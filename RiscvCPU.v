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
  reg [31:0] mem_0; // @[rv_alu.scala 121:16]
  reg [31:0] mem_1; // @[rv_alu.scala 121:16]
  reg [31:0] mem_2; // @[rv_alu.scala 121:16]
  reg [31:0] mem_3; // @[rv_alu.scala 121:16]
  reg [31:0] mem_4; // @[rv_alu.scala 121:16]
  reg [31:0] mem_5; // @[rv_alu.scala 121:16]
  reg [31:0] mem_6; // @[rv_alu.scala 121:16]
  reg [31:0] mem_7; // @[rv_alu.scala 121:16]
  reg [31:0] mem_8; // @[rv_alu.scala 121:16]
  reg [31:0] mem_9; // @[rv_alu.scala 121:16]
  reg [31:0] mem_10; // @[rv_alu.scala 121:16]
  reg [31:0] mem_11; // @[rv_alu.scala 121:16]
  reg [31:0] mem_12; // @[rv_alu.scala 121:16]
  reg [31:0] mem_13; // @[rv_alu.scala 121:16]
  reg [31:0] mem_14; // @[rv_alu.scala 121:16]
  reg [31:0] mem_15; // @[rv_alu.scala 121:16]
  reg [31:0] mem_16; // @[rv_alu.scala 121:16]
  reg [31:0] mem_17; // @[rv_alu.scala 121:16]
  reg [31:0] mem_18; // @[rv_alu.scala 121:16]
  reg [31:0] mem_19; // @[rv_alu.scala 121:16]
  reg [31:0] mem_20; // @[rv_alu.scala 121:16]
  reg [31:0] mem_21; // @[rv_alu.scala 121:16]
  reg [31:0] mem_22; // @[rv_alu.scala 121:16]
  reg [31:0] mem_23; // @[rv_alu.scala 121:16]
  reg [31:0] mem_24; // @[rv_alu.scala 121:16]
  reg [31:0] mem_25; // @[rv_alu.scala 121:16]
  reg [31:0] mem_26; // @[rv_alu.scala 121:16]
  reg [31:0] mem_27; // @[rv_alu.scala 121:16]
  reg [31:0] mem_28; // @[rv_alu.scala 121:16]
  reg [31:0] mem_29; // @[rv_alu.scala 121:16]
  reg [31:0] mem_30; // @[rv_alu.scala 121:16]
  reg [31:0] mem_31; // @[rv_alu.scala 121:16]
  wire  rsdzero = io_rsd == 5'h0; // @[rv_alu.scala 123:24]
  wire  rs1zero = io_rs1 == 5'h0; // @[rv_alu.scala 124:24]
  wire  rs2zero = io_rs2 == 5'h0; // @[rv_alu.scala 125:24]
  wire [31:0] _GEN_65 = 5'h1 == io_rs1 ? mem_1 : mem_0; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_66 = 5'h2 == io_rs1 ? mem_2 : _GEN_65; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_67 = 5'h3 == io_rs1 ? mem_3 : _GEN_66; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_68 = 5'h4 == io_rs1 ? mem_4 : _GEN_67; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_69 = 5'h5 == io_rs1 ? mem_5 : _GEN_68; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_70 = 5'h6 == io_rs1 ? mem_6 : _GEN_69; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_71 = 5'h7 == io_rs1 ? mem_7 : _GEN_70; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_72 = 5'h8 == io_rs1 ? mem_8 : _GEN_71; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_73 = 5'h9 == io_rs1 ? mem_9 : _GEN_72; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_74 = 5'ha == io_rs1 ? mem_10 : _GEN_73; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_75 = 5'hb == io_rs1 ? mem_11 : _GEN_74; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_76 = 5'hc == io_rs1 ? mem_12 : _GEN_75; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_77 = 5'hd == io_rs1 ? mem_13 : _GEN_76; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_78 = 5'he == io_rs1 ? mem_14 : _GEN_77; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_79 = 5'hf == io_rs1 ? mem_15 : _GEN_78; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_80 = 5'h10 == io_rs1 ? mem_16 : _GEN_79; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_81 = 5'h11 == io_rs1 ? mem_17 : _GEN_80; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_82 = 5'h12 == io_rs1 ? mem_18 : _GEN_81; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_83 = 5'h13 == io_rs1 ? mem_19 : _GEN_82; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_84 = 5'h14 == io_rs1 ? mem_20 : _GEN_83; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_85 = 5'h15 == io_rs1 ? mem_21 : _GEN_84; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_86 = 5'h16 == io_rs1 ? mem_22 : _GEN_85; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_87 = 5'h17 == io_rs1 ? mem_23 : _GEN_86; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_88 = 5'h18 == io_rs1 ? mem_24 : _GEN_87; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_89 = 5'h19 == io_rs1 ? mem_25 : _GEN_88; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_90 = 5'h1a == io_rs1 ? mem_26 : _GEN_89; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_91 = 5'h1b == io_rs1 ? mem_27 : _GEN_90; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_92 = 5'h1c == io_rs1 ? mem_28 : _GEN_91; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_93 = 5'h1d == io_rs1 ? mem_29 : _GEN_92; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_94 = 5'h1e == io_rs1 ? mem_30 : _GEN_93; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_95 = 5'h1f == io_rs1 ? mem_31 : _GEN_94; // @[rv_alu.scala 131:{19,19}]
  wire [31:0] _GEN_97 = 5'h1 == io_rs2 ? mem_1 : mem_0; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_98 = 5'h2 == io_rs2 ? mem_2 : _GEN_97; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_99 = 5'h3 == io_rs2 ? mem_3 : _GEN_98; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_100 = 5'h4 == io_rs2 ? mem_4 : _GEN_99; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_101 = 5'h5 == io_rs2 ? mem_5 : _GEN_100; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_102 = 5'h6 == io_rs2 ? mem_6 : _GEN_101; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_103 = 5'h7 == io_rs2 ? mem_7 : _GEN_102; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_104 = 5'h8 == io_rs2 ? mem_8 : _GEN_103; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_105 = 5'h9 == io_rs2 ? mem_9 : _GEN_104; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_106 = 5'ha == io_rs2 ? mem_10 : _GEN_105; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_107 = 5'hb == io_rs2 ? mem_11 : _GEN_106; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_108 = 5'hc == io_rs2 ? mem_12 : _GEN_107; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_109 = 5'hd == io_rs2 ? mem_13 : _GEN_108; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_110 = 5'he == io_rs2 ? mem_14 : _GEN_109; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_111 = 5'hf == io_rs2 ? mem_15 : _GEN_110; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_112 = 5'h10 == io_rs2 ? mem_16 : _GEN_111; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_113 = 5'h11 == io_rs2 ? mem_17 : _GEN_112; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_114 = 5'h12 == io_rs2 ? mem_18 : _GEN_113; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_115 = 5'h13 == io_rs2 ? mem_19 : _GEN_114; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_116 = 5'h14 == io_rs2 ? mem_20 : _GEN_115; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_117 = 5'h15 == io_rs2 ? mem_21 : _GEN_116; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_118 = 5'h16 == io_rs2 ? mem_22 : _GEN_117; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_119 = 5'h17 == io_rs2 ? mem_23 : _GEN_118; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_120 = 5'h18 == io_rs2 ? mem_24 : _GEN_119; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_121 = 5'h19 == io_rs2 ? mem_25 : _GEN_120; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_122 = 5'h1a == io_rs2 ? mem_26 : _GEN_121; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_123 = 5'h1b == io_rs2 ? mem_27 : _GEN_122; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_124 = 5'h1c == io_rs2 ? mem_28 : _GEN_123; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_125 = 5'h1d == io_rs2 ? mem_29 : _GEN_124; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_126 = 5'h1e == io_rs2 ? mem_30 : _GEN_125; // @[rv_alu.scala 132:{19,19}]
  wire [31:0] _GEN_127 = 5'h1f == io_rs2 ? mem_31 : _GEN_126; // @[rv_alu.scala 132:{19,19}]
  assign io_outrs1 = rs1zero ? 32'h0 : _GEN_95; // @[rv_alu.scala 131:19]
  assign io_outrs2 = rs2zero ? 32'h0 : _GEN_127; // @[rv_alu.scala 132:19]
  always @(posedge clock) begin
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h0 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_0 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h1 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_1 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h2 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_2 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h3 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_3 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h4 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_4 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h5 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_5 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h6 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_6 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h7 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_7 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h8 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_8 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h9 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_9 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'ha == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_10 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'hb == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_11 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'hc == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_12 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'hd == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_13 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'he == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_14 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'hf == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_15 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h10 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_16 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h11 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_17 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h12 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_18 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h13 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_19 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h14 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_20 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h15 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_21 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h16 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_22 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h17 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_23 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h18 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_24 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h19 == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_25 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h1a == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_26 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h1b == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_27 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h1c == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_28 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h1d == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_29 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h1e == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_30 <= io_din; // @[rv_alu.scala 128:17]
      end
    end
    if (~rsdzero) begin // @[rv_alu.scala 127:17]
      if (5'h1f == io_rsd) begin // @[rv_alu.scala 128:17]
        mem_31 <= io_din; // @[rv_alu.scala 128:17]
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
module RiscvCPU(
  input         clock,
  input         reset,
  input  [31:0] io_mIn,
  output        io_mWrite,
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] alu_io_input1; // @[rv_alu.scala 163:19]
  wire [31:0] alu_io_input2; // @[rv_alu.scala 163:19]
  wire [2:0] alu_io_func3; // @[rv_alu.scala 163:19]
  wire [31:0] alu_io_out; // @[rv_alu.scala 163:19]
  wire  regs_clock; // @[rv_alu.scala 164:20]
  wire [31:0] regs_io_din; // @[rv_alu.scala 164:20]
  wire [4:0] regs_io_rsd; // @[rv_alu.scala 164:20]
  wire [4:0] regs_io_rs1; // @[rv_alu.scala 164:20]
  wire [4:0] regs_io_rs2; // @[rv_alu.scala 164:20]
  wire [31:0] regs_io_outrs1; // @[rv_alu.scala 164:20]
  wire [31:0] regs_io_outrs2; // @[rv_alu.scala 164:20]
  reg [31:0] PC; // @[rv_alu.scala 166:19]
  wire [31:0] PC4 = PC + 32'h4; // @[rv_alu.scala 168:16]
  reg  state_start; // @[rv_alu.scala 170:29]
  reg  state_fetch; // @[rv_alu.scala 171:29]
  reg  state_decode; // @[rv_alu.scala 173:29]
  reg  state_exec; // @[rv_alu.scala 174:27]
  reg  state_halt; // @[rv_alu.scala 175:27]
  reg [4:0] rd; // @[rv_alu.scala 178:20]
  reg [4:0] rs1; // @[rv_alu.scala 179:20]
  reg [4:0] rs2; // @[rv_alu.scala 180:20]
  reg [31:0] immv; // @[rv_alu.scala 181:21]
  reg [2:0] aluOP; // @[rv_alu.scala 182:22]
  reg  din_is_alu; // @[rv_alu.scala 183:27]
  reg  alu2_use_reg; // @[rv_alu.scala 184:29]
  reg  branchEnable; // @[rv_alu.scala 186:29]
  wire [6:0] inst_opcode = io_mIn[6:0]; // @[rv_alu.scala 194:29]
  wire [4:0] inst_I_rd = io_mIn[11:7]; // @[rv_alu.scala 195:31]
  wire [2:0] inst_I_func3 = io_mIn[14:12]; // @[rv_alu.scala 195:31]
  wire [4:0] inst_I_rs1 = io_mIn[19:15]; // @[rv_alu.scala 195:31]
  wire [11:0] inst_I_imm = io_mIn[31:20]; // @[rv_alu.scala 195:31]
  wire [4:0] inst_R_rs2 = io_mIn[24:20]; // @[rv_alu.scala 196:31]
  wire [19:0] inst_U_imm = io_mIn[31:12]; // @[rv_alu.scala 197:31]
  wire  inst_B_im11 = io_mIn[7]; // @[rv_alu.scala 198:31]
  wire [3:0] inst_B_im41 = io_mIn[11:8]; // @[rv_alu.scala 198:31]
  wire [5:0] inst_B_imm10_5 = io_mIn[30:25]; // @[rv_alu.scala 198:31]
  wire  inst_B_imm12 = io_mIn[31]; // @[rv_alu.scala 198:31]
  wire [7:0] inst_J_im19_12 = io_mIn[19:12]; // @[rv_alu.scala 199:31]
  wire  inst_J_im11 = io_mIn[20]; // @[rv_alu.scala 199:31]
  wire [9:0] inst_J_im10_1 = io_mIn[30:21]; // @[rv_alu.scala 199:31]
  wire [19:0] _imm_I_T_1 = inst_B_imm12 ? 20'hfffff : 20'h0; // @[rv_alu.scala 206:15]
  wire [31:0] imm_I = {_imm_I_T_1,inst_I_imm}; // @[rv_alu.scala 206:52]
  wire [31:0] imm_B = {_imm_I_T_1,inst_B_im11,inst_B_imm10_5,inst_B_im41,1'h0}; // @[rv_alu.scala 209:52]
  wire [31:0] imm_U = {inst_U_imm,12'h0}; // @[rv_alu.scala 212:23]
  wire [11:0] _imm_J_T_1 = inst_B_imm12 ? 12'hfff : 12'h0; // @[rv_alu.scala 215:15]
  wire [31:0] imm_J = {_imm_J_T_1,inst_J_im19_12,inst_J_im11,inst_J_im10_1,1'h0}; // @[rv_alu.scala 215:103]
  wire  must_halt = state_decode & (inst_opcode == 7'h73 & inst_I_imm == 12'h1 & inst_I_rd == 5'h0 & inst_I_rs1 == 5'h0
     & inst_I_func3 == 3'h0); // @[rv_alu.scala 252:13 264:21 269:15]
  wire [31:0] _io_mAddr_T_2 = state_fetch | state_start ? PC : 32'hffffffff; // @[rv_alu.scala 233:18]
  wire [31:0] lui_mix = {immv[31:12],regs_io_outrs1[11:0]}; // @[rv_alu.scala 251:26]
  wire [31:0] branch_target = PC + immv; // @[rv_alu.scala 256:23]
  wire  alu_eq = regs_io_outrs1 == regs_io_outrs2; // @[rv_alu.scala 258:31]
  wire  alu_lt = regs_io_outrs1 < regs_io_outrs2; // @[rv_alu.scala 259:31]
  wire [2:0] _GEN_0 = 7'h6f == inst_opcode ? 3'h2 : inst_I_func3; // @[rv_alu.scala 267:11 279:16 295:15]
  wire [31:0] _GEN_2 = 7'h6f == inst_opcode ? imm_J : 32'h0; // @[rv_alu.scala 272:10 279:16 297:14]
  wire [31:0] _GEN_3 = 7'h37 == inst_opcode ? imm_U : _GEN_2; // @[rv_alu.scala 279:16 291:14]
  wire [4:0] _GEN_4 = 7'h37 == inst_opcode ? inst_I_rd : inst_I_rs1; // @[rv_alu.scala 279:16 292:13 274:9]
  wire [2:0] _GEN_5 = 7'h37 == inst_opcode ? inst_I_func3 : _GEN_0; // @[rv_alu.scala 267:11 279:16]
  wire  _GEN_6 = 7'h37 == inst_opcode ? 1'h0 : 7'h6f == inst_opcode; // @[rv_alu.scala 279:16 271:18]
  wire  _GEN_7 = 7'h63 == inst_opcode | _GEN_6; // @[rv_alu.scala 279:16 287:22]
  wire  _branchCheck_T_1 = ~alu_lt; // @[rv_alu.scala 318:22]
  wire  _GEN_26 = 3'h7 == aluOP & _branchCheck_T_1; // @[rv_alu.scala 303:15 304:17 324:19]
  wire  _GEN_27 = 3'h6 == aluOP ? alu_lt : _GEN_26; // @[rv_alu.scala 304:17 321:19]
  wire  _GEN_28 = 3'h5 == aluOP ? ~alu_lt : _GEN_27; // @[rv_alu.scala 304:17 318:19]
  wire  _GEN_29 = 3'h4 == aluOP ? alu_lt : _GEN_28; // @[rv_alu.scala 304:17 315:19]
  wire  _GEN_30 = 3'h2 == aluOP | _GEN_29; // @[rv_alu.scala 304:17 312:19]
  wire  _GEN_31 = 3'h1 == aluOP ? ~alu_eq : _GEN_30; // @[rv_alu.scala 304:17 309:19]
  wire  branchCheck = 3'h0 == aluOP ? alu_eq : _GEN_31; // @[rv_alu.scala 304:17 306:19]
  Alu alu ( // @[rv_alu.scala 163:19]
    .io_input1(alu_io_input1),
    .io_input2(alu_io_input2),
    .io_func3(alu_io_func3),
    .io_out(alu_io_out)
  );
  RegisterBank regs ( // @[rv_alu.scala 164:20]
    .clock(regs_clock),
    .io_din(regs_io_din),
    .io_rsd(regs_io_rsd),
    .io_rs1(regs_io_rs1),
    .io_rs2(regs_io_rs2),
    .io_outrs1(regs_io_outrs1),
    .io_outrs2(regs_io_outrs2)
  );
  assign io_mWrite = 1'h0; // @[rv_alu.scala 232:13]
  assign io_mOut = 32'h0; // @[rv_alu.scala 234:11]
  assign io_mAddr = _io_mAddr_T_2[9:0]; // @[rv_alu.scala 233:12]
  assign io_halted = state_halt; // @[rv_alu.scala 235:13]
  assign io_db_r1 = regs_io_outrs1; // @[rv_alu.scala 238:12]
  assign io_db_r2 = regs_io_outrs2; // @[rv_alu.scala 239:12]
  assign io_db_pc = PC; // @[rv_alu.scala 237:12]
  assign alu_io_input1 = regs_io_outrs1; // @[rv_alu.scala 241:17]
  assign alu_io_input2 = alu2_use_reg ? regs_io_outrs2 : immv; // @[rv_alu.scala 242:23]
  assign alu_io_func3 = aluOP; // @[rv_alu.scala 243:16]
  assign regs_clock = clock;
  assign regs_io_din = din_is_alu ? alu_io_out : lui_mix; // @[rv_alu.scala 245:21]
  assign regs_io_rsd = state_exec ? rd : 5'h0; // @[rv_alu.scala 249:21]
  assign regs_io_rs1 = state_halt ? 5'h1 : rs1; // @[rv_alu.scala 247:21]
  assign regs_io_rs2 = state_halt ? 5'h2 : rs2; // @[rv_alu.scala 248:21]
  always @(posedge clock) begin
    if (reset) begin // @[rv_alu.scala 166:19]
      PC <= 32'h0; // @[rv_alu.scala 166:19]
    end else if (state_exec) begin // @[rv_alu.scala 328:19]
      if (branchEnable & branchCheck) begin // @[rv_alu.scala 331:14]
        PC <= branch_target;
      end else begin
        PC <= PC4;
      end
    end
    state_start <= reset; // @[rv_alu.scala 170:{29,29} 224:15]
    if (reset) begin // @[rv_alu.scala 171:29]
      state_fetch <= 1'h0; // @[rv_alu.scala 171:29]
    end else begin
      state_fetch <= state_exec | state_start; // @[rv_alu.scala 225:15]
    end
    if (reset) begin // @[rv_alu.scala 173:29]
      state_decode <= 1'h0; // @[rv_alu.scala 173:29]
    end else begin
      state_decode <= state_fetch; // @[rv_alu.scala 227:16]
    end
    if (reset) begin // @[rv_alu.scala 174:27]
      state_exec <= 1'h0; // @[rv_alu.scala 174:27]
    end else if (must_halt) begin // @[rv_alu.scala 228:21]
      state_exec <= 1'h0;
    end else begin
      state_exec <= state_decode;
    end
    if (reset) begin // @[rv_alu.scala 175:27]
      state_halt <= 1'h0; // @[rv_alu.scala 175:27]
    end else begin
      state_halt <= must_halt | state_halt; // @[rv_alu.scala 229:14]
    end
    if (reset) begin // @[rv_alu.scala 178:20]
      rd <= 5'h0; // @[rv_alu.scala 178:20]
    end else if (state_decode) begin // @[rv_alu.scala 264:21]
      rd <= inst_I_rd; // @[rv_alu.scala 275:9]
    end
    if (reset) begin // @[rv_alu.scala 179:20]
      rs1 <= 5'h0; // @[rv_alu.scala 179:20]
    end else if (state_decode) begin // @[rv_alu.scala 264:21]
      if (7'h13 == inst_opcode) begin // @[rv_alu.scala 279:16]
        rs1 <= inst_I_rs1; // @[rv_alu.scala 274:9]
      end else if (7'h63 == inst_opcode) begin // @[rv_alu.scala 279:16]
        rs1 <= inst_I_rs1; // @[rv_alu.scala 274:9]
      end else begin
        rs1 <= _GEN_4;
      end
    end
    if (reset) begin // @[rv_alu.scala 180:20]
      rs2 <= 5'h0; // @[rv_alu.scala 180:20]
    end else if (state_decode) begin // @[rv_alu.scala 264:21]
      if (7'h13 == inst_opcode) begin // @[rv_alu.scala 279:16]
        rs2 <= 5'h0; // @[rv_alu.scala 281:13]
      end else begin
        rs2 <= inst_R_rs2; // @[rv_alu.scala 273:9]
      end
    end
    if (reset) begin // @[rv_alu.scala 181:21]
      immv <= 32'h0; // @[rv_alu.scala 181:21]
    end else if (state_decode) begin // @[rv_alu.scala 264:21]
      if (7'h13 == inst_opcode) begin // @[rv_alu.scala 279:16]
        immv <= imm_I; // @[rv_alu.scala 283:14]
      end else if (7'h63 == inst_opcode) begin // @[rv_alu.scala 279:16]
        immv <= imm_B; // @[rv_alu.scala 288:14]
      end else begin
        immv <= _GEN_3;
      end
    end
    if (reset) begin // @[rv_alu.scala 182:22]
      aluOP <= 3'h0; // @[rv_alu.scala 182:22]
    end else if (state_decode) begin // @[rv_alu.scala 264:21]
      if (7'h13 == inst_opcode) begin // @[rv_alu.scala 279:16]
        aluOP <= inst_I_func3; // @[rv_alu.scala 267:11]
      end else if (7'h63 == inst_opcode) begin // @[rv_alu.scala 279:16]
        aluOP <= inst_I_func3; // @[rv_alu.scala 267:11]
      end else begin
        aluOP <= _GEN_5;
      end
    end
    if (reset) begin // @[rv_alu.scala 183:27]
      din_is_alu <= 1'h0; // @[rv_alu.scala 183:27]
    end else if (state_decode) begin // @[rv_alu.scala 264:21]
      if (inst_opcode == 7'h37) begin // @[rv_alu.scala 277:22]
        din_is_alu <= 1'h0;
      end else begin
        din_is_alu <= 1'h1;
      end
    end
    if (reset) begin // @[rv_alu.scala 184:29]
      alu2_use_reg <= 1'h0; // @[rv_alu.scala 184:29]
    end else if (state_decode) begin // @[rv_alu.scala 264:21]
      if (7'h13 == inst_opcode) begin // @[rv_alu.scala 279:16]
        alu2_use_reg <= 1'h0; // @[rv_alu.scala 284:22]
      end else begin
        alu2_use_reg <= 1'h1; // @[rv_alu.scala 278:18]
      end
    end
    if (reset) begin // @[rv_alu.scala 186:29]
      branchEnable <= 1'h0; // @[rv_alu.scala 186:29]
    end else if (state_decode) begin // @[rv_alu.scala 264:21]
      if (7'h13 == inst_opcode) begin // @[rv_alu.scala 279:16]
        branchEnable <= 1'h0; // @[rv_alu.scala 271:18]
      end else begin
        branchEnable <= _GEN_7;
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
  immv = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  aluOP = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  din_is_alu = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  alu2_use_reg = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  branchEnable = _RAND_13[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
