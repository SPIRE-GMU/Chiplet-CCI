module AsyncResetSynchronizerPrimitiveShiftReg_d3_i0(
  input   clock,
  input   reset,
  input   io_d, // @[src/main/scala/util/ShiftReg.scala 36:14]
  output  io_q // @[src/main/scala/util/ShiftReg.scala 36:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  sync_0; // @[src/main/scala/util/SynchronizerReg.scala 51:87]
  reg  sync_1; // @[src/main/scala/util/SynchronizerReg.scala 51:87]
  reg  sync_2; // @[src/main/scala/util/SynchronizerReg.scala 51:87]
  assign io_q = sync_0; // @[src/main/scala/util/SynchronizerReg.scala 59:8]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[src/main/scala/util/SynchronizerReg.scala 51:87]
      sync_0 <= 1'h0; // @[src/main/scala/util/SynchronizerReg.scala 51:87]
    end else begin
      sync_0 <= sync_1; // @[src/main/scala/util/SynchronizerReg.scala 57:10]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[src/main/scala/util/SynchronizerReg.scala 51:87]
      sync_1 <= 1'h0; // @[src/main/scala/util/SynchronizerReg.scala 51:87]
    end else begin
      sync_1 <= sync_2; // @[src/main/scala/util/SynchronizerReg.scala 57:10]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[src/main/scala/util/SynchronizerReg.scala 54:22]
      sync_2 <= 1'h0;
    end else begin
      sync_2 <= io_d;
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
  sync_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  sync_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  sync_2 = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    sync_0 = 1'h0;
  end
  if (reset) begin
    sync_1 = 1'h0;
  end
  if (reset) begin
    sync_2 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AsyncResetSynchronizerShiftReg_w4_d3_i0(
  input        clock,
  input        reset,
  input  [3:0] io_d, // @[src/main/scala/util/ShiftReg.scala 36:14]
  output [3:0] io_q // @[src/main/scala/util/ShiftReg.scala 36:14]
);
  wire  output_chain_clock; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_chain_reset; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_chain_io_d; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_chain_io_q; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_chain_1_clock; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_chain_1_reset; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_chain_1_io_d; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_chain_1_io_q; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_chain_2_clock; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_chain_2_reset; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_chain_2_io_d; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_chain_2_io_q; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_chain_3_clock; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_chain_3_reset; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_chain_3_io_d; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_chain_3_io_q; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_1 = output_chain_1_io_q; // @[src/main/scala/util/ShiftReg.scala 48:{24,24}]
  wire  output_0 = output_chain_io_q; // @[src/main/scala/util/ShiftReg.scala 48:{24,24}]
  wire [1:0] io_q_lo = {output_1,output_0}; // @[src/main/scala/util/SynchronizerReg.scala 90:14]
  wire  output_3 = output_chain_3_io_q; // @[src/main/scala/util/ShiftReg.scala 48:{24,24}]
  wire  output_2 = output_chain_2_io_q; // @[src/main/scala/util/ShiftReg.scala 48:{24,24}]
  wire [1:0] io_q_hi = {output_3,output_2}; // @[src/main/scala/util/SynchronizerReg.scala 90:14]
  AsyncResetSynchronizerPrimitiveShiftReg_d3_i0 output_chain ( // @[src/main/scala/util/ShiftReg.scala 45:23]
    .clock(output_chain_clock),
    .reset(output_chain_reset),
    .io_d(output_chain_io_d),
    .io_q(output_chain_io_q)
  );
  AsyncResetSynchronizerPrimitiveShiftReg_d3_i0 output_chain_1 ( // @[src/main/scala/util/ShiftReg.scala 45:23]
    .clock(output_chain_1_clock),
    .reset(output_chain_1_reset),
    .io_d(output_chain_1_io_d),
    .io_q(output_chain_1_io_q)
  );
  AsyncResetSynchronizerPrimitiveShiftReg_d3_i0 output_chain_2 ( // @[src/main/scala/util/ShiftReg.scala 45:23]
    .clock(output_chain_2_clock),
    .reset(output_chain_2_reset),
    .io_d(output_chain_2_io_d),
    .io_q(output_chain_2_io_q)
  );
  AsyncResetSynchronizerPrimitiveShiftReg_d3_i0 output_chain_3 ( // @[src/main/scala/util/ShiftReg.scala 45:23]
    .clock(output_chain_3_clock),
    .reset(output_chain_3_reset),
    .io_d(output_chain_3_io_d),
    .io_q(output_chain_3_io_q)
  );
  assign io_q = {io_q_hi,io_q_lo}; // @[src/main/scala/util/SynchronizerReg.scala 90:14]
  assign output_chain_clock = clock;
  assign output_chain_reset = reset; // @[src/main/scala/util/SynchronizerReg.scala 86:21]
  assign output_chain_io_d = io_d[0]; // @[src/main/scala/util/SynchronizerReg.scala 87:41]
  assign output_chain_1_clock = clock;
  assign output_chain_1_reset = reset; // @[src/main/scala/util/SynchronizerReg.scala 86:21]
  assign output_chain_1_io_d = io_d[1]; // @[src/main/scala/util/SynchronizerReg.scala 87:41]
  assign output_chain_2_clock = clock;
  assign output_chain_2_reset = reset; // @[src/main/scala/util/SynchronizerReg.scala 86:21]
  assign output_chain_2_io_d = io_d[2]; // @[src/main/scala/util/SynchronizerReg.scala 87:41]
  assign output_chain_3_clock = clock;
  assign output_chain_3_reset = reset; // @[src/main/scala/util/SynchronizerReg.scala 86:21]
  assign output_chain_3_io_d = io_d[3]; // @[src/main/scala/util/SynchronizerReg.scala 87:41]
endmodule
module AsyncResetSynchronizerShiftReg_w1_d3_i0(
  input   clock,
  input   reset,
  input   io_d, // @[src/main/scala/util/ShiftReg.scala 36:14]
  output  io_q // @[src/main/scala/util/ShiftReg.scala 36:14]
);
  wire  output_chain_clock; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_chain_reset; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_chain_io_d; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  output_chain_io_q; // @[src/main/scala/util/ShiftReg.scala 45:23]
  AsyncResetSynchronizerPrimitiveShiftReg_d3_i0 output_chain ( // @[src/main/scala/util/ShiftReg.scala 45:23]
    .clock(output_chain_clock),
    .reset(output_chain_reset),
    .io_d(output_chain_io_d),
    .io_q(output_chain_io_q)
  );
  assign io_q = output_chain_io_q; // @[src/main/scala/util/ShiftReg.scala 48:{24,24}]
  assign output_chain_clock = clock;
  assign output_chain_reset = reset; // @[src/main/scala/util/SynchronizerReg.scala 86:21]
  assign output_chain_io_d = io_d; // @[src/main/scala/util/SynchronizerReg.scala 87:41]
endmodule
module AsyncValidSync(
  input   io_in, // @[src/main/scala/util/AsyncQueue.scala 59:14]
  output  io_out, // @[src/main/scala/util/AsyncQueue.scala 59:14]
  input   clock, // @[src/main/scala/util/AsyncQueue.scala 63:17]
  input   reset // @[src/main/scala/util/AsyncQueue.scala 64:17]
);
  wire  io_out_source_valid_0_clock; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  io_out_source_valid_0_reset; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  io_out_source_valid_0_io_d; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  io_out_source_valid_0_io_q; // @[src/main/scala/util/ShiftReg.scala 45:23]
  AsyncResetSynchronizerShiftReg_w1_d3_i0 io_out_source_valid_0 ( // @[src/main/scala/util/ShiftReg.scala 45:23]
    .clock(io_out_source_valid_0_clock),
    .reset(io_out_source_valid_0_reset),
    .io_d(io_out_source_valid_0_io_d),
    .io_q(io_out_source_valid_0_io_q)
  );
  assign io_out = io_out_source_valid_0_io_q; // @[src/main/scala/util/ShiftReg.scala 48:{24,24}]
  assign io_out_source_valid_0_clock = clock;
  assign io_out_source_valid_0_reset = reset;
  assign io_out_source_valid_0_io_d = io_in; // @[src/main/scala/util/ShiftReg.scala 47:16]
endmodule
module AsyncQueueSource(
  input         clock,
  input         reset,
  output        io_enq_ready, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input         io_enq_valid, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [31:0] io_enq_bits_0, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [31:0] io_enq_bits_1, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [31:0] io_enq_bits_2, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [31:0] io_enq_bits_3, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_0_0, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_0_1, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_0_2, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_0_3, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_1_0, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_1_1, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_1_2, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_1_3, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_2_0, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_2_1, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_2_2, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_2_3, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_3_0, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_3_1, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_3_2, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_3_3, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_4_0, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_4_1, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_4_2, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_4_3, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_5_0, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_5_1, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_5_2, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_5_3, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_6_0, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_6_1, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_6_2, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_6_3, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_7_0, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_7_1, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_7_2, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [31:0] io_async_mem_7_3, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [3:0]  io_async_ridx, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [3:0]  io_async_widx, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input         io_async_safe_ridx_valid, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output        io_async_safe_widx_valid, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output        io_async_safe_source_reset_n, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input         io_async_safe_sink_reset_n // @[src/main/scala/util/AsyncQueue.scala 71:14]
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
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
`endif // RANDOMIZE_REG_INIT
  wire  ridx_ridx_gray_clock; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  ridx_ridx_gray_reset; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire [3:0] ridx_ridx_gray_io_d; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire [3:0] ridx_ridx_gray_io_q; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  source_valid_0_io_in; // @[src/main/scala/util/AsyncQueue.scala 100:32]
  wire  source_valid_0_io_out; // @[src/main/scala/util/AsyncQueue.scala 100:32]
  wire  source_valid_0_clock; // @[src/main/scala/util/AsyncQueue.scala 100:32]
  wire  source_valid_0_reset; // @[src/main/scala/util/AsyncQueue.scala 100:32]
  wire  source_valid_1_io_in; // @[src/main/scala/util/AsyncQueue.scala 101:32]
  wire  source_valid_1_io_out; // @[src/main/scala/util/AsyncQueue.scala 101:32]
  wire  source_valid_1_clock; // @[src/main/scala/util/AsyncQueue.scala 101:32]
  wire  source_valid_1_reset; // @[src/main/scala/util/AsyncQueue.scala 101:32]
  wire  sink_extend_io_in; // @[src/main/scala/util/AsyncQueue.scala 103:30]
  wire  sink_extend_io_out; // @[src/main/scala/util/AsyncQueue.scala 103:30]
  wire  sink_extend_clock; // @[src/main/scala/util/AsyncQueue.scala 103:30]
  wire  sink_extend_reset; // @[src/main/scala/util/AsyncQueue.scala 103:30]
  wire  sink_valid_io_in; // @[src/main/scala/util/AsyncQueue.scala 104:30]
  wire  sink_valid_io_out; // @[src/main/scala/util/AsyncQueue.scala 104:30]
  wire  sink_valid_clock; // @[src/main/scala/util/AsyncQueue.scala 104:30]
  wire  sink_valid_reset; // @[src/main/scala/util/AsyncQueue.scala 104:30]
  reg [31:0] mem_0_0; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_0_1; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_0_2; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_0_3; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_1_0; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_1_1; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_1_2; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_1_3; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_2_0; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_2_1; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_2_2; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_2_3; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_3_0; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_3_1; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_3_2; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_3_3; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_4_0; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_4_1; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_4_2; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_4_3; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_5_0; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_5_1; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_5_2; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_5_3; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_6_0; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_6_1; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_6_2; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_6_3; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_7_0; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_7_1; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_7_2; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [31:0] mem_7_3; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  wire  _widx_T_1 = io_enq_ready & io_enq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  sink_ready = sink_valid_io_out; // @[src/main/scala/util/AsyncQueue.scala 120:16 79:28]
  wire  _widx_T_2 = ~sink_ready; // @[src/main/scala/util/AsyncQueue.scala 81:77]
  reg [3:0] widx_widx_bin; // @[src/main/scala/util/AsyncQueue.scala 52:25]
  wire [3:0] _GEN_64 = {{3'd0}, _widx_T_1}; // @[src/main/scala/util/AsyncQueue.scala 53:43]
  wire [3:0] _widx_incremented_T_1 = widx_widx_bin + _GEN_64; // @[src/main/scala/util/AsyncQueue.scala 53:43]
  wire [3:0] widx_incremented = _widx_T_2 ? 4'h0 : _widx_incremented_T_1; // @[src/main/scala/util/AsyncQueue.scala 53:23]
  wire [3:0] _GEN_65 = {{1'd0}, widx_incremented[3:1]}; // @[src/main/scala/util/AsyncQueue.scala 54:17]
  wire [3:0] widx = widx_incremented ^ _GEN_65; // @[src/main/scala/util/AsyncQueue.scala 54:17]
  wire [3:0] ridx = ridx_ridx_gray_io_q; // @[src/main/scala/util/ShiftReg.scala 48:{24,24}]
  wire [3:0] _ready_T = ridx ^ 4'hc; // @[src/main/scala/util/AsyncQueue.scala 83:44]
  wire [2:0] _index_T_2 = {io_async_widx[3], 2'h0}; // @[src/main/scala/util/AsyncQueue.scala 85:93]
  wire [2:0] index = io_async_widx[2:0] ^ _index_T_2; // @[src/main/scala/util/AsyncQueue.scala 85:64]
  reg  ready_reg; // @[src/main/scala/util/AsyncQueue.scala 88:56]
  reg [3:0] widx_gray; // @[src/main/scala/util/AsyncQueue.scala 91:55]
  AsyncResetSynchronizerShiftReg_w4_d3_i0 ridx_ridx_gray ( // @[src/main/scala/util/ShiftReg.scala 45:23]
    .clock(ridx_ridx_gray_clock),
    .reset(ridx_ridx_gray_reset),
    .io_d(ridx_ridx_gray_io_d),
    .io_q(ridx_ridx_gray_io_q)
  );
  AsyncValidSync source_valid_0 ( // @[src/main/scala/util/AsyncQueue.scala 100:32]
    .io_in(source_valid_0_io_in),
    .io_out(source_valid_0_io_out),
    .clock(source_valid_0_clock),
    .reset(source_valid_0_reset)
  );
  AsyncValidSync source_valid_1 ( // @[src/main/scala/util/AsyncQueue.scala 101:32]
    .io_in(source_valid_1_io_in),
    .io_out(source_valid_1_io_out),
    .clock(source_valid_1_clock),
    .reset(source_valid_1_reset)
  );
  AsyncValidSync sink_extend ( // @[src/main/scala/util/AsyncQueue.scala 103:30]
    .io_in(sink_extend_io_in),
    .io_out(sink_extend_io_out),
    .clock(sink_extend_clock),
    .reset(sink_extend_reset)
  );
  AsyncValidSync sink_valid ( // @[src/main/scala/util/AsyncQueue.scala 104:30]
    .io_in(sink_valid_io_in),
    .io_out(sink_valid_io_out),
    .clock(sink_valid_clock),
    .reset(sink_valid_reset)
  );
  assign io_enq_ready = ready_reg & sink_ready; // @[src/main/scala/util/AsyncQueue.scala 89:29]
  assign io_async_mem_0_0 = mem_0_0; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_0_1 = mem_0_1; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_0_2 = mem_0_2; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_0_3 = mem_0_3; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_0 = mem_1_0; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_1 = mem_1_1; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_2 = mem_1_2; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_3 = mem_1_3; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_0 = mem_2_0; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_1 = mem_2_1; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_2 = mem_2_2; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_3 = mem_2_3; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_0 = mem_3_0; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_1 = mem_3_1; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_2 = mem_3_2; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_3 = mem_3_3; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_0 = mem_4_0; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_1 = mem_4_1; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_2 = mem_4_2; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_3 = mem_4_3; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_0 = mem_5_0; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_1 = mem_5_1; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_2 = mem_5_2; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_3 = mem_5_3; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_0 = mem_6_0; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_1 = mem_6_1; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_2 = mem_6_2; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_3 = mem_6_3; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_0 = mem_7_0; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_1 = mem_7_1; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_2 = mem_7_2; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_3 = mem_7_3; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_widx = widx_gray; // @[src/main/scala/util/AsyncQueue.scala 92:17]
  assign io_async_safe_widx_valid = source_valid_1_io_out; // @[src/main/scala/util/AsyncQueue.scala 117:20]
  assign io_async_safe_source_reset_n = ~reset; // @[src/main/scala/util/AsyncQueue.scala 121:27]
  assign ridx_ridx_gray_clock = clock;
  assign ridx_ridx_gray_reset = reset;
  assign ridx_ridx_gray_io_d = io_async_ridx; // @[src/main/scala/util/ShiftReg.scala 47:16]
  assign source_valid_0_io_in = 1'h1; // @[src/main/scala/util/AsyncQueue.scala 115:26]
  assign source_valid_0_clock = clock; // @[src/main/scala/util/AsyncQueue.scala 110:26]
  assign source_valid_0_reset = reset | ~io_async_safe_sink_reset_n; // @[src/main/scala/util/AsyncQueue.scala 105:65]
  assign source_valid_1_io_in = source_valid_0_io_out; // @[src/main/scala/util/AsyncQueue.scala 116:26]
  assign source_valid_1_clock = clock; // @[src/main/scala/util/AsyncQueue.scala 111:26]
  assign source_valid_1_reset = reset | ~io_async_safe_sink_reset_n; // @[src/main/scala/util/AsyncQueue.scala 106:65]
  assign sink_extend_io_in = io_async_safe_ridx_valid; // @[src/main/scala/util/AsyncQueue.scala 118:23]
  assign sink_extend_clock = clock; // @[src/main/scala/util/AsyncQueue.scala 112:26]
  assign sink_extend_reset = reset | ~io_async_safe_sink_reset_n; // @[src/main/scala/util/AsyncQueue.scala 107:65]
  assign sink_valid_io_in = sink_extend_io_out; // @[src/main/scala/util/AsyncQueue.scala 119:22]
  assign sink_valid_clock = clock; // @[src/main/scala/util/AsyncQueue.scala 113:26]
  assign sink_valid_reset = reset; // @[src/main/scala/util/AsyncQueue.scala 108:35]
  always @(posedge clock) begin
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h0 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_0_0 <= io_enq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h0 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_0_1 <= io_enq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h0 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_0_2 <= io_enq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h0 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_0_3 <= io_enq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h1 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_1_0 <= io_enq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h1 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_1_1 <= io_enq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h1 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_1_2 <= io_enq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h1 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_1_3 <= io_enq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h2 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_2_0 <= io_enq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h2 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_2_1 <= io_enq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h2 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_2_2 <= io_enq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h2 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_2_3 <= io_enq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h3 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_3_0 <= io_enq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h3 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_3_1 <= io_enq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h3 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_3_2 <= io_enq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h3 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_3_3 <= io_enq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h4 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_4_0 <= io_enq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h4 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_4_1 <= io_enq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h4 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_4_2 <= io_enq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h4 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_4_3 <= io_enq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h5 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_5_0 <= io_enq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h5 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_5_1 <= io_enq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h5 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_5_2 <= io_enq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h5 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_5_3 <= io_enq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h6 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_6_0 <= io_enq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h6 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_6_1 <= io_enq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h6 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_6_2 <= io_enq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h6 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_6_3 <= io_enq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h7 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_7_0 <= io_enq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h7 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_7_1 <= io_enq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h7 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_7_2 <= io_enq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h7 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_7_3 <= io_enq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[src/main/scala/util/AsyncQueue.scala 53:23]
      widx_widx_bin <= 4'h0;
    end else if (_widx_T_2) begin
      widx_widx_bin <= 4'h0;
    end else begin
      widx_widx_bin <= _widx_incremented_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[src/main/scala/util/AsyncQueue.scala 83:26]
      ready_reg <= 1'h0;
    end else begin
      ready_reg <= sink_ready & widx != _ready_T;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[src/main/scala/util/AsyncQueue.scala 54:17]
      widx_gray <= 4'h0;
    end else begin
      widx_gray <= widx_incremented ^ _GEN_65;
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
  mem_0_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  mem_0_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  mem_0_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  mem_0_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  mem_1_0 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  mem_1_1 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  mem_1_2 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  mem_1_3 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  mem_2_0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  mem_2_1 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  mem_2_2 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  mem_2_3 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  mem_3_0 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  mem_3_1 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  mem_3_2 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  mem_3_3 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  mem_4_0 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  mem_4_1 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  mem_4_2 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  mem_4_3 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  mem_5_0 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  mem_5_1 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  mem_5_2 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  mem_5_3 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  mem_6_0 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  mem_6_1 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  mem_6_2 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  mem_6_3 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  mem_7_0 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  mem_7_1 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  mem_7_2 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  mem_7_3 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  widx_widx_bin = _RAND_32[3:0];
  _RAND_33 = {1{`RANDOM}};
  ready_reg = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  widx_gray = _RAND_34[3:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    widx_widx_bin = 4'h0;
  end
  if (reset) begin
    ready_reg = 1'h0;
  end
  if (reset) begin
    widx_gray = 4'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ClockCrossingReg_w128(
  input          clock,
  input  [127:0] io_d, // @[src/main/scala/util/SynchronizerReg.scala 195:14]
  output [127:0] io_q, // @[src/main/scala/util/SynchronizerReg.scala 195:14]
  input          io_en // @[src/main/scala/util/SynchronizerReg.scala 195:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [127:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [127:0] cdc_reg; // @[src/main/scala/util/SynchronizerReg.scala 201:76]
  assign io_q = cdc_reg; // @[src/main/scala/util/SynchronizerReg.scala 202:8]
  always @(posedge clock) begin
    if (io_en) begin // @[src/main/scala/util/SynchronizerReg.scala 201:76]
      cdc_reg <= io_d; // @[src/main/scala/util/SynchronizerReg.scala 201:76]
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
  _RAND_0 = {4{`RANDOM}};
  cdc_reg = _RAND_0[127:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AsyncQueueSink(
  input         clock,
  input         reset,
  input         io_deq_ready, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output        io_deq_valid, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [31:0] io_deq_bits_0, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [31:0] io_deq_bits_1, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [31:0] io_deq_bits_2, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [31:0] io_deq_bits_3, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_0_0, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_0_1, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_0_2, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_0_3, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_1_0, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_1_1, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_1_2, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_1_3, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_2_0, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_2_1, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_2_2, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_2_3, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_3_0, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_3_1, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_3_2, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_3_3, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_4_0, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_4_1, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_4_2, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_4_3, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_5_0, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_5_1, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_5_2, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_5_3, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_6_0, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_6_1, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_6_2, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_6_3, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_7_0, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_7_1, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_7_2, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [31:0] io_async_mem_7_3, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [3:0]  io_async_ridx, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [3:0]  io_async_widx, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output        io_async_safe_ridx_valid, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input         io_async_safe_widx_valid, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input         io_async_safe_source_reset_n, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output        io_async_safe_sink_reset_n // @[src/main/scala/util/AsyncQueue.scala 135:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  widx_widx_gray_clock; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  widx_widx_gray_reset; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire [3:0] widx_widx_gray_io_d; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire [3:0] widx_widx_gray_io_q; // @[src/main/scala/util/ShiftReg.scala 45:23]
  wire  io_deq_bits_deq_bits_reg_clock; // @[src/main/scala/util/SynchronizerReg.scala 207:25]
  wire [127:0] io_deq_bits_deq_bits_reg_io_d; // @[src/main/scala/util/SynchronizerReg.scala 207:25]
  wire [127:0] io_deq_bits_deq_bits_reg_io_q; // @[src/main/scala/util/SynchronizerReg.scala 207:25]
  wire  io_deq_bits_deq_bits_reg_io_en; // @[src/main/scala/util/SynchronizerReg.scala 207:25]
  wire  sink_valid_0_io_in; // @[src/main/scala/util/AsyncQueue.scala 168:33]
  wire  sink_valid_0_io_out; // @[src/main/scala/util/AsyncQueue.scala 168:33]
  wire  sink_valid_0_clock; // @[src/main/scala/util/AsyncQueue.scala 168:33]
  wire  sink_valid_0_reset; // @[src/main/scala/util/AsyncQueue.scala 168:33]
  wire  sink_valid_1_io_in; // @[src/main/scala/util/AsyncQueue.scala 169:33]
  wire  sink_valid_1_io_out; // @[src/main/scala/util/AsyncQueue.scala 169:33]
  wire  sink_valid_1_clock; // @[src/main/scala/util/AsyncQueue.scala 169:33]
  wire  sink_valid_1_reset; // @[src/main/scala/util/AsyncQueue.scala 169:33]
  wire  source_extend_io_in; // @[src/main/scala/util/AsyncQueue.scala 171:31]
  wire  source_extend_io_out; // @[src/main/scala/util/AsyncQueue.scala 171:31]
  wire  source_extend_clock; // @[src/main/scala/util/AsyncQueue.scala 171:31]
  wire  source_extend_reset; // @[src/main/scala/util/AsyncQueue.scala 171:31]
  wire  source_valid_io_in; // @[src/main/scala/util/AsyncQueue.scala 172:31]
  wire  source_valid_io_out; // @[src/main/scala/util/AsyncQueue.scala 172:31]
  wire  source_valid_clock; // @[src/main/scala/util/AsyncQueue.scala 172:31]
  wire  source_valid_reset; // @[src/main/scala/util/AsyncQueue.scala 172:31]
  wire  _ridx_T_1 = io_deq_ready & io_deq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  source_ready = source_valid_io_out; // @[src/main/scala/util/AsyncQueue.scala 143:30 188:18]
  wire  _ridx_T_2 = ~source_ready; // @[src/main/scala/util/AsyncQueue.scala 144:77]
  reg [3:0] ridx_ridx_bin; // @[src/main/scala/util/AsyncQueue.scala 52:25]
  wire [3:0] _GEN_32 = {{3'd0}, _ridx_T_1}; // @[src/main/scala/util/AsyncQueue.scala 53:43]
  wire [3:0] _ridx_incremented_T_1 = ridx_ridx_bin + _GEN_32; // @[src/main/scala/util/AsyncQueue.scala 53:43]
  wire [3:0] ridx_incremented = _ridx_T_2 ? 4'h0 : _ridx_incremented_T_1; // @[src/main/scala/util/AsyncQueue.scala 53:23]
  wire [3:0] _GEN_33 = {{1'd0}, ridx_incremented[3:1]}; // @[src/main/scala/util/AsyncQueue.scala 54:17]
  wire [3:0] ridx = ridx_incremented ^ _GEN_33; // @[src/main/scala/util/AsyncQueue.scala 54:17]
  wire [3:0] widx = widx_widx_gray_io_q; // @[src/main/scala/util/ShiftReg.scala 48:{24,24}]
  wire [2:0] _index_T_2 = {ridx[3], 2'h0}; // @[src/main/scala/util/AsyncQueue.scala 152:75]
  wire [2:0] index = ridx[2:0] ^ _index_T_2; // @[src/main/scala/util/AsyncQueue.scala 152:55]
  wire [31:0] _GEN_1 = 3'h1 == index ? io_async_mem_1_1 : io_async_mem_0_1; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_2 = 3'h2 == index ? io_async_mem_2_1 : _GEN_1; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_3 = 3'h3 == index ? io_async_mem_3_1 : _GEN_2; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_4 = 3'h4 == index ? io_async_mem_4_1 : _GEN_3; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_5 = 3'h5 == index ? io_async_mem_5_1 : _GEN_4; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_6 = 3'h6 == index ? io_async_mem_6_1 : _GEN_5; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_7 = 3'h7 == index ? io_async_mem_7_1 : _GEN_6; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_9 = 3'h1 == index ? io_async_mem_1_0 : io_async_mem_0_0; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_10 = 3'h2 == index ? io_async_mem_2_0 : _GEN_9; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_11 = 3'h3 == index ? io_async_mem_3_0 : _GEN_10; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_12 = 3'h4 == index ? io_async_mem_4_0 : _GEN_11; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_13 = 3'h5 == index ? io_async_mem_5_0 : _GEN_12; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_14 = 3'h6 == index ? io_async_mem_6_0 : _GEN_13; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_15 = 3'h7 == index ? io_async_mem_7_0 : _GEN_14; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [63:0] io_deq_bits_deq_bits_reg_io_d_lo = {_GEN_7,_GEN_15}; // @[src/main/scala/util/SynchronizerReg.scala 209:24]
  wire [31:0] _GEN_17 = 3'h1 == index ? io_async_mem_1_3 : io_async_mem_0_3; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_18 = 3'h2 == index ? io_async_mem_2_3 : _GEN_17; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_19 = 3'h3 == index ? io_async_mem_3_3 : _GEN_18; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_20 = 3'h4 == index ? io_async_mem_4_3 : _GEN_19; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_21 = 3'h5 == index ? io_async_mem_5_3 : _GEN_20; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_22 = 3'h6 == index ? io_async_mem_6_3 : _GEN_21; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_23 = 3'h7 == index ? io_async_mem_7_3 : _GEN_22; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_25 = 3'h1 == index ? io_async_mem_1_2 : io_async_mem_0_2; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_26 = 3'h2 == index ? io_async_mem_2_2 : _GEN_25; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_27 = 3'h3 == index ? io_async_mem_3_2 : _GEN_26; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_28 = 3'h4 == index ? io_async_mem_4_2 : _GEN_27; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_29 = 3'h5 == index ? io_async_mem_5_2 : _GEN_28; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_30 = 3'h6 == index ? io_async_mem_6_2 : _GEN_29; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [31:0] _GEN_31 = 3'h7 == index ? io_async_mem_7_2 : _GEN_30; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [63:0] io_deq_bits_deq_bits_reg_io_d_hi = {_GEN_23,_GEN_31}; // @[src/main/scala/util/SynchronizerReg.scala 209:24]
  wire [127:0] _io_deq_bits_WIRE_1 = io_deq_bits_deq_bits_reg_io_q; // @[src/main/scala/util/SynchronizerReg.scala 211:{26,26}]
  reg  valid_reg; // @[src/main/scala/util/AsyncQueue.scala 161:56]
  reg [3:0] ridx_gray; // @[src/main/scala/util/AsyncQueue.scala 164:55]
  AsyncResetSynchronizerShiftReg_w4_d3_i0 widx_widx_gray ( // @[src/main/scala/util/ShiftReg.scala 45:23]
    .clock(widx_widx_gray_clock),
    .reset(widx_widx_gray_reset),
    .io_d(widx_widx_gray_io_d),
    .io_q(widx_widx_gray_io_q)
  );
  ClockCrossingReg_w128 io_deq_bits_deq_bits_reg ( // @[src/main/scala/util/SynchronizerReg.scala 207:25]
    .clock(io_deq_bits_deq_bits_reg_clock),
    .io_d(io_deq_bits_deq_bits_reg_io_d),
    .io_q(io_deq_bits_deq_bits_reg_io_q),
    .io_en(io_deq_bits_deq_bits_reg_io_en)
  );
  AsyncValidSync sink_valid_0 ( // @[src/main/scala/util/AsyncQueue.scala 168:33]
    .io_in(sink_valid_0_io_in),
    .io_out(sink_valid_0_io_out),
    .clock(sink_valid_0_clock),
    .reset(sink_valid_0_reset)
  );
  AsyncValidSync sink_valid_1 ( // @[src/main/scala/util/AsyncQueue.scala 169:33]
    .io_in(sink_valid_1_io_in),
    .io_out(sink_valid_1_io_out),
    .clock(sink_valid_1_clock),
    .reset(sink_valid_1_reset)
  );
  AsyncValidSync source_extend ( // @[src/main/scala/util/AsyncQueue.scala 171:31]
    .io_in(source_extend_io_in),
    .io_out(source_extend_io_out),
    .clock(source_extend_clock),
    .reset(source_extend_reset)
  );
  AsyncValidSync source_valid ( // @[src/main/scala/util/AsyncQueue.scala 172:31]
    .io_in(source_valid_io_in),
    .io_out(source_valid_io_out),
    .clock(source_valid_clock),
    .reset(source_valid_reset)
  );
  assign io_deq_valid = valid_reg & source_ready; // @[src/main/scala/util/AsyncQueue.scala 162:29]
  assign io_deq_bits_0 = _io_deq_bits_WIRE_1[31:0]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_deq_bits_1 = _io_deq_bits_WIRE_1[63:32]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_deq_bits_2 = _io_deq_bits_WIRE_1[95:64]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_deq_bits_3 = _io_deq_bits_WIRE_1[127:96]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_async_ridx = ridx_gray; // @[src/main/scala/util/AsyncQueue.scala 165:17]
  assign io_async_safe_ridx_valid = sink_valid_1_io_out; // @[src/main/scala/util/AsyncQueue.scala 185:20]
  assign io_async_safe_sink_reset_n = ~reset; // @[src/main/scala/util/AsyncQueue.scala 189:25]
  assign widx_widx_gray_clock = clock;
  assign widx_widx_gray_reset = reset;
  assign widx_widx_gray_io_d = io_async_widx; // @[src/main/scala/util/ShiftReg.scala 47:16]
  assign io_deq_bits_deq_bits_reg_clock = clock;
  assign io_deq_bits_deq_bits_reg_io_d = {io_deq_bits_deq_bits_reg_io_d_hi,io_deq_bits_deq_bits_reg_io_d_lo}; // @[src/main/scala/util/SynchronizerReg.scala 209:24]
  assign io_deq_bits_deq_bits_reg_io_en = source_ready & ridx != widx; // @[src/main/scala/util/AsyncQueue.scala 146:28]
  assign sink_valid_0_io_in = 1'h1; // @[src/main/scala/util/AsyncQueue.scala 183:24]
  assign sink_valid_0_clock = clock; // @[src/main/scala/util/AsyncQueue.scala 178:25]
  assign sink_valid_0_reset = reset | ~io_async_safe_source_reset_n; // @[src/main/scala/util/AsyncQueue.scala 173:66]
  assign sink_valid_1_io_in = sink_valid_0_io_out; // @[src/main/scala/util/AsyncQueue.scala 184:24]
  assign sink_valid_1_clock = clock; // @[src/main/scala/util/AsyncQueue.scala 179:25]
  assign sink_valid_1_reset = reset | ~io_async_safe_source_reset_n; // @[src/main/scala/util/AsyncQueue.scala 174:66]
  assign source_extend_io_in = io_async_safe_widx_valid; // @[src/main/scala/util/AsyncQueue.scala 186:25]
  assign source_extend_clock = clock; // @[src/main/scala/util/AsyncQueue.scala 180:25]
  assign source_extend_reset = reset | ~io_async_safe_source_reset_n; // @[src/main/scala/util/AsyncQueue.scala 175:66]
  assign source_valid_io_in = source_extend_io_out; // @[src/main/scala/util/AsyncQueue.scala 187:24]
  assign source_valid_clock = clock; // @[src/main/scala/util/AsyncQueue.scala 181:25]
  assign source_valid_reset = reset; // @[src/main/scala/util/AsyncQueue.scala 176:34]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[src/main/scala/util/AsyncQueue.scala 53:23]
      ridx_ridx_bin <= 4'h0;
    end else if (_ridx_T_2) begin
      ridx_ridx_bin <= 4'h0;
    end else begin
      ridx_ridx_bin <= _ridx_incremented_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[src/main/scala/util/AsyncQueue.scala 146:28]
      valid_reg <= 1'h0;
    end else begin
      valid_reg <= source_ready & ridx != widx;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[src/main/scala/util/AsyncQueue.scala 54:17]
      ridx_gray <= 4'h0;
    end else begin
      ridx_gray <= ridx_incremented ^ _GEN_33;
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
  ridx_ridx_bin = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  valid_reg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ridx_gray = _RAND_2[3:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    ridx_ridx_bin = 4'h0;
  end
  if (reset) begin
    valid_reg = 1'h0;
  end
  if (reset) begin
    ridx_gray = 4'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AsyncQueue(
  input         io_enq_clock, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input         io_enq_reset, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output        io_enq_ready, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input         io_enq_valid, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [31:0] io_enq_bits_0, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [31:0] io_enq_bits_1, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [31:0] io_enq_bits_2, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [31:0] io_enq_bits_3, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input         io_deq_clock, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input         io_deq_reset, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input         io_deq_ready, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output        io_deq_valid, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [31:0] io_deq_bits_0, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [31:0] io_deq_bits_1, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [31:0] io_deq_bits_2, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [31:0] io_deq_bits_3 // @[src/main/scala/util/AsyncQueue.scala 223:14]
);
  wire  source_clock; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_reset; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_io_enq_ready; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_io_enq_valid; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_enq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_enq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_enq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_enq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_0_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_0_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_0_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_0_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_1_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_1_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_1_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_1_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_2_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_2_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_2_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_2_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_3_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_3_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_3_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_3_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_4_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_4_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_4_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_4_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_5_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_5_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_5_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_5_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_6_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_6_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_6_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_6_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_7_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_7_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_7_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_7_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [3:0] source_io_async_ridx; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [3:0] source_io_async_widx; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_io_async_safe_ridx_valid; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_io_async_safe_widx_valid; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_io_async_safe_source_reset_n; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_io_async_safe_sink_reset_n; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  sink_clock; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire  sink_reset; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire  sink_io_deq_ready; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire  sink_io_deq_valid; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_deq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_deq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_deq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_deq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_0_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_0_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_0_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_0_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_1_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_1_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_1_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_1_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_2_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_2_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_2_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_2_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_3_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_3_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_3_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_3_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_4_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_4_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_4_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_4_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_5_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_5_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_5_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_5_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_6_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_6_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_6_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_6_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_7_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_7_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_7_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_7_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [3:0] sink_io_async_ridx; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [3:0] sink_io_async_widx; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire  sink_io_async_safe_ridx_valid; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire  sink_io_async_safe_widx_valid; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire  sink_io_async_safe_source_reset_n; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire  sink_io_async_safe_sink_reset_n; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  AsyncQueueSource source ( // @[src/main/scala/util/AsyncQueue.scala 224:70]
    .clock(source_clock),
    .reset(source_reset),
    .io_enq_ready(source_io_enq_ready),
    .io_enq_valid(source_io_enq_valid),
    .io_enq_bits_0(source_io_enq_bits_0),
    .io_enq_bits_1(source_io_enq_bits_1),
    .io_enq_bits_2(source_io_enq_bits_2),
    .io_enq_bits_3(source_io_enq_bits_3),
    .io_async_mem_0_0(source_io_async_mem_0_0),
    .io_async_mem_0_1(source_io_async_mem_0_1),
    .io_async_mem_0_2(source_io_async_mem_0_2),
    .io_async_mem_0_3(source_io_async_mem_0_3),
    .io_async_mem_1_0(source_io_async_mem_1_0),
    .io_async_mem_1_1(source_io_async_mem_1_1),
    .io_async_mem_1_2(source_io_async_mem_1_2),
    .io_async_mem_1_3(source_io_async_mem_1_3),
    .io_async_mem_2_0(source_io_async_mem_2_0),
    .io_async_mem_2_1(source_io_async_mem_2_1),
    .io_async_mem_2_2(source_io_async_mem_2_2),
    .io_async_mem_2_3(source_io_async_mem_2_3),
    .io_async_mem_3_0(source_io_async_mem_3_0),
    .io_async_mem_3_1(source_io_async_mem_3_1),
    .io_async_mem_3_2(source_io_async_mem_3_2),
    .io_async_mem_3_3(source_io_async_mem_3_3),
    .io_async_mem_4_0(source_io_async_mem_4_0),
    .io_async_mem_4_1(source_io_async_mem_4_1),
    .io_async_mem_4_2(source_io_async_mem_4_2),
    .io_async_mem_4_3(source_io_async_mem_4_3),
    .io_async_mem_5_0(source_io_async_mem_5_0),
    .io_async_mem_5_1(source_io_async_mem_5_1),
    .io_async_mem_5_2(source_io_async_mem_5_2),
    .io_async_mem_5_3(source_io_async_mem_5_3),
    .io_async_mem_6_0(source_io_async_mem_6_0),
    .io_async_mem_6_1(source_io_async_mem_6_1),
    .io_async_mem_6_2(source_io_async_mem_6_2),
    .io_async_mem_6_3(source_io_async_mem_6_3),
    .io_async_mem_7_0(source_io_async_mem_7_0),
    .io_async_mem_7_1(source_io_async_mem_7_1),
    .io_async_mem_7_2(source_io_async_mem_7_2),
    .io_async_mem_7_3(source_io_async_mem_7_3),
    .io_async_ridx(source_io_async_ridx),
    .io_async_widx(source_io_async_widx),
    .io_async_safe_ridx_valid(source_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(source_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(source_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(source_io_async_safe_sink_reset_n)
  );
  AsyncQueueSink sink ( // @[src/main/scala/util/AsyncQueue.scala 225:70]
    .clock(sink_clock),
    .reset(sink_reset),
    .io_deq_ready(sink_io_deq_ready),
    .io_deq_valid(sink_io_deq_valid),
    .io_deq_bits_0(sink_io_deq_bits_0),
    .io_deq_bits_1(sink_io_deq_bits_1),
    .io_deq_bits_2(sink_io_deq_bits_2),
    .io_deq_bits_3(sink_io_deq_bits_3),
    .io_async_mem_0_0(sink_io_async_mem_0_0),
    .io_async_mem_0_1(sink_io_async_mem_0_1),
    .io_async_mem_0_2(sink_io_async_mem_0_2),
    .io_async_mem_0_3(sink_io_async_mem_0_3),
    .io_async_mem_1_0(sink_io_async_mem_1_0),
    .io_async_mem_1_1(sink_io_async_mem_1_1),
    .io_async_mem_1_2(sink_io_async_mem_1_2),
    .io_async_mem_1_3(sink_io_async_mem_1_3),
    .io_async_mem_2_0(sink_io_async_mem_2_0),
    .io_async_mem_2_1(sink_io_async_mem_2_1),
    .io_async_mem_2_2(sink_io_async_mem_2_2),
    .io_async_mem_2_3(sink_io_async_mem_2_3),
    .io_async_mem_3_0(sink_io_async_mem_3_0),
    .io_async_mem_3_1(sink_io_async_mem_3_1),
    .io_async_mem_3_2(sink_io_async_mem_3_2),
    .io_async_mem_3_3(sink_io_async_mem_3_3),
    .io_async_mem_4_0(sink_io_async_mem_4_0),
    .io_async_mem_4_1(sink_io_async_mem_4_1),
    .io_async_mem_4_2(sink_io_async_mem_4_2),
    .io_async_mem_4_3(sink_io_async_mem_4_3),
    .io_async_mem_5_0(sink_io_async_mem_5_0),
    .io_async_mem_5_1(sink_io_async_mem_5_1),
    .io_async_mem_5_2(sink_io_async_mem_5_2),
    .io_async_mem_5_3(sink_io_async_mem_5_3),
    .io_async_mem_6_0(sink_io_async_mem_6_0),
    .io_async_mem_6_1(sink_io_async_mem_6_1),
    .io_async_mem_6_2(sink_io_async_mem_6_2),
    .io_async_mem_6_3(sink_io_async_mem_6_3),
    .io_async_mem_7_0(sink_io_async_mem_7_0),
    .io_async_mem_7_1(sink_io_async_mem_7_1),
    .io_async_mem_7_2(sink_io_async_mem_7_2),
    .io_async_mem_7_3(sink_io_async_mem_7_3),
    .io_async_ridx(sink_io_async_ridx),
    .io_async_widx(sink_io_async_widx),
    .io_async_safe_ridx_valid(sink_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(sink_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(sink_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(sink_io_async_safe_sink_reset_n)
  );
  assign io_enq_ready = source_io_enq_ready; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign io_deq_valid = sink_io_deq_valid; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_0 = sink_io_deq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_1 = sink_io_deq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_2 = sink_io_deq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_3 = sink_io_deq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign source_clock = io_enq_clock;
  assign source_reset = io_enq_reset;
  assign source_io_enq_valid = io_enq_valid; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_0 = io_enq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_1 = io_enq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_2 = io_enq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_3 = io_enq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_async_ridx = sink_io_async_ridx; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign source_io_async_safe_ridx_valid = sink_io_async_safe_ridx_valid; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign source_io_async_safe_sink_reset_n = sink_io_async_safe_sink_reset_n; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_clock = io_deq_clock;
  assign sink_reset = io_deq_reset;
  assign sink_io_deq_ready = io_deq_ready; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign sink_io_async_mem_0_0 = source_io_async_mem_0_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_1 = source_io_async_mem_0_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_2 = source_io_async_mem_0_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_3 = source_io_async_mem_0_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_0 = source_io_async_mem_1_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_1 = source_io_async_mem_1_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_2 = source_io_async_mem_1_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_3 = source_io_async_mem_1_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_0 = source_io_async_mem_2_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_1 = source_io_async_mem_2_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_2 = source_io_async_mem_2_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_3 = source_io_async_mem_2_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_0 = source_io_async_mem_3_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_1 = source_io_async_mem_3_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_2 = source_io_async_mem_3_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_3 = source_io_async_mem_3_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_0 = source_io_async_mem_4_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_1 = source_io_async_mem_4_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_2 = source_io_async_mem_4_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_3 = source_io_async_mem_4_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_0 = source_io_async_mem_5_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_1 = source_io_async_mem_5_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_2 = source_io_async_mem_5_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_3 = source_io_async_mem_5_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_0 = source_io_async_mem_6_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_1 = source_io_async_mem_6_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_2 = source_io_async_mem_6_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_3 = source_io_async_mem_6_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_0 = source_io_async_mem_7_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_1 = source_io_async_mem_7_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_2 = source_io_async_mem_7_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_3 = source_io_async_mem_7_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_widx = source_io_async_widx; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_safe_widx_valid = source_io_async_safe_widx_valid; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_safe_source_reset_n = source_io_async_safe_source_reset_n; // @[src/main/scala/util/AsyncQueue.scala 229:17]
endmodule
module AsyncQueue_1(
  input         io_enq_clock, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input         io_enq_reset, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output        io_enq_ready, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input         io_enq_valid, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [31:0] io_enq_bits_0, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [31:0] io_enq_bits_1, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [31:0] io_enq_bits_2, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [31:0] io_enq_bits_3, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input         io_deq_clock, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input         io_deq_reset, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output        io_deq_valid, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [31:0] io_deq_bits_0, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [31:0] io_deq_bits_1, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [31:0] io_deq_bits_2, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [31:0] io_deq_bits_3 // @[src/main/scala/util/AsyncQueue.scala 223:14]
);
  wire  source_clock; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_reset; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_io_enq_ready; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_io_enq_valid; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_enq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_enq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_enq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_enq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_0_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_0_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_0_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_0_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_1_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_1_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_1_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_1_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_2_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_2_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_2_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_2_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_3_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_3_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_3_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_3_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_4_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_4_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_4_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_4_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_5_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_5_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_5_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_5_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_6_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_6_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_6_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_6_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_7_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_7_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_7_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [31:0] source_io_async_mem_7_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [3:0] source_io_async_ridx; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [3:0] source_io_async_widx; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_io_async_safe_ridx_valid; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_io_async_safe_widx_valid; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_io_async_safe_source_reset_n; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_io_async_safe_sink_reset_n; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  sink_clock; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire  sink_reset; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire  sink_io_deq_ready; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire  sink_io_deq_valid; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_deq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_deq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_deq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_deq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_0_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_0_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_0_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_0_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_1_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_1_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_1_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_1_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_2_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_2_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_2_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_2_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_3_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_3_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_3_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_3_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_4_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_4_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_4_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_4_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_5_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_5_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_5_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_5_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_6_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_6_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_6_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_6_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_7_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_7_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_7_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [31:0] sink_io_async_mem_7_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [3:0] sink_io_async_ridx; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [3:0] sink_io_async_widx; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire  sink_io_async_safe_ridx_valid; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire  sink_io_async_safe_widx_valid; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire  sink_io_async_safe_source_reset_n; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire  sink_io_async_safe_sink_reset_n; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  AsyncQueueSource source ( // @[src/main/scala/util/AsyncQueue.scala 224:70]
    .clock(source_clock),
    .reset(source_reset),
    .io_enq_ready(source_io_enq_ready),
    .io_enq_valid(source_io_enq_valid),
    .io_enq_bits_0(source_io_enq_bits_0),
    .io_enq_bits_1(source_io_enq_bits_1),
    .io_enq_bits_2(source_io_enq_bits_2),
    .io_enq_bits_3(source_io_enq_bits_3),
    .io_async_mem_0_0(source_io_async_mem_0_0),
    .io_async_mem_0_1(source_io_async_mem_0_1),
    .io_async_mem_0_2(source_io_async_mem_0_2),
    .io_async_mem_0_3(source_io_async_mem_0_3),
    .io_async_mem_1_0(source_io_async_mem_1_0),
    .io_async_mem_1_1(source_io_async_mem_1_1),
    .io_async_mem_1_2(source_io_async_mem_1_2),
    .io_async_mem_1_3(source_io_async_mem_1_3),
    .io_async_mem_2_0(source_io_async_mem_2_0),
    .io_async_mem_2_1(source_io_async_mem_2_1),
    .io_async_mem_2_2(source_io_async_mem_2_2),
    .io_async_mem_2_3(source_io_async_mem_2_3),
    .io_async_mem_3_0(source_io_async_mem_3_0),
    .io_async_mem_3_1(source_io_async_mem_3_1),
    .io_async_mem_3_2(source_io_async_mem_3_2),
    .io_async_mem_3_3(source_io_async_mem_3_3),
    .io_async_mem_4_0(source_io_async_mem_4_0),
    .io_async_mem_4_1(source_io_async_mem_4_1),
    .io_async_mem_4_2(source_io_async_mem_4_2),
    .io_async_mem_4_3(source_io_async_mem_4_3),
    .io_async_mem_5_0(source_io_async_mem_5_0),
    .io_async_mem_5_1(source_io_async_mem_5_1),
    .io_async_mem_5_2(source_io_async_mem_5_2),
    .io_async_mem_5_3(source_io_async_mem_5_3),
    .io_async_mem_6_0(source_io_async_mem_6_0),
    .io_async_mem_6_1(source_io_async_mem_6_1),
    .io_async_mem_6_2(source_io_async_mem_6_2),
    .io_async_mem_6_3(source_io_async_mem_6_3),
    .io_async_mem_7_0(source_io_async_mem_7_0),
    .io_async_mem_7_1(source_io_async_mem_7_1),
    .io_async_mem_7_2(source_io_async_mem_7_2),
    .io_async_mem_7_3(source_io_async_mem_7_3),
    .io_async_ridx(source_io_async_ridx),
    .io_async_widx(source_io_async_widx),
    .io_async_safe_ridx_valid(source_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(source_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(source_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(source_io_async_safe_sink_reset_n)
  );
  AsyncQueueSink sink ( // @[src/main/scala/util/AsyncQueue.scala 225:70]
    .clock(sink_clock),
    .reset(sink_reset),
    .io_deq_ready(sink_io_deq_ready),
    .io_deq_valid(sink_io_deq_valid),
    .io_deq_bits_0(sink_io_deq_bits_0),
    .io_deq_bits_1(sink_io_deq_bits_1),
    .io_deq_bits_2(sink_io_deq_bits_2),
    .io_deq_bits_3(sink_io_deq_bits_3),
    .io_async_mem_0_0(sink_io_async_mem_0_0),
    .io_async_mem_0_1(sink_io_async_mem_0_1),
    .io_async_mem_0_2(sink_io_async_mem_0_2),
    .io_async_mem_0_3(sink_io_async_mem_0_3),
    .io_async_mem_1_0(sink_io_async_mem_1_0),
    .io_async_mem_1_1(sink_io_async_mem_1_1),
    .io_async_mem_1_2(sink_io_async_mem_1_2),
    .io_async_mem_1_3(sink_io_async_mem_1_3),
    .io_async_mem_2_0(sink_io_async_mem_2_0),
    .io_async_mem_2_1(sink_io_async_mem_2_1),
    .io_async_mem_2_2(sink_io_async_mem_2_2),
    .io_async_mem_2_3(sink_io_async_mem_2_3),
    .io_async_mem_3_0(sink_io_async_mem_3_0),
    .io_async_mem_3_1(sink_io_async_mem_3_1),
    .io_async_mem_3_2(sink_io_async_mem_3_2),
    .io_async_mem_3_3(sink_io_async_mem_3_3),
    .io_async_mem_4_0(sink_io_async_mem_4_0),
    .io_async_mem_4_1(sink_io_async_mem_4_1),
    .io_async_mem_4_2(sink_io_async_mem_4_2),
    .io_async_mem_4_3(sink_io_async_mem_4_3),
    .io_async_mem_5_0(sink_io_async_mem_5_0),
    .io_async_mem_5_1(sink_io_async_mem_5_1),
    .io_async_mem_5_2(sink_io_async_mem_5_2),
    .io_async_mem_5_3(sink_io_async_mem_5_3),
    .io_async_mem_6_0(sink_io_async_mem_6_0),
    .io_async_mem_6_1(sink_io_async_mem_6_1),
    .io_async_mem_6_2(sink_io_async_mem_6_2),
    .io_async_mem_6_3(sink_io_async_mem_6_3),
    .io_async_mem_7_0(sink_io_async_mem_7_0),
    .io_async_mem_7_1(sink_io_async_mem_7_1),
    .io_async_mem_7_2(sink_io_async_mem_7_2),
    .io_async_mem_7_3(sink_io_async_mem_7_3),
    .io_async_ridx(sink_io_async_ridx),
    .io_async_widx(sink_io_async_widx),
    .io_async_safe_ridx_valid(sink_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(sink_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(sink_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(sink_io_async_safe_sink_reset_n)
  );
  assign io_enq_ready = source_io_enq_ready; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign io_deq_valid = sink_io_deq_valid; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_0 = sink_io_deq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_1 = sink_io_deq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_2 = sink_io_deq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_3 = sink_io_deq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign source_clock = io_enq_clock;
  assign source_reset = io_enq_reset;
  assign source_io_enq_valid = io_enq_valid; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_0 = io_enq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_1 = io_enq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_2 = io_enq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_3 = io_enq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_async_ridx = sink_io_async_ridx; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign source_io_async_safe_ridx_valid = sink_io_async_safe_ridx_valid; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign source_io_async_safe_sink_reset_n = sink_io_async_safe_sink_reset_n; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_clock = io_deq_clock;
  assign sink_reset = io_deq_reset;
  assign sink_io_deq_ready = 1'h1; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign sink_io_async_mem_0_0 = source_io_async_mem_0_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_1 = source_io_async_mem_0_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_2 = source_io_async_mem_0_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_3 = source_io_async_mem_0_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_0 = source_io_async_mem_1_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_1 = source_io_async_mem_1_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_2 = source_io_async_mem_1_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_3 = source_io_async_mem_1_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_0 = source_io_async_mem_2_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_1 = source_io_async_mem_2_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_2 = source_io_async_mem_2_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_3 = source_io_async_mem_2_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_0 = source_io_async_mem_3_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_1 = source_io_async_mem_3_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_2 = source_io_async_mem_3_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_3 = source_io_async_mem_3_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_0 = source_io_async_mem_4_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_1 = source_io_async_mem_4_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_2 = source_io_async_mem_4_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_3 = source_io_async_mem_4_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_0 = source_io_async_mem_5_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_1 = source_io_async_mem_5_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_2 = source_io_async_mem_5_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_3 = source_io_async_mem_5_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_0 = source_io_async_mem_6_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_1 = source_io_async_mem_6_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_2 = source_io_async_mem_6_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_3 = source_io_async_mem_6_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_0 = source_io_async_mem_7_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_1 = source_io_async_mem_7_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_2 = source_io_async_mem_7_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_3 = source_io_async_mem_7_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_widx = source_io_async_widx; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_safe_widx_valid = source_io_async_safe_widx_valid; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_safe_source_reset_n = source_io_async_safe_source_reset_n; // @[src/main/scala/util/AsyncQueue.scala 229:17]
endmodule
module Lanes(
  input          clock,
  input          reset,
  input          io_mainbandIo_fifoParams_clk, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input          io_mainbandIo_fifoParams_reset, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input          io_mainbandIo_txData_ready, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output         io_mainbandIo_txData_valid, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [31:0]  io_mainbandIo_txData_bits_0, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [31:0]  io_mainbandIo_txData_bits_1, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [31:0]  io_mainbandIo_txData_bits_2, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [31:0]  io_mainbandIo_txData_bits_3, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output         io_mainbandIo_rxData_ready, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input          io_mainbandIo_rxData_valid, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [31:0]  io_mainbandIo_rxData_bits_0, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [31:0]  io_mainbandIo_rxData_bits_1, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [31:0]  io_mainbandIo_rxData_bits_2, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [31:0]  io_mainbandIo_rxData_bits_3, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output         io_mainbandLaneIO_txData_ready, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input          io_mainbandLaneIO_txData_valid, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [127:0] io_mainbandLaneIO_txData_bits, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output         io_mainbandLaneIO_rxData_valid, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [127:0] io_mainbandLaneIO_rxData_bits // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
);
  wire  txMBFifo_io_enq_clock; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire  txMBFifo_io_enq_reset; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire  txMBFifo_io_enq_ready; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire  txMBFifo_io_enq_valid; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [31:0] txMBFifo_io_enq_bits_0; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [31:0] txMBFifo_io_enq_bits_1; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [31:0] txMBFifo_io_enq_bits_2; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [31:0] txMBFifo_io_enq_bits_3; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire  txMBFifo_io_deq_clock; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire  txMBFifo_io_deq_reset; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire  txMBFifo_io_deq_ready; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire  txMBFifo_io_deq_valid; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [31:0] txMBFifo_io_deq_bits_0; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [31:0] txMBFifo_io_deq_bits_1; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [31:0] txMBFifo_io_deq_bits_2; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [31:0] txMBFifo_io_deq_bits_3; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire  rxMBFifo_io_enq_clock; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire  rxMBFifo_io_enq_reset; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire  rxMBFifo_io_enq_ready; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire  rxMBFifo_io_enq_valid; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [31:0] rxMBFifo_io_enq_bits_0; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [31:0] rxMBFifo_io_enq_bits_1; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [31:0] rxMBFifo_io_enq_bits_2; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [31:0] rxMBFifo_io_enq_bits_3; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire  rxMBFifo_io_deq_clock; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire  rxMBFifo_io_deq_reset; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire  rxMBFifo_io_deq_valid; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [31:0] rxMBFifo_io_deq_bits_0; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [31:0] rxMBFifo_io_deq_bits_1; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [31:0] rxMBFifo_io_deq_bits_2; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [31:0] rxMBFifo_io_deq_bits_3; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [7:0] txDataVec_3_0 = io_mainbandLaneIO_txData_bits[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_0_3 = rxMBFifo_io_deq_bits_0[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_3_1 = io_mainbandLaneIO_txData_bits[39:32]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_1_3 = rxMBFifo_io_deq_bits_0[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_3_2 = io_mainbandLaneIO_txData_bits[71:64]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_2_3 = rxMBFifo_io_deq_bits_0[23:16]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_3_3 = io_mainbandLaneIO_txData_bits[103:96]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_3_3 = rxMBFifo_io_deq_bits_0[31:24]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_0_1 = io_mainbandLaneIO_txData_bits[63:56]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_0_0 = io_mainbandLaneIO_txData_bits[31:24]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [15:0] txMBFifo_io_enq_bits_0_lo = {txDataVec_0_1,txDataVec_0_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  wire [7:0] txDataVec_0_3 = io_mainbandLaneIO_txData_bits[127:120]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_0_2 = io_mainbandLaneIO_txData_bits[95:88]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [15:0] txMBFifo_io_enq_bits_0_hi = {txDataVec_0_3,txDataVec_0_2}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  wire [7:0] txDataVec_2_0 = io_mainbandLaneIO_txData_bits[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_0_2 = rxMBFifo_io_deq_bits_1[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_2_1 = io_mainbandLaneIO_txData_bits[47:40]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_1_2 = rxMBFifo_io_deq_bits_1[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_2_2 = io_mainbandLaneIO_txData_bits[79:72]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_2_2 = rxMBFifo_io_deq_bits_1[23:16]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_2_3 = io_mainbandLaneIO_txData_bits[111:104]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_3_2 = rxMBFifo_io_deq_bits_1[31:24]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_1_1 = io_mainbandLaneIO_txData_bits[55:48]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_1_0 = io_mainbandLaneIO_txData_bits[23:16]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [15:0] txMBFifo_io_enq_bits_1_lo = {txDataVec_1_1,txDataVec_1_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  wire [7:0] txDataVec_1_3 = io_mainbandLaneIO_txData_bits[119:112]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_1_2 = io_mainbandLaneIO_txData_bits[87:80]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [15:0] txMBFifo_io_enq_bits_1_hi = {txDataVec_1_3,txDataVec_1_2}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  wire [7:0] rxDataVec_0_1 = rxMBFifo_io_deq_bits_2[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_1_1 = rxMBFifo_io_deq_bits_2[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_2_1 = rxMBFifo_io_deq_bits_2[23:16]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_3_1 = rxMBFifo_io_deq_bits_2[31:24]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [15:0] txMBFifo_io_enq_bits_2_lo = {txDataVec_2_1,txDataVec_2_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  wire [15:0] txMBFifo_io_enq_bits_2_hi = {txDataVec_2_3,txDataVec_2_2}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  wire [7:0] rxDataVec_0_0 = rxMBFifo_io_deq_bits_3[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_1_0 = rxMBFifo_io_deq_bits_3[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_2_0 = rxMBFifo_io_deq_bits_3[23:16]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_3_0 = rxMBFifo_io_deq_bits_3[31:24]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [15:0] txMBFifo_io_enq_bits_3_lo = {txDataVec_3_1,txDataVec_3_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  wire [15:0] txMBFifo_io_enq_bits_3_hi = {txDataVec_3_3,txDataVec_3_2}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  wire [63:0] io_mainbandLaneIO_rxData_bits_lo = {rxDataVec_1_3,rxDataVec_1_2,rxDataVec_1_1,rxDataVec_1_0,rxDataVec_0_3,
    rxDataVec_0_2,rxDataVec_0_1,rxDataVec_0_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 70:46]
  wire [63:0] io_mainbandLaneIO_rxData_bits_hi = {rxDataVec_3_3,rxDataVec_3_2,rxDataVec_3_1,rxDataVec_3_0,rxDataVec_2_3,
    rxDataVec_2_2,rxDataVec_2_1,rxDataVec_2_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 70:46]
  AsyncQueue txMBFifo ( // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
    .io_enq_clock(txMBFifo_io_enq_clock),
    .io_enq_reset(txMBFifo_io_enq_reset),
    .io_enq_ready(txMBFifo_io_enq_ready),
    .io_enq_valid(txMBFifo_io_enq_valid),
    .io_enq_bits_0(txMBFifo_io_enq_bits_0),
    .io_enq_bits_1(txMBFifo_io_enq_bits_1),
    .io_enq_bits_2(txMBFifo_io_enq_bits_2),
    .io_enq_bits_3(txMBFifo_io_enq_bits_3),
    .io_deq_clock(txMBFifo_io_deq_clock),
    .io_deq_reset(txMBFifo_io_deq_reset),
    .io_deq_ready(txMBFifo_io_deq_ready),
    .io_deq_valid(txMBFifo_io_deq_valid),
    .io_deq_bits_0(txMBFifo_io_deq_bits_0),
    .io_deq_bits_1(txMBFifo_io_deq_bits_1),
    .io_deq_bits_2(txMBFifo_io_deq_bits_2),
    .io_deq_bits_3(txMBFifo_io_deq_bits_3)
  );
  AsyncQueue_1 rxMBFifo ( // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
    .io_enq_clock(rxMBFifo_io_enq_clock),
    .io_enq_reset(rxMBFifo_io_enq_reset),
    .io_enq_ready(rxMBFifo_io_enq_ready),
    .io_enq_valid(rxMBFifo_io_enq_valid),
    .io_enq_bits_0(rxMBFifo_io_enq_bits_0),
    .io_enq_bits_1(rxMBFifo_io_enq_bits_1),
    .io_enq_bits_2(rxMBFifo_io_enq_bits_2),
    .io_enq_bits_3(rxMBFifo_io_enq_bits_3),
    .io_deq_clock(rxMBFifo_io_deq_clock),
    .io_deq_reset(rxMBFifo_io_deq_reset),
    .io_deq_valid(rxMBFifo_io_deq_valid),
    .io_deq_bits_0(rxMBFifo_io_deq_bits_0),
    .io_deq_bits_1(rxMBFifo_io_deq_bits_1),
    .io_deq_bits_2(rxMBFifo_io_deq_bits_2),
    .io_deq_bits_3(rxMBFifo_io_deq_bits_3)
  );
  assign io_mainbandIo_txData_valid = txMBFifo_io_deq_valid; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_0 = txMBFifo_io_deq_bits_0; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_1 = txMBFifo_io_deq_bits_1; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_2 = txMBFifo_io_deq_bits_2; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_3 = txMBFifo_io_deq_bits_3; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_rxData_ready = rxMBFifo_io_enq_ready; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign io_mainbandLaneIO_txData_ready = txMBFifo_io_enq_ready; // @[\\src\\main\\scala\\logphy\\Lanes.scala 72:34]
  assign io_mainbandLaneIO_rxData_valid = rxMBFifo_io_deq_valid; // @[\\src\\main\\scala\\logphy\\Lanes.scala 47:34]
  assign io_mainbandLaneIO_rxData_bits = {io_mainbandLaneIO_rxData_bits_hi,io_mainbandLaneIO_rxData_bits_lo}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 70:46]
  assign txMBFifo_io_enq_clock = clock; // @[\\src\\main\\scala\\logphy\\Lanes.scala 41:25]
  assign txMBFifo_io_enq_reset = reset; // @[\\src\\main\\scala\\logphy\\Lanes.scala 42:25]
  assign txMBFifo_io_enq_valid = io_mainbandLaneIO_txData_valid; // @[\\src\\main\\scala\\logphy\\Lanes.scala 46:25]
  assign txMBFifo_io_enq_bits_0 = {txMBFifo_io_enq_bits_0_hi,txMBFifo_io_enq_bits_0_lo}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_enq_bits_1 = {txMBFifo_io_enq_bits_1_hi,txMBFifo_io_enq_bits_1_lo}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_enq_bits_2 = {txMBFifo_io_enq_bits_2_hi,txMBFifo_io_enq_bits_2_lo}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_enq_bits_3 = {txMBFifo_io_enq_bits_3_hi,txMBFifo_io_enq_bits_3_lo}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_deq_clock = io_mainbandIo_fifoParams_clk; // @[\\src\\main\\scala\\logphy\\Lanes.scala 43:25]
  assign txMBFifo_io_deq_reset = io_mainbandIo_fifoParams_reset; // @[\\src\\main\\scala\\logphy\\Lanes.scala 44:25]
  assign txMBFifo_io_deq_ready = io_mainbandIo_txData_ready; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign rxMBFifo_io_enq_clock = io_mainbandIo_fifoParams_clk; // @[\\src\\main\\scala\\logphy\\Lanes.scala 38:25]
  assign rxMBFifo_io_enq_reset = io_mainbandIo_fifoParams_reset; // @[\\src\\main\\scala\\logphy\\Lanes.scala 39:25]
  assign rxMBFifo_io_enq_valid = io_mainbandIo_rxData_valid; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign rxMBFifo_io_enq_bits_0 = io_mainbandIo_rxData_bits_0; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign rxMBFifo_io_enq_bits_1 = io_mainbandIo_rxData_bits_1; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign rxMBFifo_io_enq_bits_2 = io_mainbandIo_rxData_bits_2; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign rxMBFifo_io_enq_bits_3 = io_mainbandIo_rxData_bits_3; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign rxMBFifo_io_deq_clock = clock; // @[\\src\\main\\scala\\logphy\\Lanes.scala 36:25]
  assign rxMBFifo_io_deq_reset = reset; // @[\\src\\main\\scala\\logphy\\Lanes.scala 37:25]
endmodule
