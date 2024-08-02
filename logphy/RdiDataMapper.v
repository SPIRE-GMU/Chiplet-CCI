module DataWidthCoupler(
  input          clock,
  input          reset,
  output         io_in_ready, // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 22:14]
  input          io_in_valid, // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 22:14]
  input  [511:0] io_in_bits, // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 22:14]
  input          io_out_ready, // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 22:14]
  output         io_out_valid, // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 22:14]
  output [255:0] io_out_bits // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 22:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [511:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  currentState; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 29:37]
  reg  chunkCounter; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 42:31]
  reg [511:0] inData; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 43:25]
  wire  _T_3 = io_in_ready & io_in_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  _GEN_2 = _T_3 | currentState; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 47:26 50:24 29:37]
  wire  _io_out_bits_T_3 = 1'h1 - chunkCounter; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 56:27]
  wire  _T_7 = io_out_ready & io_out_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  _GEN_5 = chunkCounter ? 1'h0 : currentState; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 61:48 62:26 29:37]
  assign io_in_ready = ~currentState; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 44:26]
  assign io_out_valid = ~currentState ? 1'h0 : currentState; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 44:26 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  assign io_out_bits = _io_out_bits_T_3 ? inData[511:256] : inData[255:0]; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 54:{21,21}]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 29:37]
      currentState <= 1'h0; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 29:37]
    end else if (~currentState) begin // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 44:26]
      currentState <= _GEN_2;
    end else if (currentState) begin // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 44:26]
      if (_T_7) begin // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 59:27]
        currentState <= _GEN_5;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 42:31]
      chunkCounter <= 1'h0; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 42:31]
    end else if (~currentState) begin // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 44:26]
      if (_T_3) begin // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 47:26]
        chunkCounter <= 1'h0; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 49:24]
      end
    end else if (currentState) begin // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 44:26]
      if (_T_7) begin // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 59:27]
        chunkCounter <= chunkCounter + 1'h1; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 60:24]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 43:25]
      inData <= 512'h0; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 43:25]
    end else if (~currentState) begin // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 44:26]
      if (_T_3) begin // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 47:26]
        inData <= io_in_bits; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 48:18]
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
  currentState = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  chunkCounter = _RAND_1[0:0];
  _RAND_2 = {16{`RANDOM}};
  inData = _RAND_2[511:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RdiDataMapper(
  input          clock,
  input          reset,
  output         io_rdi_lpData_ready, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 33:14]
  input          io_rdi_lpData_valid, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 33:14]
  input          io_rdi_lpData_irdy, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 33:14]
  input  [511:0] io_rdi_lpData_bits, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 33:14]
  output         io_rdi_plData_valid, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 33:14]
  output [511:0] io_rdi_plData_bits, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 33:14]
  input          io_mainbandLaneIO_txData_ready, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 33:14]
  output         io_mainbandLaneIO_txData_valid, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 33:14]
  output [255:0] io_mainbandLaneIO_txData_bits, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 33:14]
  input          io_mainbandLaneIO_rxData_valid, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 33:14]
  input  [255:0] io_mainbandLaneIO_rxData_bits // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 33:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [255:0] _RAND_1;
  reg [255:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  txWidthCoupler_clock; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 71:38]
  wire  txWidthCoupler_reset; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 71:38]
  wire  txWidthCoupler_io_in_ready; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 71:38]
  wire  txWidthCoupler_io_in_valid; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 71:38]
  wire [511:0] txWidthCoupler_io_in_bits; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 71:38]
  wire  txWidthCoupler_io_out_ready; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 71:38]
  wire  txWidthCoupler_io_out_valid; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 71:38]
  wire [255:0] txWidthCoupler_io_out_bits; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 71:38]
  reg  rxSliceCounter; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 46:31]
  reg [255:0] rxData_0; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 48:12]
  reg [255:0] rxData_1; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 48:12]
  reg  hasRxData; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 55:26]
  wire  _GEN_7 = io_mainbandLaneIO_rxData_valid & rxSliceCounter; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 56:13 57:39]
  DataWidthCoupler txWidthCoupler ( // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 71:38]
    .clock(txWidthCoupler_clock),
    .reset(txWidthCoupler_reset),
    .io_in_ready(txWidthCoupler_io_in_ready),
    .io_in_valid(txWidthCoupler_io_in_valid),
    .io_in_bits(txWidthCoupler_io_in_bits),
    .io_out_ready(txWidthCoupler_io_out_ready),
    .io_out_valid(txWidthCoupler_io_out_valid),
    .io_out_bits(txWidthCoupler_io_out_bits)
  );
  assign io_rdi_lpData_ready = txWidthCoupler_io_in_ready; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 81:23]
  assign io_rdi_plData_valid = hasRxData; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 67:23]
  assign io_rdi_plData_bits = {rxData_1,rxData_0}; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 68:32]
  assign io_mainbandLaneIO_txData_valid = txWidthCoupler_io_out_valid; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 79:25]
  assign io_mainbandLaneIO_txData_bits = txWidthCoupler_io_out_bits; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 79:25]
  assign txWidthCoupler_clock = clock;
  assign txWidthCoupler_reset = reset;
  assign txWidthCoupler_io_in_valid = io_rdi_lpData_valid & io_rdi_lpData_irdy; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 82:53]
  assign txWidthCoupler_io_in_bits = io_rdi_lpData_bits; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 83:29]
  assign txWidthCoupler_io_out_ready = io_mainbandLaneIO_txData_ready; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 79:25]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 46:31]
      rxSliceCounter <= 1'h0; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 46:31]
    end else if (io_mainbandLaneIO_rxData_valid) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 57:39]
      if (rxSliceCounter) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 62:44]
        rxSliceCounter <= 1'h0; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 64:22]
      end else begin
        rxSliceCounter <= rxSliceCounter + 1'h1; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 61:20]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 48:12]
      rxData_0 <= 256'h0; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 48:12]
    end else if (io_mainbandLaneIO_rxData_valid) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 57:39]
      if (~(1'h1 - rxSliceCounter)) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 60:44]
        rxData_0 <= io_mainbandLaneIO_rxData_bits; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 60:44]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 48:12]
      rxData_1 <= 256'h0; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 48:12]
    end else if (io_mainbandLaneIO_rxData_valid) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 57:39]
      if (1'h1 - rxSliceCounter) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 60:44]
        rxData_1 <= io_mainbandLaneIO_rxData_bits; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 60:44]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 55:26]
      hasRxData <= 1'h0; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 55:26]
    end else begin
      hasRxData <= _GEN_7;
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
  rxSliceCounter = _RAND_0[0:0];
  _RAND_1 = {8{`RANDOM}};
  rxData_0 = _RAND_1[255:0];
  _RAND_2 = {8{`RANDOM}};
  rxData_1 = _RAND_2[255:0];
  _RAND_3 = {1{`RANDOM}};
  hasRxData = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
