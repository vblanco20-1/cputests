module Alu(
  input  [31:0] io_input1, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 20:14]
  input  [31:0] io_input2, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 20:14]
  input  [2:0]  io_func3, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 20:14]
  output [31:0] io_out // @[\\src\\main\\scala\\gcd\\rv_alu.scala 20:14]
);
  wire [31:0] _io_out_T_1 = io_input1 + io_input2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 28:36]
  wire [31:0] _io_out_T_2 = io_input1 & io_input2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 29:36]
  wire [31:0] _io_out_T_3 = io_input1 ^ io_input2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 30:36]
  wire [31:0] _io_out_T_4 = io_input1 | io_input2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 31:36]
  wire [31:0] _GEN_0 = 3'h4 == io_func3 ? _io_out_T_4 : 32'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 26:10 27:20 31:23]
  wire [31:0] _GEN_1 = 3'h6 == io_func3 ? _io_out_T_3 : _GEN_0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 27:20 30:23]
  wire [31:0] _GEN_2 = 3'h7 == io_func3 ? _io_out_T_2 : _GEN_1; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 27:20 29:23]
  assign io_out = 3'h0 == io_func3 ? _io_out_T_1 : _GEN_2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 27:20 28:23]
endmodule
module RegisterBank(
  input         clock,
  input  [31:0] io_din, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 121:14]
  input  [4:0]  io_rsd, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 121:14]
  input  [4:0]  io_rs1, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 121:14]
  input  [4:0]  io_rs2, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 121:14]
  output [31:0] io_outrs1, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 121:14]
  output [31:0] io_outrs2 // @[\\src\\main\\scala\\gcd\\rv_alu.scala 121:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] mem1 [0:31]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 144:17]
  wire  mem1_io_outrs1_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 144:17]
  wire [4:0] mem1_io_outrs1_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 144:17]
  wire [31:0] mem1_io_outrs1_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 144:17]
  wire [31:0] mem1_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 144:17]
  wire [4:0] mem1_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 144:17]
  wire  mem1_MPORT_mask; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 144:17]
  wire  mem1_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 144:17]
  reg [31:0] mem2 [0:31]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 145:17]
  wire  mem2_io_outrs2_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 145:17]
  wire [4:0] mem2_io_outrs2_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 145:17]
  wire [31:0] mem2_io_outrs2_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 145:17]
  wire [31:0] mem2_MPORT_1_data; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 145:17]
  wire [4:0] mem2_MPORT_1_addr; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 145:17]
  wire  mem2_MPORT_1_mask; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 145:17]
  wire  mem2_MPORT_1_en; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 145:17]
  wire  rsdzero = io_rsd == 5'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 147:24]
  assign mem1_io_outrs1_MPORT_en = 1'h1;
  assign mem1_io_outrs1_MPORT_addr = io_rs1;
  assign mem1_io_outrs1_MPORT_data = mem1[mem1_io_outrs1_MPORT_addr]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 144:17]
  assign mem1_MPORT_data = io_din;
  assign mem1_MPORT_addr = io_rsd;
  assign mem1_MPORT_mask = 1'h1;
  assign mem1_MPORT_en = ~rsdzero;
  assign mem2_io_outrs2_MPORT_en = 1'h1;
  assign mem2_io_outrs2_MPORT_addr = io_rs2;
  assign mem2_io_outrs2_MPORT_data = mem2[mem2_io_outrs2_MPORT_addr]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 145:17]
  assign mem2_MPORT_1_data = io_din;
  assign mem2_MPORT_1_addr = io_rsd;
  assign mem2_MPORT_1_mask = 1'h1;
  assign mem2_MPORT_1_en = ~rsdzero;
  assign io_outrs1 = mem1_io_outrs1_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 154:13]
  assign io_outrs2 = mem2_io_outrs2_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 155:13]
  always @(posedge clock) begin
    if (mem1_MPORT_en & mem1_MPORT_mask) begin
      mem1[mem1_MPORT_addr] <= mem1_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 144:17]
    end
    if (mem2_MPORT_1_en & mem2_MPORT_1_mask) begin
      mem2[mem2_MPORT_1_addr] <= mem2_MPORT_1_data; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 145:17]
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
module RiscvCPU(
  input         clock,
  input         reset,
  input  [31:0] io_mIn, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 175:14]
  output        io_mWrite, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 175:14]
  output        io_mMask_0, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 175:14]
  output        io_mMask_1, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 175:14]
  output        io_mMask_2, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 175:14]
  output        io_mMask_3, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 175:14]
  output [31:0] io_mOut, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 175:14]
  output [9:0]  io_mAddr, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 175:14]
  output        io_halted, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 175:14]
  output [31:0] io_db_r1, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 175:14]
  output [31:0] io_db_r2, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 175:14]
  output [31:0] io_db_pc // @[\\src\\main\\scala\\gcd\\rv_alu.scala 175:14]
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] alu_io_input1; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 187:19]
  wire [31:0] alu_io_input2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 187:19]
  wire [2:0] alu_io_func3; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 187:19]
  wire [31:0] alu_io_out; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 187:19]
  wire  regs_clock; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 188:20]
  wire [31:0] regs_io_din; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 188:20]
  wire [4:0] regs_io_rsd; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 188:20]
  wire [4:0] regs_io_rs1; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 188:20]
  wire [4:0] regs_io_rs2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 188:20]
  wire [31:0] regs_io_outrs1; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 188:20]
  wire [31:0] regs_io_outrs2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 188:20]
  reg [31:0] PC; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 190:19]
  wire [31:0] PC4 = PC + 32'h4; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 192:16]
  reg  state_start; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 194:29]
  reg  state_fetch; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 195:29]
  reg  state_decode; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 197:29]
  reg  state_exec; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 198:27]
  reg  state_halt; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 199:27]
  reg [4:0] rd; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 202:19]
  reg [4:0] rs1; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 203:19]
  reg [4:0] rs2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 204:20]
  reg [31:0] savedOp; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 205:24]
  reg [31:0] immv; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 206:21]
  reg [2:0] aluOP; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 207:22]
  reg  din_is_alu; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 208:27]
  reg  din_is_mem; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 209:27]
  reg  alu2_use_reg; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 210:29]
  reg  branchEnable; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 212:29]
  reg  writeEnable; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 213:28]
  wire [31:0] instruction = state_decode ? io_mIn : savedOp; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 220:21]
  reg [1:0] memoryShift; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 222:28]
  wire [6:0] inst_opcode = instruction[6:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 226:36]
  wire [4:0] inst_I_rd = instruction[11:7]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 227:36]
  wire [2:0] inst_I_func3 = instruction[14:12]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 227:36]
  wire [4:0] inst_I_rs1 = instruction[19:15]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 227:36]
  wire [11:0] inst_I_imm = instruction[31:20]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 227:36]
  wire [4:0] inst_R_rs2 = instruction[24:20]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 228:36]
  wire [6:0] inst_R_func7 = instruction[31:25]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 228:36]
  wire [19:0] inst_U_imm = instruction[31:12]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 229:36]
  wire  inst_B_im11 = instruction[7]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 230:36]
  wire [3:0] inst_B_im41 = instruction[11:8]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 230:36]
  wire [5:0] inst_B_imm10_5 = instruction[30:25]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 230:36]
  wire  sign = io_mIn[31]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 238:17]
  wire [19:0] _imm_I_T_1 = sign ? 20'hfffff : 20'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 241:15]
  wire [31:0] imm_I = {_imm_I_T_1,inst_I_imm}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 241:52]
  wire [31:0] imm_B = {_imm_I_T_1,inst_B_im11,inst_B_imm10_5,inst_B_im41,1'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 244:52]
  wire [31:0] imm_U = {inst_U_imm,12'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 247:23]
  wire [11:0] _imm_J_T_2 = sign ? 12'hfff : 12'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 251:15]
  wire [31:0] imm_J = {_imm_J_T_2,io_mIn[19:12],io_mIn[20],io_mIn[30:25],io_mIn[24:21],1'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 251:123]
  wire [31:0] imm_S = {_imm_I_T_1,inst_R_func7,inst_I_rd}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 255:69]
  wire  _GEN_6 = 7'h73 == inst_opcode & (inst_I_imm == 12'h1 & inst_I_rd == 5'h0 & inst_I_rs1 == 5'h0 & inst_I_func3 == 3'h0
    ); // @[\\src\\main\\scala\\gcd\\rv_alu.scala 327:15 336:16 376:19]
  wire  _GEN_16 = 7'h23 == inst_opcode ? 1'h0 : _GEN_6; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 327:15 336:16]
  wire  _GEN_27 = 7'h3 == inst_opcode ? 1'h0 : _GEN_16; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 327:15 336:16]
  wire  _GEN_38 = 7'h6f == inst_opcode ? 1'h0 : _GEN_27; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 327:15 336:16]
  wire  _GEN_49 = 7'h37 == inst_opcode ? 1'h0 : _GEN_38; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 327:15 336:16]
  wire  _GEN_60 = 7'h63 == inst_opcode ? 1'h0 : _GEN_49; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 327:15 336:16]
  wire  _GEN_71 = 7'h13 == inst_opcode ? 1'h0 : _GEN_60; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 327:15 336:16]
  wire  must_halt = state_decode & _GEN_71; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 291:13 319:21]
  wire [31:0] _io_mAddr_T_1 = state_fetch | state_start ? PC : alu_io_out; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 268:18]
  wire [31:0] _lui_mix_T_2 = {immv[31:12],regs_io_outrs1[11:0]}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 290:52]
  wire [31:0] lui_mix = din_is_mem ? io_mIn : _lui_mix_T_2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 290:17]
  wire [31:0] branch_target = PC + immv; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 295:23]
  wire  alu_eq = regs_io_outrs1 == regs_io_outrs2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 297:31]
  wire  alu_lt = regs_io_outrs1 < regs_io_outrs2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 298:31]
  wire [39:0] _shiftedMem_T = {regs_io_outrs2, 8'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 308:37]
  wire [47:0] _shiftedMem_T_2 = {_shiftedMem_T,regs_io_outrs2[31:24]}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 308:43]
  wire [47:0] _shiftedMem_T_3 = {regs_io_outrs2, 16'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 311:37]
  wire [63:0] _shiftedMem_T_5 = {_shiftedMem_T_3,regs_io_outrs2[31:16]}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 311:44]
  wire [55:0] _shiftedMem_T_6 = {regs_io_outrs2, 24'h0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 314:37]
  wire [79:0] _shiftedMem_T_8 = {_shiftedMem_T_6,regs_io_outrs2[31:8]}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 314:44]
  wire [79:0] _GEN_1 = 2'h2 == memoryShift ? {{16'd0}, _shiftedMem_T_5} : _shiftedMem_T_8; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 303:23 311:18]
  wire [79:0] _GEN_2 = 2'h1 == memoryShift ? {{32'd0}, _shiftedMem_T_2} : _GEN_1; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 303:23 308:18]
  wire [79:0] _GEN_3 = 2'h0 == memoryShift ? {{48'd0}, regs_io_outrs2} : _GEN_2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 303:23 305:18]
  wire [4:0] _GEN_4 = 7'h73 == inst_opcode ? 5'h2 : inst_R_rs2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 374:13 320:9]
  wire [4:0] _GEN_5 = 7'h73 == inst_opcode ? 5'h1 : inst_I_rs1; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 375:13 321:9]
  wire [4:0] _GEN_7 = 7'h23 == inst_opcode ? 5'h0 : inst_I_rd; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 364:12 322:8]
  wire [2:0] _GEN_8 = 7'h23 == inst_opcode ? 3'h0 : inst_I_func3; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 325:11 336:16 366:15]
  wire [31:0] _GEN_10 = 7'h23 == inst_opcode ? imm_S : 32'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 329:10 336:16 368:14]
  wire  _GEN_11 = 7'h23 == inst_opcode ? 1'h0 : 1'h1; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 333:18 369:22]
  wire [1:0] _GEN_13 = 7'h23 == inst_opcode ? immv[1:0] : 2'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 335:17 371:21]
  wire [4:0] _GEN_14 = 7'h23 == inst_opcode ? inst_R_rs2 : _GEN_4; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 320:9]
  wire [4:0] _GEN_15 = 7'h23 == inst_opcode ? inst_I_rs1 : _GEN_5; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 321:9]
  wire [2:0] _GEN_18 = 7'h3 == inst_opcode ? 3'h0 : _GEN_8; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 358:15]
  wire [31:0] _GEN_20 = 7'h3 == inst_opcode ? imm_I : _GEN_10; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 360:14]
  wire  _GEN_21 = 7'h3 == inst_opcode ? 1'h0 : _GEN_11; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 361:22]
  wire [4:0] _GEN_22 = 7'h3 == inst_opcode ? inst_I_rd : _GEN_7; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 322:8]
  wire  _GEN_23 = 7'h3 == inst_opcode ? 1'h0 : 7'h23 == inst_opcode; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 334:17]
  wire [1:0] _GEN_24 = 7'h3 == inst_opcode ? 2'h0 : _GEN_13; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 335:17]
  wire [4:0] _GEN_25 = 7'h3 == inst_opcode ? inst_R_rs2 : _GEN_14; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 320:9]
  wire [4:0] _GEN_26 = 7'h3 == inst_opcode ? inst_I_rs1 : _GEN_15; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 321:9]
  wire [2:0] _GEN_28 = 7'h6f == inst_opcode ? 3'h2 : _GEN_18; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 351:15]
  wire [31:0] _GEN_30 = 7'h6f == inst_opcode ? imm_J : _GEN_20; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 353:14]
  wire  _GEN_31 = 7'h6f == inst_opcode ? 1'h0 : 7'h3 == inst_opcode; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 331:16 336:16]
  wire [4:0] _GEN_33 = 7'h6f == inst_opcode ? inst_I_rd : _GEN_22; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 322:8]
  wire  _GEN_34 = 7'h6f == inst_opcode ? 1'h0 : _GEN_23; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 334:17]
  wire [1:0] _GEN_35 = 7'h6f == inst_opcode ? 2'h0 : _GEN_24; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 335:17]
  wire [4:0] _GEN_36 = 7'h6f == inst_opcode ? inst_R_rs2 : _GEN_25; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 320:9]
  wire [4:0] _GEN_37 = 7'h6f == inst_opcode ? inst_I_rs1 : _GEN_26; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 321:9]
  wire [31:0] _GEN_39 = 7'h37 == inst_opcode ? imm_U : _GEN_30; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 347:14]
  wire [4:0] _GEN_40 = 7'h37 == inst_opcode ? inst_I_rd : _GEN_37; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 348:13]
  wire [2:0] _GEN_41 = 7'h37 == inst_opcode ? inst_I_func3 : _GEN_28; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 325:11 336:16]
  wire  _GEN_42 = 7'h37 == inst_opcode ? 1'h0 : 7'h6f == inst_opcode; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 328:18]
  wire  _GEN_43 = 7'h37 == inst_opcode ? 1'h0 : _GEN_31; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 331:16 336:16]
  wire [4:0] _GEN_45 = 7'h37 == inst_opcode ? inst_I_rd : _GEN_33; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 322:8]
  wire  _GEN_46 = 7'h37 == inst_opcode ? 1'h0 : _GEN_34; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 334:17]
  wire [1:0] _GEN_47 = 7'h37 == inst_opcode ? 2'h0 : _GEN_35; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 335:17]
  wire [4:0] _GEN_48 = 7'h37 == inst_opcode ? inst_R_rs2 : _GEN_36; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 320:9]
  wire  _GEN_50 = 7'h63 == inst_opcode | _GEN_42; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 343:22]
  wire  _GEN_55 = 7'h63 == inst_opcode | (7'h37 == inst_opcode | (7'h6f == inst_opcode | _GEN_21)); // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16 333:18]
  wire  _branchCheck_T_1 = ~alu_lt; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 399:22]
  wire  _GEN_85 = 3'h7 == aluOP & _branchCheck_T_1; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 384:15 385:17 405:19]
  wire  _GEN_86 = 3'h6 == aluOP ? alu_lt : _GEN_85; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 385:17 402:19]
  wire  _GEN_87 = 3'h5 == aluOP ? ~alu_lt : _GEN_86; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 385:17 399:19]
  wire  _GEN_88 = 3'h4 == aluOP ? alu_lt : _GEN_87; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 385:17 396:19]
  wire  _GEN_89 = 3'h2 == aluOP | _GEN_88; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 385:17 393:19]
  wire  _GEN_90 = 3'h1 == aluOP ? ~alu_eq : _GEN_89; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 385:17 390:19]
  wire  branchCheck = 3'h0 == aluOP ? alu_eq : _GEN_90; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 385:17 387:19]
  Alu alu ( // @[\\src\\main\\scala\\gcd\\rv_alu.scala 187:19]
    .io_input1(alu_io_input1),
    .io_input2(alu_io_input2),
    .io_func3(alu_io_func3),
    .io_out(alu_io_out)
  );
  RegisterBank regs ( // @[\\src\\main\\scala\\gcd\\rv_alu.scala 188:20]
    .clock(regs_clock),
    .io_din(regs_io_din),
    .io_rsd(regs_io_rsd),
    .io_rs1(regs_io_rs1),
    .io_rs2(regs_io_rs2),
    .io_outrs1(regs_io_outrs1),
    .io_outrs2(regs_io_outrs2)
  );
  assign io_mWrite = state_exec & writeEnable; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 266:27]
  assign io_mMask_0 = state_exec & writeEnable; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 270:29]
  assign io_mMask_1 = state_exec & writeEnable; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 271:29]
  assign io_mMask_2 = state_exec & writeEnable; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 272:29]
  assign io_mMask_3 = state_exec & writeEnable; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 273:29]
  assign io_mOut = _GEN_3[31:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 223:24]
  assign io_mAddr = _io_mAddr_T_1[9:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 268:12]
  assign io_halted = state_halt; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 274:13]
  assign io_db_r1 = regs_io_outrs1; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 277:12]
  assign io_db_r2 = regs_io_outrs2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 278:12]
  assign io_db_pc = PC; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 276:12]
  assign alu_io_input1 = regs_io_outrs1; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 280:17]
  assign alu_io_input2 = alu2_use_reg ? regs_io_outrs2 : immv; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 281:23]
  assign alu_io_func3 = aluOP; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 282:16]
  assign regs_clock = clock;
  assign regs_io_din = din_is_alu ? alu_io_out : lui_mix; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 284:21]
  assign regs_io_rsd = state_exec & ~din_is_mem | state_fetch & din_is_mem ? rd : 5'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 288:21]
  assign regs_io_rs1 = rs1; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 286:15]
  assign regs_io_rs2 = rs2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 287:15]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 190:19]
      PC <= 32'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 190:19]
    end else if (state_exec) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 409:19]
      if (branchEnable & branchCheck) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 411:14]
        PC <= branch_target;
      end else begin
        PC <= PC4;
      end
    end
    state_start <= reset; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 194:{29,29} 258:15]
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 195:29]
      state_fetch <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 195:29]
    end else begin
      state_fetch <= state_exec | state_start; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 259:15]
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 197:29]
      state_decode <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 197:29]
    end else begin
      state_decode <= state_fetch; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 261:16]
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 198:27]
      state_exec <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 198:27]
    end else if (must_halt) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 262:21]
      state_exec <= 1'h0;
    end else begin
      state_exec <= state_decode;
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 199:27]
      state_halt <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 199:27]
    end else begin
      state_halt <= must_halt | state_halt; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 263:14]
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 202:19]
      rd <= 5'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 202:19]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 319:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16]
        rd <= inst_I_rd; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 322:8]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16]
        rd <= inst_I_rd; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 322:8]
      end else begin
        rd <= _GEN_45;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 203:19]
      rs1 <= 5'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 203:19]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 319:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16]
        rs1 <= inst_I_rs1; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 321:9]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16]
        rs1 <= inst_I_rs1; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 321:9]
      end else begin
        rs1 <= _GEN_40;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 204:20]
      rs2 <= 5'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 204:20]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 319:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16]
        rs2 <= inst_R_rs2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 320:9]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16]
        rs2 <= inst_R_rs2; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 320:9]
      end else begin
        rs2 <= _GEN_48;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 205:24]
      savedOp <= 32'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 205:24]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 220:21]
      savedOp <= io_mIn;
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 206:21]
      immv <= 32'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 206:21]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 319:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16]
        immv <= imm_I; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 339:14]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16]
        immv <= imm_B; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 344:14]
      end else begin
        immv <= _GEN_39;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 207:22]
      aluOP <= 3'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 207:22]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 319:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16]
        aluOP <= inst_I_func3; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 325:11]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16]
        aluOP <= inst_I_func3; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 325:11]
      end else begin
        aluOP <= _GEN_41;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 208:27]
      din_is_alu <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 208:27]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 319:21]
      if (inst_opcode == 7'h37 | inst_opcode == 7'h3) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 332:22]
        din_is_alu <= 1'h0;
      end else begin
        din_is_alu <= 1'h1;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 209:27]
      din_is_mem <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 209:27]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 319:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16]
        din_is_mem <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 331:16]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16]
        din_is_mem <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 331:16]
      end else begin
        din_is_mem <= _GEN_43;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 210:29]
      alu2_use_reg <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 210:29]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 319:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16]
        alu2_use_reg <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 340:22]
      end else begin
        alu2_use_reg <= _GEN_55;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 212:29]
      branchEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 212:29]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 319:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16]
        branchEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 328:18]
      end else begin
        branchEnable <= _GEN_50;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 213:28]
      writeEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 213:28]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 319:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16]
        writeEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 334:17]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16]
        writeEnable <= 1'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 334:17]
      end else begin
        writeEnable <= _GEN_46;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 222:28]
      memoryShift <= 2'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 222:28]
    end else if (state_decode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 319:21]
      if (7'h13 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16]
        memoryShift <= 2'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 335:17]
      end else if (7'h63 == inst_opcode) begin // @[\\src\\main\\scala\\gcd\\rv_alu.scala 336:16]
        memoryShift <= 2'h0; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 335:17]
      end else begin
        memoryShift <= _GEN_47;
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
  din_is_alu = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  din_is_mem = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  alu2_use_reg = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  branchEnable = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  writeEnable = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  memoryShift = _RAND_17[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
