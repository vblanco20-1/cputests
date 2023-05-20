// See README.md for license details.

package gcd

import chisel3._
import chisel3.util._
import com.sun.source.doctree.UnknownInlineTagTree
import chisel3.stage.ChiselStage

import chisel3.ChiselEnum
import chisel3._
import chisel3.util._
import chisel3.experimental.hierarchy.{Definition, Instance, instantiable, public}
/**
  * Compute GCD using subtraction method.
  * Subtracts the smaller from the larger until register y is zero.
  * value in register x is then the GCD
  */

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

class RvInst_J extends Bundle {
  val im20    = UInt(1.W)
  val im10_1    = UInt(10.W)
  val im11    = UInt(1.W)
  val im19_12    = UInt(8.W)
  val rd    = UInt(5.W)
  val opcode        = UInt(7.W)
}

class RvInst_S extends Bundle {
  val im11_5    = UInt(7.W)
  val rs2    = UInt(5.W)
  val rs1    = UInt(5.W)
  val func3 = UInt(3.W)
  val im4    = UInt(5.W)
  val opcode        = UInt(7.W)
}

//shifter for the memory adress unit. for load/store words
class MemShift extends Module {
  val io = IO(new Bundle {

    val shift = Input(UInt(2.W))
    val in = Input(UInt(32.W))
    val out = Output(UInt(32.W))
  })

  val vin = Wire(Vec(4, UInt(8.W)))
  val vout =  Wire(Vec(4, UInt(8.W)))

  vin(0) := io.in(7, 0)
  vin(1) := io.in(15, 8)
  vin(2) := io.in(23, 16)
  vin(3) := io.in(31, 24)


  vout := vin

  io.out := vout.asUInt
  switch(io.shift) {
    is(0.U) {
      //io.out := io.in
      vout := vin
    }
    is(1.U) {
      vout(0) :=  vin(3)
      vout(1) :=  vin(0)
      vout(2) :=  vin(1)
      vout(3) :=  vin(2)
    }
    is(2.U) {
      vout(0) := vin(2)
      vout(1) := vin(3)
      vout(2) := vin(0)
      vout(3) := vin(1)
    }
    is(3.U) {
      vout(0) := vin(1)
      vout(1) := vin(2)
      vout(2) := vin(3)
      vout(3) := vin(0)
    }
  }
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

  val mem1 = Mem(32,UInt(32.W))
  val mem2 = Mem(32,UInt(32.W))

  val rsdzero = io.rsd === 0.U;

  val write = Wire(UInt(32.W))
  //if we are writing to register 0, all writes are 0 val
  write := Mux(io.rsd === 0.U, 0.U, io.din)

  mem1.write(io.rsd, write)
  mem2.write(io.rsd, write)

  io.outrs1 := mem1.read(io.rs1)
  io.outrs2 := mem2.read(io.rs2)
  //when(!rsdzero) {
  //  mem1(io.rsd) := io.din
  //  mem2(io.rsd) := io.din
  //}
//
  //io.outrs1 := mem1(io.rs1)
  //io.outrs2 := mem2(io.rs2)
}

object Opcode extends ChiselEnum {
  val load  = Value(0x03.U) // i "load"  -> 000_0011
  val imm   = Value(0x13.U) // i "imm"   -> 001_0011
  val auipc = Value(0x17.U) // u "auipc" -> 001_0111
  val store = Value(0x23.U) // s "store" -> 010_0011
  val reg   = Value(0x33.U) // r "reg"   -> 011_0011
  val lui   = Value(0x37.U) // u "lui"   -> 011_0111
  val br    = Value(0x63.U) // b "br"    -> 110_0011
  val jalr  = Value(0x67.U) // i "jalr"  -> 110_0111
  val jal   = Value(0x6F.U) // j "jal"   -> 110_1111
  val sys =   Value(0x73.U) //sys -> 1110011
}

object ImmMode extends ChiselEnum {
  val r_type, i_type, s_type, b_type,u_type, j_type = Value
}
class RiscvCPU extends Module{
  val io = IO(new Bundle {
    val mIn= Input(UInt(32.W))
    val mWrite = Output(Bool())
    val mMask = Output(Vec(4,Bool()))
    val mOut = Output(UInt(32.W))
    val mAddr = Output(UInt(30.W))
    val halted = Output(Bool())

    val csr_data = Output(UInt(32.W))
    val csr_read = Input(UInt(32.W))
    val csr_id = Output(UInt(12.W))
    val csr_write = Output(Bool())
    val csr_newInst  = Output(Bool())

    val db_r1 = Output(UInt(32.W))
    val db_r2 = Output(UInt(32.W))
    val db_pc = Output(UInt(32.W))
  })
  val alu = Module(new Alu)
  val regs = Module(new RegisterBank)
  val mshift = Module(new MemShift)
  val PC = RegInit(0.U(32.W))

  val PC4 = PC + 4.U
  // The state registers
  val state_start  = RegInit(true.B)
  val state_fetch  = RegInit(false.B)
  val state_fetch2 = RegInit(false.B)
  val state_decode = RegInit(false.B)
  val state_exec = RegInit(false.B)
  val state_halt = RegInit(false.B)
 // val rd_w = Wire(5.W)

  val rd = RegInit(0.U(5.W))
  val rs1 =RegInit(0.U(5.W))
  val rs2 = RegInit(0.U(5.W))
  //val savedOp = Wire(UInt(32.W))//RegInit(0.U(32.W))
  val immv = RegInit(0.U(32.W))
  val aluOP = RegInit(0.U(3.W))
  val memoryWidth = RegInit(0.U(3.W))
  val din_is_alu = RegInit(false.B)
  val din_is_mem = RegInit(false.B)
  val alu2_use_reg = RegInit(false.B)
  val alu_sub = RegInit(false.B)


  val csr_load = RegInit(false.B)
  val csr_store = RegInit(false.B)

  val branchEnable = RegInit(false.B)
  val jumpEnable = RegInit(false.B)
  val absjumpEnable = RegInit(false.B)
  val storePC = RegInit(false.B)
  val writeEnable = RegInit(false.B)
  val writeMask = Wire(Vec(4,Bool()))
  val prefetch = RegInit(false.B)
  //val alu_in2 = Wire(UInt (32.W))
  val lui_mix = Wire(UInt (32.W))
  val must_halt = Wire(Bool())
  val branch_target = Wire(UInt (32.W))

  val instruction = Wire(UInt(32.W))
  instruction := io.mIn//Mux(state_decode, io.mIn, savedOp)



  //in this stage memory bus contains opcode
  val inst   = instruction.asTypeOf(new RvInst)
  val inst_I = instruction.asTypeOf(new RvInst_I)
  val inst_R = instruction.asTypeOf(new RvInst_R)
  val inst_U = instruction.asTypeOf(new RvInst_U)
  val inst_B = instruction.asTypeOf(new RvInst_B)
  val inst_J = instruction.asTypeOf(new RvInst_J)
  val inst_S = instruction.asTypeOf(new RvInst_S)

  val op = Opcode(inst.opcode)

  //immediate types
  val sign = Wire(Bool())
  sign := io.mIn(31);

  val imm_I =  Wire(UInt (32.W))
  imm_I := Mux(sign,-1.S(20.W).asUInt, 0.U(20.W) ) ## inst_I.imm

  val imm_B =  Wire(UInt (32.W))
  imm_B := Mux(sign,-1.S(20.W).asUInt, 0.U(20.W) ) ## (inst_B.im11 ## inst_B.imm10_5 ## inst_B.im41 ## 0.U(1.W))

  val imm_U =  Wire(UInt (32.W))
  imm_U := inst_U.imm ## 0.U(12.W)

  val imm_J =  Wire(UInt (32.W))
 imm_J := Mux(io.mIn(31), -1.S(12.W).asUInt, 0.U(12.W)) ## io.mIn(19,12) ## io.mIn(20) ## io.mIn(30,25) ## io.mIn(24,21) ## 0.U(1.W)

  val imm_S =  Wire(UInt (32.W))
  imm_S := Mux(sign,-1.S(20.W).asUInt, 0.U(20.W) ) ## inst_S.im11_5 ## inst_S.im4



  val memAddr =  Wire(UInt (32.W))

  state_start := 0.U
  state_fetch :=  (state_exec & !prefetch)| state_start

  state_decode := (state_exec & prefetch) | state_fetch
  state_exec :=  Mux(must_halt, false.B, state_decode)
  state_halt := must_halt | state_halt

  io.csr_newInst := state_exec; //update the  instruction counters at exec stage for CSR
  io.csr_data := regs.io.outrs1
  //io.csr_read = Input(UInt(32.W))
  io.csr_id := immv(11,0)///Output(UInt(12.W))
  io.csr_write := csr_store & state_exec


  io.halted := state_halt
  io.mWrite := state_exec & writeEnable

  memAddr := Mux(prefetch, PC4, Mux(state_fetch | state_start, PC, alu.io.adderOut) )

  io.mAddr := memAddr >> 2
  io.mOut := mshift.io.out
  io.mMask(0) := state_exec & writeMask(0) & writeEnable
  io.mMask(1) := state_exec & writeMask(1) & writeEnable
  io.mMask(2) := state_exec & writeMask(2) & writeEnable
  io.mMask(3) := state_exec & writeMask(3) & writeEnable
  io.halted := state_halt

  io.db_pc := PC
  io.db_r1 :=regs.io.outrs1
  io.db_r2 :=regs.io.outrs2

  alu.io.input1 := regs.io.outrs1
  alu.io.input2 :=  Mux(alu2_use_reg, regs.io.outrs2,immv)
  alu.io.func3 := aluOP
  alu.io.sub := alu_sub
  regs.io.din := Mux(storePC, PC4, Mux(din_is_alu, alu.io.out, Mux(csr_load, io.csr_read,lui_mix)))

  regs.io.rs1 := rs1
  regs.io.rs2 := rs2
  regs.io.rsd := Mux( (state_exec & !din_is_mem) | (state_fetch & din_is_mem), rd, 0.U)

  lui_mix := Mux(din_is_mem , io.mIn , immv(31,12) ## regs.io.outrs1(11,0))
  must_halt := false.B


  alu2_use_reg := alu2_use_reg

  mshift.io.in := regs.io.outrs2
  mshift.io.shift := memAddr(1,0)

  writeMask(0) := false.B
  writeMask(1) := false.B
  writeMask(2) := false.B
  writeMask(3) := false.B
  switch(memoryWidth) {
    is(0.U) { //store byte
      writeMask(0) := memAddr(1,0) === 0.U
      writeMask(1) := memAddr(1,0) === 1.U
      writeMask(2) := memAddr(1,0) === 2.U
      writeMask(3) := memAddr(1,0) === 3.U
    }
    is(1.U) { //store half
      writeMask(0) := memAddr(1) === 0.U
      writeMask(1) := memAddr(1) === 0.U
      writeMask(2) := memAddr(1) === 1.U
      writeMask(3) := memAddr(1) === 1.U
    }
    is(2.U) { //store word
      writeMask(0) := true.B
      writeMask(1) := true.B
      writeMask(2) := true.B
      writeMask(3) := true.B
    }
  }

  din_is_alu := din_is_alu;
  when(state_decode){
    rs2 := inst_R.rs2
    rs1 := inst_R.rs1
    rd := inst_R.rd

    aluOP :=inst_R.func3
    //must_halt := false.B
    branchEnable := 0.U
    jumpEnable := 0.U
    immv := 0.U
    alu_sub := false.B
    din_is_mem := false.B
    din_is_alu := Mux(op === Opcode.lui | op === Opcode.load | op === Opcode.sys, false.B, true.B)
    alu2_use_reg := true.B
    writeEnable := false.B;
    storePC := false.B;
    absjumpEnable := 0.U
    memoryWidth := 0.U
    prefetch := false.B;

    switch(op) {
      is(Opcode.reg){

        alu_sub := inst_R.func7 === "h20".U
        prefetch := true.B;
      }
      is(Opcode.imm) {

        immv := imm_I
        alu2_use_reg := false.B
        prefetch := true.B;
        alu_sub := Mux( (inst_I.func3 === 1.U) | (inst_I.func3 === 5.U)  ,inst_R.func7 === "h20".U , false.B)
      }
      is(Opcode.br) {
        aluOP := inst_R.func3
        branchEnable := 1.U
        immv := imm_B
        //alu2_use_reg := false.B
      }
      is(Opcode.lui){
        prefetch := true.B;
        immv := imm_U
        rs1 := inst_R.rd
      }
      is(Opcode.jal) {
        aluOP := 0.U
        jumpEnable := 1.U
        rs1 := 0.U
        immv := imm_J
        alu2_use_reg := false.B
        storePC := true.B;
      }
      is(Opcode.jalr) {
        absjumpEnable := 1.U
        aluOP := 0.U
        jumpEnable := 1.U
        immv := imm_I
        alu2_use_reg := false.B
        storePC := true.B;
      }
      is(Opcode.load) {
        din_is_mem := true.B
        rs2 := 0.U
        aluOP := 0.U
        memoryWidth := inst_I.func3(1,0)
        immv := imm_I
        alu2_use_reg := false.B
      }
      is(Opcode.store) {
        rd := 0.U
      //  rd := 0.U
        memoryWidth := inst_I.func3(1,0)
        aluOP := 0.U
        immv := imm_S
        alu2_use_reg := false.B
        writeEnable := true.B;
      }
      is(Opcode.sys){

        val csrrw = inst_I.func3(1,0) === 0.U
        val csrrs = inst_I.func3(1,0) === 1.U
        val csrrc = inst_I.func3(1,0) === 2.U

        csr_load := !(inst_I.rd === 0.U)
        csr_store := !(inst_I.rs1 === 0.U)


        //csr adress will be the immediate bits of type I
        immv := imm_I

        must_halt := (inst_I.imm === 1.U) && (inst_I.rd === 0.U)  && (inst_I.rs1 === 0.U) && (inst_I.func3 === 0.U)
      }
    }
  }

  when(state_halt){
    rs2 := 2.U;
    rs1 := 1.U;
  }

  branch_target := Mux(absjumpEnable, alu.io.adderOut, PC + Mux(jumpEnable, alu.io.adderOut,immv ))



  when(state_exec){

    PC := Mux( jumpEnable | (branchEnable & alu.io.branchOut ), branch_target ,PC4)
  }
}
import chisel3.util.experimental.loadMemoryFromFileInline

import firrtl.annotations.{ComponentName, LoadMemoryAnnotation, MemoryFileInlineAnnotation, MemoryLoadFileType}

class BlockRam(memoryFile: String = "") extends Module{
  val io = IO(new Bundle {

    val addr = Input(UInt(30.W))
    val write = Input(Bool())
    val mask = Input(Vec(4, Bool()))
    val in = Input(UInt(32.W))
    val out = Output(UInt(32.W))

  })

    // from 0 to 0x00FF
    val memROM = SyncReadMem(16*1024, UInt(32.W))
    if (memoryFile.trim().nonEmpty) {
      loadMemoryFromFileInline(memROM, memoryFile, MemoryLoadFileType.Binary)
    }
    // from 0x00FF to end
    val memRAM = SyncReadMem(16*1024,Vec(4,UInt(8.W)))


    val readROM = Wire(UInt(32.W))
    val readRAM = Wire(UInt(32.W))
    val data = Wire(Vec(4,UInt(8.W)))

    val adressMasked = (io.addr & (0xFFFF.U >> 2))

    val addrRom = Reg(Bool())

    readROM := memROM(adressMasked)
    readRAM := memRAM(adressMasked).asUInt//.asUInt()

    addrRom := adressMasked === io.addr//((io.addr << 2) & 0xF000.U ) === 0.U


    for (i <- 0 until 4) {
      data(i) := io.in((i + 1) * 8 - 1, i * 8); // := Mux(io.mask(i) , io.in((i+1) * 8 -1, i* 8) , read((i+1) * 8 -1, i* 8))
    }

   //
  memRAM.write(adressMasked,data,io.mask)


  io.out := Mux(addrRom,readROM, readRAM );// read

}




object Hello extends App {
 // emitVerilog (new Alu ())
  //emitVerilog (new RegisterBank ())
  emitVerilog (new RiscvCPU ())
  emitVerilog (new BlockRam ("fib.txt"))
}