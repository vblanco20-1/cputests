package gcd;

import chisel3._
import chisel3.util._
import com.sun.source.doctree.UnknownInlineTagTree
import chisel3.stage.ChiselStage

import chisel3.ChiselEnum
import chisel3._
import chisel3.util._
import chisel3.experimental.hierarchy.{Definition, Instance, instantiable, public}

class Alu extends Module {
  val io = IO(new Bundle {
    val input1    = Input(UInt(32.W))
    val input2    = Input(UInt(32.W))
    val mathOP     = Input(UInt(3.W))
    val branchOP = Input(UInt(3.W))
    val out     = Output(UInt(32.W))
    val branchOut     = Output(Bool())
  })
  io.out := 0.U


  var inputMSB = Mux(io.input1(31) & io.input2(10) , -1.S(20.W).asUInt, 0.U(20.W) )

  //var rightBarrel = io.func3(2)
//
  //var flippedIn = Wire(UInt(32.W))
  //val flippedOut = Wire(UInt(32.W))
  //flippedIn := Mux(rightBarrel, io.input1(31,0), io.input1(0,31)  )
//
  //var rbarrel = Wire(Vec(5, UInt(32.W)))
  //rbarrel(0) := Mux(io.input2(0), inputMSB ## flippedIn >> 1, flippedIn)
  //rbarrel(1) := Mux(io.input2(1), inputMSB ## rbarrel(0) >> 2, rbarrel(0))
  //rbarrel(2) := Mux(io.input2(2), inputMSB ## rbarrel(1) >> 4, rbarrel(1))
  //rbarrel(3) := Mux(io.input2(3), inputMSB ## rbarrel(2) >> 8, rbarrel(2))
  //rbarrel(4) := Mux(io.input2(4), inputMSB ## rbarrel(3) >> 16, rbarrel(3))
//
  //flippedOut := Mux(rightBarrel, rbarrel(4)(31,0) , rbarrel(4)(0,31))

  //right barrel shifter
  var rbarrel = Wire(Vec(5,UInt(32.W)))
  rbarrel(0) := Mux(io.input2(0), inputMSB ## io.input1 >> 1, io.input1 )
  rbarrel(1) := Mux(io.input2(1), inputMSB ## rbarrel(0) >> 2, rbarrel(0) )
  rbarrel(2) := Mux(io.input2(2), inputMSB ## rbarrel(1) >> 4, rbarrel(1) )
  rbarrel(3) := Mux(io.input2(3), inputMSB ## rbarrel(2) >> 8, rbarrel(2) )
  rbarrel(4) := Mux(io.input2(4), inputMSB ## rbarrel(3) >> 16, rbarrel(3) )

  //left barrel shifter
  var lbarrel = Wire(Vec(5, UInt(32.W)))
  lbarrel(0) := Mux(io.input2(0), io.input1 << 1, io.input1)
  lbarrel(1) := Mux(io.input2(1), lbarrel(0) << 2, lbarrel(0))
  lbarrel(2) := Mux(io.input2(2), lbarrel(1) << 4, lbarrel(1))
  lbarrel(3) := Mux(io.input2(3), lbarrel(2) << 8, lbarrel(2))
  lbarrel(4) := Mux(io.input2(4), lbarrel(3) << 16, lbarrel(3))


  switch(io.mathOP) {
    is(0x0.U){ io.out := io.input1 + io.input2 }
    //is(0x1.U) { io.out := flippedOut  }
    //is(0x5.U) { io.out := flippedOut  }
    is(0x1.U){ io.out := rbarrel(4) }
    is(0x5.U){ io.out := lbarrel(4) }
    is(0x7.U){ io.out := io.input1 & io.input2 }
    is(0x6.U){ io.out := io.input1 ^ io.input2 }
    is(0x4.U){ io.out := io.input1 | io.input2 }
  }

  //branch unit
  val aluminus = Wire(UInt(33.W))

  aluminus := (true.B ## io.input1) + (false.B ## ~io.input2) + (-1.S(33.U).asUInt)

  val eq = aluminus === 0.U
  val lt = Mux((io.input1(31) ^ io.input2(31)), io.input1(31), aluminus(32))
  val ltu = aluminus(32)

  io.branchOut := false.B;

  switch(io.branchOP) {
    is(0.U) { //beq
      io.branchOut := eq
    }
    is(1.U) { //bne
      io.branchOut := ~eq
    }
    is(4.U) { //blt
      io.branchOut := lt
    }
    is(5.U) { //bge
      io.branchOut := ~lt
    }
    is(6.U) { //blt U
      io.branchOut := ltu
    }
    is(7.U) { //bge U
      io.branchOut := ~ltu
    }
  }
}

class BranchAlu extends Module {
  val io = IO(new Bundle {
    val input1 = Input(UInt(32.W))
    val input2 = Input(UInt(32.W))
    val func3 = Input(UInt(3.W))
    val out = Output(Bool())
  })

  val aluminus = Wire(UInt(33.W))

  aluminus := ( true.B ## io.input1) + ( false.B ## ~io.input2) + (-1.S(33.U).asUInt)

  val eq = aluminus === 0.U
  val lt = Mux( (io.input1(31) ^ io.input2(31)), io.input1(31), aluminus(32)  )
  val ltu = aluminus(32)
  switch(io.func3) {
    is(0.U) { //beq
      io.out := eq
    }
    is(1.U) { //bne
      io.out := ~eq
    }
    is(4.U) { //blt
      io.out := lt
    }
    is(5.U) { //bge
      io.out := ~lt
    }
    is(6.U) { //blt U
      io.out := ltu
    }
    is(7.U) { //bge U
      io.out := ~ltu
    }
  }
}