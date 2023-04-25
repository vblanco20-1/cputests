module Alu(
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
module RegisterBank(
  input         clock,
  input  [31:0] io_din,
  input  [4:0]  io_rsd,
  input  [4:0]  io_rs1,
  input  [4:0]  io_rs2,
  output [31:0] io_outrs1,
  output [31:0] io_outrs2
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] mem [0:31]; // @[rv_alu.scala 144:16]
  wire  mem_io_outrs1_MPORT_en; // @[rv_alu.scala 144:16]
  wire [4:0] mem_io_outrs1_MPORT_addr; // @[rv_alu.scala 144:16]
  wire [31:0] mem_io_outrs1_MPORT_data; // @[rv_alu.scala 144:16]
  wire  mem_io_outrs2_MPORT_en; // @[rv_alu.scala 144:16]
  wire [4:0] mem_io_outrs2_MPORT_addr; // @[rv_alu.scala 144:16]
  wire [31:0] mem_io_outrs2_MPORT_data; // @[rv_alu.scala 144:16]
  wire [31:0] mem_MPORT_data; // @[rv_alu.scala 144:16]
  wire [4:0] mem_MPORT_addr; // @[rv_alu.scala 144:16]
  wire  mem_MPORT_mask; // @[rv_alu.scala 144:16]
  wire  mem_MPORT_en; // @[rv_alu.scala 144:16]
  wire  rsdzero = io_rsd == 5'h0; // @[rv_alu.scala 146:24]
  assign mem_io_outrs1_MPORT_en = 1'h1;
  assign mem_io_outrs1_MPORT_addr = io_rs1;
  assign mem_io_outrs1_MPORT_data = mem[mem_io_outrs1_MPORT_addr]; // @[rv_alu.scala 144:16]
  assign mem_io_outrs2_MPORT_en = 1'h1;
  assign mem_io_outrs2_MPORT_addr = io_rs2;
  assign mem_io_outrs2_MPORT_data = mem[mem_io_outrs2_MPORT_addr]; // @[rv_alu.scala 144:16]
  assign mem_MPORT_data = io_din;
  assign mem_MPORT_addr = io_rsd;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = ~rsdzero;
  assign io_outrs1 = mem_io_outrs1_MPORT_data; // @[rv_alu.scala 152:13]
  assign io_outrs2 = mem_io_outrs2_MPORT_data; // @[rv_alu.scala 153:13]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[rv_alu.scala 144:16]
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
    mem[initvar] = _RAND_0[31:0];
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
  input  [31:0] io_mIn,
  output        io_mWrite,
  output        io_mMask_0,
  output        io_mMask_1,
  output        io_mMask_2,
  output        io_mMask_3,
  output [31:0] io_mOut,
  output [9:0]  io_mAddr,
  output        io_halted,
  output [31:0] io_db_r1,
  output [31:0] io_db_r2,
  output [31:0] io_db_pc
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] alu_io_input1; // @[rv_alu.scala 185:19]
  wire [31:0] alu_io_input2; // @[rv_alu.scala 185:19]
  wire [2:0] alu_io_func3; // @[rv_alu.scala 185:19]
  wire [31:0] alu_io_out; // @[rv_alu.scala 185:19]
  wire  regs_clock; // @[rv_alu.scala 186:20]
  wire [31:0] regs_io_din; // @[rv_alu.scala 186:20]
  wire [4:0] regs_io_rsd; // @[rv_alu.scala 186:20]
  wire [4:0] regs_io_rs1; // @[rv_alu.scala 186:20]
  wire [4:0] regs_io_rs2; // @[rv_alu.scala 186:20]
  wire [31:0] regs_io_outrs1; // @[rv_alu.scala 186:20]
  wire [31:0] regs_io_outrs2; // @[rv_alu.scala 186:20]
  reg [31:0] PC; // @[rv_alu.scala 188:19]
  wire [31:0] PC4 = PC + 32'h4; // @[rv_alu.scala 190:16]
  reg  state_start; // @[rv_alu.scala 192:29]
  reg  state_fetch; // @[rv_alu.scala 193:29]
  reg  state_decode; // @[rv_alu.scala 195:29]
  reg  state_exec; // @[rv_alu.scala 196:27]
  reg  state_halt; // @[rv_alu.scala 197:27]
  reg [4:0] rd; // @[rv_alu.scala 200:20]
  reg [4:0] rs1; // @[rv_alu.scala 201:20]
  reg [4:0] rs2; // @[rv_alu.scala 202:20]
  reg [31:0] savedOp; // @[rv_alu.scala 203:24]
  reg [31:0] immv; // @[rv_alu.scala 204:21]
  reg [2:0] aluOP; // @[rv_alu.scala 205:22]
  reg  din_is_alu; // @[rv_alu.scala 206:27]
  reg  din_is_mem; // @[rv_alu.scala 207:27]
  reg  alu2_use_reg; // @[rv_alu.scala 208:29]
  reg  branchEnable; // @[rv_alu.scala 210:29]
  reg  writeEnable; // @[rv_alu.scala 211:28]
  wire [31:0] instruction = state_decode ? io_mIn : savedOp; // @[rv_alu.scala 218:21]
  wire [6:0] inst_opcode = instruction[6:0]; // @[rv_alu.scala 221:36]
  wire [4:0] inst_I_rd = instruction[11:7]; // @[rv_alu.scala 222:36]
  wire [2:0] inst_I_func3 = instruction[14:12]; // @[rv_alu.scala 222:36]
  wire [4:0] inst_I_rs1 = instruction[19:15]; // @[rv_alu.scala 222:36]
  wire [11:0] inst_I_imm = instruction[31:20]; // @[rv_alu.scala 222:36]
  wire [4:0] inst_R_rs2 = instruction[24:20]; // @[rv_alu.scala 223:36]
  wire [6:0] inst_R_func7 = instruction[31:25]; // @[rv_alu.scala 223:36]
  wire [19:0] inst_U_imm = instruction[31:12]; // @[rv_alu.scala 224:36]
  wire  inst_B_im11 = instruction[7]; // @[rv_alu.scala 225:36]
  wire [3:0] inst_B_im41 = instruction[11:8]; // @[rv_alu.scala 225:36]
  wire [5:0] inst_B_imm10_5 = instruction[30:25]; // @[rv_alu.scala 225:36]
  wire  sign = io_mIn[31]; // @[rv_alu.scala 231:17]
  wire [19:0] _imm_I_T_1 = sign ? 20'hfffff : 20'h0; // @[rv_alu.scala 234:15]
  wire [31:0] imm_I = {_imm_I_T_1,inst_I_imm}; // @[rv_alu.scala 234:52]
  wire [31:0] imm_B = {_imm_I_T_1,inst_B_im11,inst_B_imm10_5,inst_B_im41,1'h0}; // @[rv_alu.scala 237:52]
  wire [31:0] imm_U = {inst_U_imm,12'h0}; // @[rv_alu.scala 240:23]
  wire [11:0] _imm_J_T_2 = sign ? 12'hfff : 12'h0; // @[rv_alu.scala 244:15]
  wire [31:0] imm_J = {_imm_J_T_2,io_mIn[19:12],io_mIn[20],io_mIn[30:25],io_mIn[24:21],1'h0}; // @[rv_alu.scala 244:123]
  wire [31:0] imm_S = {_imm_I_T_1,inst_R_func7,inst_I_rd}; // @[rv_alu.scala 248:69]
  wire  _GEN_0 = 7'h73 == inst_opcode & (inst_I_imm == 12'h1 & inst_I_rd == 5'h0 & inst_I_rs1 == 5'h0 & inst_I_func3 == 3'h0
    ); // @[rv_alu.scala 300:15 310:16 347:19]
  wire  _GEN_9 = 7'h23 == inst_opcode ? 1'h0 : _GEN_0; // @[rv_alu.scala 300:15 310:16]
  wire  _GEN_20 = 7'h3 == inst_opcode ? 1'h0 : _GEN_9; // @[rv_alu.scala 300:15 310:16]
  wire  _GEN_30 = 7'h6f == inst_opcode ? 1'h0 : _GEN_20; // @[rv_alu.scala 300:15 310:16]
  wire  _GEN_41 = 7'h37 == inst_opcode ? 1'h0 : _GEN_30; // @[rv_alu.scala 300:15 310:16]
  wire  _GEN_51 = 7'h63 == inst_opcode ? 1'h0 : _GEN_41; // @[rv_alu.scala 300:15 310:16]
  wire  _GEN_61 = 7'h13 == inst_opcode ? 1'h0 : _GEN_51; // @[rv_alu.scala 300:15 310:16]
  wire  must_halt = state_decode & _GEN_61; // @[rv_alu.scala 284:13 296:21]
  wire [31:0] _io_mAddr_T_1 = state_fetch | state_start ? PC : alu_io_out; // @[rv_alu.scala 261:18]
  wire [31:0] _lui_mix_T_2 = {immv[31:12],regs_io_outrs1[11:0]}; // @[rv_alu.scala 283:52]
  wire [31:0] lui_mix = din_is_mem ? io_mIn : _lui_mix_T_2; // @[rv_alu.scala 283:17]
  wire [31:0] branch_target = PC + immv; // @[rv_alu.scala 288:23]
  wire  alu_eq = regs_io_outrs1 == regs_io_outrs2; // @[rv_alu.scala 290:31]
  wire  alu_lt = regs_io_outrs1 < regs_io_outrs2; // @[rv_alu.scala 291:31]
  wire [4:0] _GEN_1 = 7'h73 == inst_opcode ? 5'h2 : inst_R_rs2; // @[rv_alu.scala 310:16 348:13 303:9]
  wire [4:0] _GEN_2 = 7'h73 == inst_opcode ? 5'h1 : inst_I_rs1; // @[rv_alu.scala 310:16 349:13 304:9]
  wire [4:0] _GEN_3 = 7'h23 == inst_opcode ? 5'h0 : inst_I_rd; // @[rv_alu.scala 310:16 339:12 305:9]
  wire [2:0] _GEN_4 = 7'h23 == inst_opcode ? 3'h0 : inst_I_func3; // @[rv_alu.scala 298:11 310:16 340:15]
  wire [31:0] _GEN_6 = 7'h23 == inst_opcode ? imm_S : 32'h0; // @[rv_alu.scala 302:10 310:16 342:14]
  wire  _GEN_7 = 7'h23 == inst_opcode ? 1'h0 : 1'h1; // @[rv_alu.scala 310:16 308:18 343:22]
  wire [4:0] _GEN_10 = 7'h23 == inst_opcode ? inst_R_rs2 : _GEN_1; // @[rv_alu.scala 310:16 303:9]
  wire [4:0] _GEN_11 = 7'h23 == inst_opcode ? inst_I_rs1 : _GEN_2; // @[rv_alu.scala 310:16 304:9]
  wire [4:0] _GEN_13 = 7'h3 == inst_opcode ? 5'h0 : _GEN_10; // @[rv_alu.scala 310:16 332:13]
  wire [2:0] _GEN_14 = 7'h3 == inst_opcode ? 3'h0 : _GEN_4; // @[rv_alu.scala 310:16 333:15]
  wire [31:0] _GEN_16 = 7'h3 == inst_opcode ? imm_I : _GEN_6; // @[rv_alu.scala 310:16 335:14]
  wire  _GEN_17 = 7'h3 == inst_opcode ? 1'h0 : _GEN_7; // @[rv_alu.scala 310:16 336:22]
  wire [4:0] _GEN_18 = 7'h3 == inst_opcode ? inst_I_rd : _GEN_3; // @[rv_alu.scala 310:16 305:9]
  wire  _GEN_19 = 7'h3 == inst_opcode ? 1'h0 : 7'h23 == inst_opcode; // @[rv_alu.scala 310:16 309:17]
  wire [4:0] _GEN_21 = 7'h3 == inst_opcode ? inst_I_rs1 : _GEN_11; // @[rv_alu.scala 310:16 304:9]
  wire [2:0] _GEN_22 = 7'h6f == inst_opcode ? 3'h2 : _GEN_14; // @[rv_alu.scala 310:16 326:15]
  wire [31:0] _GEN_24 = 7'h6f == inst_opcode ? imm_J : _GEN_16; // @[rv_alu.scala 310:16 328:14]
  wire  _GEN_25 = 7'h6f == inst_opcode ? 1'h0 : 7'h3 == inst_opcode; // @[rv_alu.scala 306:16 310:16]
  wire [4:0] _GEN_26 = 7'h6f == inst_opcode ? inst_R_rs2 : _GEN_13; // @[rv_alu.scala 310:16 303:9]
  wire [4:0] _GEN_28 = 7'h6f == inst_opcode ? inst_I_rd : _GEN_18; // @[rv_alu.scala 310:16 305:9]
  wire  _GEN_29 = 7'h6f == inst_opcode ? 1'h0 : _GEN_19; // @[rv_alu.scala 310:16 309:17]
  wire [4:0] _GEN_31 = 7'h6f == inst_opcode ? inst_I_rs1 : _GEN_21; // @[rv_alu.scala 310:16 304:9]
  wire [31:0] _GEN_32 = 7'h37 == inst_opcode ? imm_U : _GEN_24; // @[rv_alu.scala 310:16 322:14]
  wire [4:0] _GEN_33 = 7'h37 == inst_opcode ? inst_I_rd : _GEN_31; // @[rv_alu.scala 310:16 323:13]
  wire [2:0] _GEN_34 = 7'h37 == inst_opcode ? inst_I_func3 : _GEN_22; // @[rv_alu.scala 298:11 310:16]
  wire  _GEN_35 = 7'h37 == inst_opcode ? 1'h0 : 7'h6f == inst_opcode; // @[rv_alu.scala 310:16 301:18]
  wire  _GEN_36 = 7'h37 == inst_opcode ? 1'h0 : _GEN_25; // @[rv_alu.scala 306:16 310:16]
  wire [4:0] _GEN_37 = 7'h37 == inst_opcode ? inst_R_rs2 : _GEN_26; // @[rv_alu.scala 310:16 303:9]
  wire [4:0] _GEN_39 = 7'h37 == inst_opcode ? inst_I_rd : _GEN_28; // @[rv_alu.scala 310:16 305:9]
  wire  _GEN_40 = 7'h37 == inst_opcode ? 1'h0 : _GEN_29; // @[rv_alu.scala 310:16 309:17]
  wire  _GEN_42 = 7'h63 == inst_opcode | _GEN_35; // @[rv_alu.scala 310:16 318:22]
  wire  _GEN_48 = 7'h63 == inst_opcode | (7'h37 == inst_opcode | (7'h6f == inst_opcode | _GEN_17)); // @[rv_alu.scala 310:16 308:18]
  wire  _branchCheck_T_1 = ~alu_lt; // @[rv_alu.scala 370:22]
  wire  _GEN_74 = 3'h7 == aluOP & _branchCheck_T_1; // @[rv_alu.scala 355:15 356:17 376:19]
  wire  _GEN_75 = 3'h6 == aluOP ? alu_lt : _GEN_74; // @[rv_alu.scala 356:17 373:19]
  wire  _GEN_76 = 3'h5 == aluOP ? ~alu_lt : _GEN_75; // @[rv_alu.scala 356:17 370:19]
  wire  _GEN_77 = 3'h4 == aluOP ? alu_lt : _GEN_76; // @[rv_alu.scala 356:17 367:19]
  wire  _GEN_78 = 3'h2 == aluOP | _GEN_77; // @[rv_alu.scala 356:17 364:19]
  wire  _GEN_79 = 3'h1 == aluOP ? ~alu_eq : _GEN_78; // @[rv_alu.scala 356:17 361:19]
  wire  branchCheck = 3'h0 == aluOP ? alu_eq : _GEN_79; // @[rv_alu.scala 356:17 358:19]
  Alu alu ( // @[rv_alu.scala 185:19]
    .io_input1(alu_io_input1),
    .io_input2(alu_io_input2),
    .io_func3(alu_io_func3),
    .io_out(alu_io_out)
  );
  RegisterBank regs ( // @[rv_alu.scala 186:20]
    .clock(regs_clock),
    .io_din(regs_io_din),
    .io_rsd(regs_io_rsd),
    .io_rs1(regs_io_rs1),
    .io_rs2(regs_io_rs2),
    .io_outrs1(regs_io_outrs1),
    .io_outrs2(regs_io_outrs2)
  );
  assign io_mWrite = state_exec & writeEnable; // @[rv_alu.scala 259:27]
  assign io_mMask_0 = state_exec & writeEnable; // @[rv_alu.scala 263:29]
  assign io_mMask_1 = state_exec & writeEnable; // @[rv_alu.scala 264:29]
  assign io_mMask_2 = state_exec & writeEnable; // @[rv_alu.scala 265:29]
  assign io_mMask_3 = state_exec & writeEnable; // @[rv_alu.scala 266:29]
  assign io_mOut = regs_io_outrs2; // @[rv_alu.scala 262:11]
  assign io_mAddr = _io_mAddr_T_1[9:0]; // @[rv_alu.scala 261:12]
  assign io_halted = state_halt; // @[rv_alu.scala 267:13]
  assign io_db_r1 = regs_io_outrs1; // @[rv_alu.scala 270:12]
  assign io_db_r2 = regs_io_outrs2; // @[rv_alu.scala 271:12]
  assign io_db_pc = PC; // @[rv_alu.scala 269:12]
  assign alu_io_input1 = regs_io_outrs1; // @[rv_alu.scala 273:17]
  assign alu_io_input2 = alu2_use_reg ? regs_io_outrs2 : immv; // @[rv_alu.scala 274:23]
  assign alu_io_func3 = aluOP; // @[rv_alu.scala 275:16]
  assign regs_clock = clock;
  assign regs_io_din = din_is_alu ? alu_io_out : lui_mix; // @[rv_alu.scala 277:21]
  assign regs_io_rsd = state_exec & ~din_is_mem | state_fetch & din_is_mem ? rd : 5'h0; // @[rv_alu.scala 281:21]
  assign regs_io_rs1 = rs1; // @[rv_alu.scala 279:15]
  assign regs_io_rs2 = rs2; // @[rv_alu.scala 280:15]
  always @(posedge clock) begin
    if (reset) begin // @[rv_alu.scala 188:19]
      PC <= 32'h0; // @[rv_alu.scala 188:19]
    end else if (state_exec) begin // @[rv_alu.scala 380:19]
      if (branchEnable & branchCheck) begin // @[rv_alu.scala 382:14]
        PC <= branch_target;
      end else begin
        PC <= PC4;
      end
    end
    state_start <= reset; // @[rv_alu.scala 192:{29,29} 251:15]
    if (reset) begin // @[rv_alu.scala 193:29]
      state_fetch <= 1'h0; // @[rv_alu.scala 193:29]
    end else begin
      state_fetch <= state_exec | state_start; // @[rv_alu.scala 252:15]
    end
    if (reset) begin // @[rv_alu.scala 195:29]
      state_decode <= 1'h0; // @[rv_alu.scala 195:29]
    end else begin
      state_decode <= state_fetch; // @[rv_alu.scala 254:16]
    end
    if (reset) begin // @[rv_alu.scala 196:27]
      state_exec <= 1'h0; // @[rv_alu.scala 196:27]
    end else if (must_halt) begin // @[rv_alu.scala 255:21]
      state_exec <= 1'h0;
    end else begin
      state_exec <= state_decode;
    end
    if (reset) begin // @[rv_alu.scala 197:27]
      state_halt <= 1'h0; // @[rv_alu.scala 197:27]
    end else begin
      state_halt <= must_halt | state_halt; // @[rv_alu.scala 256:14]
    end
    if (reset) begin // @[rv_alu.scala 200:20]
      rd <= 5'h0; // @[rv_alu.scala 200:20]
    end else if (state_decode) begin // @[rv_alu.scala 296:21]
      if (7'h13 == inst_opcode) begin // @[rv_alu.scala 310:16]
        rd <= inst_I_rd; // @[rv_alu.scala 305:9]
      end else if (7'h63 == inst_opcode) begin // @[rv_alu.scala 310:16]
        rd <= inst_I_rd; // @[rv_alu.scala 305:9]
      end else begin
        rd <= _GEN_39;
      end
    end
    if (reset) begin // @[rv_alu.scala 201:20]
      rs1 <= 5'h0; // @[rv_alu.scala 201:20]
    end else if (state_decode) begin // @[rv_alu.scala 296:21]
      if (7'h13 == inst_opcode) begin // @[rv_alu.scala 310:16]
        rs1 <= inst_I_rs1; // @[rv_alu.scala 304:9]
      end else if (7'h63 == inst_opcode) begin // @[rv_alu.scala 310:16]
        rs1 <= inst_I_rs1; // @[rv_alu.scala 304:9]
      end else begin
        rs1 <= _GEN_33;
      end
    end
    if (reset) begin // @[rv_alu.scala 202:20]
      rs2 <= 5'h0; // @[rv_alu.scala 202:20]
    end else if (state_decode) begin // @[rv_alu.scala 296:21]
      if (7'h13 == inst_opcode) begin // @[rv_alu.scala 310:16]
        rs2 <= 5'h0; // @[rv_alu.scala 312:13]
      end else if (7'h63 == inst_opcode) begin // @[rv_alu.scala 310:16]
        rs2 <= inst_R_rs2; // @[rv_alu.scala 303:9]
      end else begin
        rs2 <= _GEN_37;
      end
    end
    if (reset) begin // @[rv_alu.scala 203:24]
      savedOp <= 32'h0; // @[rv_alu.scala 203:24]
    end else if (state_decode) begin // @[rv_alu.scala 218:21]
      savedOp <= io_mIn;
    end
    if (reset) begin // @[rv_alu.scala 204:21]
      immv <= 32'h0; // @[rv_alu.scala 204:21]
    end else if (state_decode) begin // @[rv_alu.scala 296:21]
      if (7'h13 == inst_opcode) begin // @[rv_alu.scala 310:16]
        immv <= imm_I; // @[rv_alu.scala 314:14]
      end else if (7'h63 == inst_opcode) begin // @[rv_alu.scala 310:16]
        immv <= imm_B; // @[rv_alu.scala 319:14]
      end else begin
        immv <= _GEN_32;
      end
    end
    if (reset) begin // @[rv_alu.scala 205:22]
      aluOP <= 3'h0; // @[rv_alu.scala 205:22]
    end else if (state_decode) begin // @[rv_alu.scala 296:21]
      if (7'h13 == inst_opcode) begin // @[rv_alu.scala 310:16]
        aluOP <= inst_I_func3; // @[rv_alu.scala 298:11]
      end else if (7'h63 == inst_opcode) begin // @[rv_alu.scala 310:16]
        aluOP <= inst_I_func3; // @[rv_alu.scala 298:11]
      end else begin
        aluOP <= _GEN_34;
      end
    end
    if (reset) begin // @[rv_alu.scala 206:27]
      din_is_alu <= 1'h0; // @[rv_alu.scala 206:27]
    end else if (state_decode) begin // @[rv_alu.scala 296:21]
      if (inst_opcode == 7'h37 | inst_opcode == 7'h3) begin // @[rv_alu.scala 307:22]
        din_is_alu <= 1'h0;
      end else begin
        din_is_alu <= 1'h1;
      end
    end
    if (reset) begin // @[rv_alu.scala 207:27]
      din_is_mem <= 1'h0; // @[rv_alu.scala 207:27]
    end else if (state_decode) begin // @[rv_alu.scala 296:21]
      if (7'h13 == inst_opcode) begin // @[rv_alu.scala 310:16]
        din_is_mem <= 1'h0; // @[rv_alu.scala 306:16]
      end else if (7'h63 == inst_opcode) begin // @[rv_alu.scala 310:16]
        din_is_mem <= 1'h0; // @[rv_alu.scala 306:16]
      end else begin
        din_is_mem <= _GEN_36;
      end
    end
    if (reset) begin // @[rv_alu.scala 208:29]
      alu2_use_reg <= 1'h0; // @[rv_alu.scala 208:29]
    end else if (state_decode) begin // @[rv_alu.scala 296:21]
      if (7'h13 == inst_opcode) begin // @[rv_alu.scala 310:16]
        alu2_use_reg <= 1'h0; // @[rv_alu.scala 315:22]
      end else begin
        alu2_use_reg <= _GEN_48;
      end
    end
    if (reset) begin // @[rv_alu.scala 210:29]
      branchEnable <= 1'h0; // @[rv_alu.scala 210:29]
    end else if (state_decode) begin // @[rv_alu.scala 296:21]
      if (7'h13 == inst_opcode) begin // @[rv_alu.scala 310:16]
        branchEnable <= 1'h0; // @[rv_alu.scala 301:18]
      end else begin
        branchEnable <= _GEN_42;
      end
    end
    if (reset) begin // @[rv_alu.scala 211:28]
      writeEnable <= 1'h0; // @[rv_alu.scala 211:28]
    end else if (state_decode) begin // @[rv_alu.scala 296:21]
      if (7'h13 == inst_opcode) begin // @[rv_alu.scala 310:16]
        writeEnable <= 1'h0; // @[rv_alu.scala 309:17]
      end else if (7'h63 == inst_opcode) begin // @[rv_alu.scala 310:16]
        writeEnable <= 1'h0; // @[rv_alu.scala 309:17]
      end else begin
        writeEnable <= _GEN_40;
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
