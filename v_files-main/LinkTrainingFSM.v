module PatternGenerator(
  input          clock,
  input          reset,
  output         io_patternGeneratorIO_transmitReq_ready, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 22:14]
  input          io_patternGeneratorIO_transmitReq_valid, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 22:14]
  input  [31:0]  io_patternGeneratorIO_transmitReq_bits_timeoutCycles, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 22:14]
  input          io_patternGeneratorIO_transmitPatternStatus_ready, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 22:14]
  output         io_patternGeneratorIO_transmitPatternStatus_valid, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 22:14]
  output         io_patternGeneratorIO_transmitPatternStatus_bits, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 22:14]
  input          io_sidebandLaneIO_txData_ready, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 22:14]
  output         io_sidebandLaneIO_txData_valid, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 22:14]
  output [127:0] io_sidebandLaneIO_txData_bits, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 22:14]
  output         io_sidebandLaneIO_rxData_ready, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 22:14]
  input          io_sidebandLaneIO_rxData_valid, // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 22:14]
  input  [127:0] io_sidebandLaneIO_rxData_bits // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 22:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg  writeInProgress; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 33:40]
  reg  readInProgress; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 34:39]
  wire  inProgress = writeInProgress | readInProgress; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 35:53]
  reg [31:0] timeoutCycles; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 38:38]
  reg  status; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 39:31]
  reg  statusValid; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 40:36]
  wire  _T = io_patternGeneratorIO_transmitReq_ready & io_patternGeneratorIO_transmitReq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  _GEN_0 = _T | writeInProgress; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 45:48 46:21 33:40]
  wire  _GEN_1 = _T | readInProgress; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 45:48 47:20 34:39]
  wire  _GEN_5 = _T ? 1'h0 : statusValid; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 45:48 51:17 40:36]
  reg [8:0] patternDetectedCount; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 61:37]
  reg [1:0] patternWrittenCount; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 62:36]
  wire  _T_1 = io_patternGeneratorIO_transmitPatternStatus_ready & io_patternGeneratorIO_transmitPatternStatus_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  _GEN_6 = _T_1 ? 1'h0 : _GEN_5; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 76:58 77:17]
  wire [31:0] _timeoutCycles_T_1 = timeoutCycles - 32'h1; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 81:36]
  wire  _T_7 = patternWrittenCount >= 2'h2; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 90:28]
  wire  _T_13 = _T_7 & patternDetectedCount >= 9'h80; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 92:10]
  wire  _GEN_7 = _T_13 | _GEN_6; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 95:7 96:19]
  wire  _GEN_8 = _T_13 ? 1'h0 : status; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 95:7 97:14 39:31]
  wire [1:0] _GEN_11 = _T_13 ? 2'h0 : patternWrittenCount; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 100:27 62:36 95:7]
  wire [8:0] _GEN_12 = _T_13 ? 9'h0 : patternDetectedCount; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 101:28 61:37 95:7]
  wire  _GEN_13 = timeoutCycles == 32'h0 | _GEN_8; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 82:33 83:14]
  wire  _GEN_14 = timeoutCycles == 32'h0 | _GEN_7; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 82:33 84:19]
  wire [1:0] _GEN_17 = timeoutCycles == 32'h0 ? 2'h0 : _GEN_11; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 82:33 87:27]
  wire [8:0] _GEN_18 = timeoutCycles == 32'h0 ? 9'h0 : _GEN_12; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 82:33 88:28]
  wire [1:0] _GEN_24 = inProgress ? _GEN_17 : patternWrittenCount; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 80:20 62:36]
  wire [8:0] _GEN_25 = inProgress ? _GEN_18 : patternDetectedCount; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 80:20 61:37]
  wire  _T_17 = io_sidebandLaneIO_txData_ready & io_sidebandLaneIO_txData_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [1:0] _patternWrittenCount_T_1 = patternWrittenCount + 2'h1; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 122:54]
  wire  _T_23 = io_sidebandLaneIO_rxData_ready & io_sidebandLaneIO_rxData_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [8:0] _patternDetectedCount_T_1 = patternDetectedCount + 9'h80; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 147:58]
  assign io_patternGeneratorIO_transmitReq_ready = ~inProgress; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 41:58]
  assign io_patternGeneratorIO_transmitPatternStatus_valid = statusValid; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 42:53]
  assign io_patternGeneratorIO_transmitPatternStatus_bits = status; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 43:52]
  assign io_sidebandLaneIO_txData_valid = writeInProgress; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 72:34]
  assign io_sidebandLaneIO_txData_bits = writeInProgress ? 128'haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa : 128'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 105:25 60:35]
  assign io_sidebandLaneIO_rxData_ready = readInProgress; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 74:34]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 33:40]
      writeInProgress <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 33:40]
    end else if (inProgress) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 80:20]
      if (timeoutCycles == 32'h0) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 82:33]
        writeInProgress <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 85:23]
      end else if (_T_13) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 95:7]
        writeInProgress <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 98:23]
      end else begin
        writeInProgress <= _GEN_0;
      end
    end else begin
      writeInProgress <= _GEN_0;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 34:39]
      readInProgress <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 34:39]
    end else if (inProgress) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 80:20]
      if (timeoutCycles == 32'h0) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 82:33]
        readInProgress <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 86:22]
      end else if (_T_13) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 95:7]
        readInProgress <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 99:22]
      end else begin
        readInProgress <= _GEN_1;
      end
    end else begin
      readInProgress <= _GEN_1;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 38:38]
      timeoutCycles <= 32'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 38:38]
    end else if (inProgress) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 80:20]
      timeoutCycles <= _timeoutCycles_T_1; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 81:19]
    end else if (_T) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 45:48]
      timeoutCycles <= io_patternGeneratorIO_transmitReq_bits_timeoutCycles; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 50:19]
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 39:31]
      status <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 39:31]
    end else if (inProgress) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 80:20]
      status <= _GEN_13;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 40:36]
      statusValid <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 40:36]
    end else if (inProgress) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 80:20]
      statusValid <= _GEN_14;
    end else if (_T_1) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 76:58]
      statusValid <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 77:17]
    end else if (_T) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 45:48]
      statusValid <= 1'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 51:17]
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 61:37]
      patternDetectedCount <= 9'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 61:37]
    end else if (readInProgress) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 129:24]
      if (_T_23) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 141:45]
        if (io_sidebandLaneIO_rxData_bits == 128'haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 146:67]
          patternDetectedCount <= _patternDetectedCount_T_1; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 147:34]
        end else begin
          patternDetectedCount <= _GEN_25;
        end
      end else begin
        patternDetectedCount <= _GEN_25;
      end
    end else begin
      patternDetectedCount <= _GEN_25;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 62:36]
      patternWrittenCount <= 2'h0; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 62:36]
    end else if (writeInProgress) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 105:25]
      if (_T_17) begin // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 116:45]
        patternWrittenCount <= _patternWrittenCount_T_1; // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 122:31]
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
        if (writeInProgress & _T_17 & ~reset) begin
          $fwrite(32'h80000002,"pattern written count: %d\n",patternWrittenCount); // @[\\src\\main\\scala\\logphy\\PatternGenerator.scala 121:17]
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
  timeoutCycles = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  status = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  statusValid = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  patternDetectedCount = _RAND_5[8:0];
  _RAND_6 = {1{`RANDOM}};
  patternWrittenCount = _RAND_6[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SBMsgWrapper(
  input          clock,
  input          reset,
  output         io_trainIO_msgReq_ready, // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 17:14]
  input          io_trainIO_msgReq_valid, // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 17:14]
  input  [127:0] io_trainIO_msgReq_bits_msg, // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 17:14]
  input  [63:0]  io_trainIO_msgReq_bits_timeoutCycles, // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 17:14]
  input          io_trainIO_msgReqStatus_ready, // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 17:14]
  output         io_trainIO_msgReqStatus_valid, // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 17:14]
  input          io_laneIO_txData_ready, // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 17:14]
  output         io_laneIO_txData_valid, // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 17:14]
  output [127:0] io_laneIO_txData_bits, // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 17:14]
  output         io_laneIO_rxData_ready, // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 17:14]
  input          io_laneIO_rxData_valid, // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 17:14]
  input  [127:0] io_laneIO_rxData_bits // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 17:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [127:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] currentState; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 30:37]
  reg [63:0] timeoutCounter; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 33:39]
  reg  sentMsg; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 37:32]
  reg  receivedMsg; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 38:36]
  wire  _T_3 = 2'h0 == currentState; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24]
  wire  _T_4 = io_trainIO_msgReq_ready & io_trainIO_msgReq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [1:0] _GEN_5 = _T_4 ? 2'h1 : currentState; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 63:36 67:19 35:35]
  wire  _T_7 = 2'h1 == currentState; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24]
  reg [63:0] currentReqTimeoutMax; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 49:45]
  wire  _justReceivedMsg_T = io_laneIO_rxData_ready & io_laneIO_rxData_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  reg [127:0] currentReq; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 47:35]
  wire  _justReceivedMsg_T_8 = io_laneIO_rxData_bits[21:14] == currentReq[21:14]; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 92:21]
  wire  _justReceivedMsg_T_9 = io_laneIO_rxData_bits[4:0] == currentReq[4:0] & _justReceivedMsg_T_8; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 90:33]
  wire  _justReceivedMsg_T_12 = io_laneIO_rxData_bits[39:32] == currentReq[39:32]; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 94:21]
  wire  _justReceivedMsg_T_13 = _justReceivedMsg_T_9 & _justReceivedMsg_T_12; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 92:37]
  wire  justReceivedMsg = _justReceivedMsg_T & _justReceivedMsg_T_13; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 107:48]
  wire  hasReceivedMsg = justReceivedMsg | receivedMsg; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 112:41]
  wire  _hasSentMsg_T = io_laneIO_txData_ready & io_laneIO_txData_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  hasSentMsg = _hasSentMsg_T | sentMsg; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 100:55]
  wire [1:0] _GEN_8 = hasReceivedMsg & hasSentMsg ? 2'h2 : currentState; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 115:42 118:19 35:35]
  wire [1:0] _GEN_9 = timeoutCounter == currentReqTimeoutMax ? 2'h2 : _GEN_8; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 167:53 168:19]
  wire  _T_12 = 2'h2 == currentState; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24]
  wire  _T_15 = io_trainIO_msgReqStatus_ready & io_trainIO_msgReqStatus_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [1:0] _GEN_11 = _T_15 ? 2'h0 : currentState; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 176:42 177:19 35:35]
  wire [1:0] _GEN_13 = 2'h2 == currentState ? _GEN_11 : currentState; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24 35:35]
  wire [1:0] _GEN_20 = 2'h1 == currentState ? _GEN_9 : _GEN_13; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24]
  wire [1:0] nextState = 2'h0 == currentState ? _GEN_5 : _GEN_20; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24]
  wire [63:0] _GEN_0 = currentState != nextState ? 64'h0 : timeoutCounter; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 39:36 42:20 33:39]
  wire  _GEN_1 = currentState != nextState ? 1'h0 : sentMsg; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 39:36 43:13 37:32]
  wire  _GEN_2 = currentState != nextState ? 1'h0 : receivedMsg; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 39:36 44:17 38:36]
  wire [63:0] _timeoutCounter_T_1 = timeoutCounter + 64'h1; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 166:40]
  wire  _GEN_22 = 2'h1 == currentState ? 1'h0 : 2'h2 == currentState; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  assign io_trainIO_msgReq_ready = 2'h0 == currentState; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24]
  assign io_trainIO_msgReqStatus_valid = 2'h0 == currentState ? 1'h0 : _GEN_22; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  assign io_laneIO_txData_valid = 2'h0 == currentState ? 1'h0 : 2'h1 == currentState; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  assign io_laneIO_txData_bits = currentReq; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24 99:29]
  assign io_laneIO_rxData_ready = 2'h0 == currentState ? 1'h0 : 2'h1 == currentState; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 30:37]
      currentState <= 2'h0; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 30:37]
    end else if (2'h0 == currentState) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24]
      if (_T_4) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 63:36]
        currentState <= 2'h1; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 67:19]
      end
    end else if (2'h1 == currentState) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24]
      if (timeoutCounter == currentReqTimeoutMax) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 167:53]
        currentState <= 2'h2; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 168:19]
      end else begin
        currentState <= _GEN_8;
      end
    end else if (2'h2 == currentState) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24]
      currentState <= _GEN_11;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 33:39]
      timeoutCounter <= 64'h0; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 33:39]
    end else if (2'h0 == currentState) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24]
      timeoutCounter <= _GEN_0;
    end else if (2'h1 == currentState) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24]
      timeoutCounter <= _timeoutCounter_T_1; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 166:22]
    end else begin
      timeoutCounter <= _GEN_0;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 37:32]
      sentMsg <= 1'h0; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 37:32]
    end else if (2'h0 == currentState) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24]
      sentMsg <= _GEN_1;
    end else if (2'h1 == currentState) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24]
      sentMsg <= hasSentMsg; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 103:15]
    end else begin
      sentMsg <= _GEN_1;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 38:36]
      receivedMsg <= 1'h0; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 38:36]
    end else if (2'h0 == currentState) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24]
      receivedMsg <= _GEN_2;
    end else if (2'h1 == currentState) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24]
      receivedMsg <= hasReceivedMsg; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 113:19]
    end else begin
      receivedMsg <= _GEN_2;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 49:45]
      currentReqTimeoutMax <= 64'h0; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 49:45]
    end else if (2'h0 == currentState) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24]
      if (_T_4) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 63:36]
        currentReqTimeoutMax <= io_trainIO_msgReq_bits_timeoutCycles; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 66:30]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 47:35]
      currentReq <= 128'h0; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 47:35]
    end else if (2'h0 == currentState) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 60:24]
      if (_T_4) begin // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 63:36]
        currentReq <= io_trainIO_msgReq_bits_msg; // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 64:20]
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~_T_3 & ~_T_7 & _T_12 & ~reset) begin
          $fwrite(32'h80000002,"ack\n"); // @[\\src\\main\\scala\\logphy\\SBMsgWrapper.scala 174:13]
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
  currentState = _RAND_0[1:0];
  _RAND_1 = {2{`RANDOM}};
  timeoutCounter = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  sentMsg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  receivedMsg = _RAND_3[0:0];
  _RAND_4 = {2{`RANDOM}};
  currentReqTimeoutMax = _RAND_4[63:0];
  _RAND_5 = {4{`RANDOM}};
  currentReq = _RAND_5[127:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MBInitFSM(
  input          clock,
  input          reset,
  input          io_sbTrainIO_msgReq_ready, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 23:14]
  output         io_sbTrainIO_msgReq_valid, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 23:14]
  output [127:0] io_sbTrainIO_msgReq_bits_msg, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 23:14]
  output         io_sbTrainIO_msgReqStatus_ready, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 23:14]
  input          io_sbTrainIO_msgReqStatus_valid, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 23:14]
  output         io_transition, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 23:14]
  output         io_error // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 23:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 43:30]
  reg [1:0] paramSubState; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 45:38]
  wire  _T_13 = io_sbTrainIO_msgReqStatus_ready & io_sbTrainIO_msgReqStatus_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [2:0] _GEN_9 = _T_13 ? 3'h3 : state; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 180:48 44:35]
  wire [2:0] _GEN_11 = 2'h3 == paramSubState ? _GEN_9 : state; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 126:29 44:35]
  wire [2:0] _GEN_18 = 2'h2 == paramSubState ? state : _GEN_11; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 126:29 44:35]
  wire [2:0] _GEN_21 = 2'h1 == paramSubState ? state : _GEN_18; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 126:29]
  wire [2:0] _GEN_33 = 2'h0 == paramSubState ? state : _GEN_21; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 126:29 44:35]
  wire [2:0] nextState = 3'h0 == state ? _GEN_33 : state; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 84:17 44:35]
  wire [1:0] _GEN_0 = nextState == 3'h0 & state != 3'h0 ? 2'h0 : paramSubState; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 46:60 47:19 45:38]
  wire  _T_9 = io_sbTrainIO_msgReq_ready & io_sbTrainIO_msgReq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [1:0] _GEN_6 = _T_13 ? 2'h2 : _GEN_0; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 144:48]
  wire [1:0] _GEN_7 = _T_9 ? 2'h3 : _GEN_0; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 174:42 175:27]
  wire [1:0] _GEN_16 = 2'h2 == paramSubState ? _GEN_7 : _GEN_0; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 126:29]
  wire  _GEN_17 = 2'h2 == paramSubState ? 1'h0 : 2'h3 == paramSubState; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 126:29 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  wire  _GEN_19 = 2'h1 == paramSubState | _GEN_17; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 126:29 143:43]
  wire  _GEN_23 = 2'h1 == paramSubState ? 1'h0 : 2'h2 == paramSubState; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 126:29 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  wire  _GEN_27 = 2'h0 == paramSubState | _GEN_23; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 126:29 128:37]
  wire  _GEN_31 = 2'h0 == paramSubState ? 1'h0 : _GEN_19; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 126:29 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  assign io_sbTrainIO_msgReq_valid = 3'h0 == state & _GEN_27; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 84:17 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  assign io_sbTrainIO_msgReq_bits_msg = 2'h0 == paramSubState ? 128'h20000a54000001b : 128'h20000aa4000001b; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 126:29 129:36]
  assign io_sbTrainIO_msgReqStatus_ready = 3'h0 == state & _GEN_31; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 84:17 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  assign io_transition = nextState == 3'h3 | nextState == 3'h4; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 50:45]
  assign io_error = state == 3'h4; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 51:21]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 43:30]
      state <= 3'h0; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 43:30]
    end else if (3'h0 == state) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 84:17]
      if (!(2'h0 == paramSubState)) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 126:29]
        if (!(2'h1 == paramSubState)) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 126:29]
          state <= _GEN_18;
        end
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 45:38]
      paramSubState <= 2'h0; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 45:38]
    end else if (3'h0 == state) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 84:17]
      if (2'h0 == paramSubState) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 126:29]
        if (_T_9) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 138:42]
          paramSubState <= 2'h1; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 139:27]
        end else begin
          paramSubState <= _GEN_0;
        end
      end else if (2'h1 == paramSubState) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 126:29]
        paramSubState <= _GEN_6;
      end else begin
        paramSubState <= _GEN_16;
      end
    end else begin
      paramSubState <= _GEN_0;
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
  state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  paramSubState = _RAND_1[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RdiBringup(
  input          clock,
  input          reset,
  input  [3:0]   io_rdiIO_lpStateReq, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 30:14]
  output [3:0]   io_rdiIO_plStateStatus, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 30:14]
  output         io_rdiIO_plStallReq, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 30:14]
  input          io_rdiIO_lpStallAck, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 30:14]
  input          io_rdiIO_lpLinkError, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 30:14]
  input          io_sbTrainIO_msgReq_ready, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 30:14]
  output         io_sbTrainIO_msgReq_valid, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 30:14]
  output [127:0] io_sbTrainIO_msgReq_bits_msg, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 30:14]
  output         io_sbTrainIO_msgReqStatus_ready, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 30:14]
  input          io_sbTrainIO_msgReqStatus_valid, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 30:14]
  output         io_active, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 30:14]
  input          io_internalError // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 30:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] state; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 50:30]
  wire [3:0] _GEN_1 = io_internalError | io_rdiIO_lpLinkError ? 4'ha : state; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 57:50 58:15]
  reg [2:0] resetSubstate; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 63:38]
  wire  _T_1 = state != 4'h0; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 64:14]
  reg [3:0] prevReq; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 74:32]
  wire [3:0] _GEN_4 = _T_1 | prevReq == 4'h0 ? io_rdiIO_lpStateReq : _GEN_1; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 79:67 80:17]
  wire [3:0] _GEN_5 = io_rdiIO_lpStateReq != 4'h0 ? _GEN_4 : _GEN_1; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 78:49]
  wire  _T_33 = io_sbTrainIO_msgReqStatus_ready & io_sbTrainIO_msgReqStatus_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [3:0] _GEN_11 = _T_33 ? 4'h1 : _GEN_5; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 131:48 132:23]
  wire [3:0] _GEN_13 = 3'h6 == resetSubstate ? _GEN_11 : _GEN_5; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 86:29]
  wire [3:0] _GEN_19 = 3'h5 == resetSubstate ? _GEN_5 : _GEN_13; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 86:29]
  wire [3:0] _GEN_25 = 3'h4 == resetSubstate ? _GEN_5 : _GEN_19; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 86:29]
  wire [3:0] _GEN_31 = 3'h3 == resetSubstate ? _GEN_5 : _GEN_25; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 86:29]
  wire [3:0] _GEN_38 = 3'h2 == resetSubstate ? _GEN_5 : _GEN_31; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 86:29]
  wire [3:0] nextState = 4'h0 == state ? _GEN_38 : _GEN_5; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 84:17]
  wire [2:0] _GEN_2 = state != 4'h0 & nextState == 4'h0 ? 3'h2 : resetSubstate; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 64:66 65:19 63:38]
  reg [1:0] stallReqAckState; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 68:41]
  wire  _T_5 = nextState == 4'h1; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 69:47]
  wire [1:0] _GEN_3 = state != 4'h1 & nextState == 4'h1 ? 2'h0 : stallReqAckState; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 69:68 70:22 68:41]
  wire  _T_21 = io_sbTrainIO_msgReq_ready & io_sbTrainIO_msgReq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [2:0] _GEN_8 = _T_21 ? 3'h4 : _GEN_2; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 105:42 106:27]
  wire [2:0] _GEN_9 = _T_33 ? 3'h5 : _GEN_2; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 111:48 112:27]
  wire [2:0] _GEN_10 = _T_33 ? 3'h6 : _GEN_2; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 125:48 126:27]
  wire [2:0] _GEN_17 = 3'h5 == resetSubstate ? _GEN_10 : _GEN_2; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 86:29]
  wire  _GEN_18 = 3'h5 == resetSubstate ? 1'h0 : 3'h6 == resetSubstate; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 86:29 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  wire  _GEN_20 = 3'h4 == resetSubstate | _GEN_18; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 86:29 110:43]
  wire [2:0] _GEN_21 = 3'h4 == resetSubstate ? _GEN_9 : _GEN_17; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 86:29]
  wire  _GEN_22 = 3'h4 == resetSubstate ? 1'h0 : 3'h5 == resetSubstate; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 86:29 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  wire  _GEN_26 = 3'h3 == resetSubstate | _GEN_22; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 86:29 96:37]
  wire [142:0] _GEN_27 = 3'h3 == resetSubstate ? 143'h200000140004012 : 143'h200000140008012; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 86:29 97:40]
  wire  _GEN_30 = 3'h3 == resetSubstate ? 1'h0 : _GEN_20; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 86:29 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  wire  _GEN_34 = 3'h2 == resetSubstate ? 1'h0 : _GEN_26; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 86:29 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  wire  _GEN_37 = 3'h2 == resetSubstate ? 1'h0 : _GEN_30; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 86:29 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  reg [3:0] nextStateReq; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 138:33]
  wire  _T_44 = nextState == 4'hb | nextState == 4'h9 | nextState == 4'hc; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 142:80]
  wire [1:0] _GEN_39 = _T_44 ? 2'h1 : _GEN_3; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 143:13 146:30]
  wire [3:0] _GEN_40 = _T_44 ? 4'h1 : nextState; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 143:13 147:19 56:9]
  wire [1:0] _GEN_42 = io_rdiIO_lpStallAck ? 2'h2 : _GEN_3; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 152:37 153:30]
  wire [3:0] _GEN_43 = io_rdiIO_lpStallAck ? 4'h1 : nextState; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 152:37 154:19 56:9]
  wire [3:0] _GEN_44 = ~io_rdiIO_lpStallAck ? nextStateReq : nextState; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 158:38 159:19 56:9]
  wire [3:0] _GEN_45 = 2'h2 == stallReqAckState ? _GEN_44 : nextState; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 139:32 56:9]
  wire [1:0] _GEN_46 = 2'h1 == stallReqAckState ? _GEN_42 : _GEN_3; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 139:32]
  wire [3:0] _GEN_47 = 2'h1 == stallReqAckState ? _GEN_43 : _GEN_45; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 139:32]
  assign io_rdiIO_plStateStatus = state; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 51:26]
  assign io_rdiIO_plStallReq = stallReqAckState == 2'h1; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 73:43]
  assign io_sbTrainIO_msgReq_valid = 4'h0 == state & _GEN_34; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 84:17 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  assign io_sbTrainIO_msgReq_bits_msg = _GEN_27[127:0];
  assign io_sbTrainIO_msgReqStatus_ready = 4'h0 == state & _GEN_37; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 84:17 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  assign io_active = state == 4'h1; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 53:22]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 50:30]
      state <= 4'h0; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 50:30]
    end else if (4'h0 == state) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 84:17]
      if (3'h2 == resetSubstate) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 86:29]
        if (_T_5) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 90:13]
          state <= 4'h0; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 91:19]
        end else begin
          state <= nextState; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 56:9]
        end
      end else begin
        state <= nextState; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 56:9]
      end
    end else if (4'h1 == state) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 84:17]
      if (2'h0 == stallReqAckState) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 139:32]
        state <= _GEN_40;
      end else begin
        state <= _GEN_47;
      end
    end else begin
      state <= nextState; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 56:9]
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 63:38]
      resetSubstate <= 3'h2; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 63:38]
    end else if (4'h0 == state) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 84:17]
      if (3'h2 == resetSubstate) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 86:29]
        if (_T_5) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 90:13]
          resetSubstate <= 3'h3; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 92:27]
        end else begin
          resetSubstate <= _GEN_2;
        end
      end else if (3'h3 == resetSubstate) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 86:29]
        resetSubstate <= _GEN_8;
      end else begin
        resetSubstate <= _GEN_21;
      end
    end else begin
      resetSubstate <= _GEN_2;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 74:32]
      prevReq <= 4'h0; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 74:32]
    end else begin
      prevReq <= io_rdiIO_lpStateReq; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 75:11]
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 68:41]
      stallReqAckState <= 2'h0; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 68:41]
    end else if (4'h0 == state) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 84:17]
      stallReqAckState <= _GEN_3;
    end else if (4'h1 == state) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 84:17]
      if (2'h0 == stallReqAckState) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 139:32]
        stallReqAckState <= _GEN_39;
      end else begin
        stallReqAckState <= _GEN_46;
      end
    end else begin
      stallReqAckState <= _GEN_3;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 138:33]
      nextStateReq <= 4'h0; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 138:33]
    end else if (2'h0 == stallReqAckState) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 139:32]
      if (_T_44) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 143:13]
        if (4'h0 == state) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 84:17]
          nextStateReq <= _GEN_38;
        end else begin
          nextStateReq <= _GEN_5;
        end
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
  state = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  resetSubstate = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  prevReq = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  stallReqAckState = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  nextStateReq = _RAND_4[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module LinkTrainingFSM(
  input          clock,
  input          reset,
  output         io_mainbandFSMIO_rxEn, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  input          io_mainbandFSMIO_pllLock, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  output [2:0]   io_mainbandFSMIO_txFreqSel, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  output         io_sidebandFSMIO_rxData_ready, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  input          io_sidebandFSMIO_rxData_valid, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  input  [127:0] io_sidebandFSMIO_rxData_bits, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  input          io_sidebandFSMIO_patternTxData_ready, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  output         io_sidebandFSMIO_patternTxData_valid, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  output [127:0] io_sidebandFSMIO_patternTxData_bits, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  input          io_sidebandFSMIO_packetTxData_ready, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  output         io_sidebandFSMIO_packetTxData_valid, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  output [127:0] io_sidebandFSMIO_packetTxData_bits, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  output         io_sidebandFSMIO_rxMode, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  output         io_sidebandFSMIO_txMode, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  output         io_sidebandFSMIO_rxEn, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  input          io_sidebandFSMIO_pllLock, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  output         io_rdi_rdiBringupIO_plClkReq, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  input          io_rdi_rdiBringupIO_lpClkAck, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  input          io_rdi_rdiBringupIO_lpWakeReq, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  output         io_rdi_rdiBringupIO_plWakeAck, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  input  [3:0]   io_rdi_rdiBringupIO_lpStateReq, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  output [3:0]   io_rdi_rdiBringupIO_plStateStatus, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  output         io_rdi_rdiBringupIO_plStallReq, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  input          io_rdi_rdiBringupIO_lpStallAck, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  input          io_rdi_rdiBringupIO_lpLinkError, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
  output [2:0]   io_currentState // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  patternGenerator_clock; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 66:32]
  wire  patternGenerator_reset; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 66:32]
  wire  patternGenerator_io_patternGeneratorIO_transmitReq_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 66:32]
  wire  patternGenerator_io_patternGeneratorIO_transmitReq_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 66:32]
  wire [31:0] patternGenerator_io_patternGeneratorIO_transmitReq_bits_timeoutCycles; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 66:32]
  wire  patternGenerator_io_patternGeneratorIO_transmitPatternStatus_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 66:32]
  wire  patternGenerator_io_patternGeneratorIO_transmitPatternStatus_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 66:32]
  wire  patternGenerator_io_patternGeneratorIO_transmitPatternStatus_bits; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 66:32]
  wire  patternGenerator_io_sidebandLaneIO_txData_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 66:32]
  wire  patternGenerator_io_sidebandLaneIO_txData_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 66:32]
  wire [127:0] patternGenerator_io_sidebandLaneIO_txData_bits; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 66:32]
  wire  patternGenerator_io_sidebandLaneIO_rxData_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 66:32]
  wire  patternGenerator_io_sidebandLaneIO_rxData_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 66:32]
  wire [127:0] patternGenerator_io_sidebandLaneIO_rxData_bits; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 66:32]
  wire  sbMsgWrapper_clock; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 67:28]
  wire  sbMsgWrapper_reset; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 67:28]
  wire  sbMsgWrapper_io_trainIO_msgReq_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 67:28]
  wire  sbMsgWrapper_io_trainIO_msgReq_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 67:28]
  wire [127:0] sbMsgWrapper_io_trainIO_msgReq_bits_msg; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 67:28]
  wire [63:0] sbMsgWrapper_io_trainIO_msgReq_bits_timeoutCycles; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 67:28]
  wire  sbMsgWrapper_io_trainIO_msgReqStatus_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 67:28]
  wire  sbMsgWrapper_io_trainIO_msgReqStatus_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 67:28]
  wire  sbMsgWrapper_io_laneIO_txData_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 67:28]
  wire  sbMsgWrapper_io_laneIO_txData_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 67:28]
  wire [127:0] sbMsgWrapper_io_laneIO_txData_bits; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 67:28]
  wire  sbMsgWrapper_io_laneIO_rxData_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 67:28]
  wire  sbMsgWrapper_io_laneIO_rxData_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 67:28]
  wire [127:0] sbMsgWrapper_io_laneIO_rxData_bits; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 67:28]
  wire  mbInit_clock; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 111:30]
  wire  mbInit_reset; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 111:30]
  wire  mbInit_io_sbTrainIO_msgReq_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 111:30]
  wire  mbInit_io_sbTrainIO_msgReq_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 111:30]
  wire [127:0] mbInit_io_sbTrainIO_msgReq_bits_msg; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 111:30]
  wire  mbInit_io_sbTrainIO_msgReqStatus_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 111:30]
  wire  mbInit_io_sbTrainIO_msgReqStatus_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 111:30]
  wire  mbInit_io_transition; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 111:30]
  wire  mbInit_io_error; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 111:30]
  wire  rdiBringup_clock; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 119:34]
  wire  rdiBringup_reset; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 119:34]
  wire [3:0] rdiBringup_io_rdiIO_lpStateReq; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 119:34]
  wire [3:0] rdiBringup_io_rdiIO_plStateStatus; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 119:34]
  wire  rdiBringup_io_rdiIO_plStallReq; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 119:34]
  wire  rdiBringup_io_rdiIO_lpStallAck; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 119:34]
  wire  rdiBringup_io_rdiIO_lpLinkError; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 119:34]
  wire  rdiBringup_io_sbTrainIO_msgReq_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 119:34]
  wire  rdiBringup_io_sbTrainIO_msgReq_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 119:34]
  wire [127:0] rdiBringup_io_sbTrainIO_msgReq_bits_msg; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 119:34]
  wire  rdiBringup_io_sbTrainIO_msgReqStatus_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 119:34]
  wire  rdiBringup_io_sbTrainIO_msgReqStatus_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 119:34]
  wire  rdiBringup_io_active; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 119:34]
  wire  rdiBringup_io_internalError; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 119:34]
  reg [2:0] currentState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 87:37]
  reg [2:0] sbInitSubState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 104:39]
  wire  _T_30 = 3'h0 == sbInitSubState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30]
  wire  _GEN_51 = 3'h6 == sbInitSubState | 3'h7 == sbInitSubState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 344:21]
  wire  _GEN_57 = 3'h5 == sbInitSubState | _GEN_51; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 321:21]
  wire  _GEN_66 = 3'h4 == sbInitSubState | _GEN_57; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 314:21]
  wire  _GEN_71 = 3'h3 == sbInitSubState | _GEN_66; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 288:21]
  wire  _GEN_80 = 3'h2 == sbInitSubState | _GEN_71; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 281:21]
  wire  _GEN_85 = 3'h1 == sbInitSubState ? 1'h0 : _GEN_80; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 250:21]
  wire  _GEN_96 = 3'h0 == sbInitSubState ? 1'h0 : _GEN_85; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 243:21]
  wire  _GEN_132 = 3'h2 == currentState | 3'h3 == currentState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 373:17]
  wire  _GEN_142 = 3'h1 == currentState ? _GEN_96 : _GEN_132; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24]
  wire  msgSource = 3'h0 == currentState ? 1'h0 : _GEN_142; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 69:35]
  reg [1:0] resetSubState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 93:38]
  wire  _T_24 = io_mainbandFSMIO_pllLock & io_sidebandFSMIO_pllLock; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 214:38]
  wire [2:0] _GEN_17 = _T_24 ? 3'h1 : currentState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 218:13 219:23 88:35]
  wire [2:0] _GEN_18 = 2'h2 == resetSubState ? _GEN_17 : currentState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 199:29 88:35]
  wire [2:0] _GEN_20 = 2'h1 == resetSubState ? currentState : _GEN_18; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 199:29 88:35]
  wire [2:0] _GEN_24 = 2'h0 == resetSubState ? currentState : _GEN_20; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 199:29 88:35]
  wire  _T_35 = patternGenerator_io_patternGeneratorIO_transmitPatternStatus_ready &
    patternGenerator_io_patternGeneratorIO_transmitPatternStatus_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [2:0] _GEN_26 = patternGenerator_io_patternGeneratorIO_transmitPatternStatus_bits ? 3'h5 : currentState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 256:15 261:27 88:35]
  wire [2:0] _GEN_28 = ~patternGenerator_io_patternGeneratorIO_transmitPatternStatus_bits ? currentState : _GEN_26; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 256:15 88:35]
  wire [2:0] _GEN_30 = _T_35 ? _GEN_28 : currentState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 253:13 88:35]
  wire  _T_49 = sbMsgWrapper_io_trainIO_msgReqStatus_ready & sbMsgWrapper_io_trainIO_msgReqStatus_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [2:0] _GEN_46 = _T_49 ? 3'h2 : currentState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 355:59 88:35]
  wire [2:0] _GEN_48 = 3'h7 == sbInitSubState ? _GEN_46 : currentState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 88:35]
  wire [2:0] _GEN_55 = 3'h6 == sbInitSubState ? currentState : _GEN_48; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 88:35]
  wire [2:0] _GEN_59 = 3'h5 == sbInitSubState ? currentState : _GEN_55; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30]
  wire [2:0] _GEN_69 = 3'h4 == sbInitSubState ? currentState : _GEN_59; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 88:35]
  wire [2:0] _GEN_73 = 3'h3 == sbInitSubState ? currentState : _GEN_69; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30]
  wire [2:0] _GEN_83 = 3'h2 == sbInitSubState ? currentState : _GEN_73; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 88:35]
  wire [2:0] _GEN_87 = 3'h1 == sbInitSubState ? _GEN_30 : _GEN_83; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30]
  wire [2:0] _GEN_99 = 3'h0 == sbInitSubState ? currentState : _GEN_87; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 88:35]
  wire [2:0] _nextState_T = mbInit_io_error ? 3'h5 : 3'h3; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 375:25]
  wire [2:0] _GEN_104 = mbInit_io_transition ? _nextState_T : currentState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 374:41 375:19 88:35]
  wire [2:0] _GEN_105 = rdiBringup_io_active ? 3'h4 : currentState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 385:34 386:19 88:35]
  wire [2:0] _GEN_115 = 3'h3 == currentState ? _GEN_105 : currentState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 88:35]
  wire [2:0] _GEN_133 = 3'h2 == currentState ? _GEN_104 : _GEN_115; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24]
  wire [2:0] _GEN_145 = 3'h1 == currentState ? _GEN_99 : _GEN_133; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24]
  wire [2:0] nextState = 3'h0 == currentState ? _GEN_24 : _GEN_145; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24]
  wire  _T_2 = currentState != 3'h0; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 95:59]
  wire  _T_3 = nextState == 3'h0 & currentState != 3'h0; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 95:43]
  wire [1:0] _GEN_5 = _T_3 ? 2'h0 : resetSubState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 96:5 97:19 93:38]
  wire  _T_6 = nextState == 3'h1 & currentState != 3'h1; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 106:44]
  wire [2:0] _GEN_6 = _T_6 ? 3'h0 : sbInitSubState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 107:5 108:20 104:39]
  wire  _currentState_T = rdiBringup_io_rdiIO_plStateStatus == 4'h0; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 128:42]
  wire  _currentState_T_1 = rdiBringup_io_rdiIO_plStateStatus == 4'h1; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 130:43]
  wire  _currentState_T_2 = rdiBringup_io_rdiIO_plStateStatus == 4'hb; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 134:43]
  wire  _io_sidebandFSMIO_rxMode_T_2 = sbInitSubState == 3'h1; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 152:24]
  wire  _io_sidebandFSMIO_rxMode_T_3 = sbInitSubState == 3'h0 | _io_sidebandFSMIO_rxMode_T_2; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 151:53]
  wire  _io_sidebandFSMIO_rxMode_T_4 = sbInitSubState == 3'h2; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 153:24]
  wire  _io_sidebandFSMIO_rxMode_T_5 = _io_sidebandFSMIO_rxMode_T_3 | _io_sidebandFSMIO_rxMode_T_4; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 152:54]
  wire  _io_sidebandFSMIO_rxMode_T_6 = sbInitSubState == 3'h3; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 154:24]
  wire  _io_sidebandFSMIO_rxMode_T_7 = _io_sidebandFSMIO_rxMode_T_5 | _io_sidebandFSMIO_rxMode_T_6; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 153:64]
  wire  _io_sidebandFSMIO_rxMode_T_8 = currentState == 3'h1 & _io_sidebandFSMIO_rxMode_T_7; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 150:47]
  reg [6:0] freqSelCtrValue; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  freqSelCtrValue_wrap_wrap = freqSelCtrValue == 7'h63; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [6:0] _freqSelCtrValue_wrap_value_T_1 = freqSelCtrValue + 7'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire  _GEN_23 = 2'h0 == resetSubState & _T_24; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 174:21 199:29]
  wire  resetFreqCtrValue = 3'h0 == currentState & _GEN_23; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 174:21 191:24]
  wire [1:0] _GEN_16 = freqSelCtrValue_wrap_wrap ? 2'h2 : _GEN_5; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 208:76 209:27]
  wire  _T_31 = patternGenerator_io_patternGeneratorIO_transmitReq_ready &
    patternGenerator_io_patternGeneratorIO_transmitReq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [2:0] _GEN_25 = _T_31 ? 3'h1 : _GEN_6; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 244:73 245:28]
  wire [2:0] _GEN_27 = ~patternGenerator_io_patternGeneratorIO_transmitPatternStatus_bits ? 3'h2 : _GEN_6; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 256:15 258:32]
  wire [2:0] _GEN_29 = _T_35 ? _GEN_27 : _GEN_6; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 253:13]
  wire  _T_45 = sbMsgWrapper_io_trainIO_msgReq_ready & sbMsgWrapper_io_trainIO_msgReq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [2:0] _GEN_31 = _T_45 ? 3'h3 : _GEN_6; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 282:53 283:28]
  wire [2:0] _GEN_35 = _T_49 ? 3'h4 : _GEN_6; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 289:59]
  wire [2:0] _GEN_37 = _T_45 ? 3'h5 : _GEN_6; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 315:53 316:28]
  wire [2:0] _GEN_41 = _T_49 ? 3'h6 : _GEN_6; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 322:59]
  wire [2:0] _GEN_43 = _T_45 ? 3'h7 : _GEN_6; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 348:53 349:28]
  wire [2:0] _GEN_53 = 3'h6 == sbInitSubState ? _GEN_43 : _GEN_6; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30]
  wire  _GEN_54 = 3'h6 == sbInitSubState ? 1'h0 : 3'h7 == sbInitSubState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  wire  _GEN_56 = 3'h5 == sbInitSubState | _GEN_54; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 320:54]
  wire [2:0] _GEN_58 = 3'h5 == sbInitSubState ? _GEN_41 : _GEN_53; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30]
  wire  _GEN_61 = 3'h5 == sbInitSubState ? 1'h0 : 3'h6 == sbInitSubState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  wire [142:0] _GEN_63 = 3'h4 == sbInitSubState ? 143'h600000140254012 : 143'h600000140268012; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 301:51]
  wire  _GEN_64 = 3'h4 == sbInitSubState | _GEN_61; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 310:48]
  wire [2:0] _GEN_67 = 3'h4 == sbInitSubState ? _GEN_37 : _GEN_58; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30]
  wire  _GEN_68 = 3'h4 == sbInitSubState ? 1'h0 : _GEN_56; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  wire  _GEN_70 = 3'h3 == sbInitSubState | _GEN_68; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 287:54]
  wire [2:0] _GEN_72 = 3'h3 == sbInitSubState ? _GEN_35 : _GEN_67; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30]
  wire  _GEN_75 = 3'h3 == sbInitSubState ? 1'h0 : _GEN_64; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  wire [142:0] _GEN_77 = 3'h2 == sbInitSubState ? 143'h600000040244000 : _GEN_63; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 267:51]
  wire  _GEN_78 = 3'h2 == sbInitSubState | _GEN_75; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 276:48]
  wire [2:0] _GEN_81 = 3'h2 == sbInitSubState ? _GEN_31 : _GEN_72; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30]
  wire  _GEN_82 = 3'h2 == sbInitSubState ? 1'h0 : _GEN_70; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  wire [2:0] _GEN_86 = 3'h1 == sbInitSubState ? _GEN_29 : _GEN_81; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30]
  wire  _GEN_89 = 3'h1 == sbInitSubState ? 1'h0 : _GEN_78; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  wire  _GEN_91 = 3'h1 == sbInitSubState ? 1'h0 : _GEN_82; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  wire  _GEN_98 = 3'h0 == sbInitSubState ? 1'h0 : 3'h1 == sbInitSubState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  wire  _GEN_101 = 3'h0 == sbInitSubState ? 1'h0 : _GEN_89; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  wire  _GEN_103 = 3'h0 == sbInitSubState ? 1'h0 : _GEN_91; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  wire  _GEN_106 = 3'h3 == currentState & sbMsgWrapper_io_trainIO_msgReq_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 383:31 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  wire  _GEN_107 = 3'h3 == currentState & rdiBringup_io_sbTrainIO_msgReq_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 383:31 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  wire [127:0] _GEN_108 = rdiBringup_io_sbTrainIO_msgReq_bits_msg; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 383:31]
  wire  _GEN_110 = 3'h3 == currentState & rdiBringup_io_sbTrainIO_msgReqStatus_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 383:31 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  wire  _GEN_111 = 3'h3 == currentState & sbMsgWrapper_io_trainIO_msgReqStatus_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 383:31 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  wire  _GEN_116 = 3'h2 == currentState & sbMsgWrapper_io_trainIO_msgReq_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 371:27 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  wire  _GEN_117 = 3'h2 == currentState ? mbInit_io_sbTrainIO_msgReq_valid : _GEN_107; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 371:27]
  wire [127:0] _GEN_118 = 3'h2 == currentState ? mbInit_io_sbTrainIO_msgReq_bits_msg : _GEN_108; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 371:27]
  wire [63:0] _GEN_119 = 3'h2 == currentState ? 64'h61a800 : 64'hf4240; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 371:27]
  wire  _GEN_120 = 3'h2 == currentState ? mbInit_io_sbTrainIO_msgReqStatus_ready : _GEN_110; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 371:27]
  wire  _GEN_121 = 3'h2 == currentState & sbMsgWrapper_io_trainIO_msgReqStatus_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 371:27 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  wire  _GEN_134 = 3'h2 == currentState ? 1'h0 : _GEN_106; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  wire  _GEN_135 = 3'h2 == currentState ? 1'h0 : _GEN_111; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  wire [142:0] _GEN_146 = 3'h1 == currentState ? _GEN_77 : {{15'd0}, _GEN_118}; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24]
  wire  _GEN_147 = 3'h1 == currentState ? _GEN_101 : _GEN_117; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24]
  wire  _GEN_149 = 3'h1 == currentState ? _GEN_103 : _GEN_120; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24]
  wire  _GEN_150 = 3'h1 == currentState ? 1'h0 : _GEN_116; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  wire  _GEN_151 = 3'h1 == currentState ? 1'h0 : _GEN_121; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  wire  _GEN_157 = 3'h1 == currentState ? 1'h0 : _GEN_134; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  wire  _GEN_158 = 3'h1 == currentState ? 1'h0 : _GEN_135; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  PatternGenerator patternGenerator ( // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 66:32]
    .clock(patternGenerator_clock),
    .reset(patternGenerator_reset),
    .io_patternGeneratorIO_transmitReq_ready(patternGenerator_io_patternGeneratorIO_transmitReq_ready),
    .io_patternGeneratorIO_transmitReq_valid(patternGenerator_io_patternGeneratorIO_transmitReq_valid),
    .io_patternGeneratorIO_transmitReq_bits_timeoutCycles(
      patternGenerator_io_patternGeneratorIO_transmitReq_bits_timeoutCycles),
    .io_patternGeneratorIO_transmitPatternStatus_ready(
      patternGenerator_io_patternGeneratorIO_transmitPatternStatus_ready),
    .io_patternGeneratorIO_transmitPatternStatus_valid(
      patternGenerator_io_patternGeneratorIO_transmitPatternStatus_valid),
    .io_patternGeneratorIO_transmitPatternStatus_bits(patternGenerator_io_patternGeneratorIO_transmitPatternStatus_bits)
      ,
    .io_sidebandLaneIO_txData_ready(patternGenerator_io_sidebandLaneIO_txData_ready),
    .io_sidebandLaneIO_txData_valid(patternGenerator_io_sidebandLaneIO_txData_valid),
    .io_sidebandLaneIO_txData_bits(patternGenerator_io_sidebandLaneIO_txData_bits),
    .io_sidebandLaneIO_rxData_ready(patternGenerator_io_sidebandLaneIO_rxData_ready),
    .io_sidebandLaneIO_rxData_valid(patternGenerator_io_sidebandLaneIO_rxData_valid),
    .io_sidebandLaneIO_rxData_bits(patternGenerator_io_sidebandLaneIO_rxData_bits)
  );
  SBMsgWrapper sbMsgWrapper ( // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 67:28]
    .clock(sbMsgWrapper_clock),
    .reset(sbMsgWrapper_reset),
    .io_trainIO_msgReq_ready(sbMsgWrapper_io_trainIO_msgReq_ready),
    .io_trainIO_msgReq_valid(sbMsgWrapper_io_trainIO_msgReq_valid),
    .io_trainIO_msgReq_bits_msg(sbMsgWrapper_io_trainIO_msgReq_bits_msg),
    .io_trainIO_msgReq_bits_timeoutCycles(sbMsgWrapper_io_trainIO_msgReq_bits_timeoutCycles),
    .io_trainIO_msgReqStatus_ready(sbMsgWrapper_io_trainIO_msgReqStatus_ready),
    .io_trainIO_msgReqStatus_valid(sbMsgWrapper_io_trainIO_msgReqStatus_valid),
    .io_laneIO_txData_ready(sbMsgWrapper_io_laneIO_txData_ready),
    .io_laneIO_txData_valid(sbMsgWrapper_io_laneIO_txData_valid),
    .io_laneIO_txData_bits(sbMsgWrapper_io_laneIO_txData_bits),
    .io_laneIO_rxData_ready(sbMsgWrapper_io_laneIO_rxData_ready),
    .io_laneIO_rxData_valid(sbMsgWrapper_io_laneIO_rxData_valid),
    .io_laneIO_rxData_bits(sbMsgWrapper_io_laneIO_rxData_bits)
  );
  MBInitFSM mbInit ( // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 111:30]
    .clock(mbInit_clock),
    .reset(mbInit_reset),
    .io_sbTrainIO_msgReq_ready(mbInit_io_sbTrainIO_msgReq_ready),
    .io_sbTrainIO_msgReq_valid(mbInit_io_sbTrainIO_msgReq_valid),
    .io_sbTrainIO_msgReq_bits_msg(mbInit_io_sbTrainIO_msgReq_bits_msg),
    .io_sbTrainIO_msgReqStatus_ready(mbInit_io_sbTrainIO_msgReqStatus_ready),
    .io_sbTrainIO_msgReqStatus_valid(mbInit_io_sbTrainIO_msgReqStatus_valid),
    .io_transition(mbInit_io_transition),
    .io_error(mbInit_io_error)
  );
  RdiBringup rdiBringup ( // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 119:34]
    .clock(rdiBringup_clock),
    .reset(rdiBringup_reset),
    .io_rdiIO_lpStateReq(rdiBringup_io_rdiIO_lpStateReq),
    .io_rdiIO_plStateStatus(rdiBringup_io_rdiIO_plStateStatus),
    .io_rdiIO_plStallReq(rdiBringup_io_rdiIO_plStallReq),
    .io_rdiIO_lpStallAck(rdiBringup_io_rdiIO_lpStallAck),
    .io_rdiIO_lpLinkError(rdiBringup_io_rdiIO_lpLinkError),
    .io_sbTrainIO_msgReq_ready(rdiBringup_io_sbTrainIO_msgReq_ready),
    .io_sbTrainIO_msgReq_valid(rdiBringup_io_sbTrainIO_msgReq_valid),
    .io_sbTrainIO_msgReq_bits_msg(rdiBringup_io_sbTrainIO_msgReq_bits_msg),
    .io_sbTrainIO_msgReqStatus_ready(rdiBringup_io_sbTrainIO_msgReqStatus_ready),
    .io_sbTrainIO_msgReqStatus_valid(rdiBringup_io_sbTrainIO_msgReqStatus_valid),
    .io_active(rdiBringup_io_active),
    .io_internalError(rdiBringup_io_internalError)
  );
  assign io_mainbandFSMIO_rxEn = 3'h0 == currentState ? 1'h0 : _T_2; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 168:25 193:29]
  assign io_mainbandFSMIO_txFreqSel = 3'h0;
  assign io_sidebandFSMIO_rxData_ready = ~msgSource ? patternGenerator_io_sidebandLaneIO_rxData_ready :
    sbMsgWrapper_io_laneIO_rxData_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 79:51 80:29 83:29]
  assign io_sidebandFSMIO_patternTxData_valid = patternGenerator_io_sidebandLaneIO_txData_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 77:34]
  assign io_sidebandFSMIO_patternTxData_bits = patternGenerator_io_sidebandLaneIO_txData_bits; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 77:34]
  assign io_sidebandFSMIO_packetTxData_valid = sbMsgWrapper_io_laneIO_txData_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 78:33]
  assign io_sidebandFSMIO_packetTxData_bits = sbMsgWrapper_io_laneIO_txData_bits; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 78:33]
  assign io_sidebandFSMIO_rxMode = _io_sidebandFSMIO_rxMode_T_8 ? 1'h0 : 1'h1; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 149:33]
  assign io_sidebandFSMIO_txMode = io_sidebandFSMIO_rxMode; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 158:27]
  assign io_sidebandFSMIO_rxEn = 1'h1; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 167:25 194:29]
  assign io_rdi_rdiBringupIO_plClkReq = 1'h1; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 120:23]
  assign io_rdi_rdiBringupIO_plWakeAck = 1'h1; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 120:23]
  assign io_rdi_rdiBringupIO_plStateStatus = rdiBringup_io_rdiIO_plStateStatus; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 120:23]
  assign io_rdi_rdiBringupIO_plStallReq = rdiBringup_io_rdiIO_plStallReq; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 120:23]
  assign io_currentState = currentState; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 172:19]
  assign patternGenerator_clock = clock;
  assign patternGenerator_reset = reset;
  assign patternGenerator_io_patternGeneratorIO_transmitReq_valid = 3'h0 == currentState ? 1'h0 : 3'h1 == currentState
     & _T_30; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  assign patternGenerator_io_patternGeneratorIO_transmitReq_bits_timeoutCycles = 3'h1 == currentState ? 32'h61a800 : 32'h0
    ; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24]
  assign patternGenerator_io_patternGeneratorIO_transmitPatternStatus_ready = 3'h0 == currentState ? 1'h0 : 3'h1 ==
    currentState & _GEN_98; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  assign patternGenerator_io_sidebandLaneIO_txData_ready = io_sidebandFSMIO_patternTxData_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 77:34]
  assign patternGenerator_io_sidebandLaneIO_rxData_valid = ~msgSource & io_sidebandFSMIO_rxData_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 79:51 80:29 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  assign patternGenerator_io_sidebandLaneIO_rxData_bits = io_sidebandFSMIO_rxData_bits; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 79:51 80:29]
  assign sbMsgWrapper_clock = clock;
  assign sbMsgWrapper_reset = reset;
  assign sbMsgWrapper_io_trainIO_msgReq_valid = 3'h0 == currentState ? 1'h0 : _GEN_147; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  assign sbMsgWrapper_io_trainIO_msgReq_bits_msg = _GEN_146[127:0];
  assign sbMsgWrapper_io_trainIO_msgReq_bits_timeoutCycles = 3'h1 == currentState ? 64'h61a800 : _GEN_119; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24]
  assign sbMsgWrapper_io_trainIO_msgReqStatus_ready = 3'h0 == currentState ? 1'h0 : _GEN_149; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  assign sbMsgWrapper_io_laneIO_txData_ready = io_sidebandFSMIO_packetTxData_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 78:33]
  assign sbMsgWrapper_io_laneIO_rxData_valid = ~msgSource ? 1'h0 : io_sidebandFSMIO_rxData_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 79:51 src/main/scala/chisel3/util/Decoupled.scala 74:20 \\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 83:29]
  assign sbMsgWrapper_io_laneIO_rxData_bits = io_sidebandFSMIO_rxData_bits; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 79:51 83:29]
  assign mbInit_clock = clock;
  assign mbInit_reset = nextState == 3'h2 & currentState != 3'h2 | reset; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 117:109]
  assign mbInit_io_sbTrainIO_msgReq_ready = 3'h0 == currentState ? 1'h0 : _GEN_150; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  assign mbInit_io_sbTrainIO_msgReqStatus_valid = 3'h0 == currentState ? 1'h0 : _GEN_151; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  assign rdiBringup_clock = clock;
  assign rdiBringup_reset = reset;
  assign rdiBringup_io_rdiIO_lpStateReq = io_rdi_rdiBringupIO_lpStateReq; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 120:23]
  assign rdiBringup_io_rdiIO_lpStallAck = io_rdi_rdiBringupIO_lpStallAck; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 120:23]
  assign rdiBringup_io_rdiIO_lpLinkError = io_rdi_rdiBringupIO_lpLinkError; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 120:23]
  assign rdiBringup_io_sbTrainIO_msgReq_ready = 3'h0 == currentState ? 1'h0 : _GEN_157; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  assign rdiBringup_io_sbTrainIO_msgReqStatus_valid = 3'h0 == currentState ? 1'h0 : _GEN_158; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  assign rdiBringup_io_internalError = currentState == 3'h5; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 176:47]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 87:37]
      currentState <= 3'h0; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 87:37]
    end else if (_currentState_T) begin // @[src/main/scala/chisel3/util/Mux.scala 50:70]
      if (3'h0 == currentState) begin // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24]
        if (!(2'h0 == resetSubState)) begin // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 199:29]
          currentState <= _GEN_20;
        end
      end else if (3'h1 == currentState) begin // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24]
        currentState <= _GEN_99;
      end else begin
        currentState <= _GEN_133;
      end
    end else if (_currentState_T_1) begin // @[src/main/scala/chisel3/util/Mux.scala 50:70]
      currentState <= 3'h4;
    end else if (_currentState_T_2) begin // @[src/main/scala/chisel3/util/Mux.scala 50:70]
      currentState <= 3'h6;
    end else begin
      currentState <= 3'h5;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 104:39]
      sbInitSubState <= 3'h0; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 104:39]
    end else if (3'h0 == currentState) begin // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24]
      sbInitSubState <= _GEN_6;
    end else if (3'h1 == currentState) begin // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24]
      if (3'h0 == sbInitSubState) begin // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 232:30]
        sbInitSubState <= _GEN_25;
      end else begin
        sbInitSubState <= _GEN_86;
      end
    end else begin
      sbInitSubState <= _GEN_6;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 93:38]
      resetSubState <= 2'h0; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 93:38]
    end else if (3'h0 == currentState) begin // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 191:24]
      if (2'h0 == resetSubState) begin // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 199:29]
        if (_T_24) begin // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 201:70]
          resetSubState <= 2'h1; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 203:27]
        end else begin
          resetSubState <= _GEN_5;
        end
      end else if (2'h1 == resetSubState) begin // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 199:29]
        resetSubState <= _GEN_16;
      end else begin
        resetSubState <= _GEN_5;
      end
    end else begin
      resetSubState <= _GEN_5;
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      freqSelCtrValue <= 7'h1; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else if (resetFreqCtrValue) begin // @[src/main/scala/chisel3/util/Counter.scala 134:17]
      freqSelCtrValue <= 7'h1; // @[src/main/scala/chisel3/util/Counter.scala 98:11]
    end else if (freqSelCtrValue_wrap_wrap) begin // @[src/main/scala/chisel3/util/Counter.scala 87:20]
      freqSelCtrValue <= 7'h1; // @[src/main/scala/chisel3/util/Counter.scala 87:28]
    end else begin
      freqSelCtrValue <= _freqSelCtrValue_wrap_value_T_1; // @[src/main/scala/chisel3/util/Counter.scala 77:15]
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
  currentState = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  sbInitSubState = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  resetSubState = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  freqSelCtrValue = _RAND_3[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
