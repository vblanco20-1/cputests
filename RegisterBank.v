module RegisterBank(
  input         clock,
  input         reset,
  input  [31:0] io_din,
  input  [4:0]  io_rsd,
  input  [4:0]  io_rs1,
  input  [4:0]  io_rs2,
  output [31:0] io_outrs1,
  output [31:0] io_outrs2
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
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem_0; // @[rv_alu.scala 112:16]
  reg [31:0] mem_1; // @[rv_alu.scala 112:16]
  reg [31:0] mem_2; // @[rv_alu.scala 112:16]
  reg [31:0] mem_3; // @[rv_alu.scala 112:16]
  reg [31:0] mem_4; // @[rv_alu.scala 112:16]
  reg [31:0] mem_5; // @[rv_alu.scala 112:16]
  reg [31:0] mem_6; // @[rv_alu.scala 112:16]
  reg [31:0] mem_7; // @[rv_alu.scala 112:16]
  reg [31:0] mem_8; // @[rv_alu.scala 112:16]
  reg [31:0] mem_9; // @[rv_alu.scala 112:16]
  reg [31:0] mem_10; // @[rv_alu.scala 112:16]
  reg [31:0] mem_11; // @[rv_alu.scala 112:16]
  reg [31:0] mem_12; // @[rv_alu.scala 112:16]
  reg [31:0] mem_13; // @[rv_alu.scala 112:16]
  reg [31:0] mem_14; // @[rv_alu.scala 112:16]
  reg [31:0] mem_15; // @[rv_alu.scala 112:16]
  reg [31:0] mem_16; // @[rv_alu.scala 112:16]
  reg [31:0] mem_17; // @[rv_alu.scala 112:16]
  reg [31:0] mem_18; // @[rv_alu.scala 112:16]
  reg [31:0] mem_19; // @[rv_alu.scala 112:16]
  reg [31:0] mem_20; // @[rv_alu.scala 112:16]
  reg [31:0] mem_21; // @[rv_alu.scala 112:16]
  reg [31:0] mem_22; // @[rv_alu.scala 112:16]
  reg [31:0] mem_23; // @[rv_alu.scala 112:16]
  reg [31:0] mem_24; // @[rv_alu.scala 112:16]
  reg [31:0] mem_25; // @[rv_alu.scala 112:16]
  reg [31:0] mem_26; // @[rv_alu.scala 112:16]
  reg [31:0] mem_27; // @[rv_alu.scala 112:16]
  reg [31:0] mem_28; // @[rv_alu.scala 112:16]
  reg [31:0] mem_29; // @[rv_alu.scala 112:16]
  reg [31:0] mem_30; // @[rv_alu.scala 112:16]
  reg [31:0] mem_31; // @[rv_alu.scala 112:16]
  wire  rsdzero = io_rsd == 5'h0; // @[rv_alu.scala 114:24]
  wire  rs1zero = io_rs1 == 5'h0; // @[rv_alu.scala 115:24]
  wire  rs2zero = io_rs2 == 5'h0; // @[rv_alu.scala 116:24]
  wire [31:0] _GEN_65 = 5'h1 == io_rs1 ? mem_1 : mem_0; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_66 = 5'h2 == io_rs1 ? mem_2 : _GEN_65; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_67 = 5'h3 == io_rs1 ? mem_3 : _GEN_66; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_68 = 5'h4 == io_rs1 ? mem_4 : _GEN_67; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_69 = 5'h5 == io_rs1 ? mem_5 : _GEN_68; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_70 = 5'h6 == io_rs1 ? mem_6 : _GEN_69; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_71 = 5'h7 == io_rs1 ? mem_7 : _GEN_70; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_72 = 5'h8 == io_rs1 ? mem_8 : _GEN_71; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_73 = 5'h9 == io_rs1 ? mem_9 : _GEN_72; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_74 = 5'ha == io_rs1 ? mem_10 : _GEN_73; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_75 = 5'hb == io_rs1 ? mem_11 : _GEN_74; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_76 = 5'hc == io_rs1 ? mem_12 : _GEN_75; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_77 = 5'hd == io_rs1 ? mem_13 : _GEN_76; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_78 = 5'he == io_rs1 ? mem_14 : _GEN_77; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_79 = 5'hf == io_rs1 ? mem_15 : _GEN_78; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_80 = 5'h10 == io_rs1 ? mem_16 : _GEN_79; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_81 = 5'h11 == io_rs1 ? mem_17 : _GEN_80; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_82 = 5'h12 == io_rs1 ? mem_18 : _GEN_81; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_83 = 5'h13 == io_rs1 ? mem_19 : _GEN_82; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_84 = 5'h14 == io_rs1 ? mem_20 : _GEN_83; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_85 = 5'h15 == io_rs1 ? mem_21 : _GEN_84; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_86 = 5'h16 == io_rs1 ? mem_22 : _GEN_85; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_87 = 5'h17 == io_rs1 ? mem_23 : _GEN_86; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_88 = 5'h18 == io_rs1 ? mem_24 : _GEN_87; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_89 = 5'h19 == io_rs1 ? mem_25 : _GEN_88; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_90 = 5'h1a == io_rs1 ? mem_26 : _GEN_89; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_91 = 5'h1b == io_rs1 ? mem_27 : _GEN_90; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_92 = 5'h1c == io_rs1 ? mem_28 : _GEN_91; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_93 = 5'h1d == io_rs1 ? mem_29 : _GEN_92; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_94 = 5'h1e == io_rs1 ? mem_30 : _GEN_93; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_95 = 5'h1f == io_rs1 ? mem_31 : _GEN_94; // @[rv_alu.scala 122:{19,19}]
  wire [31:0] _GEN_97 = 5'h1 == io_rs2 ? mem_1 : mem_0; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_98 = 5'h2 == io_rs2 ? mem_2 : _GEN_97; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_99 = 5'h3 == io_rs2 ? mem_3 : _GEN_98; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_100 = 5'h4 == io_rs2 ? mem_4 : _GEN_99; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_101 = 5'h5 == io_rs2 ? mem_5 : _GEN_100; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_102 = 5'h6 == io_rs2 ? mem_6 : _GEN_101; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_103 = 5'h7 == io_rs2 ? mem_7 : _GEN_102; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_104 = 5'h8 == io_rs2 ? mem_8 : _GEN_103; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_105 = 5'h9 == io_rs2 ? mem_9 : _GEN_104; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_106 = 5'ha == io_rs2 ? mem_10 : _GEN_105; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_107 = 5'hb == io_rs2 ? mem_11 : _GEN_106; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_108 = 5'hc == io_rs2 ? mem_12 : _GEN_107; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_109 = 5'hd == io_rs2 ? mem_13 : _GEN_108; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_110 = 5'he == io_rs2 ? mem_14 : _GEN_109; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_111 = 5'hf == io_rs2 ? mem_15 : _GEN_110; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_112 = 5'h10 == io_rs2 ? mem_16 : _GEN_111; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_113 = 5'h11 == io_rs2 ? mem_17 : _GEN_112; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_114 = 5'h12 == io_rs2 ? mem_18 : _GEN_113; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_115 = 5'h13 == io_rs2 ? mem_19 : _GEN_114; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_116 = 5'h14 == io_rs2 ? mem_20 : _GEN_115; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_117 = 5'h15 == io_rs2 ? mem_21 : _GEN_116; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_118 = 5'h16 == io_rs2 ? mem_22 : _GEN_117; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_119 = 5'h17 == io_rs2 ? mem_23 : _GEN_118; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_120 = 5'h18 == io_rs2 ? mem_24 : _GEN_119; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_121 = 5'h19 == io_rs2 ? mem_25 : _GEN_120; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_122 = 5'h1a == io_rs2 ? mem_26 : _GEN_121; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_123 = 5'h1b == io_rs2 ? mem_27 : _GEN_122; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_124 = 5'h1c == io_rs2 ? mem_28 : _GEN_123; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_125 = 5'h1d == io_rs2 ? mem_29 : _GEN_124; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_126 = 5'h1e == io_rs2 ? mem_30 : _GEN_125; // @[rv_alu.scala 123:{19,19}]
  wire [31:0] _GEN_127 = 5'h1f == io_rs2 ? mem_31 : _GEN_126; // @[rv_alu.scala 123:{19,19}]
  assign io_outrs1 = rs1zero ? 32'h0 : _GEN_95; // @[rv_alu.scala 122:19]
  assign io_outrs2 = rs2zero ? 32'h0 : _GEN_127; // @[rv_alu.scala 123:19]
  always @(posedge clock) begin
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h0 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_0 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h1 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_1 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h2 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_2 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h3 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_3 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h4 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_4 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h5 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_5 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h6 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_6 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h7 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_7 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h8 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_8 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h9 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_9 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'ha == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_10 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'hb == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_11 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'hc == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_12 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'hd == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_13 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'he == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_14 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'hf == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_15 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h10 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_16 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h11 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_17 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h12 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_18 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h13 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_19 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h14 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_20 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h15 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_21 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h16 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_22 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h17 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_23 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h18 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_24 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h19 == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_25 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h1a == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_26 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h1b == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_27 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h1c == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_28 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h1d == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_29 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h1e == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_30 <= io_din; // @[rv_alu.scala 119:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 118:17]
      if (5'h1f == io_rsd) begin // @[rv_alu.scala 119:17]
        mem_31 <= io_din; // @[rv_alu.scala 119:17]
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
  mem_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  mem_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  mem_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  mem_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  mem_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  mem_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  mem_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  mem_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  mem_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  mem_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  mem_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  mem_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  mem_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  mem_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  mem_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  mem_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  mem_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  mem_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  mem_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  mem_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  mem_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  mem_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  mem_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  mem_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  mem_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  mem_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  mem_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  mem_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  mem_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  mem_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  mem_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  mem_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
