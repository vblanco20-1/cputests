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
