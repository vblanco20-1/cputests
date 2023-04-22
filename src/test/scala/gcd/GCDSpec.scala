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
class CPUwRam(memoryFile: String = "") extends Module{
  val io = IO(new Bundle {

    val out = Output(UInt(32.W))
    val halted = Output(Bool())
  })

  val inner = Module(new RiscvCPU)


  val mem = SyncReadMem(64, UInt(32.W))
  // Initialize memory
  if (memoryFile.trim().nonEmpty) {
    loadMemoryFromFileInline(mem, memoryFile,MemoryLoadFileType.Binary)
  }

  io.out := inner.io.db_aluout
  io.halted := inner.io.halted


    val rdwrPort = mem((inner.io.mAddr >> 2))
    when(inner.io.mWrite) {
      rdwrPort :=inner.io.mOut
      inner.io.mIn := 0.U
    }
    .otherwise {
      inner.io.mIn := rdwrPort
    }
 }

class CPUTest extends AnyFreeSpec with ChiselScalatestTester {

  /*"CPU should math" in {
    test(new RiscvCPU).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

      //1 empty cycle
      dut.clock.step() // begins fetch2
      //simulate loading instruction
      dut.io.mIn.poke(0x01400113.U) // add x2, 20

      dut.clock.step() // begins decode
      dut.clock.step() // begins exec
      dut.clock.step() // begins fetch
      dut.clock.step() // begins fetch2

      //simulate loading instruction
      dut.io.mIn.poke(0x03700193.U) // add x2, 55
      dut.clock.step() // begins exec
      dut.clock.step() // begins decode
      dut.clock.step() // begins fetch
      dut.clock.step() // begins fetch2
      dut.io.mIn.poke(0x003100b3.U) // add x1, x2,x3,
      dut.clock.step() // begins decode
      dut.clock.step() // begins exec
      dut.clock.step()
      dut.clock.step() // begins exec
      //read register to see if it works
      //println("Result is: " + dut.regs.mem(1).peekInt())
      //dut.aluout.expect (75.U)
    }
  }
    "CPU test load" in {
      test(new RiscvCPU).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

        //1 empty cycle
        dut.clock.step() // begins fetch2
        //simulate loading instruction
        dut.io.mIn.poke("h0de00093".U) // li 0xDE

        dut.clock.step() // begins decode
        dut.clock.step() // begins exec
        dut.clock.step() // begins fetch
        dut.clock.step() // begins fetch2

        //simulate loading instruction
        dut.io.mIn.poke("h0fafa0b7".U) // lui x1 0xFAFA
        dut.clock.step() // begins decode
        dut.clock.step() // begins exec
        dut.clock.step() // begins fetch


        //read register to see if it works
        //println("Result is: " + dut.regs.mem(1).peekInt())
        //dut.aluout.expect (75.U)
      }

    }
  */"CPU branch test" in {
    test(new CPUwRam("asm\\branch_01.txt")).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

      for (a <- 0 until 40) {
        dut.clock.step()
      }
    }
  }
}


