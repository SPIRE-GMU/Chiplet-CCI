module PatternGenerator(
  input          clock,
  input          reset,
  output         io_patternGeneratorIO_transmitReq_ready, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 25:14]
  input          io_patternGeneratorIO_transmitReq_valid, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 25:14]
  input          io_patternGeneratorIO_transmitReq_bits_pattern, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 25:14]
  input  [31:0]  io_patternGeneratorIO_transmitReq_bits_timeoutCycles, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 25:14]
  input          io_patternGeneratorIO_transmitReq_bits_sideband, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 25:14]
  input          io_patternGeneratorIO_transmitPatternStatus_ready, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 25:14]
  output         io_patternGeneratorIO_transmitPatternStatus_valid, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 25:14]
  output         io_patternGeneratorIO_transmitPatternStatus_bits, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 25:14]
  input          io_sidebandLaneIO_txData_ready, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 25:14]
  output         io_sidebandLaneIO_txData_valid, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 25:14]
  output [127:0] io_sidebandLaneIO_txData_bits, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 25:14]
  output         io_sidebandLaneIO_rxData_ready, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 25:14]
  input          io_sidebandLaneIO_rxData_valid, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 25:14]
  input  [127:0] io_sidebandLaneIO_rxData_bits // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 25:14]
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
`endif // RANDOMIZE_REG_INIT
  reg  writeInProgress; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 36:40]
  reg  readInProgress; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 37:39]
  wire  inProgress = writeInProgress | readInProgress; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 38:53]
  reg  pattern; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 39:32]
  reg [31:0] timeoutCycles; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 41:38]
  reg  status; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 42:31]
  reg  statusValid; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 43:36]
  wire  _T = io_patternGeneratorIO_transmitReq_ready & io_patternGeneratorIO_transmitReq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  _GEN_0 = _T | writeInProgress; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 48:48 49:21 36:40]
  wire  _GEN_1 = _T | readInProgress; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 48:48 50:20 37:39]
  wire  _GEN_5 = _T ? 1'h0 : statusValid; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 48:48 54:17 43:36]
  reg [8:0] patternDetectedCount; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 64:37]
  reg [1:0] patternWrittenCount; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 65:36]
  wire  _T_1 = io_patternGeneratorIO_transmitPatternStatus_ready & io_patternGeneratorIO_transmitPatternStatus_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  _GEN_6 = _T_1 ? 1'h0 : _GEN_5; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 79:58 80:17]
  wire [31:0] _timeoutCycles_T_1 = timeoutCycles - 32'h1; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 84:36]
  wire  _T_5 = ~pattern; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 93:54]
  wire [1:0] _T_6 = ~pattern ? 2'h2 : 2'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 93:54]
  wire  _T_7 = patternWrittenCount >= _T_6; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 93:28]
  wire [7:0] _T_11 = _T_5 ? 8'h80 : 8'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 95:61]
  wire [8:0] _GEN_35 = {{1'd0}, _T_11}; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 95:35]
  wire  _T_13 = _T_7 & patternDetectedCount >= _GEN_35; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 95:10]
  wire  _GEN_7 = _T_13 | _GEN_6; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 98:7 99:19]
  wire  _GEN_8 = _T_13 ? 1'h0 : status; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 100:14 42:31 98:7]
  wire [1:0] _GEN_11 = _T_13 ? 2'h0 : patternWrittenCount; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 103:27 65:36 98:7]
  wire [8:0] _GEN_12 = _T_13 ? 9'h0 : patternDetectedCount; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 104:28 64:37 98:7]
  wire  _GEN_13 = timeoutCycles == 32'h0 | _GEN_8; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 85:33 86:14]
  wire  _GEN_14 = timeoutCycles == 32'h0 | _GEN_7; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 85:33 87:19]
  wire [1:0] _GEN_17 = timeoutCycles == 32'h0 ? 2'h0 : _GEN_11; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 85:33 90:27]
  wire [8:0] _GEN_18 = timeoutCycles == 32'h0 ? 9'h0 : _GEN_12; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 85:33 91:28]
  wire [1:0] _GEN_24 = inProgress ? _GEN_17 : patternWrittenCount; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 83:20 65:36]
  wire [8:0] _GEN_25 = inProgress ? _GEN_18 : patternDetectedCount; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 83:20 64:37]
  wire  _T_17 = io_sidebandLaneIO_txData_ready & io_sidebandLaneIO_txData_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [1:0] _patternWrittenCount_T_1 = patternWrittenCount + 2'h1; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 125:54]
  wire [127:0] _GEN_27 = _T_5 ? 128'haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa : 128'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 109:21 115:27 63:35]
  wire  _T_23 = io_sidebandLaneIO_rxData_ready & io_sidebandLaneIO_rxData_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [8:0] _patternDetectedCount_T_1 = patternDetectedCount + 9'h80; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 150:58]
  wire [8:0] _GEN_31 = io_sidebandLaneIO_rxData_bits == 128'haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ?
    _patternDetectedCount_T_1 : _GEN_25; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 149:67 150:34]
  assign io_patternGeneratorIO_transmitReq_ready = ~inProgress; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 44:58]
  assign io_patternGeneratorIO_transmitPatternStatus_valid = statusValid; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 45:53]
  assign io_patternGeneratorIO_transmitPatternStatus_bits = status; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 46:52]
  assign io_sidebandLaneIO_txData_valid = writeInProgress; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 75:34]
  assign io_sidebandLaneIO_txData_bits = writeInProgress ? _GEN_27 : 128'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 108:25 63:35]
  assign io_sidebandLaneIO_rxData_ready = readInProgress; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 77:34]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 36:40]
      writeInProgress <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 36:40]
    end else if (inProgress) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 83:20]
      if (timeoutCycles == 32'h0) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 85:33]
        writeInProgress <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 88:23]
      end else if (_T_13) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 98:7]
        writeInProgress <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 101:23]
      end else begin
        writeInProgress <= _GEN_0;
      end
    end else begin
      writeInProgress <= _GEN_0;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 37:39]
      readInProgress <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 37:39]
    end else if (inProgress) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 83:20]
      if (timeoutCycles == 32'h0) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 85:33]
        readInProgress <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 89:22]
      end else if (_T_13) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 98:7]
        readInProgress <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 102:22]
      end else begin
        readInProgress <= _GEN_1;
      end
    end else begin
      readInProgress <= _GEN_1;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 39:32]
      pattern <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 39:32]
    end else if (_T) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 48:48]
      pattern <= io_patternGeneratorIO_transmitReq_bits_pattern; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 51:13]
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 41:38]
      timeoutCycles <= 32'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 41:38]
    end else if (inProgress) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 83:20]
      timeoutCycles <= _timeoutCycles_T_1; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 84:19]
    end else if (_T) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 48:48]
      timeoutCycles <= io_patternGeneratorIO_transmitReq_bits_timeoutCycles; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 53:19]
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 42:31]
      status <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 42:31]
    end else if (inProgress) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 83:20]
      status <= _GEN_13;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 43:36]
      statusValid <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 43:36]
    end else if (inProgress) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 83:20]
      statusValid <= _GEN_14;
    end else if (_T_1) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 79:58]
      statusValid <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 80:17]
    end else if (_T) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 48:48]
      statusValid <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 54:17]
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 64:37]
      patternDetectedCount <= 9'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 64:37]
    end else if (readInProgress) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 132:24]
      if (_T_5) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 133:21]
        if (_T_23) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 144:45]
          patternDetectedCount <= _GEN_31;
        end else begin
          patternDetectedCount <= _GEN_25;
        end
      end else begin
        patternDetectedCount <= _GEN_25;
      end
    end else begin
      patternDetectedCount <= _GEN_25;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 65:36]
      patternWrittenCount <= 2'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 65:36]
    end else if (writeInProgress) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 108:25]
      if (_T_5) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 109:21]
        if (_T_17) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 119:45]
          patternWrittenCount <= _patternWrittenCount_T_1; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 125:31]
        end else begin
          patternWrittenCount <= _GEN_24;
        end
      end else begin
        patternWrittenCount <= _GEN_24;
      end
    end else begin
      patternWrittenCount <= _GEN_24;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (writeInProgress & _T_5 & _T_17 & ~reset) begin
          $fwrite(32'h80000002,"pattern written count: %d\n",patternWrittenCount); // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 124:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
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
  writeInProgress = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  readInProgress = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  pattern = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  timeoutCycles = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  status = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  statusValid = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  patternDetectedCount = _RAND_6[8:0];
  _RAND_7 = {1{`RANDOM}};
  patternWrittenCount = _RAND_7[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
