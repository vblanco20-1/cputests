module Alu(
  input         clock,
  input         reset,
  input  [31:0] io_input1,
  input  [31:0] io_input2,
  input  [2:0]  io_func3,
  output [31:0] io_out
);
  wire [31:0] _io_out_T_1 = io_input1 + io_input2; // @[rv_alu.scala 28:36]
  wire [31:0] _io_out_T_2 = io_input1 & io_input2; // @[rv_alu.scala 29:36]
  wire [31:0] _io_out_T_3 = io_input1 ^ io_input2; // @[rv_alu.scala 30:36]
  wire [31:0] _io_out_T_4 = io_input1 | io_input2; // @[rv_alu.scala 31:36]
  wire [31:0] _GEN_0 = 3'h4 == io_func3 ? _io_out_T_4 : 32'h0; // @[rv_alu.scala 26:10 27:20 31:23]
  wire [31:0] _GEN_1 = 3'h6 == io_func3 ? _io_out_T_3 : _GEN_0; // @[rv_alu.scala 27:20 30:23]
  wire [31:0] _GEN_2 = 3'h7 == io_func3 ? _io_out_T_2 : _GEN_1; // @[rv_alu.scala 27:20 29:23]
  assign io_out = 3'h0 == io_func3 ? _io_out_T_1 : _GEN_2; // @[rv_alu.scala 27:20 28:23]
endmodule
