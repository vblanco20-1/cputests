// See README.md for license details.

package gcd

import chisel3._
import chisel3.util._
import com.sun.source.doctree.UnknownInlineTagTree

import chisel3.experimental.hierarchy.{Definition, Instance, instantiable, public}
/**
  * Compute GCD using subtraction method.
  * Subtracts the smaller from the larger until register y is zero.
  * value in register x is then the GCD
  */
class Alu extends Module {
  val io = IO(new Bundle {
    val input1    = Input(UInt(32.W))
    val input2    = Input(UInt(32.W))
    val func3     = Input(UInt(3.W))
    val out     = Output(UInt(32.W))
  })
  io.out := 0.U
  switch(io.func3) {
    is(0x0.U){ io.out := io.input1 + io.input2 }
    is(0x7.U){ io.out := io.input1 & io.input2 }
    is(0x6.U){ io.out := io.input1 ^ io.input2 }
    is(0x4.U){ io.out := io.input1 | io.input2 }
  }
}

class RvInst extends Bundle {
  val rest   = UInt(25.W)
  val opcode = UInt(7.W)
}

//class RvInst_I extends Bundle {
//  val opcode        = UInt(7.W)
//  val rd    = UInt(5.W)
//  val func3    = UInt(3.W)
//  val rs1    = UInt(5.W)
//  val imm    = UInt(12.W)
//}
class RvInst_I extends Bundle {

  val imm    = UInt(12.W)
  val rs1    = UInt(5.W)
  val func3    = UInt(3.W)
  val rd    = UInt(5.W)
  val opcode        = UInt(7.W)
}

class RvInst_R extends Bundle {
  val func7    = UInt(7.W)
  val rs2    = UInt(5.W)
  val rs1    = UInt(5.W)
  val func3    = UInt(3.W)
  val rd    = UInt(5.W)
  val opcode        = UInt(7.W)
}

class RvInst_U extends Bundle {
  val imm    = UInt(20.W)
  val rd    = UInt(5.W)
  val opcode        = UInt(7.W)
}
class RvInst_B extends Bundle {
  val imm12    = UInt(1.W)
  val imm10_5    = UInt(6.W)
  val rs2 = UInt(5.W)
  val rs1 = UInt(5.W)
  val func3 = UInt(3.W)
  val im41    = UInt(4.W)
  val im11    = UInt(1.W)
  val opcode        = UInt(7.W)
}

class AluWrapped extends Module{
  val io = IO(new Bundle {
    val input1 = Input(UInt(32.W))
    val input2 = Input(UInt(32.W))
    val opcode = Input(UInt(32.W))
    val out = Output(UInt(32.W))
  })

  val inner = Module(new Alu)

  val instruction = io.opcode.asTypeOf(new RvInst_I)

  io.out := inner.io.out;

  inner.io.input1 := io.input1;
  inner.io.input2 := io.input2;
  inner.io.func3 := instruction.func3

}

class RegisterBank extends Module{
  val io = IO(new Bundle {
    val din= Input(UInt(32.W))
    val rsd = Input(UInt(5.W))
    val rs1 = Input(UInt(5.W))
    val rs2 = Input(UInt(5.W))
    val outrs1 = Output(UInt(32.W))
    val outrs2 = Output(UInt(32.W))
  })

  //val mem = Mem(32,UInt(32.W))
  val mem = Reg(Vec(32, UInt (32.W)))

  val rsdzero = io.rsd === 0.U;
  val rs1zero = io.rs1 === 0.U;
  val rs2zero = io.rs2 === 0.U;

  when(!rsdzero){
    mem(io.rsd) := io.din
  }

  io.outrs1 := Mux(rs1zero, 0.U,mem(io.rs1))
  io.outrs2 := Mux(rs2zero, 0.U,mem(io.rs2))
}




class RiscvCPU extends Module{
  val io = IO(new Bundle {
    val mIn= Input(UInt(32.W))
    val mWrite = Output(Bool())
    val mOut = Output(Bool())
    val mAddr = Output(Bool())
    val halted = Output(Bool())
    val db_aluout = Output(UInt(32.W))
  })
  val alu = Module(new Alu)
  val regs = Module(new RegisterBank)

  val PC = RegInit(0.U(32.W))

  val PC4 = PC + 4.U
  // The state registers
  val state_fetch  = RegInit(true.B)
  val state_fetch2 = RegInit(false.B)
  val state_decode = RegInit(false.B)
  val state_exec = RegInit(false.B)

 // val rd_w = Wire(5.W)

  val rd =  RegInit(0.U(5.W))
  val rs1 = RegInit(0.U(5.W))
  val rs2 = RegInit(0.U(5.W))
  val imm = RegInit(0.U(32.W))
  val aluOP = RegInit(0.U(3.W))

  val branchEnable = RegInit(false.B)

  val alu_in2 = Wire(UInt (32.W))
  val lui_mix = Wire(UInt (32.W))

  //in this stage memory bus contains opcode
  val inst = io.mIn.asTypeOf(new RvInst)
  val inst_I = io.mIn.asTypeOf(new RvInst_I)
  val inst_R = io.mIn.asTypeOf(new RvInst_R)
  val inst_U = io.mIn.asTypeOf(new RvInst_U)
  val inst_B = io.mIn.asTypeOf(new RvInst_B)

  val op_ALU  = inst.opcode === "b0110011".U
  val op_ALUI = inst.opcode === "b0010011".U
  val op_LUI  = inst.opcode === "b0110111".U
  val op_Bjp  = inst.opcode === "b1100011".U
  //aluOP := aluOP
  //rs1 := rs1
  //rs2 := rs2
  //imm := imm

  state_fetch := state_exec
  state_fetch2 := state_fetch
  state_decode := state_fetch2
  state_exec := state_decode

  io.mWrite := false.B
  io.mAddr := Mux(state_fetch, PC, 0.U)
  io.mOut := 0.U
  io.halted := 0.U

  alu.io.input1 := regs.io.outrs1
  alu.io.input2 := alu_in2//Mux(rd === 0.U, imm, regs.io.outrs2)
  alu.io.func3 := aluOP
  regs.io.din := Mux(op_LUI, lui_mix, alu.io.out)

  io.db_aluout := alu.io.out

  regs.io.rs1 := rs1
  regs.io.rs2 := rs2
  regs.io.rsd := Mux(state_exec, rd, 0.U)

  lui_mix := inst_U.imm ## regs.io.outrs1(11,0)

  //val alu_eq = Wire(Boolean)
  //val alu_lt = Wire(Boolean)

  val alu_eq = regs.io.outrs1 === regs.io.outrs2
  val alu_lt = regs.io.outrs1 < regs.io.outrs2

  when(op_ALU){
    alu_in2 := regs.io.outrs2
  }.elsewhen(op_ALUI){
    alu_in2 := imm
  }.otherwise{
    alu_in2 := 0.U
  }

  when(state_decode){

    rd :=inst_I.rd
    aluOP :=inst_R.func3

    when(op_ALUI){
      branchEnable := 0.U
      imm := 0.U ## inst_I.imm
    }.elsewhen(op_Bjp){
      branchEnable := 1.U
      val imd = VecInit.fill(20)(inst_B.imm12(0))
     // imm := (Mux(inst_B.imm12(0), "hFFFFF".U, 0.U  )## inst_B.im11 ## inst_B.imm10_5 ## inst_B.im41) << 1
      imm := (imd.asUInt## inst_B.im11 ## inst_B.imm10_5 ## inst_B.im41) << 1

    }.otherwise{
      branchEnable := 0.U
      imm := 0.U
    }

   // imm := Mux(op_ALUI, 0.U ## inst_I.imm, 0.U)
    rs1 := Mux(op_LUI, inst_U.rd , inst_I.rs1)
  }

  val branchCheck = Wire(Bool())
  branchCheck := false.B;
  switch(aluOP) {
    is(0.U){ //beq
      branchCheck := alu_eq
    }
    is(1.U) { //bne
      branchCheck := ~alu_eq
    }
    is(4.U) { //blt
      branchCheck := alu_lt
    }
    is(5.U) { //bge
      branchCheck := ~alu_lt
    }
    is(6.U) { //blt U  //todo fix
      branchCheck := alu_lt
    }
    is(7.U) { //bge U //todo fix
      branchCheck := ~alu_lt
    }
  }

  when(state_exec){

    PC := Mux(branchEnable & branchCheck, PC + imm ,PC4)
  }

  when(op_ALU & state_decode) {

    rs2 := inst_R.rs2
  }.elsewhen(op_ALUI) {
    rs2 := 0.U
  }
}

object Hello extends App {
  emitVerilog (new Alu ())
  emitVerilog (new RegisterBank ())
  emitVerilog (new RiscvCPU ())
}