circuit Alu :
  module Alu :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip input1 : UInt<32>, flip input2 : UInt<32>, flip func3 : UInt<3>, out : UInt<32>}

    io.out <= UInt<1>("h0") @[rv_alu.scala 26:10]
    node _T = eq(UInt<1>("h0"), io.func3) @[rv_alu.scala 27:20]
    when _T : @[rv_alu.scala 27:20]
      node _io_out_T = add(io.input1, io.input2) @[rv_alu.scala 28:36]
      node _io_out_T_1 = tail(_io_out_T, 1) @[rv_alu.scala 28:36]
      io.out <= _io_out_T_1 @[rv_alu.scala 28:23]
    else :
      node _T_1 = eq(UInt<3>("h7"), io.func3) @[rv_alu.scala 27:20]
      when _T_1 : @[rv_alu.scala 27:20]
        node _io_out_T_2 = and(io.input1, io.input2) @[rv_alu.scala 29:36]
        io.out <= _io_out_T_2 @[rv_alu.scala 29:23]
      else :
        node _T_2 = eq(UInt<3>("h6"), io.func3) @[rv_alu.scala 27:20]
        when _T_2 : @[rv_alu.scala 27:20]
          node _io_out_T_3 = xor(io.input1, io.input2) @[rv_alu.scala 30:36]
          io.out <= _io_out_T_3 @[rv_alu.scala 30:23]
        else :
          node _T_3 = eq(UInt<3>("h4"), io.func3) @[rv_alu.scala 27:20]
          when _T_3 : @[rv_alu.scala 27:20]
            node _io_out_T_4 = or(io.input1, io.input2) @[rv_alu.scala 31:36]
            io.out <= _io_out_T_4 @[rv_alu.scala 31:23]

