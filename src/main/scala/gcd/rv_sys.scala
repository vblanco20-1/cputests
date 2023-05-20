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
 * Platform registers for the FPGA platform. These are adressed from the CSR and have special functionality so its not a simple memory system
 * current support is instret(H), cycle(H)

 */


class PlatformCSR extends Module{
  val io = IO(new Bundle {
    val din= Input(UInt(32.W))
    val csr_id = Input(UInt(12.W))
    val dout = Output(UInt(32.W))
    //debug output registers for whatever
    val dbg_1 = Output(UInt(32.W))
    val dbg_2 = Output(UInt(32.W))
    val dbg_3 = Output(UInt(32.W))
    val dbg_4 = Output(UInt(32.W))
    val write = Input(Bool())
    val newInst  = Input(Bool()) // for instruction counter register
  })

  val instret = RegInit(0.U(64.W))
  val cycle = RegInit(0.U(64.W))

  val db_1 = RegInit(0.U(32.W))
  val db_2 = RegInit(0.U(32.W))
  val db_3 = RegInit(0.U(32.W))
  val db_4 = RegInit(0.U(32.W))

  io.dbg_1 := db_1;
  io.dbg_2 := db_2;
  io.dbg_3 := db_3;
  io.dbg_4 := db_4;
  //every clock we update cycles
  cycle := cycle + 1.U;


  //update instructions retired only when the flag is set from the cpu
  when(io.newInst){
    instret := instret + 1.U;
  }


  val read = Wire(UInt(32.W))
  read := DontCare
  io.dout := read;

  when(!io.write) {
    switch(io.csr_id) {
      is(0xC00.U){ //cycle
        read := cycle(31,0)
      }
      is(0xC80.U) { //cycle(h)
        read := cycle(61,32)
      }
      is(0xC02.U) { //instret
        read := instret(31, 0)
      }
      is(0xC82.U) { //instret(h)
        read := instret(61, 32)
      }
      is(0xD00.U) {
        read:=db_1
      }
      is(0xD01.U) {
        read:=db_2
      }
      is(0xD02.U) {
        read:=db_3
      }
      is(0xD03.U) {
        read:=db_4
      }
    }
  }.otherwise{

    switch(io.csr_id) {
      is(0xD00.U) {
        db_1 := io.din
      }
      is(0xD01.U) {
        db_2 := io.din
      }
      is(0xD02.U) {
        db_3 := io.din
      }
      is(0xD03.U) {
        db_4 := io.din
      }
    }
  }
}
