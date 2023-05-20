module BlockRam(
  input         clock,
  input         reset,
  input  [29:0] io_addr, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 467:14]
  input         io_write, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 467:14]
  input         io_mask_0, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 467:14]
  input         io_mask_1, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 467:14]
  input         io_mask_2, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 467:14]
  input         io_mask_3, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 467:14]
  input  [31:0] io_in, // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 467:14]
  output [31:0] io_out // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 467:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] memROM [0:16383]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 478:29]
  wire  memROM_readROM_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 478:29]
  wire [13:0] memROM_readROM_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 478:29]
  wire [31:0] memROM_readROM_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 478:29]
  reg  memROM_readROM_MPORT_en_pipe_0;
  reg [13:0] memROM_readROM_MPORT_addr_pipe_0;
  reg [7:0] memRAM_0 [0:16383]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire  memRAM_0_readRAM_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire [13:0] memRAM_0_readRAM_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire [7:0] memRAM_0_readRAM_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire [7:0] memRAM_0_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire [13:0] memRAM_0_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire  memRAM_0_MPORT_mask; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire  memRAM_0_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  reg  memRAM_0_readRAM_MPORT_en_pipe_0;
  reg [13:0] memRAM_0_readRAM_MPORT_addr_pipe_0;
  reg [7:0] memRAM_1 [0:16383]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire  memRAM_1_readRAM_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire [13:0] memRAM_1_readRAM_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire [7:0] memRAM_1_readRAM_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire [7:0] memRAM_1_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire [13:0] memRAM_1_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire  memRAM_1_MPORT_mask; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire  memRAM_1_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  reg  memRAM_1_readRAM_MPORT_en_pipe_0;
  reg [13:0] memRAM_1_readRAM_MPORT_addr_pipe_0;
  reg [7:0] memRAM_2 [0:16383]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire  memRAM_2_readRAM_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire [13:0] memRAM_2_readRAM_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire [7:0] memRAM_2_readRAM_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire [7:0] memRAM_2_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire [13:0] memRAM_2_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire  memRAM_2_MPORT_mask; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire  memRAM_2_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  reg  memRAM_2_readRAM_MPORT_en_pipe_0;
  reg [13:0] memRAM_2_readRAM_MPORT_addr_pipe_0;
  reg [7:0] memRAM_3 [0:16383]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire  memRAM_3_readRAM_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire [13:0] memRAM_3_readRAM_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire [7:0] memRAM_3_readRAM_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire [7:0] memRAM_3_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire [13:0] memRAM_3_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire  memRAM_3_MPORT_mask; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  wire  memRAM_3_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  reg  memRAM_3_readRAM_MPORT_en_pipe_0;
  reg [13:0] memRAM_3_readRAM_MPORT_addr_pipe_0;
  wire [29:0] adressMasked = io_addr & 30'h3fff; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 490:33]
  reg  addrRom; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 492:22]
  wire [31:0] readRAM = {memRAM_3_readRAM_MPORT_data,memRAM_2_readRAM_MPORT_data,memRAM_1_readRAM_MPORT_data,
    memRAM_0_readRAM_MPORT_data}; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 495:37]
  wire [31:0] readROM = memROM_readROM_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 486:23 494:13]
  assign memROM_readROM_MPORT_en = memROM_readROM_MPORT_en_pipe_0;
  assign memROM_readROM_MPORT_addr = memROM_readROM_MPORT_addr_pipe_0;
  assign memROM_readROM_MPORT_data = memROM[memROM_readROM_MPORT_addr]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 478:29]
  assign memRAM_0_readRAM_MPORT_en = memRAM_0_readRAM_MPORT_en_pipe_0;
  assign memRAM_0_readRAM_MPORT_addr = memRAM_0_readRAM_MPORT_addr_pipe_0;
  assign memRAM_0_readRAM_MPORT_data = memRAM_0[memRAM_0_readRAM_MPORT_addr]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  assign memRAM_0_MPORT_data = io_in[7:0];
  assign memRAM_0_MPORT_addr = adressMasked[13:0];
  assign memRAM_0_MPORT_mask = io_mask_0;
  assign memRAM_0_MPORT_en = 1'h1;
  assign memRAM_1_readRAM_MPORT_en = memRAM_1_readRAM_MPORT_en_pipe_0;
  assign memRAM_1_readRAM_MPORT_addr = memRAM_1_readRAM_MPORT_addr_pipe_0;
  assign memRAM_1_readRAM_MPORT_data = memRAM_1[memRAM_1_readRAM_MPORT_addr]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  assign memRAM_1_MPORT_data = io_in[15:8];
  assign memRAM_1_MPORT_addr = adressMasked[13:0];
  assign memRAM_1_MPORT_mask = io_mask_1;
  assign memRAM_1_MPORT_en = 1'h1;
  assign memRAM_2_readRAM_MPORT_en = memRAM_2_readRAM_MPORT_en_pipe_0;
  assign memRAM_2_readRAM_MPORT_addr = memRAM_2_readRAM_MPORT_addr_pipe_0;
  assign memRAM_2_readRAM_MPORT_data = memRAM_2[memRAM_2_readRAM_MPORT_addr]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  assign memRAM_2_MPORT_data = io_in[23:16];
  assign memRAM_2_MPORT_addr = adressMasked[13:0];
  assign memRAM_2_MPORT_mask = io_mask_2;
  assign memRAM_2_MPORT_en = 1'h1;
  assign memRAM_3_readRAM_MPORT_en = memRAM_3_readRAM_MPORT_en_pipe_0;
  assign memRAM_3_readRAM_MPORT_addr = memRAM_3_readRAM_MPORT_addr_pipe_0;
  assign memRAM_3_readRAM_MPORT_data = memRAM_3[memRAM_3_readRAM_MPORT_addr]; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
  assign memRAM_3_MPORT_data = io_in[31:24];
  assign memRAM_3_MPORT_addr = adressMasked[13:0];
  assign memRAM_3_MPORT_mask = io_mask_3;
  assign memRAM_3_MPORT_en = 1'h1;
  assign io_out = addrRom ? readROM : readRAM; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 508:16]
  always @(posedge clock) begin
    memROM_readROM_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      memROM_readROM_MPORT_addr_pipe_0 <= adressMasked[13:0];
    end
    if (memRAM_0_MPORT_en & memRAM_0_MPORT_mask) begin
      memRAM_0[memRAM_0_MPORT_addr] <= memRAM_0_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
    end
    memRAM_0_readRAM_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      memRAM_0_readRAM_MPORT_addr_pipe_0 <= adressMasked[13:0];
    end
    if (memRAM_1_MPORT_en & memRAM_1_MPORT_mask) begin
      memRAM_1[memRAM_1_MPORT_addr] <= memRAM_1_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
    end
    memRAM_1_readRAM_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      memRAM_1_readRAM_MPORT_addr_pipe_0 <= adressMasked[13:0];
    end
    if (memRAM_2_MPORT_en & memRAM_2_MPORT_mask) begin
      memRAM_2[memRAM_2_MPORT_addr] <= memRAM_2_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
    end
    memRAM_2_readRAM_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      memRAM_2_readRAM_MPORT_addr_pipe_0 <= adressMasked[13:0];
    end
    if (memRAM_3_MPORT_en & memRAM_3_MPORT_mask) begin
      memRAM_3[memRAM_3_MPORT_addr] <= memRAM_3_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 483:29]
    end
    memRAM_3_readRAM_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      memRAM_3_readRAM_MPORT_addr_pipe_0 <= adressMasked[13:0];
    end
    addrRom <= adressMasked == io_addr; // @[\\src\\main\\scala\\gcd\\rv_cpu.scala 497:29]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16384; initvar = initvar+1)
    memRAM_0[initvar] = _RAND_2[7:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16384; initvar = initvar+1)
    memRAM_1[initvar] = _RAND_5[7:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16384; initvar = initvar+1)
    memRAM_2[initvar] = _RAND_8[7:0];
  _RAND_11 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16384; initvar = initvar+1)
    memRAM_3[initvar] = _RAND_11[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  memROM_readROM_MPORT_en_pipe_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  memROM_readROM_MPORT_addr_pipe_0 = _RAND_1[13:0];
  _RAND_3 = {1{`RANDOM}};
  memRAM_0_readRAM_MPORT_en_pipe_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  memRAM_0_readRAM_MPORT_addr_pipe_0 = _RAND_4[13:0];
  _RAND_6 = {1{`RANDOM}};
  memRAM_1_readRAM_MPORT_en_pipe_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  memRAM_1_readRAM_MPORT_addr_pipe_0 = _RAND_7[13:0];
  _RAND_9 = {1{`RANDOM}};
  memRAM_2_readRAM_MPORT_en_pipe_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  memRAM_2_readRAM_MPORT_addr_pipe_0 = _RAND_10[13:0];
  _RAND_12 = {1{`RANDOM}};
  memRAM_3_readRAM_MPORT_en_pipe_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  memRAM_3_readRAM_MPORT_addr_pipe_0 = _RAND_13[13:0];
  _RAND_14 = {1{`RANDOM}};
  addrRom = _RAND_14[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  $readmemb("fib.txt", memROM);
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
