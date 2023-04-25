circuit RegisterBank :
  module RegisterBank :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip din : UInt<32>, flip rsd : UInt<5>, flip rs1 : UInt<5>, flip rs2 : UInt<5>, outrs1 : UInt<32>, outrs2 : UInt<32>}

    cmem mem : UInt<32> [32] @[rv_alu.scala 144:16]
    node rsdzero = eq(io.rsd, UInt<1>("h0")) @[rv_alu.scala 146:24]
    node _T = eq(rsdzero, UInt<1>("h0")) @[rv_alu.scala 148:8]
    when _T : @[rv_alu.scala 148:18]
      infer mport MPORT = mem[io.rsd], clock @[rv_alu.scala 149:8]
      MPORT <= io.din @[rv_alu.scala 149:17]
    infer mport io_outrs1_MPORT = mem[io.rs1], clock @[rv_alu.scala 152:19]
    io.outrs1 <= io_outrs1_MPORT @[rv_alu.scala 152:13]
    infer mport io_outrs2_MPORT = mem[io.rs2], clock @[rv_alu.scala 153:19]
    io.outrs2 <= io_outrs2_MPORT @[rv_alu.scala 153:13]

