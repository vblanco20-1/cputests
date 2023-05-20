module Alu(
  input  [31:0] io_input1, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 14:14]
  input  [31:0] io_input2, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 14:14]
  input  [2:0]  io_func3, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 14:14]
  input         io_sub, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 14:14]
  output [31:0] io_out, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 14:14]
  output [31:0] io_adderOut, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 14:14]
  output        io_branchOut // @[\\src\\main\\scala\\gcd\\rv_alu.scala 14:14]
);
  wire [31:0] adder = io_input1 + io_input2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 26:22]
  wire [19:0] inputMSB = io_input1[31] & io_sub ? 20'hfffff : 20'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 28:21]
  wire  rightBarrel = io_func3[2]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 31:29]
  wire [31:0] _GEN_14 = {{16'd0}, io_input1[31:16]}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_4 = _GEN_14 & 32'hffff; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_6 = {io_input1[15:0], 16'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_8 = _flippedIn_T_6 & 32'hffff0000; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_9 = _flippedIn_T_4 | _flippedIn_T_8; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _GEN_15 = {{8'd0}, _flippedIn_T_9[31:8]}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_14 = _GEN_15 & 32'hff00ff; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_16 = {_flippedIn_T_9[23:0], 8'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_18 = _flippedIn_T_16 & 32'hff00ff00; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_19 = _flippedIn_T_14 | _flippedIn_T_18; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _GEN_16 = {{4'd0}, _flippedIn_T_19[31:4]}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_24 = _GEN_16 & 32'hf0f0f0f; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_26 = {_flippedIn_T_19[27:0], 4'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_28 = _flippedIn_T_26 & 32'hf0f0f0f0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_29 = _flippedIn_T_24 | _flippedIn_T_28; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _GEN_17 = {{2'd0}, _flippedIn_T_29[31:2]}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_34 = _GEN_17 & 32'h33333333; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_36 = {_flippedIn_T_29[29:0], 2'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_38 = _flippedIn_T_36 & 32'hcccccccc; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_39 = _flippedIn_T_34 | _flippedIn_T_38; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _GEN_18 = {{1'd0}, _flippedIn_T_39[31:1]}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_44 = _GEN_18 & 32'h55555555; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_46 = {_flippedIn_T_39[30:0], 1'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_48 = _flippedIn_T_46 & 32'haaaaaaaa; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] _flippedIn_T_49 = _flippedIn_T_44 | _flippedIn_T_48; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:57]
  wire [31:0] flippedIn = rightBarrel ? io_input1 : _flippedIn_T_49; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:19]
  wire [51:0] _rbarrel_0_T_1 = {inputMSB,flippedIn}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 36:44]
  wire [50:0] _rbarrel_0_T_3 = io_input2[0] ? _rbarrel_0_T_1[51:1] : {{19'd0}, flippedIn}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 36:20]
  wire [31:0] rbarrel_0 = _rbarrel_0_T_3[31:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 35:21 36:14]
  wire [51:0] _rbarrel_1_T_1 = {inputMSB,rbarrel_0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 37:44]
  wire [49:0] _rbarrel_1_T_3 = io_input2[1] ? _rbarrel_1_T_1[51:2] : {{18'd0}, rbarrel_0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 37:20]
  wire [31:0] rbarrel_1 = _rbarrel_1_T_3[31:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 35:21 37:14]
  wire [51:0] _rbarrel_2_T_1 = {inputMSB,rbarrel_1}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 38:44]
  wire [47:0] _rbarrel_2_T_3 = io_input2[2] ? _rbarrel_2_T_1[51:4] : {{16'd0}, rbarrel_1}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 38:20]
  wire [31:0] rbarrel_2 = _rbarrel_2_T_3[31:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 35:21 38:14]
  wire [51:0] _rbarrel_3_T_1 = {inputMSB,rbarrel_2}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 39:44]
  wire [43:0] _rbarrel_3_T_3 = io_input2[3] ? _rbarrel_3_T_1[51:8] : {{12'd0}, rbarrel_2}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 39:20]
  wire [31:0] rbarrel_3 = _rbarrel_3_T_3[31:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 35:21 39:14]
  wire [51:0] _rbarrel_4_T_1 = {inputMSB,rbarrel_3}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 40:44]
  wire [35:0] _rbarrel_4_T_3 = io_input2[4] ? _rbarrel_4_T_1[51:16] : {{4'd0}, rbarrel_3}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 40:20]
  wire [31:0] rbarrel_4 = _rbarrel_4_T_3[31:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 35:21 40:14]
  wire [31:0] _GEN_19 = {{16'd0}, rbarrel_4[31:16]}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_4 = _GEN_19 & 32'hffff; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_6 = {rbarrel_4[15:0], 16'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_8 = _flippedOut_T_6 & 32'hffff0000; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_9 = _flippedOut_T_4 | _flippedOut_T_8; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _GEN_20 = {{8'd0}, _flippedOut_T_9[31:8]}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_14 = _GEN_20 & 32'hff00ff; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_16 = {_flippedOut_T_9[23:0], 8'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_18 = _flippedOut_T_16 & 32'hff00ff00; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_19 = _flippedOut_T_14 | _flippedOut_T_18; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _GEN_21 = {{4'd0}, _flippedOut_T_19[31:4]}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_24 = _GEN_21 & 32'hf0f0f0f; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_26 = {_flippedOut_T_19[27:0], 4'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_28 = _flippedOut_T_26 & 32'hf0f0f0f0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_29 = _flippedOut_T_24 | _flippedOut_T_28; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _GEN_22 = {{2'd0}, _flippedOut_T_29[31:2]}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_34 = _GEN_22 & 32'h33333333; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_36 = {_flippedOut_T_29[29:0], 2'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_38 = _flippedOut_T_36 & 32'hcccccccc; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_39 = _flippedOut_T_34 | _flippedOut_T_38; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _GEN_23 = {{1'd0}, _flippedOut_T_39[31:1]}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_44 = _GEN_23 & 32'h55555555; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_46 = {_flippedOut_T_39[30:0], 1'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_48 = _flippedOut_T_46 & 32'haaaaaaaa; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] _flippedOut_T_49 = _flippedOut_T_44 | _flippedOut_T_48; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:60]
  wire [31:0] flippedOut = rightBarrel ? rbarrel_4 : _flippedOut_T_49; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 41:20]
  wire [32:0] _aluminus_T = {1'h1,io_input1}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 62:23]
  wire [31:0] _aluminus_T_1 = ~io_input2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 62:51]
  wire [32:0] _aluminus_T_2 = {1'h0,_aluminus_T_1}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 62:48]
  wire [32:0] _aluminus_T_4 = _aluminus_T + _aluminus_T_2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 62:37]
  wire [32:0] aluminus = _aluminus_T_4 + 33'h1; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 62:63]
  wire  eq = aluminus == 33'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 64:21]
  wire  lt = io_input1[31] ^ io_input2[31] ? io_input1[31] : aluminus[32]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 65:15]
  wire  _T = 3'h0 == io_func3; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 72:20]
  wire [31:0] _io_out_T_1 = io_input1 - io_input2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 73:48]
  wire [31:0] _io_out_T_2 = io_sub ? _io_out_T_1 : adder; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 73:29]
  wire  _T_1 = 3'h1 == io_func3; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 72:20]
  wire  _T_4 = 3'h5 == io_func3; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 72:20]
  wire  _T_5 = 3'h7 == io_func3; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 72:20]
  wire [31:0] _io_out_T_5 = io_input1 & io_input2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 80:36]
  wire  _T_6 = 3'h6 == io_func3; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 72:20]
  wire [31:0] _io_out_T_6 = io_input1 ^ io_input2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 81:36]
  wire  _T_7 = 3'h4 == io_func3; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 72:20]
  wire [31:0] _io_out_T_7 = io_input1 | io_input2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 82:36]
  wire [31:0] _GEN_1 = 3'h6 == io_func3 ? _io_out_T_6 : _io_out_T_7; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 72:20 81:23]
  wire [31:0] _GEN_2 = 3'h7 == io_func3 ? _io_out_T_5 : _GEN_1; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 72:20 80:23]
  wire [31:0] _GEN_3 = 3'h5 == io_func3 ? flippedOut : _GEN_2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 72:20 77:24]
  wire [31:0] _GEN_4 = 3'h3 == io_func3 ? {{31'd0}, aluminus[32]} : _GEN_3; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 72:20 76:24]
  wire [31:0] _GEN_5 = 3'h2 == io_func3 ? {{31'd0}, lt} : _GEN_4; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 72:20 75:24]
  wire [31:0] _GEN_6 = 3'h1 == io_func3 ? flippedOut : _GEN_5; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 72:20 74:24]
  wire  _GEN_8 = _T_5 & ~aluminus[32]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 102:20 70:16 85:20]
  wire  _GEN_9 = _T_6 ? aluminus[32] : _GEN_8; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 85:20 99:20]
  wire  _GEN_10 = _T_4 ? ~lt : _GEN_9; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 85:20 96:20]
  wire  _GEN_11 = _T_7 ? lt : _GEN_10; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 85:20 93:20]
  wire  _GEN_12 = _T_1 ? ~eq : _GEN_11; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 85:20 90:20]
  assign io_out = 3'h0 == io_func3 ? _io_out_T_2 : _GEN_6; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 72:20 73:23]
  assign io_adderOut = io_input1 + io_input2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 26:22]
  assign io_branchOut = _T ? eq : _GEN_12; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 85:20 87:20]
endmodule
module RegisterBank(
  input         clock,
  input  [31:0] io_din, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 132:14]
  input  [4:0]  io_rsd, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 132:14]
  input  [4:0]  io_rs1, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 132:14]
  input  [4:0]  io_rs2, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 132:14]
  output [31:0] io_outrs1, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 132:14]
  output [31:0] io_outrs2 // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 132:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] mem1 [0:31]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 141:17]
  wire  mem1_io_outrs1_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 141:17]
  wire [4:0] mem1_io_outrs1_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 141:17]
  wire [31:0] mem1_io_outrs1_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 141:17]
  wire [31:0] mem1_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 141:17]
  wire [4:0] mem1_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 141:17]
  wire  mem1_MPORT_mask; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 141:17]
  wire  mem1_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 141:17]
  reg [31:0] mem2 [0:31]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 142:17]
  wire  mem2_io_outrs2_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 142:17]
  wire [4:0] mem2_io_outrs2_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 142:17]
  wire [31:0] mem2_io_outrs2_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 142:17]
  wire [31:0] mem2_MPORT_1_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 142:17]
  wire [4:0] mem2_MPORT_1_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 142:17]
  wire  mem2_MPORT_1_mask; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 142:17]
  wire  mem2_MPORT_1_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 142:17]
  wire  rsdzero = io_rsd == 5'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 144:24]
  assign mem1_io_outrs1_MPORT_en = 1'h1;
  assign mem1_io_outrs1_MPORT_addr = io_rs1;
  assign mem1_io_outrs1_MPORT_data = mem1[mem1_io_outrs1_MPORT_addr]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 141:17]
  assign mem1_MPORT_data = rsdzero ? 32'h0 : io_din;
  assign mem1_MPORT_addr = io_rsd;
  assign mem1_MPORT_mask = 1'h1;
  assign mem1_MPORT_en = 1'h1;
  assign mem2_io_outrs2_MPORT_en = 1'h1;
  assign mem2_io_outrs2_MPORT_addr = io_rs2;
  assign mem2_io_outrs2_MPORT_data = mem2[mem2_io_outrs2_MPORT_addr]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 142:17]
  assign mem2_MPORT_1_data = rsdzero ? 32'h0 : io_din;
  assign mem2_MPORT_1_addr = io_rsd;
  assign mem2_MPORT_1_mask = 1'h1;
  assign mem2_MPORT_1_en = 1'h1;
  assign io_outrs1 = mem1_io_outrs1_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 153:13]
  assign io_outrs2 = mem2_io_outrs2_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 154:13]
  always @(posedge clock) begin
    if (mem1_MPORT_en & mem1_MPORT_mask) begin
      mem1[mem1_MPORT_addr] <= mem1_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 141:17]
    end
    if (mem2_MPORT_1_en & mem2_MPORT_1_mask) begin
      mem2[mem2_MPORT_1_addr] <= mem2_MPORT_1_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 142:17]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    mem1[initvar] = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    mem2[initvar] = _RAND_1[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MemShift(
  input  [1:0]  io_shift, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 86:14]
  input  [31:0] io_in, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 86:14]
  output [31:0] io_out // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 86:14]
);
  wire [7:0] vin_0 = io_in[7:0]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 96:18]
  wire [7:0] vin_1 = io_in[15:8]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 97:18]
  wire [7:0] vin_2 = io_in[23:16]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 98:18]
  wire [7:0] vin_3 = io_in[31:24]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 99:18]
  wire [7:0] _GEN_1 = 2'h3 == io_shift ? vin_2 : vin_1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 105:20 124:15 102:8]
  wire [7:0] _GEN_5 = 2'h2 == io_shift ? vin_3 : _GEN_1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 105:20 118:15]
  wire [7:0] _GEN_9 = 2'h1 == io_shift ? vin_0 : _GEN_5; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 105:20 112:15]
  wire [7:0] vout_1 = 2'h0 == io_shift ? vin_1 : _GEN_9; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 105:20 108:12]
  wire [7:0] _GEN_0 = 2'h3 == io_shift ? vin_1 : vin_0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 105:20 123:15 102:8]
  wire [7:0] _GEN_4 = 2'h2 == io_shift ? vin_2 : _GEN_0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 105:20 117:15]
  wire [7:0] _GEN_8 = 2'h1 == io_shift ? vin_3 : _GEN_4; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 105:20 111:15]
  wire [7:0] vout_0 = 2'h0 == io_shift ? vin_0 : _GEN_8; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 105:20 108:12]
  wire [15:0] io_out_lo = {vout_1,vout_0}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 104:18]
  wire [7:0] _GEN_3 = 2'h3 == io_shift ? vin_0 : vin_3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 105:20 126:15 102:8]
  wire [7:0] _GEN_7 = 2'h2 == io_shift ? vin_1 : _GEN_3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 105:20 120:15]
  wire [7:0] _GEN_11 = 2'h1 == io_shift ? vin_2 : _GEN_7; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 105:20 114:15]
  wire [7:0] vout_3 = 2'h0 == io_shift ? vin_3 : _GEN_11; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 105:20 108:12]
  wire [7:0] _GEN_2 = 2'h3 == io_shift ? vin_3 : vin_2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 105:20 125:15 102:8]
  wire [7:0] _GEN_6 = 2'h2 == io_shift ? vin_0 : _GEN_2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 105:20 119:15]
  wire [7:0] _GEN_10 = 2'h1 == io_shift ? vin_1 : _GEN_6; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 105:20 113:15]
  wire [7:0] vout_2 = 2'h0 == io_shift ? vin_2 : _GEN_10; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 105:20 108:12]
  wire [15:0] io_out_hi = {vout_3,vout_2}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 104:18]
  assign io_out = {io_out_hi,io_out_lo}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 104:18]
endmodule
module RiscvCPU(
  input         clock,
  input         reset,
  input  [31:0] io_mIn, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 181:14]
  output        io_mWrite, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 181:14]
  output        io_mMask_0, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 181:14]
  output        io_mMask_1, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 181:14]
  output        io_mMask_2, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 181:14]
  output        io_mMask_3, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 181:14]
  output [31:0] io_mOut, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 181:14]
  output [29:0] io_mAddr, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 181:14]
  output        io_halted, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 181:14]
  output [31:0] io_csr_data, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 181:14]
  input  [31:0] io_csr_read, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 181:14]
  output [11:0] io_csr_id, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 181:14]
  output        io_csr_write, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 181:14]
  output        io_csr_newInst, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 181:14]
  output [31:0] io_db_r1, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 181:14]
  output [31:0] io_db_r2, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 181:14]
  output [31:0] io_db_pc // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 181:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] alu_io_input1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 199:19]
  wire [31:0] alu_io_input2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 199:19]
  wire [2:0] alu_io_func3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 199:19]
  wire  alu_io_sub; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 199:19]
  wire [31:0] alu_io_out; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 199:19]
  wire [31:0] alu_io_adderOut; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 199:19]
  wire  alu_io_branchOut; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 199:19]
  wire  regs_clock; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 200:20]
  wire [31:0] regs_io_din; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 200:20]
  wire [4:0] regs_io_rsd; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 200:20]
  wire [4:0] regs_io_rs1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 200:20]
  wire [4:0] regs_io_rs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 200:20]
  wire [31:0] regs_io_outrs1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 200:20]
  wire [31:0] regs_io_outrs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 200:20]
  wire [1:0] mshift_io_shift; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 201:22]
  wire [31:0] mshift_io_in; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 201:22]
  wire [31:0] mshift_io_out; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 201:22]
  reg [31:0] PC; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 202:19]
  wire [31:0] PC4 = PC + 32'h4; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 204:16]
  reg  state_start; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 206:29]
  reg  state_fetch; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 207:29]
  reg  state_decode; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 209:29]
  reg  state_exec; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 210:27]
  reg  state_halt; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 211:27]
  reg [4:0] rd; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 214:19]
  reg [4:0] rs1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 215:19]
  reg [4:0] rs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 216:20]
  reg [31:0] immv; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 218:21]
  reg [2:0] aluOP; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 219:22]
  reg [2:0] memoryWidth; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 220:28]
  reg  din_is_alu; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 221:27]
  reg  din_is_mem; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 222:27]
  reg  alu2_use_reg; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 223:29]
  reg  alu_sub; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 224:24]
  reg  branchEnable; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 230:29]
  reg  jumpEnable; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 231:27]
  reg  absjumpEnable; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 232:30]
  reg  storePC; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 233:24]
  reg  writeEnable; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 234:28]
  reg  prefetch; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 236:25]
  wire [6:0] inst_opcode = io_mIn[6:0]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 248:36]
  wire [4:0] inst_I_rd = io_mIn[11:7]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 249:36]
  wire [2:0] inst_I_func3 = io_mIn[14:12]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 249:36]
  wire [4:0] inst_I_rs1 = io_mIn[19:15]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 249:36]
  wire [11:0] inst_I_imm = io_mIn[31:20]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 249:36]
  wire [4:0] inst_R_rs2 = io_mIn[24:20]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 250:36]
  wire [6:0] inst_R_func7 = io_mIn[31:25]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 250:36]
  wire [19:0] inst_U_imm = io_mIn[31:12]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 251:36]
  wire  inst_B_im11 = io_mIn[7]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 252:36]
  wire [3:0] inst_B_im41 = io_mIn[11:8]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 252:36]
  wire [5:0] inst_B_imm10_5 = io_mIn[30:25]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 252:36]
  wire  inst_B_imm12 = io_mIn[31]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 252:36]
  wire [7:0] inst_J_im19_12 = io_mIn[19:12]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 253:36]
  wire  inst_J_im11 = io_mIn[20]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 253:36]
  wire [19:0] _imm_I_T_1 = inst_B_imm12 ? 20'hfffff : 20'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 263:15]
  wire [31:0] imm_I = {_imm_I_T_1,inst_I_imm}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 263:52]
  wire [31:0] imm_B = {_imm_I_T_1,inst_B_im11,inst_B_imm10_5,inst_B_im41,1'h0}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 266:52]
  wire [31:0] imm_U = {inst_U_imm,12'h0}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 269:23]
  wire [11:0] _imm_J_T_2 = inst_B_imm12 ? 12'hfff : 12'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 272:14]
  wire [31:0] imm_J = {_imm_J_T_2,inst_J_im19_12,inst_J_im11,inst_B_imm10_5,io_mIn[24:21],1'h0}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 272:122]
  wire [31:0] imm_S = {_imm_I_T_1,inst_R_func7,inst_I_rd}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 275:69]
  wire  _GEN_10 = 7'h73 == inst_opcode & (inst_I_imm == 12'h1 & inst_I_rd == 5'h0 & inst_I_rs1 == 5'h0 & inst_I_func3
     == 3'h0); // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 363:15 377:16 443:19]
  wire  _GEN_17 = 7'h23 == inst_opcode ? 1'h0 : _GEN_10; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 363:15 377:16]
  wire  _GEN_26 = 7'h3 == inst_opcode ? 1'h0 : _GEN_17; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 363:15 377:16]
  wire  _GEN_36 = 7'h67 == inst_opcode ? 1'h0 : _GEN_26; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 363:15 377:16]
  wire  _GEN_48 = 7'h6f == inst_opcode ? 1'h0 : _GEN_36; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 363:15 377:16]
  wire  _GEN_61 = 7'h37 == inst_opcode ? 1'h0 : _GEN_48; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 363:15 377:16]
  wire  _GEN_75 = 7'h63 == inst_opcode ? 1'h0 : _GEN_61; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 363:15 377:16]
  wire  _GEN_90 = 7'h13 == inst_opcode ? 1'h0 : _GEN_75; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 363:15 377:16]
  wire  _GEN_105 = 7'h33 == inst_opcode ? 1'h0 : _GEN_90; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 363:15 377:16]
  wire  must_halt = state_decode & _GEN_105; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 323:13 357:21]
  wire [31:0] _memAddr_T_1 = state_fetch | state_start ? PC : alu_io_adderOut; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 298:36]
  wire [31:0] memAddr = prefetch ? PC4 : _memAddr_T_1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 298:17]
  wire  _GEN_1 = 3'h1 == memoryWidth ? ~memAddr[1] : 3'h2 == memoryWidth; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 335:23 343:20]
  wire  writeMask_0 = 3'h0 == memoryWidth ? memAddr[1:0] == 2'h0 : _GEN_1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 335:23 337:20]
  wire  writeMask_1 = 3'h0 == memoryWidth ? memAddr[1:0] == 2'h1 : _GEN_1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 335:23 338:20]
  wire  _GEN_3 = 3'h1 == memoryWidth ? memAddr[1] : 3'h2 == memoryWidth; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 335:23 345:20]
  wire  writeMask_2 = 3'h0 == memoryWidth ? memAddr[1:0] == 2'h2 : _GEN_3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 335:23 339:20]
  wire  writeMask_3 = 3'h0 == memoryWidth ? memAddr[1:0] == 2'h3 : _GEN_3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 335:23 340:20]
  wire [31:0] _lui_mix_T_2 = {immv[31:12],regs_io_outrs1[11:0]}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 322:52]
  wire [31:0] lui_mix = din_is_mem ? io_mIn : _lui_mix_T_2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 322:17]
  wire [31:0] _regs_io_din_T = din_is_alu ? alu_io_out : lui_mix; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 316:39]
  wire  _alu_sub_T = inst_R_func7 == 7'h20; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 380:33]
  wire [31:0] _GEN_9 = 7'h73 == inst_opcode ? imm_I : 32'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 366:10 377:16 441:14]
  wire [4:0] _GEN_11 = 7'h23 == inst_opcode ? 5'h0 : inst_I_rd; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 426:12 360:8]
  wire [1:0] _GEN_12 = 7'h23 == inst_opcode ? inst_I_func3[1:0] : 2'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 374:17 428:21]
  wire [2:0] _GEN_13 = 7'h23 == inst_opcode ? 3'h0 : inst_I_func3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 362:11 377:16 429:15]
  wire [31:0] _GEN_14 = 7'h23 == inst_opcode ? imm_S : _GEN_9; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 430:14]
  wire  _GEN_15 = 7'h23 == inst_opcode ? 1'h0 : 1'h1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 370:18 431:22]
  wire [4:0] _GEN_19 = 7'h3 == inst_opcode ? 5'h0 : inst_R_rs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 419:13 358:9]
  wire [2:0] _GEN_20 = 7'h3 == inst_opcode ? 3'h0 : _GEN_13; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 420:15]
  wire [1:0] _GEN_21 = 7'h3 == inst_opcode ? inst_I_func3[1:0] : _GEN_12; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 421:21]
  wire [31:0] _GEN_22 = 7'h3 == inst_opcode ? imm_I : _GEN_14; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 422:14]
  wire  _GEN_23 = 7'h3 == inst_opcode ? 1'h0 : _GEN_15; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 423:22]
  wire [4:0] _GEN_24 = 7'h3 == inst_opcode ? inst_I_rd : _GEN_11; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 360:8]
  wire  _GEN_25 = 7'h3 == inst_opcode ? 1'h0 : 7'h23 == inst_opcode; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 371:17]
  wire [2:0] _GEN_28 = 7'h67 == inst_opcode ? 3'h0 : _GEN_20; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 411:15]
  wire [31:0] _GEN_29 = 7'h67 == inst_opcode ? imm_I : _GEN_22; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 413:14]
  wire  _GEN_30 = 7'h67 == inst_opcode ? 1'h0 : _GEN_23; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 414:22]
  wire  _GEN_31 = 7'h67 == inst_opcode ? 1'h0 : 7'h3 == inst_opcode; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 368:16 377:16]
  wire [4:0] _GEN_32 = 7'h67 == inst_opcode ? inst_R_rs2 : _GEN_19; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 358:9]
  wire [1:0] _GEN_33 = 7'h67 == inst_opcode ? 2'h0 : _GEN_21; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 374:17]
  wire [4:0] _GEN_34 = 7'h67 == inst_opcode ? inst_I_rd : _GEN_24; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 360:8]
  wire  _GEN_35 = 7'h67 == inst_opcode ? 1'h0 : _GEN_25; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 371:17]
  wire [2:0] _GEN_37 = 7'h6f == inst_opcode ? 3'h0 : _GEN_28; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 402:15]
  wire  _GEN_38 = 7'h6f == inst_opcode | 7'h67 == inst_opcode; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 403:20]
  wire [4:0] _GEN_39 = 7'h6f == inst_opcode ? 5'h0 : inst_I_rs1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 404:13 359:9]
  wire [31:0] _GEN_40 = 7'h6f == inst_opcode ? imm_J : _GEN_29; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 405:14]
  wire  _GEN_41 = 7'h6f == inst_opcode ? 1'h0 : _GEN_30; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 406:22]
  wire  _GEN_42 = 7'h6f == inst_opcode ? 1'h0 : 7'h67 == inst_opcode; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 373:19]
  wire  _GEN_43 = 7'h6f == inst_opcode ? 1'h0 : _GEN_31; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 368:16 377:16]
  wire [4:0] _GEN_44 = 7'h6f == inst_opcode ? inst_R_rs2 : _GEN_32; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 358:9]
  wire [1:0] _GEN_45 = 7'h6f == inst_opcode ? 2'h0 : _GEN_33; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 374:17]
  wire [4:0] _GEN_46 = 7'h6f == inst_opcode ? inst_I_rd : _GEN_34; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 360:8]
  wire  _GEN_47 = 7'h6f == inst_opcode ? 1'h0 : _GEN_35; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 371:17]
  wire [31:0] _GEN_50 = 7'h37 == inst_opcode ? imm_U : _GEN_40; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 398:14]
  wire [4:0] _GEN_51 = 7'h37 == inst_opcode ? inst_I_rd : _GEN_39; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 399:13]
  wire [2:0] _GEN_52 = 7'h37 == inst_opcode ? inst_I_func3 : _GEN_37; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 362:11 377:16]
  wire  _GEN_53 = 7'h37 == inst_opcode ? 1'h0 : _GEN_38; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 365:16 377:16]
  wire  _GEN_55 = 7'h37 == inst_opcode ? 1'h0 : _GEN_42; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 373:19]
  wire  _GEN_56 = 7'h37 == inst_opcode ? 1'h0 : _GEN_43; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 368:16 377:16]
  wire [4:0] _GEN_57 = 7'h37 == inst_opcode ? inst_R_rs2 : _GEN_44; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 358:9]
  wire [1:0] _GEN_58 = 7'h37 == inst_opcode ? 2'h0 : _GEN_45; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 374:17]
  wire [4:0] _GEN_59 = 7'h37 == inst_opcode ? inst_I_rd : _GEN_46; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 360:8]
  wire  _GEN_60 = 7'h37 == inst_opcode ? 1'h0 : _GEN_47; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 371:17]
  wire [2:0] _GEN_62 = 7'h63 == inst_opcode ? inst_I_func3 : _GEN_52; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 391:15]
  wire [31:0] _GEN_64 = 7'h63 == inst_opcode ? imm_B : _GEN_50; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 393:14]
  wire  _GEN_65 = 7'h63 == inst_opcode ? 1'h0 : 7'h37 == inst_opcode; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 375:14 377:16]
  wire [4:0] _GEN_66 = 7'h63 == inst_opcode ? inst_I_rs1 : _GEN_51; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 359:9]
  wire  _GEN_67 = 7'h63 == inst_opcode ? 1'h0 : _GEN_53; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 365:16 377:16]
  wire  _GEN_68 = 7'h63 == inst_opcode | (7'h37 == inst_opcode | _GEN_41); // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 370:18]
  wire  _GEN_69 = 7'h63 == inst_opcode ? 1'h0 : _GEN_55; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 373:19]
  wire  _GEN_70 = 7'h63 == inst_opcode ? 1'h0 : _GEN_56; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 368:16 377:16]
  wire [4:0] _GEN_71 = 7'h63 == inst_opcode ? inst_R_rs2 : _GEN_57; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 358:9]
  wire [1:0] _GEN_72 = 7'h63 == inst_opcode ? 2'h0 : _GEN_58; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 374:17]
  wire [4:0] _GEN_73 = 7'h63 == inst_opcode ? inst_I_rd : _GEN_59; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 360:8]
  wire  _GEN_74 = 7'h63 == inst_opcode ? 1'h0 : _GEN_60; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 371:17]
  wire  _GEN_77 = 7'h13 == inst_opcode ? 1'h0 : _GEN_68; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 386:22]
  wire  _GEN_78 = 7'h13 == inst_opcode | _GEN_65; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 387:18]
  wire  _GEN_79 = 7'h13 == inst_opcode & ((inst_I_func3 == 3'h1 | inst_I_func3 == 3'h5) & _alu_sub_T); // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 367:13 377:16 388:17]
  wire [4:0] _GEN_82 = 7'h13 == inst_opcode ? inst_I_rs1 : _GEN_66; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 359:9]
  wire [4:0] _GEN_86 = 7'h13 == inst_opcode ? inst_R_rs2 : _GEN_71; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 358:9]
  wire [1:0] _GEN_87 = 7'h13 == inst_opcode ? 2'h0 : _GEN_72; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 374:17]
  wire  _GEN_92 = 7'h33 == inst_opcode | _GEN_78; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 381:18]
  wire  _GEN_94 = 7'h33 == inst_opcode | _GEN_77; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 370:18]
  wire [1:0] _GEN_102 = 7'h33 == inst_opcode ? 2'h0 : _GEN_87; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16 374:17]
  wire [31:0] _branch_target_T = jumpEnable ? alu_io_adderOut : immv; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 453:64]
  wire [31:0] _branch_target_T_2 = PC + _branch_target_T; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 453:59]
  Alu alu ( // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 199:19]
    .io_input1(alu_io_input1),
    .io_input2(alu_io_input2),
    .io_func3(alu_io_func3),
    .io_sub(alu_io_sub),
    .io_out(alu_io_out),
    .io_adderOut(alu_io_adderOut),
    .io_branchOut(alu_io_branchOut)
  );
  RegisterBank regs ( // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 200:20]
    .clock(regs_clock),
    .io_din(regs_io_din),
    .io_rsd(regs_io_rsd),
    .io_rs1(regs_io_rs1),
    .io_rs2(regs_io_rs2),
    .io_outrs1(regs_io_outrs1),
    .io_outrs2(regs_io_outrs2)
  );
  MemShift mshift ( // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 201:22]
    .io_shift(mshift_io_shift),
    .io_in(mshift_io_in),
    .io_out(mshift_io_out)
  );
  assign io_mWrite = state_exec & writeEnable; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 296:27]
  assign io_mMask_0 = state_exec & writeMask_0 & writeEnable; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 302:44]
  assign io_mMask_1 = state_exec & writeMask_1 & writeEnable; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 303:44]
  assign io_mMask_2 = state_exec & writeMask_2 & writeEnable; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 304:44]
  assign io_mMask_3 = state_exec & writeMask_3 & writeEnable; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 305:44]
  assign io_mOut = mshift_io_out; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 301:11]
  assign io_mAddr = memAddr[31:2]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 300:23]
  assign io_halted = state_halt; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 306:13]
  assign io_csr_data = regs_io_outrs1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 289:15]
  assign io_csr_id = immv[11:0]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 291:20]
  assign io_csr_write = 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 292:29]
  assign io_csr_newInst = state_exec; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 288:18]
  assign io_db_r1 = regs_io_outrs1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 309:12]
  assign io_db_r2 = regs_io_outrs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 310:12]
  assign io_db_pc = PC; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 308:12]
  assign alu_io_input1 = regs_io_outrs1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 312:17]
  assign alu_io_input2 = alu2_use_reg ? regs_io_outrs2 : immv; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 313:50]
  assign alu_io_func3 = aluOP; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 314:16]
  assign alu_io_sub = alu_sub; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 315:14]
  assign regs_clock = clock;
  assign regs_io_din = storePC ? PC4 : _regs_io_din_T; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 316:21]
  assign regs_io_rsd = state_exec & ~din_is_mem | state_fetch & din_is_mem ? rd : 5'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 320:21]
  assign regs_io_rs1 = rs1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 318:15]
  assign regs_io_rs2 = rs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 319:15]
  assign mshift_io_shift = memAddr[1:0]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 329:29]
  assign mshift_io_in = regs_io_outrs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 328:16]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 202:19]
      PC <= 32'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 202:19]
    end else if (state_exec) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 457:19]
      if (jumpEnable | branchEnable & alu_io_branchOut) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 459:14]
        if (absjumpEnable) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 453:23]
          PC <= alu_io_adderOut;
        end else begin
          PC <= _branch_target_T_2;
        end
      end else begin
        PC <= PC4;
      end
    end
    state_start <= reset; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 206:{29,29} 281:15]
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 207:29]
      state_fetch <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 207:29]
    end else begin
      state_fetch <= state_exec & ~prefetch | state_start; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 282:15]
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 209:29]
      state_decode <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 209:29]
    end else begin
      state_decode <= state_exec & prefetch | state_fetch; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 284:16]
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 210:27]
      state_exec <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 210:27]
    end else if (must_halt) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 285:21]
      state_exec <= 1'h0;
    end else begin
      state_exec <= state_decode;
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 211:27]
      state_halt <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 211:27]
    end else begin
      state_halt <= must_halt | state_halt; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 286:14]
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 214:19]
      rd <= 5'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 214:19]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 357:21]
      if (7'h33 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        rd <= inst_I_rd; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 360:8]
      end else if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        rd <= inst_I_rd; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 360:8]
      end else begin
        rd <= _GEN_73;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 215:19]
      rs1 <= 5'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 215:19]
    end else if (state_halt) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 448:19]
      rs1 <= 5'h1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 450:9]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 357:21]
      if (7'h33 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        rs1 <= inst_I_rs1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 359:9]
      end else begin
        rs1 <= _GEN_82;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 216:20]
      rs2 <= 5'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 216:20]
    end else if (state_halt) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 448:19]
      rs2 <= 5'h2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 449:9]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 357:21]
      if (7'h33 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        rs2 <= inst_R_rs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 358:9]
      end else begin
        rs2 <= _GEN_86;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 218:21]
      immv <= 32'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 218:21]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 357:21]
      if (7'h33 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        immv <= 32'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 366:10]
      end else if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        immv <= imm_I; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 385:14]
      end else begin
        immv <= _GEN_64;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 219:22]
      aluOP <= 3'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 219:22]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 357:21]
      if (7'h33 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        aluOP <= inst_I_func3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 362:11]
      end else if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        aluOP <= inst_I_func3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 362:11]
      end else begin
        aluOP <= _GEN_62;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 220:28]
      memoryWidth <= 3'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 220:28]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 357:21]
      memoryWidth <= {{1'd0}, _GEN_102};
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 221:27]
      din_is_alu <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 221:27]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 357:21]
      if (inst_opcode == 7'h37 | inst_opcode == 7'h3) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 369:22]
        din_is_alu <= 1'h0;
      end else begin
        din_is_alu <= 1'h1;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 222:27]
      din_is_mem <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 222:27]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 357:21]
      if (7'h33 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        din_is_mem <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 368:16]
      end else if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        din_is_mem <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 368:16]
      end else begin
        din_is_mem <= _GEN_70;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 223:29]
      alu2_use_reg <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 223:29]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 357:21]
      alu2_use_reg <= _GEN_94;
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 224:24]
      alu_sub <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 224:24]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 357:21]
      if (7'h33 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        alu_sub <= inst_R_func7 == 7'h20; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 380:17]
      end else begin
        alu_sub <= _GEN_79;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 230:29]
      branchEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 230:29]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 357:21]
      if (7'h33 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        branchEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 364:18]
      end else if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        branchEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 364:18]
      end else begin
        branchEnable <= 7'h63 == inst_opcode;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 231:27]
      jumpEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 231:27]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 357:21]
      if (7'h33 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        jumpEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 365:16]
      end else if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        jumpEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 365:16]
      end else begin
        jumpEnable <= _GEN_67;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 232:30]
      absjumpEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 232:30]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 357:21]
      if (7'h33 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        absjumpEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 373:19]
      end else if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        absjumpEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 373:19]
      end else begin
        absjumpEnable <= _GEN_69;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 233:24]
      storePC <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 233:24]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 357:21]
      if (7'h33 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        storePC <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 365:16]
      end else if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        storePC <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 365:16]
      end else begin
        storePC <= _GEN_67;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 234:28]
      writeEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 234:28]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 357:21]
      if (7'h33 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        writeEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 371:17]
      end else if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:16]
        writeEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 371:17]
      end else begin
        writeEnable <= _GEN_74;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 236:25]
      prefetch <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 236:25]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 357:21]
      prefetch <= _GEN_92;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  PC = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  state_start = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  state_fetch = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  state_decode = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  state_exec = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  state_halt = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  rd = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  rs1 = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  rs2 = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  immv = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  aluOP = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  memoryWidth = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  din_is_alu = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  din_is_mem = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  alu2_use_reg = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  alu_sub = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  branchEnable = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  jumpEnable = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  absjumpEnable = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  storePC = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  writeEnable = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  prefetch = _RAND_21[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
