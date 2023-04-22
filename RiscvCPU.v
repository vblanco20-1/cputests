module Alu(
  input  [31:0] io_input1,
  input  [31:0] io_input2,
  input  [2:0]  io_func3,
  output [31:0] io_out
);
  wire [31:0] _io_out_T_1 = io_input1 + io_input2; // @[rv_alu.scala 24:36]
  wire [31:0] _io_out_T_2 = io_input1 & io_input2; // @[rv_alu.scala 25:36]
  wire [31:0] _io_out_T_3 = io_input1 ^ io_input2; // @[rv_alu.scala 26:36]
  wire [31:0] _io_out_T_4 = io_input1 | io_input2; // @[rv_alu.scala 27:36]
  wire [31:0] _GEN_0 = 3'h4 == io_func3 ? _io_out_T_4 : 32'h0; // @[rv_alu.scala 22:10 23:20 27:23]
  wire [31:0] _GEN_1 = 3'h6 == io_func3 ? _io_out_T_3 : _GEN_0; // @[rv_alu.scala 23:20 26:23]
  wire [31:0] _GEN_2 = 3'h7 == io_func3 ? _io_out_T_2 : _GEN_1; // @[rv_alu.scala 23:20 25:23]
  assign io_out = 3'h0 == io_func3 ? _io_out_T_1 : _GEN_2; // @[rv_alu.scala 23:20 24:23]
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
  reg [31:0] mem [0:31]; // @[rv_alu.scala 91:18]
  wire  mem_io_outrs1_MPORT_en; // @[rv_alu.scala 91:18]
  wire [4:0] mem_io_outrs1_MPORT_addr; // @[rv_alu.scala 91:18]
  wire [31:0] mem_io_outrs1_MPORT_data; // @[rv_alu.scala 91:18]
  wire  mem_io_outrs2_MPORT_en; // @[rv_alu.scala 91:18]
  wire [4:0] mem_io_outrs2_MPORT_addr; // @[rv_alu.scala 91:18]
  wire [31:0] mem_io_outrs2_MPORT_data; // @[rv_alu.scala 91:18]
  wire [31:0] mem_MPORT_data; // @[rv_alu.scala 91:18]
  wire [4:0] mem_MPORT_addr; // @[rv_alu.scala 91:18]
  wire  mem_MPORT_mask; // @[rv_alu.scala 91:18]
  wire  mem_MPORT_en; // @[rv_alu.scala 91:18]
  wire  rsdzero = io_rsd == 5'h0; // @[rv_alu.scala 92:26]
  wire  rs1zero = io_rs1 == 5'h0; // @[rv_alu.scala 93:24]
  wire  rs2zero = io_rs2 == 5'h0; // @[rv_alu.scala 94:24]
  assign mem_io_outrs1_MPORT_en = 1'h1;
  assign mem_io_outrs1_MPORT_addr = io_rs1;
  assign mem_io_outrs1_MPORT_data = mem[mem_io_outrs1_MPORT_addr]; // @[rv_alu.scala 91:18]
  assign mem_io_outrs2_MPORT_en = 1'h1;
  assign mem_io_outrs2_MPORT_addr = io_rs2;
  assign mem_io_outrs2_MPORT_data = mem[mem_io_outrs2_MPORT_addr]; // @[rv_alu.scala 91:18]
  assign mem_MPORT_data = io_din;
  assign mem_MPORT_addr = io_rsd;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = ~rsdzero;
  assign io_outrs1 = rs1zero ? 32'h0 : mem_io_outrs1_MPORT_data; // @[rv_alu.scala 100:19]
  assign io_outrs2 = rs2zero ? 32'h0 : mem_io_outrs2_MPORT_data; // @[rv_alu.scala 101:19]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[rv_alu.scala 91:18]
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
  output        io_mOut,
  output        io_mAddr,
  output        io_halted,
  output [31:0] io_db_aluout
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] alu_io_input1; // @[rv_alu.scala 116:19]
  wire [31:0] alu_io_input2; // @[rv_alu.scala 116:19]
  wire [2:0] alu_io_func3; // @[rv_alu.scala 116:19]
  wire [31:0] alu_io_out; // @[rv_alu.scala 116:19]
  wire  regs_clock; // @[rv_alu.scala 117:20]
  wire [31:0] regs_io_din; // @[rv_alu.scala 117:20]
  wire [4:0] regs_io_rsd; // @[rv_alu.scala 117:20]
  wire [4:0] regs_io_rs1; // @[rv_alu.scala 117:20]
  wire [4:0] regs_io_rs2; // @[rv_alu.scala 117:20]
  wire [31:0] regs_io_outrs1; // @[rv_alu.scala 117:20]
  wire [31:0] regs_io_outrs2; // @[rv_alu.scala 117:20]
  reg [31:0] PC; // @[rv_alu.scala 119:19]
  wire [31:0] PC4 = PC + 32'h4; // @[rv_alu.scala 121:16]
  reg  state_fetch; // @[rv_alu.scala 123:29]
  reg  state_fetch2; // @[rv_alu.scala 124:29]
  reg  state_decode; // @[rv_alu.scala 125:29]
  reg  state_exec; // @[rv_alu.scala 126:27]
  reg [4:0] rd; // @[rv_alu.scala 128:20]
  reg [4:0] rs1; // @[rv_alu.scala 129:20]
  reg [4:0] rs2; // @[rv_alu.scala 130:20]
  reg [31:0] imm; // @[rv_alu.scala 131:20]
  reg [2:0] aluOP; // @[rv_alu.scala 132:22]
  wire [31:0] _io_mAddr_T = state_fetch ? PC : 32'h0; // @[rv_alu.scala 146:18]
  wire [6:0] inst_opcode = io_mIn[6:0]; // @[rv_alu.scala 162:29]
  wire [4:0] inst_I_rd = io_mIn[11:7]; // @[rv_alu.scala 163:31]
  wire [2:0] inst_I_func3 = io_mIn[14:12]; // @[rv_alu.scala 163:31]
  wire [4:0] inst_I_rs1 = io_mIn[19:15]; // @[rv_alu.scala 163:31]
  wire [11:0] inst_I_imm = io_mIn[31:20]; // @[rv_alu.scala 163:31]
  wire [4:0] inst_R_rs2 = io_mIn[24:20]; // @[rv_alu.scala 164:31]
  wire  op_ALU = inst_opcode == 7'h33; // @[rv_alu.scala 166:29]
  wire  op_ALUI = inst_opcode == 7'h13; // @[rv_alu.scala 167:29]
  wire [12:0] _imm_T = {1'h0,inst_I_imm}; // @[rv_alu.scala 196:16]
  Alu alu ( // @[rv_alu.scala 116:19]
    .io_input1(alu_io_input1),
    .io_input2(alu_io_input2),
    .io_func3(alu_io_func3),
    .io_out(alu_io_out)
  );
  RegisterBank regs ( // @[rv_alu.scala 117:20]
    .clock(regs_clock),
    .io_din(regs_io_din),
    .io_rsd(regs_io_rsd),
    .io_rs1(regs_io_rs1),
    .io_rs2(regs_io_rs2),
    .io_outrs1(regs_io_outrs1),
    .io_outrs2(regs_io_outrs2)
  );
  assign io_mWrite = 1'h0; // @[rv_alu.scala 145:13]
  assign io_mOut = 1'h0; // @[rv_alu.scala 147:11]
  assign io_mAddr = _io_mAddr_T[0]; // @[rv_alu.scala 146:12]
  assign io_halted = 1'h0; // @[rv_alu.scala 148:13]
  assign io_db_aluout = alu_io_out; // @[rv_alu.scala 155:16]
  assign alu_io_input1 = regs_io_outrs1; // @[rv_alu.scala 150:17]
  assign alu_io_input2 = rd == 5'h0 ? imm : regs_io_outrs2; // @[rv_alu.scala 151:23]
  assign alu_io_func3 = aluOP; // @[rv_alu.scala 152:16]
  assign regs_clock = clock;
  assign regs_io_din = alu_io_out; // @[rv_alu.scala 153:15]
  assign regs_io_rsd = rd; // @[rv_alu.scala 159:15]
  assign regs_io_rs1 = rs1; // @[rv_alu.scala 157:15]
  assign regs_io_rs2 = rs2; // @[rv_alu.scala 158:15]
  always @(posedge clock) begin
    if (reset) begin // @[rv_alu.scala 119:19]
      PC <= 32'h0; // @[rv_alu.scala 119:19]
    end else if (state_decode) begin // @[rv_alu.scala 179:21]
      PC <= PC4; // @[rv_alu.scala 183:8]
    end
    state_fetch <= reset | state_exec; // @[rv_alu.scala 123:{29,29} 140:15]
    if (reset) begin // @[rv_alu.scala 124:29]
      state_fetch2 <= 1'h0; // @[rv_alu.scala 124:29]
    end else begin
      state_fetch2 <= state_fetch; // @[rv_alu.scala 141:16]
    end
    if (reset) begin // @[rv_alu.scala 125:29]
      state_decode <= 1'h0; // @[rv_alu.scala 125:29]
    end else begin
      state_decode <= state_fetch2; // @[rv_alu.scala 142:16]
    end
    if (reset) begin // @[rv_alu.scala 126:27]
      state_exec <= 1'h0; // @[rv_alu.scala 126:27]
    end else begin
      state_exec <= state_decode; // @[rv_alu.scala 143:14]
    end
    if (reset) begin // @[rv_alu.scala 128:20]
      rd <= 5'h0; // @[rv_alu.scala 128:20]
    end else if (state_decode) begin // @[rv_alu.scala 179:21]
      rd <= inst_I_rd; // @[rv_alu.scala 186:8]
    end else if (state_fetch) begin // @[rv_alu.scala 171:20]
      rd <= 5'h0; // @[rv_alu.scala 175:8]
    end
    if (reset) begin // @[rv_alu.scala 129:20]
      rs1 <= 5'h0; // @[rv_alu.scala 129:20]
    end else if (state_decode) begin // @[rv_alu.scala 179:21]
      rs1 <= inst_I_rs1; // @[rv_alu.scala 185:9]
    end else if (state_fetch) begin // @[rv_alu.scala 171:20]
      rs1 <= 5'h0; // @[rv_alu.scala 173:9]
    end
    if (reset) begin // @[rv_alu.scala 130:20]
      rs2 <= 5'h0; // @[rv_alu.scala 130:20]
    end else if (op_ALU & state_decode) begin // @[rv_alu.scala 189:31]
      rs2 <= inst_R_rs2; // @[rv_alu.scala 191:9]
    end else if (op_ALUI) begin // @[rv_alu.scala 193:23]
      rs2 <= 5'h0; // @[rv_alu.scala 195:9]
    end else if (state_fetch) begin // @[rv_alu.scala 171:20]
      rs2 <= 5'h0; // @[rv_alu.scala 174:9]
    end
    if (reset) begin // @[rv_alu.scala 131:20]
      imm <= 32'h0; // @[rv_alu.scala 131:20]
    end else if (op_ALU & state_decode) begin // @[rv_alu.scala 189:31]
      imm <= 32'h0; // @[rv_alu.scala 192:9]
    end else if (op_ALUI) begin // @[rv_alu.scala 193:23]
      imm <= {{19'd0}, _imm_T}; // @[rv_alu.scala 196:9]
    end else if (state_fetch) begin // @[rv_alu.scala 171:20]
      imm <= 32'h0; // @[rv_alu.scala 176:9]
    end
    if (reset) begin // @[rv_alu.scala 132:22]
      aluOP <= 3'h0; // @[rv_alu.scala 132:22]
    end else if (state_decode) begin // @[rv_alu.scala 179:21]
      aluOP <= inst_I_func3; // @[rv_alu.scala 182:10]
    end else if (state_fetch) begin // @[rv_alu.scala 171:20]
      aluOP <= 3'h0; // @[rv_alu.scala 172:10]
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
  state_fetch = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  state_fetch2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  state_decode = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  state_exec = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  rd = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  rs1 = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  rs2 = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  imm = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  aluOP = _RAND_9[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
