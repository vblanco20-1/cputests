circuit RegisterBank :
  module RegisterBank :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip din : UInt<32>, flip rsd : UInt<5>, flip rs1 : UInt<5>, flip rs2 : UInt<5>, outrs1 : UInt<32>, outrs2 : UInt<32>}

    reg mem : UInt<32>[32], clock with :
      reset => (UInt<1>("h0"), mem) @[rv_alu.scala 121:16]
    node rsdzero = eq(io.rsd, UInt<1>("h0")) @[rv_alu.scala 123:24]
    node rs1zero = eq(io.rs1, UInt<1>("h0")) @[rv_alu.scala 124:24]
    node rs2zero = eq(io.rs2, UInt<1>("h0")) @[rv_alu.scala 125:24]
    node _T = eq(rsdzero, UInt<1>("h0")) @[rv_alu.scala 127:8]
    when _T : @[rv_alu.scala 127:17]
      mem[io.rsd] <= io.din @[rv_alu.scala 128:17]
    node _io_outrs1_T = mux(rs1zero, UInt<1>("h0"), mem[io.rs1]) @[rv_alu.scala 131:19]
    io.outrs1 <= _io_outrs1_T @[rv_alu.scala 131:13]
    node _io_outrs2_T = mux(rs2zero, UInt<1>("h0"), mem[io.rs2]) @[rv_alu.scala 132:19]
    io.outrs2 <= _io_outrs2_T @[rv_alu.scala 132:13]

