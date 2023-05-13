// See README.md for license details.

package gcd

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.experimental.BundleLiterals._

/**
  * This is a trivial example of how to run this Specification
  * From within sbt use:
  * {{{
  * testOnly gcd.GcdDecoupledTester
  * }}}
  * From a terminal shell use:
  * {{{
  * sbt 'testOnly gcd.GcdDecoupledTester'
  * }}}
  */
class GCDSpec extends AnyFreeSpec with ChiselScalatestTester {

  "Gcd should calculate proper greatest common denominator" in {
    test(new DecoupledGcd(16)) { dut =>
      dut.input.initSource()
      dut.input.setSourceClock(dut.clock)
      dut.output.initSink()
      dut.output.setSinkClock(dut.clock)

      val testValues = for { x <- 0 to 10; y <- 0 to 10} yield (x, y)
      val inputSeq = testValues.map { case (x, y) => (new GcdInputBundle(16)).Lit(_.value1 -> x.U, _.value2 -> y.U) }
      val resultSeq = testValues.map { case (x, y) =>
        (new GcdOutputBundle(16)).Lit(_.value1 -> x.U, _.value2 -> y.U, _.gcd -> BigInt(x).gcd(BigInt(y)).U)
      }

      fork {
        // push inputs into the calculator, stall for 11 cycles one third of the way
        val (seq1, seq2) = inputSeq.splitAt(resultSeq.length / 3)
        dut.input.enqueueSeq(seq1)
        dut.clock.step(11)
        dut.input.enqueueSeq(seq2)
      }.fork {
        // retrieve computations from the calculator, stall for 10 cycles one half of the way
        val (seq1, seq2) = resultSeq.splitAt(resultSeq.length / 2)
        dut.output.expectDequeueSeq(seq1)
        dut.clock.step(10)
        dut.output.expectDequeueSeq(seq2)
      }.join()

    }
  }
}


class ALUTest extends AnyFreeSpec with ChiselScalatestTester {

  "Alu should work" in {
    test(new AluWrapped) { dut =>

      dut.io.opcode.poke(0x003100b3.U); //basic addition
      dut.io.input1.poke(155.U);
      dut.io.input2.poke(100.U);
      dut.clock.step ()
      println("Result is: " + dut.io.out.peekInt ())
      dut.io.out.expect (255.U)
    }
  }
}


class RegTest extends AnyFreeSpec with ChiselScalatestTester {

  "Regs should work" in {
    test(new RegisterBank) { dut =>

      //write  var to x1
      dut.io.rsd.poke(0x01.U)
      dut.io.din.poke(0x0F0F0F0F.U) //basic addition

      dut.clock.step ()
      dut.io.rs1.poke(0x01.U)
      println("Result is: " + dut.io.outrs1.peekInt ())
      dut.io.outrs1.expect (0x0F0F0F0F.U)

      //write  var to x0 (should not work)
      dut.io.rsd.poke(0x00.U)
      dut.io.din.poke(0x0F0F0F0F.U) //basic addition
      dut.clock.step()

      dut.io.rs2.poke(0x00.U)
      println("Result is: " + dut.io.outrs2.peekInt())
      dut.io.outrs2.expect(0x0.U)
      dut.io.outrs1.expect(0x0F0F0F0F.U)
    }
  }
}


class TestBlockRam extends Module{
  val io = IO(new Bundle {
    val dIn= Input(UInt(32.W))
    val dOut = Output(UInt(32.W))
    val addr = Input(UInt(5.W))
    val wE = Input(Bool())
  })

  //val mem = Mem(32,UInt(32.W))
  val mem = Reg(Vec(32, UInt (32.W)))

  val addr = RegNext( io.addr )
  val out = RegNext( mem(addr) )

  io.dOut := out

  when(io.wE){
    mem(addr) := io.dIn
  }

 //when(!rsdzero){
 //  mem(io.rsd) := io.din
 //}

 //io.outrs1 := Mux(rs1zero, 0.U,mem(io.rs1))
 //io.outrs2 := Mux(rs2zero, 0.U,mem(io.rs2))
}


import chisel3.util.experimental.loadMemoryFromFileInline

import firrtl.annotations.{ComponentName, LoadMemoryAnnotation, MemoryFileInlineAnnotation, MemoryLoadFileType}

class CPUwRam(memoryFile: String = "") extends Module {
  val io = IO(new Bundle {

    val db_r1 = Output(UInt(32.W))
    val db_r2 = Output(UInt(32.W))
    val db_pc = Output(UInt(32.W))

    val halted = Output(Bool())
  })

  val inner = Module(new RiscvCPU)
  val ram   = Module(new BlockRam(memoryFile))

  io.halted := inner.io.halted
  io.db_pc := inner.io.db_pc
  io.db_r1 := inner.io.db_r1
  io.db_r2 := inner.io.db_r2

  ram.io.addr := inner.io.mAddr
  ram.io.mask := inner.io.mMask
  ram.io.in   := inner.io.mOut
  ram.io.write := inner.io.mWrite

  inner.io.mIn := ram.io.out
}

class CPUTest extends AnyFreeSpec with ChiselScalatestTester {
  "CPU branch test" in {
    test(new CPUwRam("asm\\branch_01.txt")).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

      for (a <- 0 until 40) {
        dut.clock.step()
      }
      dut.io.halted.expect(true.B)
      dut.io.db_r1.expect (100.U)
      dut.io.db_r2.expect (100.U)
      dut.io.db_pc.expect(16.U)
    }
  }

  "CPU lui test" in {
    test(new CPUwRam("asm\\load_imm_01.txt")).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

      for (a <- 0 until 20) {
        dut.clock.step()
      }
      dut.io.halted.expect(true.B)
      dut.io.db_r1.expect("hFDEFDECC".U)
      dut.io.db_r2.expect(3.U)
    }
  }

  "CPU jump test" in {
    test(new CPUwRam("asm\\jumps_01.txt")).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

      for (a <- 0 until 40) {
        dut.clock.step()
      }
      dut.io.halted.expect(true.B)
      dut.io.db_r1.expect(130.U)
      dut.io.db_r2.expect(20.U)
      dut.io.db_pc.expect(48.U)
    }
  }

  "CPU loadw test" in {
    test(new CPUwRam("asm\\load_memory_01.txt")).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

      for (a <- 0 until 30) {
        dut.clock.step()
      }
      dut.io.halted.expect(true.B)
      dut.io.db_r1.expect("hECC".U)
      dut.io.db_r2.expect("hDEADBABE".U)
      //dut.io.db_pc.expect(48.U)
    }
  }

  "CPU loads test" in {
    test(new CPUwRam("asm\\load_store_memory_01.txt")).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

      for (a <- 0 until 50) {
        dut.clock.step()
      }
      dut.io.halted.expect(true.B)
      dut.io.db_r1.expect(0.U)
      dut.io.db_r2.expect("hFEFEDADA".U)
      //dut.io.db_pc.expect(48.U)
    }
  }
}


