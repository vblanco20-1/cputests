module BlockRam(
  input         clock,
  input         reset,
  input  [9:0]  io_addr, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 419:14]
  input         io_write, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 419:14]
  input         io_mask_0, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 419:14]
  input         io_mask_1, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 419:14]
  input         io_mask_2, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 419:14]
  input         io_mask_3, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 419:14]
  input  [31:0] io_in, // @[\\src\\main\\scala\\gcd\\rv_alu.scala 419:14]
  output [31:0] io_out // @[\\src\\main\\scala\\gcd\\rv_alu.scala 419:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:63]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 429:26]
  wire  mem_read_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 429:26]
  wire [5:0] mem_read_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 429:26]
  wire [31:0] mem_read_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 429:26]
  wire [31:0] mem_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 429:26]
  wire [5:0] mem_MPORT_addr; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 429:26]
  wire  mem_MPORT_mask; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 429:26]
  wire  mem_MPORT_en; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 429:26]
  reg  mem_read_MPORT_en_pipe_0;
  reg [5:0] mem_read_MPORT_addr_pipe_0;
  wire [7:0] adress = io_addr[9:2]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 435:26]
  wire [31:0] read = mem_read_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 433:20 437:10]
  wire [7:0] data_0 = io_mask_0 ? io_in[7:0] : read[7:0]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:21]
  wire [7:0] data_1 = io_mask_1 ? io_in[15:8] : read[15:8]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:21]
  wire [7:0] data_2 = io_mask_2 ? io_in[23:16] : read[23:16]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:21]
  wire [7:0] data_3 = io_mask_3 ? io_in[31:24] : read[31:24]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:21]
  wire [15:0] lo = {data_1,data_0}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 446:31]
  wire [15:0] hi = {data_3,data_2}; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 446:31]
  assign mem_read_MPORT_en = mem_read_MPORT_en_pipe_0;
  assign mem_read_MPORT_addr = mem_read_MPORT_addr_pipe_0;
  assign mem_read_MPORT_data = mem[mem_read_MPORT_addr]; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 429:26]
  assign mem_MPORT_data = {hi,lo};
  assign mem_MPORT_addr = adress[5:0];
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_write;
  assign io_out = mem_read_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 433:20 437:10]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[\\src\\main\\scala\\gcd\\rv_alu.scala 429:26]
    end
    mem_read_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_read_MPORT_addr_pipe_0 <= adress[5:0];
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  mem_read_MPORT_en_pipe_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  mem_read_MPORT_addr_pipe_0 = _RAND_1[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  $readmemb("asm\jumps_01.txt", mem);
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
