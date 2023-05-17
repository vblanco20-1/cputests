module BlockRam(
  input         clock,
  input         reset,
  input  [29:0] io_addr, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 494:14]
  input         io_write, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 494:14]
  input         io_mask_0, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 494:14]
  input         io_mask_1, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 494:14]
  input         io_mask_2, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 494:14]
  input         io_mask_3, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 494:14]
  input  [31:0] io_in, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 494:14]
  output [31:0] io_out // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 494:14]
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_12;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] memROM [0:254]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 505:29]
  wire  memROM_readROM_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 505:29]
  wire [7:0] memROM_readROM_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 505:29]
  wire [31:0] memROM_readROM_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 505:29]
  reg  memROM_readROM_MPORT_en_pipe_0;
  reg [7:0] memROM_readROM_MPORT_addr_pipe_0;
  reg [7:0] memRAM_0 [0:8191]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire  memRAM_0_readRAM_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire [12:0] memRAM_0_readRAM_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire [7:0] memRAM_0_readRAM_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire [7:0] memRAM_0_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire [12:0] memRAM_0_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire  memRAM_0_MPORT_mask; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire  memRAM_0_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  reg  memRAM_0_readRAM_MPORT_en_pipe_0;
  reg [12:0] memRAM_0_readRAM_MPORT_addr_pipe_0;
  reg [7:0] memRAM_1 [0:8191]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire  memRAM_1_readRAM_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire [12:0] memRAM_1_readRAM_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire [7:0] memRAM_1_readRAM_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire [7:0] memRAM_1_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire [12:0] memRAM_1_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire  memRAM_1_MPORT_mask; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire  memRAM_1_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  reg  memRAM_1_readRAM_MPORT_en_pipe_0;
  reg [12:0] memRAM_1_readRAM_MPORT_addr_pipe_0;
  reg [7:0] memRAM_2 [0:8191]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire  memRAM_2_readRAM_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire [12:0] memRAM_2_readRAM_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire [7:0] memRAM_2_readRAM_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire [7:0] memRAM_2_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire [12:0] memRAM_2_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire  memRAM_2_MPORT_mask; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire  memRAM_2_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  reg  memRAM_2_readRAM_MPORT_en_pipe_0;
  reg [12:0] memRAM_2_readRAM_MPORT_addr_pipe_0;
  reg [7:0] memRAM_3 [0:8191]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire  memRAM_3_readRAM_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire [12:0] memRAM_3_readRAM_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire [7:0] memRAM_3_readRAM_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire [7:0] memRAM_3_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire [12:0] memRAM_3_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire  memRAM_3_MPORT_mask; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  wire  memRAM_3_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  reg  memRAM_3_readRAM_MPORT_en_pipe_0;
  reg [12:0] memRAM_3_readRAM_MPORT_addr_pipe_0;
  wire [29:0] adressMasked = io_addr & 30'h3ff; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 517:33]
  reg  addrRom; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 519:22]
  wire [31:0] readRAM = {memRAM_3_readRAM_MPORT_data,memRAM_2_readRAM_MPORT_data,memRAM_1_readRAM_MPORT_data,
    memRAM_0_readRAM_MPORT_data}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 522:37]
  wire [31:0] readROM = memROM_readROM_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 513:23 521:13]
  assign memROM_readROM_MPORT_en = memROM_readROM_MPORT_en_pipe_0;
  assign memROM_readROM_MPORT_addr = memROM_readROM_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign memROM_readROM_MPORT_data = memROM[memROM_readROM_MPORT_addr]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 505:29]
  `else
  assign memROM_readROM_MPORT_data = memROM_readROM_MPORT_addr >= 8'hff ? _RAND_0[31:0] :
    memROM[memROM_readROM_MPORT_addr]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 505:29]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign memRAM_0_readRAM_MPORT_en = memRAM_0_readRAM_MPORT_en_pipe_0;
  assign memRAM_0_readRAM_MPORT_addr = memRAM_0_readRAM_MPORT_addr_pipe_0;
  assign memRAM_0_readRAM_MPORT_data = memRAM_0[memRAM_0_readRAM_MPORT_addr]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  assign memRAM_0_MPORT_data = io_in[7:0];
  assign memRAM_0_MPORT_addr = adressMasked[12:0];
  assign memRAM_0_MPORT_mask = io_mask_0;
  assign memRAM_0_MPORT_en = 1'h1;
  assign memRAM_1_readRAM_MPORT_en = memRAM_1_readRAM_MPORT_en_pipe_0;
  assign memRAM_1_readRAM_MPORT_addr = memRAM_1_readRAM_MPORT_addr_pipe_0;
  assign memRAM_1_readRAM_MPORT_data = memRAM_1[memRAM_1_readRAM_MPORT_addr]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  assign memRAM_1_MPORT_data = io_in[15:8];
  assign memRAM_1_MPORT_addr = adressMasked[12:0];
  assign memRAM_1_MPORT_mask = io_mask_1;
  assign memRAM_1_MPORT_en = 1'h1;
  assign memRAM_2_readRAM_MPORT_en = memRAM_2_readRAM_MPORT_en_pipe_0;
  assign memRAM_2_readRAM_MPORT_addr = memRAM_2_readRAM_MPORT_addr_pipe_0;
  assign memRAM_2_readRAM_MPORT_data = memRAM_2[memRAM_2_readRAM_MPORT_addr]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  assign memRAM_2_MPORT_data = io_in[23:16];
  assign memRAM_2_MPORT_addr = adressMasked[12:0];
  assign memRAM_2_MPORT_mask = io_mask_2;
  assign memRAM_2_MPORT_en = 1'h1;
  assign memRAM_3_readRAM_MPORT_en = memRAM_3_readRAM_MPORT_en_pipe_0;
  assign memRAM_3_readRAM_MPORT_addr = memRAM_3_readRAM_MPORT_addr_pipe_0;
  assign memRAM_3_readRAM_MPORT_data = memRAM_3[memRAM_3_readRAM_MPORT_addr]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
  assign memRAM_3_MPORT_data = io_in[31:24];
  assign memRAM_3_MPORT_addr = adressMasked[12:0];
  assign memRAM_3_MPORT_mask = io_mask_3;
  assign memRAM_3_MPORT_en = 1'h1;
  assign io_out = addrRom ? readROM : readRAM; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 535:16]
  always @(posedge clock) begin
    memROM_readROM_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      memROM_readROM_MPORT_addr_pipe_0 <= adressMasked[7:0];
    end
    if (memRAM_0_MPORT_en & memRAM_0_MPORT_mask) begin
      memRAM_0[memRAM_0_MPORT_addr] <= memRAM_0_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
    end
    memRAM_0_readRAM_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      memRAM_0_readRAM_MPORT_addr_pipe_0 <= adressMasked[12:0];
    end
    if (memRAM_1_MPORT_en & memRAM_1_MPORT_mask) begin
      memRAM_1[memRAM_1_MPORT_addr] <= memRAM_1_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
    end
    memRAM_1_readRAM_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      memRAM_1_readRAM_MPORT_addr_pipe_0 <= adressMasked[12:0];
    end
    if (memRAM_2_MPORT_en & memRAM_2_MPORT_mask) begin
      memRAM_2[memRAM_2_MPORT_addr] <= memRAM_2_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
    end
    memRAM_2_readRAM_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      memRAM_2_readRAM_MPORT_addr_pipe_0 <= adressMasked[12:0];
    end
    if (memRAM_3_MPORT_en & memRAM_3_MPORT_mask) begin
      memRAM_3[memRAM_3_MPORT_addr] <= memRAM_3_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 510:29]
    end
    memRAM_3_readRAM_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      memRAM_3_readRAM_MPORT_addr_pipe_0 <= adressMasked[12:0];
    end
    addrRom <= adressMasked == io_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 524:29]
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
  integer initvar;
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_0 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8192; initvar = initvar+1)
    memRAM_0[initvar] = _RAND_3[7:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8192; initvar = initvar+1)
    memRAM_1[initvar] = _RAND_6[7:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8192; initvar = initvar+1)
    memRAM_2[initvar] = _RAND_9[7:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8192; initvar = initvar+1)
    memRAM_3[initvar] = _RAND_12[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  memROM_readROM_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  memROM_readROM_MPORT_addr_pipe_0 = _RAND_2[7:0];
  _RAND_4 = {1{`RANDOM}};
  memRAM_0_readRAM_MPORT_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  memRAM_0_readRAM_MPORT_addr_pipe_0 = _RAND_5[12:0];
  _RAND_7 = {1{`RANDOM}};
  memRAM_1_readRAM_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  memRAM_1_readRAM_MPORT_addr_pipe_0 = _RAND_8[12:0];
  _RAND_10 = {1{`RANDOM}};
  memRAM_2_readRAM_MPORT_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  memRAM_2_readRAM_MPORT_addr_pipe_0 = _RAND_11[12:0];
  _RAND_13 = {1{`RANDOM}};
  memRAM_3_readRAM_MPORT_en_pipe_0 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  memRAM_3_readRAM_MPORT_addr_pipe_0 = _RAND_14[12:0];
  _RAND_15 = {1{`RANDOM}};
  addrRom = _RAND_15[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  $readmemb("fib.txt", memROM);
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
