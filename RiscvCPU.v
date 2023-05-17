module Alu(
  input  [31:0] io_input1, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 14:14]
  input  [31:0] io_input2, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 14:14]
  input  [2:0]  io_func3, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 14:14]
  output [31:0] io_out // @[\\src\\main\\scala\\gcd\\rv_alu.scala 14:14]
);
  wire [19:0] inputMSB = io_input1[31] & io_input2[10] ? 20'hfffff : 20'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 23:21]
  wire [51:0] _rbarrel_0_T_1 = {inputMSB,io_input1}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 27:44]
  wire [50:0] _rbarrel_0_T_3 = io_input2[0] ? _rbarrel_0_T_1[51:1] : {{19'd0}, io_input1}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 27:20]
  wire [31:0] rbarrel_0 = _rbarrel_0_T_3[31:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 26:21 27:14]
  wire [51:0] _rbarrel_1_T_1 = {inputMSB,rbarrel_0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 28:44]
  wire [49:0] _rbarrel_1_T_3 = io_input2[1] ? _rbarrel_1_T_1[51:2] : {{18'd0}, rbarrel_0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 28:20]
  wire [31:0] rbarrel_1 = _rbarrel_1_T_3[31:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 26:21 28:14]
  wire [51:0] _rbarrel_2_T_1 = {inputMSB,rbarrel_1}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 29:44]
  wire [47:0] _rbarrel_2_T_3 = io_input2[2] ? _rbarrel_2_T_1[51:4] : {{16'd0}, rbarrel_1}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 29:20]
  wire [31:0] rbarrel_2 = _rbarrel_2_T_3[31:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 26:21 29:14]
  wire [51:0] _rbarrel_3_T_1 = {inputMSB,rbarrel_2}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 30:44]
  wire [43:0] _rbarrel_3_T_3 = io_input2[3] ? _rbarrel_3_T_1[51:8] : {{12'd0}, rbarrel_2}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 30:20]
  wire [31:0] rbarrel_3 = _rbarrel_3_T_3[31:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 26:21 30:14]
  wire [51:0] _rbarrel_4_T_1 = {inputMSB,rbarrel_3}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 31:44]
  wire [35:0] _rbarrel_4_T_3 = io_input2[4] ? _rbarrel_4_T_1[51:16] : {{4'd0}, rbarrel_3}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 31:20]
  wire [32:0] _lbarrel_0_T_1 = {io_input1, 1'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 35:45]
  wire [32:0] _lbarrel_0_T_2 = io_input2[0] ? _lbarrel_0_T_1 : {{1'd0}, io_input1}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 35:20]
  wire [31:0] lbarrel_0 = _lbarrel_0_T_2[31:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:21 35:14]
  wire [33:0] _lbarrel_1_T_1 = {lbarrel_0, 2'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 36:46]
  wire [33:0] _lbarrel_1_T_2 = io_input2[1] ? _lbarrel_1_T_1 : {{2'd0}, lbarrel_0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 36:20]
  wire [31:0] lbarrel_1 = _lbarrel_1_T_2[31:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:21 36:14]
  wire [35:0] _lbarrel_2_T_1 = {lbarrel_1, 4'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 37:46]
  wire [35:0] _lbarrel_2_T_2 = io_input2[2] ? _lbarrel_2_T_1 : {{4'd0}, lbarrel_1}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 37:20]
  wire [31:0] lbarrel_2 = _lbarrel_2_T_2[31:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:21 37:14]
  wire [39:0] _lbarrel_3_T_1 = {lbarrel_2, 8'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 38:46]
  wire [39:0] _lbarrel_3_T_2 = io_input2[3] ? _lbarrel_3_T_1 : {{8'd0}, lbarrel_2}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 38:20]
  wire [31:0] lbarrel_3 = _lbarrel_3_T_2[31:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:21 38:14]
  wire [47:0] _lbarrel_4_T_1 = {lbarrel_3, 16'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 39:46]
  wire [47:0] _lbarrel_4_T_2 = io_input2[4] ? _lbarrel_4_T_1 : {{16'd0}, lbarrel_3}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 39:20]
  wire [31:0] _io_out_T_1 = io_input1 + io_input2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 43:36]
  wire [31:0] _io_out_T_2 = io_input1 & io_input2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 46:36]
  wire [31:0] _io_out_T_3 = io_input1 ^ io_input2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 47:36]
  wire [31:0] _io_out_T_4 = io_input1 | io_input2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 48:36]
  wire [31:0] _GEN_0 = 3'h4 == io_func3 ? _io_out_T_4 : 32'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 20:10 42:20 48:23]
  wire [31:0] _GEN_1 = 3'h6 == io_func3 ? _io_out_T_3 : _GEN_0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 42:20 47:23]
  wire [31:0] _GEN_2 = 3'h7 == io_func3 ? _io_out_T_2 : _GEN_1; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 42:20 46:23]
  wire [31:0] lbarrel_4 = _lbarrel_4_T_2[31:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 34:21 39:14]
  wire [31:0] _GEN_3 = 3'h5 == io_func3 ? lbarrel_4 : _GEN_2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 42:20 45:23]
  wire [31:0] rbarrel_4 = _rbarrel_4_T_3[31:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 26:21 31:14]
  wire [31:0] _GEN_4 = 3'h1 == io_func3 ? rbarrel_4 : _GEN_3; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 42:20 44:23]
  assign io_out = 3'h0 == io_func3 ? _io_out_T_1 : _GEN_4; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 42:20 43:23]
endmodule
module RegisterBank(
  input         clock,
  input  [31:0] io_din, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 154:14]
  input  [4:0]  io_rsd, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 154:14]
  input  [4:0]  io_rs1, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 154:14]
  input  [4:0]  io_rs2, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 154:14]
  output [31:0] io_outrs1, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 154:14]
  output [31:0] io_outrs2 // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 154:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] mem1 [0:31]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 177:17]
  wire  mem1_io_outrs1_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 177:17]
  wire [4:0] mem1_io_outrs1_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 177:17]
  wire [31:0] mem1_io_outrs1_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 177:17]
  wire [31:0] mem1_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 177:17]
  wire [4:0] mem1_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 177:17]
  wire  mem1_MPORT_mask; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 177:17]
  wire  mem1_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 177:17]
  reg [31:0] mem2 [0:31]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 178:17]
  wire  mem2_io_outrs2_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 178:17]
  wire [4:0] mem2_io_outrs2_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 178:17]
  wire [31:0] mem2_io_outrs2_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 178:17]
  wire [31:0] mem2_MPORT_1_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 178:17]
  wire [4:0] mem2_MPORT_1_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 178:17]
  wire  mem2_MPORT_1_mask; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 178:17]
  wire  mem2_MPORT_1_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 178:17]
  wire  rsdzero = io_rsd == 5'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 180:24]
  assign mem1_io_outrs1_MPORT_en = 1'h1;
  assign mem1_io_outrs1_MPORT_addr = io_rs1;
  assign mem1_io_outrs1_MPORT_data = mem1[mem1_io_outrs1_MPORT_addr]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 177:17]
  assign mem1_MPORT_data = io_din;
  assign mem1_MPORT_addr = io_rsd;
  assign mem1_MPORT_mask = 1'h1;
  assign mem1_MPORT_en = ~rsdzero;
  assign mem2_io_outrs2_MPORT_en = 1'h1;
  assign mem2_io_outrs2_MPORT_addr = io_rs2;
  assign mem2_io_outrs2_MPORT_data = mem2[mem2_io_outrs2_MPORT_addr]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 178:17]
  assign mem2_MPORT_1_data = io_din;
  assign mem2_MPORT_1_addr = io_rsd;
  assign mem2_MPORT_1_mask = 1'h1;
  assign mem2_MPORT_1_en = ~rsdzero;
  assign io_outrs1 = mem1_io_outrs1_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 187:13]
  assign io_outrs2 = mem2_io_outrs2_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 188:13]
  always @(posedge clock) begin
    if (mem1_MPORT_en & mem1_MPORT_mask) begin
      mem1[mem1_MPORT_addr] <= mem1_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 177:17]
    end
    if (mem2_MPORT_1_en & mem2_MPORT_1_mask) begin
      mem2[mem2_MPORT_1_addr] <= mem2_MPORT_1_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 178:17]
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
  input  [1:0]  io_shift, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 108:14]
  input  [31:0] io_in, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 108:14]
  output [31:0] io_out // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 108:14]
);
  wire [7:0] vin_0 = io_in[7:0]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 118:18]
  wire [7:0] vin_1 = io_in[15:8]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 119:18]
  wire [7:0] vin_2 = io_in[23:16]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 120:18]
  wire [7:0] vin_3 = io_in[31:24]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 121:18]
  wire [7:0] _GEN_1 = 2'h3 == io_shift ? vin_2 : vin_1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 127:20 146:15 124:8]
  wire [7:0] _GEN_5 = 2'h2 == io_shift ? vin_3 : _GEN_1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 127:20 140:15]
  wire [7:0] _GEN_9 = 2'h1 == io_shift ? vin_0 : _GEN_5; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 127:20 134:15]
  wire [7:0] vout_1 = 2'h0 == io_shift ? vin_1 : _GEN_9; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 127:20 130:12]
  wire [7:0] _GEN_0 = 2'h3 == io_shift ? vin_1 : vin_0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 127:20 145:15 124:8]
  wire [7:0] _GEN_4 = 2'h2 == io_shift ? vin_2 : _GEN_0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 127:20 139:15]
  wire [7:0] _GEN_8 = 2'h1 == io_shift ? vin_3 : _GEN_4; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 127:20 133:15]
  wire [7:0] vout_0 = 2'h0 == io_shift ? vin_0 : _GEN_8; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 127:20 130:12]
  wire [15:0] io_out_lo = {vout_1,vout_0}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 126:18]
  wire [7:0] _GEN_3 = 2'h3 == io_shift ? vin_0 : vin_3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 127:20 148:15 124:8]
  wire [7:0] _GEN_7 = 2'h2 == io_shift ? vin_1 : _GEN_3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 127:20 142:15]
  wire [7:0] _GEN_11 = 2'h1 == io_shift ? vin_2 : _GEN_7; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 127:20 136:15]
  wire [7:0] vout_3 = 2'h0 == io_shift ? vin_3 : _GEN_11; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 127:20 130:12]
  wire [7:0] _GEN_2 = 2'h3 == io_shift ? vin_3 : vin_2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 127:20 147:15 124:8]
  wire [7:0] _GEN_6 = 2'h2 == io_shift ? vin_0 : _GEN_2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 127:20 141:15]
  wire [7:0] _GEN_10 = 2'h1 == io_shift ? vin_1 : _GEN_6; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 127:20 135:15]
  wire [7:0] vout_2 = 2'h0 == io_shift ? vin_2 : _GEN_10; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 127:20 130:12]
  wire [15:0] io_out_hi = {vout_3,vout_2}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 126:18]
  assign io_out = {io_out_hi,io_out_lo}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 126:18]
endmodule
module RiscvCPU(
  input         clock,
  input         reset,
  input  [31:0] io_mIn, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 208:14]
  output        io_mWrite, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 208:14]
  output        io_mMask_0, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 208:14]
  output        io_mMask_1, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 208:14]
  output        io_mMask_2, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 208:14]
  output        io_mMask_3, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 208:14]
  output [31:0] io_mOut, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 208:14]
  output [29:0] io_mAddr, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 208:14]
  output        io_halted, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 208:14]
  output [31:0] io_db_r1, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 208:14]
  output [31:0] io_db_r2, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 208:14]
  output [31:0] io_db_pc // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 208:14]
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] alu_io_input1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 220:19]
  wire [31:0] alu_io_input2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 220:19]
  wire [2:0] alu_io_func3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 220:19]
  wire [31:0] alu_io_out; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 220:19]
  wire  regs_clock; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 221:20]
  wire [31:0] regs_io_din; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 221:20]
  wire [4:0] regs_io_rsd; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 221:20]
  wire [4:0] regs_io_rs1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 221:20]
  wire [4:0] regs_io_rs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 221:20]
  wire [31:0] regs_io_outrs1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 221:20]
  wire [31:0] regs_io_outrs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 221:20]
  wire [1:0] mshift_io_shift; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 222:22]
  wire [31:0] mshift_io_in; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 222:22]
  wire [31:0] mshift_io_out; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 222:22]
  reg [31:0] PC; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 223:19]
  wire [31:0] PC4 = PC + 32'h4; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 225:16]
  reg  state_start; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 227:29]
  reg  state_fetch; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 228:29]
  reg  state_decode; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 230:29]
  reg  state_exec; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 231:27]
  reg  state_halt; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 232:27]
  reg [4:0] rd; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 235:19]
  reg [4:0] rs1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 236:19]
  reg [4:0] rs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 237:20]
  reg [31:0] savedOp; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 238:24]
  reg [31:0] immv; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 239:21]
  reg [2:0] aluOP; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 240:22]
  reg [2:0] branchOP; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 241:25]
  reg  din_is_alu; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 243:27]
  reg  din_is_mem; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 244:27]
  reg  alu2_use_reg; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 245:29]
  reg  branchEnable; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 247:29]
  reg  jumpEnable; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 248:27]
  reg  absjumpEnable; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 249:30]
  reg  storePC; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 250:24]
  reg  writeEnable; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 251:28]
  wire [31:0] instruction = state_decode ? io_mIn : savedOp; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 259:21]
  wire [6:0] inst_opcode = instruction[6:0]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 265:36]
  wire [4:0] inst_I_rd = instruction[11:7]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 266:36]
  wire [2:0] inst_I_func3 = instruction[14:12]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 266:36]
  wire [4:0] inst_I_rs1 = instruction[19:15]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 266:36]
  wire [11:0] inst_I_imm = instruction[31:20]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 266:36]
  wire [4:0] inst_R_rs2 = instruction[24:20]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 267:36]
  wire [6:0] inst_R_func7 = instruction[31:25]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 267:36]
  wire [19:0] inst_U_imm = instruction[31:12]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 268:36]
  wire  inst_B_im11 = instruction[7]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 269:36]
  wire [3:0] inst_B_im41 = instruction[11:8]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 269:36]
  wire [5:0] inst_B_imm10_5 = instruction[30:25]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 269:36]
  wire  sign = io_mIn[31]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 277:17]
  wire [19:0] _imm_I_T_1 = sign ? 20'hfffff : 20'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 280:15]
  wire [31:0] imm_I = {_imm_I_T_1,inst_I_imm}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 280:52]
  wire [31:0] imm_B = {_imm_I_T_1,inst_B_im11,inst_B_imm10_5,inst_B_im41,1'h0}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 283:52]
  wire [31:0] imm_U = {inst_U_imm,12'h0}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 286:23]
  wire [11:0] _imm_J_T_2 = sign ? 12'hfff : 12'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 290:15]
  wire [31:0] imm_J = {_imm_J_T_2,io_mIn[19:12],io_mIn[20],io_mIn[30:25],io_mIn[24:21],1'h0}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 290:123]
  wire [31:0] imm_S = {_imm_I_T_1,inst_R_func7,inst_I_rd}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 294:69]
  wire  _GEN_11 = 7'h73 == inst_opcode & (inst_I_imm == 12'h1 & inst_I_rd == 5'h0 & inst_I_rs1 == 5'h0 & inst_I_func3
     == 3'h0); // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 383:15 395:16 451:19]
  wire  _GEN_20 = 7'h23 == inst_opcode ? 1'h0 : _GEN_11; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 383:15 395:16]
  wire  _GEN_30 = 7'h3 == inst_opcode ? 1'h0 : _GEN_20; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 383:15 395:16]
  wire  _GEN_41 = 7'h67 == inst_opcode ? 1'h0 : _GEN_30; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 383:15 395:16]
  wire  _GEN_53 = 7'h6f == inst_opcode ? 1'h0 : _GEN_41; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 383:15 395:16]
  wire  _GEN_65 = 7'h37 == inst_opcode ? 1'h0 : _GEN_53; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 383:15 395:16]
  wire  _GEN_78 = 7'h63 == inst_opcode ? 1'h0 : _GEN_65; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 383:15 395:16]
  wire  _GEN_91 = 7'h13 == inst_opcode ? 1'h0 : _GEN_78; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 383:15 395:16]
  wire  must_halt = state_decode & _GEN_91; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 334:13 374:21]
  wire [31:0] memAddr = state_fetch | state_start ? PC : alu_io_out; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 309:18]
  wire  _GEN_1 = 3'h1 == inst_I_func3 ? ~memAddr[1] : 3'h2 == inst_I_func3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 352:24 360:20]
  wire  writeMask_0 = 3'h0 == inst_I_func3 ? memAddr[1:0] == 2'h0 : _GEN_1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 352:24 354:20]
  wire  writeMask_1 = 3'h0 == inst_I_func3 ? memAddr[1:0] == 2'h1 : _GEN_1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 352:24 355:20]
  wire  _GEN_3 = 3'h1 == inst_I_func3 ? memAddr[1] : 3'h2 == inst_I_func3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 352:24 362:20]
  wire  writeMask_2 = 3'h0 == inst_I_func3 ? memAddr[1:0] == 2'h2 : _GEN_3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 352:24 356:20]
  wire  writeMask_3 = 3'h0 == inst_I_func3 ? memAddr[1:0] == 2'h3 : _GEN_3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 352:24 357:20]
  wire [31:0] _lui_mix_T_2 = {immv[31:12],regs_io_outrs1[11:0]}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 333:52]
  wire [31:0] lui_mix = din_is_mem ? io_mIn : _lui_mix_T_2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 333:17]
  wire [31:0] _regs_io_din_T = din_is_alu ? alu_io_out : lui_mix; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 327:39]
  wire [31:0] _branch_target_T_1 = PC + alu_io_out; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 338:69]
  wire [31:0] _branch_target_T_3 = PC + immv; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 338:85]
  wire [31:0] _branch_target_T_4 = jumpEnable ? _branch_target_T_1 : _branch_target_T_3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 338:53]
  wire  alu_eq = regs_io_outrs1 == regs_io_outrs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 340:31]
  wire  alu_lt = regs_io_outrs1 < regs_io_outrs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 341:31]
  wire [4:0] _GEN_9 = 7'h73 == inst_opcode ? 5'h2 : inst_R_rs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 449:13 375:9]
  wire [4:0] _GEN_10 = 7'h73 == inst_opcode ? 5'h1 : inst_I_rs1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 450:13 376:9]
  wire [4:0] _GEN_12 = 7'h23 == inst_opcode ? 5'h0 : inst_I_rd; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 440:12 377:8]
  wire [2:0] _GEN_13 = 7'h23 == inst_opcode ? 3'h0 : inst_I_func3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 380:11 395:16 442:15]
  wire [31:0] _GEN_15 = 7'h23 == inst_opcode ? imm_S : 32'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 386:10 395:16 444:14]
  wire  _GEN_16 = 7'h23 == inst_opcode ? 1'h0 : 1'h1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 390:18 445:22]
  wire [4:0] _GEN_18 = 7'h23 == inst_opcode ? inst_R_rs2 : _GEN_9; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 375:9]
  wire [4:0] _GEN_19 = 7'h23 == inst_opcode ? inst_I_rs1 : _GEN_10; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 376:9]
  wire [2:0] _GEN_22 = 7'h3 == inst_opcode ? 3'h0 : _GEN_13; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 434:15]
  wire [31:0] _GEN_24 = 7'h3 == inst_opcode ? imm_I : _GEN_15; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 436:14]
  wire  _GEN_25 = 7'h3 == inst_opcode ? 1'h0 : _GEN_16; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 437:22]
  wire [4:0] _GEN_26 = 7'h3 == inst_opcode ? inst_I_rd : _GEN_12; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 377:8]
  wire  _GEN_27 = 7'h3 == inst_opcode ? 1'h0 : 7'h23 == inst_opcode; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 391:17]
  wire [4:0] _GEN_28 = 7'h3 == inst_opcode ? inst_R_rs2 : _GEN_18; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 375:9]
  wire [4:0] _GEN_29 = 7'h3 == inst_opcode ? inst_I_rs1 : _GEN_19; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 376:9]
  wire [2:0] _GEN_32 = 7'h67 == inst_opcode ? 3'h0 : _GEN_22; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 424:15]
  wire [31:0] _GEN_34 = 7'h67 == inst_opcode ? imm_I : _GEN_24; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 427:14]
  wire  _GEN_35 = 7'h67 == inst_opcode ? 1'h0 : _GEN_25; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 428:22]
  wire  _GEN_36 = 7'h67 == inst_opcode ? 1'h0 : 7'h3 == inst_opcode; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 388:16 395:16]
  wire [4:0] _GEN_37 = 7'h67 == inst_opcode ? inst_I_rd : _GEN_26; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 377:8]
  wire  _GEN_38 = 7'h67 == inst_opcode ? 1'h0 : _GEN_27; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 391:17]
  wire [4:0] _GEN_39 = 7'h67 == inst_opcode ? inst_R_rs2 : _GEN_28; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 375:9]
  wire [4:0] _GEN_40 = 7'h67 == inst_opcode ? inst_I_rs1 : _GEN_29; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 376:9]
  wire [2:0] _GEN_42 = 7'h6f == inst_opcode ? 3'h0 : _GEN_32; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 414:15]
  wire  _GEN_44 = 7'h6f == inst_opcode | 7'h67 == inst_opcode; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 416:20]
  wire [4:0] _GEN_45 = 7'h6f == inst_opcode ? 5'h0 : _GEN_40; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 417:13]
  wire [31:0] _GEN_46 = 7'h6f == inst_opcode ? imm_J : _GEN_34; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 418:14]
  wire  _GEN_47 = 7'h6f == inst_opcode ? 1'h0 : _GEN_35; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 419:22]
  wire  _GEN_48 = 7'h6f == inst_opcode ? 1'h0 : 7'h67 == inst_opcode; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 394:19]
  wire  _GEN_49 = 7'h6f == inst_opcode ? 1'h0 : _GEN_36; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 388:16 395:16]
  wire [4:0] _GEN_50 = 7'h6f == inst_opcode ? inst_I_rd : _GEN_37; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 377:8]
  wire  _GEN_51 = 7'h6f == inst_opcode ? 1'h0 : _GEN_38; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 391:17]
  wire [4:0] _GEN_52 = 7'h6f == inst_opcode ? inst_R_rs2 : _GEN_39; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 375:9]
  wire [31:0] _GEN_54 = 7'h37 == inst_opcode ? imm_U : _GEN_46; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 409:14]
  wire [4:0] _GEN_55 = 7'h37 == inst_opcode ? inst_I_rd : _GEN_45; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 410:13]
  wire [2:0] _GEN_56 = 7'h37 == inst_opcode ? inst_I_func3 : _GEN_42; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 380:11 395:16]
  wire  _GEN_58 = 7'h37 == inst_opcode ? 1'h0 : _GEN_44; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 385:16 395:16]
  wire  _GEN_59 = 7'h37 == inst_opcode | _GEN_47; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 390:18]
  wire  _GEN_60 = 7'h37 == inst_opcode ? 1'h0 : _GEN_48; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 394:19]
  wire  _GEN_61 = 7'h37 == inst_opcode ? 1'h0 : _GEN_49; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 388:16 395:16]
  wire [4:0] _GEN_62 = 7'h37 == inst_opcode ? inst_I_rd : _GEN_50; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 377:8]
  wire  _GEN_63 = 7'h37 == inst_opcode ? 1'h0 : _GEN_51; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 391:17]
  wire [4:0] _GEN_64 = 7'h37 == inst_opcode ? inst_R_rs2 : _GEN_52; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16 375:9]
  wire  _branchCheck_T_1 = ~alu_lt; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 474:22]
  wire  _GEN_109 = 3'h7 == branchOP & _branchCheck_T_1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 459:15 460:20 480:19]
  wire  _GEN_110 = 3'h6 == branchOP ? alu_lt : _GEN_109; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 460:20 477:19]
  wire  _GEN_111 = 3'h5 == branchOP ? ~alu_lt : _GEN_110; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 460:20 474:19]
  wire  _GEN_112 = 3'h4 == branchOP ? alu_lt : _GEN_111; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 460:20 471:19]
  wire  _GEN_113 = 3'h1 == branchOP ? ~alu_eq : _GEN_112; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 460:20 465:19]
  wire  branchCheck = 3'h0 == branchOP ? alu_eq : _GEN_113; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 460:20 462:19]
  Alu alu ( // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 220:19]
    .io_input1(alu_io_input1),
    .io_input2(alu_io_input2),
    .io_func3(alu_io_func3),
    .io_out(alu_io_out)
  );
  RegisterBank regs ( // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 221:20]
    .clock(regs_clock),
    .io_din(regs_io_din),
    .io_rsd(regs_io_rsd),
    .io_rs1(regs_io_rs1),
    .io_rs2(regs_io_rs2),
    .io_outrs1(regs_io_outrs1),
    .io_outrs2(regs_io_outrs2)
  );
  MemShift mshift ( // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 222:22]
    .io_shift(mshift_io_shift),
    .io_in(mshift_io_in),
    .io_out(mshift_io_out)
  );
  assign io_mWrite = state_exec & writeEnable; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 307:27]
  assign io_mMask_0 = state_exec & writeMask_0 & writeEnable; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 313:44]
  assign io_mMask_1 = state_exec & writeMask_1 & writeEnable; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 314:44]
  assign io_mMask_2 = state_exec & writeMask_2 & writeEnable; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 315:44]
  assign io_mMask_3 = state_exec & writeMask_3 & writeEnable; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 316:44]
  assign io_mOut = mshift_io_out; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 312:11]
  assign io_mAddr = memAddr[31:2]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 311:23]
  assign io_halted = state_halt; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 317:13]
  assign io_db_r1 = regs_io_outrs1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 320:12]
  assign io_db_r2 = regs_io_outrs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 321:12]
  assign io_db_pc = PC; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 319:12]
  assign alu_io_input1 = regs_io_outrs1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 323:17]
  assign alu_io_input2 = alu2_use_reg ? regs_io_outrs2 : immv; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 324:23]
  assign alu_io_func3 = aluOP; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 325:16]
  assign regs_clock = clock;
  assign regs_io_din = storePC ? PC4 : _regs_io_din_T; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 327:21]
  assign regs_io_rsd = state_exec & ~din_is_mem | state_fetch & din_is_mem ? rd : 5'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 331:21]
  assign regs_io_rs1 = rs1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 329:15]
  assign regs_io_rs2 = rs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 330:15]
  assign mshift_io_shift = memAddr[1:0]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 346:29]
  assign mshift_io_in = regs_io_outrs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 345:16]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 223:19]
      PC <= 32'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 223:19]
    end else if (state_exec) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 484:19]
      if (jumpEnable | branchEnable & branchCheck) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 486:14]
        if (absjumpEnable) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 338:23]
          PC <= alu_io_out;
        end else begin
          PC <= _branch_target_T_4;
        end
      end else begin
        PC <= PC4;
      end
    end
    state_start <= reset; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 227:{29,29} 299:15]
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 228:29]
      state_fetch <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 228:29]
    end else begin
      state_fetch <= state_exec | state_start; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 300:15]
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 230:29]
      state_decode <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 230:29]
    end else begin
      state_decode <= state_fetch; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 302:16]
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 231:27]
      state_exec <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 231:27]
    end else if (must_halt) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 303:21]
      state_exec <= 1'h0;
    end else begin
      state_exec <= state_decode;
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 232:27]
      state_halt <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 232:27]
    end else begin
      state_halt <= must_halt | state_halt; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 304:14]
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 235:19]
      rd <= 5'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 235:19]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 374:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        rd <= inst_I_rd; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:8]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        rd <= inst_I_rd; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 377:8]
      end else begin
        rd <= _GEN_62;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 236:19]
      rs1 <= 5'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 236:19]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 374:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        rs1 <= inst_I_rs1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 376:9]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        rs1 <= inst_I_rs1; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 376:9]
      end else begin
        rs1 <= _GEN_55;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 237:20]
      rs2 <= 5'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 237:20]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 374:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        rs2 <= inst_R_rs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 375:9]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        rs2 <= inst_R_rs2; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 375:9]
      end else begin
        rs2 <= _GEN_64;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 238:24]
      savedOp <= 32'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 238:24]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 259:21]
      savedOp <= io_mIn;
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 239:21]
      immv <= 32'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 239:21]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 374:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        immv <= imm_I; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 398:14]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        immv <= imm_B; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 405:14]
      end else begin
        immv <= _GEN_54;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 240:22]
      aluOP <= 3'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 240:22]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 374:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        aluOP <= inst_I_func3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 380:11]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        aluOP <= 3'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 402:15]
      end else begin
        aluOP <= _GEN_56;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 241:25]
      branchOP <= 3'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 241:25]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 374:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        branchOP <= 3'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 381:14]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        branchOP <= inst_I_func3; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 403:18]
      end else begin
        branchOP <= 3'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 381:14]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 243:27]
      din_is_alu <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 243:27]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 374:21]
      if (inst_opcode == 7'h37 | inst_opcode == 7'h3) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 389:22]
        din_is_alu <= 1'h0;
      end else begin
        din_is_alu <= 1'h1;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 244:27]
      din_is_mem <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 244:27]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 374:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        din_is_mem <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 388:16]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        din_is_mem <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 388:16]
      end else begin
        din_is_mem <= _GEN_61;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 245:29]
      alu2_use_reg <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 245:29]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 374:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        alu2_use_reg <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 399:22]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        alu2_use_reg <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 406:22]
      end else begin
        alu2_use_reg <= _GEN_59;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 247:29]
      branchEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 247:29]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 374:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        branchEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 384:18]
      end else begin
        branchEnable <= 7'h63 == inst_opcode;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 248:27]
      jumpEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 248:27]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 374:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        jumpEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 385:16]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        jumpEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 385:16]
      end else begin
        jumpEnable <= _GEN_58;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 249:30]
      absjumpEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 249:30]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 374:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        absjumpEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 394:19]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        absjumpEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 394:19]
      end else begin
        absjumpEnable <= _GEN_60;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 250:24]
      storePC <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 250:24]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 374:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        storePC <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 385:16]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        storePC <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 385:16]
      end else begin
        storePC <= _GEN_58;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 251:28]
      writeEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 251:28]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 374:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        writeEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 391:17]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 395:16]
        writeEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 391:17]
      end else begin
        writeEnable <= _GEN_63;
      end
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
  savedOp = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  immv = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  aluOP = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  branchOP = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  din_is_alu = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  din_is_mem = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  alu2_use_reg = _RAND_15[0:0];
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
