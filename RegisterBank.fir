circuit RegisterBank :
  module RegisterBank :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip din : UInt<32>, flip rsd : UInt<5>, flip rs1 : UInt<5>, flip rs2 : UInt<5>, outrs1 : UInt<32>, outrs2 : UInt<32>}

    cmem mem : UInt<32> [32] @[rv_alu.scala 91:18]
    node rsdzero = eq(io.rsd, UInt<1>("h0")) @[rv_alu.scala 92:26]
    node rs1zero = eq(io.rs1, UInt<1>("h0")) @[rv_alu.scala 93:24]
    node rs2zero = eq(io.rs2, UInt<1>("h0")) @[rv_alu.scala 94:24]
    node _T = eq(rsdzero, UInt<1>("h0")) @[rv_alu.scala 96:8]
    when _T : @[rv_alu.scala 96:17]
      infer mport MPORT = mem[io.rsd], clock @[rv_alu.scala 97:8]
      MPORT <= io.din @[rv_alu.scala 97:17]
    infer mport io_outrs1_MPORT = mem[io.rs1], clock @[rv_alu.scala 100:36]
    node _io_outrs1_T = mux(rs1zero, UInt<1>("h0"), io_outrs1_MPORT) @[rv_alu.scala 100:19]
    io.outrs1 <= _io_outrs1_T @[rv_alu.scala 100:13]
    infer mport io_outrs2_MPORT = mem[io.rs2], clock @[rv_alu.scala 101:36]
    node _io_outrs2_T = mux(rs2zero, UInt<1>("h0"), io_outrs2_MPORT) @[rv_alu.scala 101:19]
    io.outrs2 <= _io_outrs2_T @[rv_alu.scala 101:13]

