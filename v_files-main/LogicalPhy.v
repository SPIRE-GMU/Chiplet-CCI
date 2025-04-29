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
  input          io_sidebandFSMIO_pllLock, // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 57:14]
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
  assign io_sidebandFSMIO_rxData_ready = ~msgSource ? patternGenerator_io_sidebandLaneIO_rxData_ready :
    sbMsgWrapper_io_laneIO_rxData_ready; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 79:51 80:29 83:29]
  assign io_sidebandFSMIO_patternTxData_valid = patternGenerator_io_sidebandLaneIO_txData_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 77:34]
  assign io_sidebandFSMIO_patternTxData_bits = patternGenerator_io_sidebandLaneIO_txData_bits; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 77:34]
  assign io_sidebandFSMIO_packetTxData_valid = sbMsgWrapper_io_laneIO_txData_valid; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 78:33]
  assign io_sidebandFSMIO_packetTxData_bits = sbMsgWrapper_io_laneIO_txData_bits; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 78:33]
  assign io_sidebandFSMIO_rxMode = _io_sidebandFSMIO_rxMode_T_8 ? 1'h0 : 1'h1; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 149:33]
  assign io_sidebandFSMIO_txMode = io_sidebandFSMIO_rxMode; // @[\\src\\main\\scala\\logphy\\LinkTrainingFSM.scala 158:27]
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
  output         io_rdi_lpData_ready, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 30:14]
  input          io_rdi_lpData_valid, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 30:14]
  input          io_rdi_lpData_irdy, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 30:14]
  input  [511:0] io_rdi_lpData_bits, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 30:14]
  output         io_rdi_plData_valid, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 30:14]
  output [511:0] io_rdi_plData_bits, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 30:14]
  input          io_mainbandLaneIO_txData_ready, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 30:14]
  output         io_mainbandLaneIO_txData_valid, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 30:14]
  output [255:0] io_mainbandLaneIO_txData_bits, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 30:14]
  input          io_mainbandLaneIO_rxData_valid, // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 30:14]
  input  [255:0] io_mainbandLaneIO_rxData_bits // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 30:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [255:0] _RAND_1;
  reg [255:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  txWidthCoupler_clock; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 68:38]
  wire  txWidthCoupler_reset; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 68:38]
  wire  txWidthCoupler_io_in_ready; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 68:38]
  wire  txWidthCoupler_io_in_valid; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 68:38]
  wire [511:0] txWidthCoupler_io_in_bits; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 68:38]
  wire  txWidthCoupler_io_out_ready; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 68:38]
  wire  txWidthCoupler_io_out_valid; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 68:38]
  wire [255:0] txWidthCoupler_io_out_bits; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 68:38]
  reg  rxSliceCounter; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 43:31]
  reg [255:0] rxData_0; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 45:12]
  reg [255:0] rxData_1; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 45:12]
  reg  hasRxData; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 52:26]
  wire  _GEN_7 = io_mainbandLaneIO_rxData_valid & rxSliceCounter; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 53:13 54:39]
  DataWidthCoupler txWidthCoupler ( // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 68:38]
    .clock(txWidthCoupler_clock),
    .reset(txWidthCoupler_reset),
    .io_in_ready(txWidthCoupler_io_in_ready),
    .io_in_valid(txWidthCoupler_io_in_valid),
    .io_in_bits(txWidthCoupler_io_in_bits),
    .io_out_ready(txWidthCoupler_io_out_ready),
    .io_out_valid(txWidthCoupler_io_out_valid),
    .io_out_bits(txWidthCoupler_io_out_bits)
  );
  assign io_rdi_lpData_ready = txWidthCoupler_io_in_ready; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 78:23]
  assign io_rdi_plData_valid = hasRxData; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 64:23]
  assign io_rdi_plData_bits = {rxData_1,rxData_0}; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 65:32]
  assign io_mainbandLaneIO_txData_valid = txWidthCoupler_io_out_valid; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 76:25]
  assign io_mainbandLaneIO_txData_bits = txWidthCoupler_io_out_bits; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 76:25]
  assign txWidthCoupler_clock = clock;
  assign txWidthCoupler_reset = reset;
  assign txWidthCoupler_io_in_valid = io_rdi_lpData_valid & io_rdi_lpData_irdy; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 79:53]
  assign txWidthCoupler_io_in_bits = io_rdi_lpData_bits; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 80:29]
  assign txWidthCoupler_io_out_ready = io_mainbandLaneIO_txData_ready; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 76:25]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 43:31]
      rxSliceCounter <= 1'h0; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 43:31]
    end else if (io_mainbandLaneIO_rxData_valid) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 54:39]
      if (rxSliceCounter) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 59:44]
        rxSliceCounter <= 1'h0; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 61:22]
      end else begin
        rxSliceCounter <= rxSliceCounter + 1'h1; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 58:20]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 45:12]
      rxData_0 <= 256'h0; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 45:12]
    end else if (io_mainbandLaneIO_rxData_valid) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 54:39]
      if (~(1'h1 - rxSliceCounter)) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 57:44]
        rxData_0 <= io_mainbandLaneIO_rxData_bits; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 57:44]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 45:12]
      rxData_1 <= 256'h0; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 45:12]
    end else if (io_mainbandLaneIO_rxData_valid) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 54:39]
      if (1'h1 - rxSliceCounter) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 57:44]
        rxData_1 <= io_mainbandLaneIO_rxData_bits; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 57:44]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 52:26]
      hasRxData <= 1'h0; // @[\\src\\main\\scala\\logphy\\RdiDataMapper.scala 52:26]
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
  input  [15:0] io_enq_bits_0, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [15:0] io_enq_bits_1, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [15:0] io_enq_bits_2, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [15:0] io_enq_bits_3, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [15:0] io_enq_bits_4, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [15:0] io_enq_bits_5, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [15:0] io_enq_bits_6, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [15:0] io_enq_bits_7, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [15:0] io_enq_bits_8, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [15:0] io_enq_bits_9, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [15:0] io_enq_bits_10, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [15:0] io_enq_bits_11, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [15:0] io_enq_bits_12, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [15:0] io_enq_bits_13, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [15:0] io_enq_bits_14, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  input  [15:0] io_enq_bits_15, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_0_0, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_0_1, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_0_2, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_0_3, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_0_4, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_0_5, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_0_6, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_0_7, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_0_8, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_0_9, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_0_10, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_0_11, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_0_12, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_0_13, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_0_14, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_0_15, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_1_0, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_1_1, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_1_2, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_1_3, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_1_4, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_1_5, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_1_6, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_1_7, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_1_8, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_1_9, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_1_10, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_1_11, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_1_12, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_1_13, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_1_14, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_1_15, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_2_0, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_2_1, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_2_2, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_2_3, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_2_4, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_2_5, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_2_6, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_2_7, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_2_8, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_2_9, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_2_10, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_2_11, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_2_12, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_2_13, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_2_14, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_2_15, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_3_0, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_3_1, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_3_2, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_3_3, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_3_4, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_3_5, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_3_6, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_3_7, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_3_8, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_3_9, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_3_10, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_3_11, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_3_12, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_3_13, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_3_14, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_3_15, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_4_0, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_4_1, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_4_2, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_4_3, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_4_4, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_4_5, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_4_6, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_4_7, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_4_8, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_4_9, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_4_10, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_4_11, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_4_12, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_4_13, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_4_14, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_4_15, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_5_0, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_5_1, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_5_2, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_5_3, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_5_4, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_5_5, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_5_6, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_5_7, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_5_8, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_5_9, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_5_10, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_5_11, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_5_12, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_5_13, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_5_14, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_5_15, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_6_0, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_6_1, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_6_2, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_6_3, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_6_4, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_6_5, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_6_6, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_6_7, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_6_8, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_6_9, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_6_10, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_6_11, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_6_12, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_6_13, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_6_14, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_6_15, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_7_0, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_7_1, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_7_2, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_7_3, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_7_4, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_7_5, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_7_6, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_7_7, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_7_8, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_7_9, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_7_10, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_7_11, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_7_12, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_7_13, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_7_14, // @[src/main/scala/util/AsyncQueue.scala 71:14]
  output [15:0] io_async_mem_7_15, // @[src/main/scala/util/AsyncQueue.scala 71:14]
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
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
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
  reg [15:0] mem_0_0; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_0_1; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_0_2; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_0_3; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_0_4; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_0_5; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_0_6; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_0_7; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_0_8; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_0_9; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_0_10; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_0_11; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_0_12; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_0_13; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_0_14; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_0_15; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_1_0; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_1_1; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_1_2; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_1_3; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_1_4; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_1_5; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_1_6; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_1_7; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_1_8; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_1_9; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_1_10; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_1_11; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_1_12; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_1_13; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_1_14; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_1_15; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_2_0; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_2_1; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_2_2; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_2_3; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_2_4; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_2_5; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_2_6; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_2_7; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_2_8; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_2_9; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_2_10; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_2_11; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_2_12; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_2_13; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_2_14; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_2_15; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_3_0; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_3_1; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_3_2; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_3_3; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_3_4; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_3_5; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_3_6; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_3_7; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_3_8; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_3_9; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_3_10; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_3_11; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_3_12; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_3_13; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_3_14; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_3_15; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_4_0; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_4_1; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_4_2; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_4_3; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_4_4; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_4_5; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_4_6; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_4_7; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_4_8; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_4_9; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_4_10; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_4_11; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_4_12; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_4_13; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_4_14; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_4_15; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_5_0; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_5_1; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_5_2; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_5_3; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_5_4; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_5_5; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_5_6; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_5_7; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_5_8; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_5_9; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_5_10; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_5_11; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_5_12; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_5_13; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_5_14; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_5_15; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_6_0; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_6_1; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_6_2; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_6_3; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_6_4; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_6_5; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_6_6; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_6_7; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_6_8; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_6_9; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_6_10; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_6_11; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_6_12; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_6_13; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_6_14; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_6_15; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_7_0; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_7_1; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_7_2; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_7_3; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_7_4; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_7_5; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_7_6; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_7_7; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_7_8; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_7_9; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_7_10; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_7_11; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_7_12; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_7_13; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_7_14; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  reg [15:0] mem_7_15; // @[src/main/scala/util/AsyncQueue.scala 80:16]
  wire  _widx_T_1 = io_enq_ready & io_enq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  sink_ready = sink_valid_io_out; // @[src/main/scala/util/AsyncQueue.scala 120:16 79:28]
  wire  _widx_T_2 = ~sink_ready; // @[src/main/scala/util/AsyncQueue.scala 81:77]
  reg [3:0] widx_widx_bin; // @[src/main/scala/util/AsyncQueue.scala 52:25]
  wire [3:0] _GEN_256 = {{3'd0}, _widx_T_1}; // @[src/main/scala/util/AsyncQueue.scala 53:43]
  wire [3:0] _widx_incremented_T_1 = widx_widx_bin + _GEN_256; // @[src/main/scala/util/AsyncQueue.scala 53:43]
  wire [3:0] widx_incremented = _widx_T_2 ? 4'h0 : _widx_incremented_T_1; // @[src/main/scala/util/AsyncQueue.scala 53:23]
  wire [3:0] _GEN_257 = {{1'd0}, widx_incremented[3:1]}; // @[src/main/scala/util/AsyncQueue.scala 54:17]
  wire [3:0] widx = widx_incremented ^ _GEN_257; // @[src/main/scala/util/AsyncQueue.scala 54:17]
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
  assign io_async_mem_0_4 = mem_0_4; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_0_5 = mem_0_5; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_0_6 = mem_0_6; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_0_7 = mem_0_7; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_0_8 = mem_0_8; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_0_9 = mem_0_9; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_0_10 = mem_0_10; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_0_11 = mem_0_11; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_0_12 = mem_0_12; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_0_13 = mem_0_13; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_0_14 = mem_0_14; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_0_15 = mem_0_15; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_0 = mem_1_0; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_1 = mem_1_1; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_2 = mem_1_2; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_3 = mem_1_3; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_4 = mem_1_4; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_5 = mem_1_5; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_6 = mem_1_6; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_7 = mem_1_7; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_8 = mem_1_8; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_9 = mem_1_9; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_10 = mem_1_10; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_11 = mem_1_11; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_12 = mem_1_12; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_13 = mem_1_13; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_14 = mem_1_14; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_1_15 = mem_1_15; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_0 = mem_2_0; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_1 = mem_2_1; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_2 = mem_2_2; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_3 = mem_2_3; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_4 = mem_2_4; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_5 = mem_2_5; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_6 = mem_2_6; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_7 = mem_2_7; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_8 = mem_2_8; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_9 = mem_2_9; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_10 = mem_2_10; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_11 = mem_2_11; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_12 = mem_2_12; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_13 = mem_2_13; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_14 = mem_2_14; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_2_15 = mem_2_15; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_0 = mem_3_0; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_1 = mem_3_1; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_2 = mem_3_2; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_3 = mem_3_3; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_4 = mem_3_4; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_5 = mem_3_5; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_6 = mem_3_6; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_7 = mem_3_7; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_8 = mem_3_8; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_9 = mem_3_9; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_10 = mem_3_10; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_11 = mem_3_11; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_12 = mem_3_12; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_13 = mem_3_13; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_14 = mem_3_14; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_3_15 = mem_3_15; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_0 = mem_4_0; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_1 = mem_4_1; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_2 = mem_4_2; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_3 = mem_4_3; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_4 = mem_4_4; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_5 = mem_4_5; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_6 = mem_4_6; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_7 = mem_4_7; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_8 = mem_4_8; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_9 = mem_4_9; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_10 = mem_4_10; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_11 = mem_4_11; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_12 = mem_4_12; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_13 = mem_4_13; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_14 = mem_4_14; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_4_15 = mem_4_15; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_0 = mem_5_0; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_1 = mem_5_1; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_2 = mem_5_2; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_3 = mem_5_3; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_4 = mem_5_4; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_5 = mem_5_5; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_6 = mem_5_6; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_7 = mem_5_7; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_8 = mem_5_8; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_9 = mem_5_9; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_10 = mem_5_10; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_11 = mem_5_11; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_12 = mem_5_12; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_13 = mem_5_13; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_14 = mem_5_14; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_5_15 = mem_5_15; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_0 = mem_6_0; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_1 = mem_6_1; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_2 = mem_6_2; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_3 = mem_6_3; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_4 = mem_6_4; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_5 = mem_6_5; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_6 = mem_6_6; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_7 = mem_6_7; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_8 = mem_6_8; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_9 = mem_6_9; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_10 = mem_6_10; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_11 = mem_6_11; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_12 = mem_6_12; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_13 = mem_6_13; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_14 = mem_6_14; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_6_15 = mem_6_15; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_0 = mem_7_0; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_1 = mem_7_1; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_2 = mem_7_2; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_3 = mem_7_3; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_4 = mem_7_4; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_5 = mem_7_5; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_6 = mem_7_6; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_7 = mem_7_7; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_8 = mem_7_8; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_9 = mem_7_9; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_10 = mem_7_10; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_11 = mem_7_11; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_12 = mem_7_12; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_13 = mem_7_13; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_14 = mem_7_14; // @[src/main/scala/util/AsyncQueue.scala 96:31]
  assign io_async_mem_7_15 = mem_7_15; // @[src/main/scala/util/AsyncQueue.scala 96:31]
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
      if (3'h0 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_0_4 <= io_enq_bits_4; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h0 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_0_5 <= io_enq_bits_5; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h0 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_0_6 <= io_enq_bits_6; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h0 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_0_7 <= io_enq_bits_7; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h0 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_0_8 <= io_enq_bits_8; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h0 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_0_9 <= io_enq_bits_9; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h0 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_0_10 <= io_enq_bits_10; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h0 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_0_11 <= io_enq_bits_11; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h0 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_0_12 <= io_enq_bits_12; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h0 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_0_13 <= io_enq_bits_13; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h0 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_0_14 <= io_enq_bits_14; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h0 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_0_15 <= io_enq_bits_15; // @[src/main/scala/util/AsyncQueue.scala 86:35]
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
      if (3'h1 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_1_4 <= io_enq_bits_4; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h1 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_1_5 <= io_enq_bits_5; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h1 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_1_6 <= io_enq_bits_6; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h1 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_1_7 <= io_enq_bits_7; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h1 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_1_8 <= io_enq_bits_8; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h1 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_1_9 <= io_enq_bits_9; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h1 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_1_10 <= io_enq_bits_10; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h1 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_1_11 <= io_enq_bits_11; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h1 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_1_12 <= io_enq_bits_12; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h1 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_1_13 <= io_enq_bits_13; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h1 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_1_14 <= io_enq_bits_14; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h1 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_1_15 <= io_enq_bits_15; // @[src/main/scala/util/AsyncQueue.scala 86:35]
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
      if (3'h2 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_2_4 <= io_enq_bits_4; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h2 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_2_5 <= io_enq_bits_5; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h2 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_2_6 <= io_enq_bits_6; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h2 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_2_7 <= io_enq_bits_7; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h2 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_2_8 <= io_enq_bits_8; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h2 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_2_9 <= io_enq_bits_9; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h2 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_2_10 <= io_enq_bits_10; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h2 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_2_11 <= io_enq_bits_11; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h2 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_2_12 <= io_enq_bits_12; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h2 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_2_13 <= io_enq_bits_13; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h2 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_2_14 <= io_enq_bits_14; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h2 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_2_15 <= io_enq_bits_15; // @[src/main/scala/util/AsyncQueue.scala 86:35]
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
      if (3'h3 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_3_4 <= io_enq_bits_4; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h3 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_3_5 <= io_enq_bits_5; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h3 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_3_6 <= io_enq_bits_6; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h3 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_3_7 <= io_enq_bits_7; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h3 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_3_8 <= io_enq_bits_8; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h3 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_3_9 <= io_enq_bits_9; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h3 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_3_10 <= io_enq_bits_10; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h3 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_3_11 <= io_enq_bits_11; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h3 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_3_12 <= io_enq_bits_12; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h3 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_3_13 <= io_enq_bits_13; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h3 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_3_14 <= io_enq_bits_14; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h3 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_3_15 <= io_enq_bits_15; // @[src/main/scala/util/AsyncQueue.scala 86:35]
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
      if (3'h4 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_4_4 <= io_enq_bits_4; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h4 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_4_5 <= io_enq_bits_5; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h4 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_4_6 <= io_enq_bits_6; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h4 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_4_7 <= io_enq_bits_7; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h4 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_4_8 <= io_enq_bits_8; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h4 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_4_9 <= io_enq_bits_9; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h4 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_4_10 <= io_enq_bits_10; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h4 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_4_11 <= io_enq_bits_11; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h4 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_4_12 <= io_enq_bits_12; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h4 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_4_13 <= io_enq_bits_13; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h4 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_4_14 <= io_enq_bits_14; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h4 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_4_15 <= io_enq_bits_15; // @[src/main/scala/util/AsyncQueue.scala 86:35]
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
      if (3'h5 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_5_4 <= io_enq_bits_4; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h5 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_5_5 <= io_enq_bits_5; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h5 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_5_6 <= io_enq_bits_6; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h5 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_5_7 <= io_enq_bits_7; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h5 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_5_8 <= io_enq_bits_8; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h5 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_5_9 <= io_enq_bits_9; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h5 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_5_10 <= io_enq_bits_10; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h5 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_5_11 <= io_enq_bits_11; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h5 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_5_12 <= io_enq_bits_12; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h5 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_5_13 <= io_enq_bits_13; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h5 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_5_14 <= io_enq_bits_14; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h5 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_5_15 <= io_enq_bits_15; // @[src/main/scala/util/AsyncQueue.scala 86:35]
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
      if (3'h6 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_6_4 <= io_enq_bits_4; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h6 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_6_5 <= io_enq_bits_5; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h6 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_6_6 <= io_enq_bits_6; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h6 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_6_7 <= io_enq_bits_7; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h6 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_6_8 <= io_enq_bits_8; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h6 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_6_9 <= io_enq_bits_9; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h6 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_6_10 <= io_enq_bits_10; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h6 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_6_11 <= io_enq_bits_11; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h6 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_6_12 <= io_enq_bits_12; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h6 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_6_13 <= io_enq_bits_13; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h6 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_6_14 <= io_enq_bits_14; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h6 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_6_15 <= io_enq_bits_15; // @[src/main/scala/util/AsyncQueue.scala 86:35]
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
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h7 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_7_4 <= io_enq_bits_4; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h7 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_7_5 <= io_enq_bits_5; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h7 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_7_6 <= io_enq_bits_6; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h7 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_7_7 <= io_enq_bits_7; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h7 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_7_8 <= io_enq_bits_8; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h7 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_7_9 <= io_enq_bits_9; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h7 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_7_10 <= io_enq_bits_10; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h7 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_7_11 <= io_enq_bits_11; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h7 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_7_12 <= io_enq_bits_12; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h7 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_7_13 <= io_enq_bits_13; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h7 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_7_14 <= io_enq_bits_14; // @[src/main/scala/util/AsyncQueue.scala 86:35]
      end
    end
    if (_widx_T_1) begin // @[src/main/scala/util/AsyncQueue.scala 86:22]
      if (3'h7 == index) begin // @[src/main/scala/util/AsyncQueue.scala 86:35]
        mem_7_15 <= io_enq_bits_15; // @[src/main/scala/util/AsyncQueue.scala 86:35]
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
      widx_gray <= widx_incremented ^ _GEN_257;
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
  mem_0_0 = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  mem_0_1 = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  mem_0_2 = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  mem_0_3 = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  mem_0_4 = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  mem_0_5 = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  mem_0_6 = _RAND_6[15:0];
  _RAND_7 = {1{`RANDOM}};
  mem_0_7 = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  mem_0_8 = _RAND_8[15:0];
  _RAND_9 = {1{`RANDOM}};
  mem_0_9 = _RAND_9[15:0];
  _RAND_10 = {1{`RANDOM}};
  mem_0_10 = _RAND_10[15:0];
  _RAND_11 = {1{`RANDOM}};
  mem_0_11 = _RAND_11[15:0];
  _RAND_12 = {1{`RANDOM}};
  mem_0_12 = _RAND_12[15:0];
  _RAND_13 = {1{`RANDOM}};
  mem_0_13 = _RAND_13[15:0];
  _RAND_14 = {1{`RANDOM}};
  mem_0_14 = _RAND_14[15:0];
  _RAND_15 = {1{`RANDOM}};
  mem_0_15 = _RAND_15[15:0];
  _RAND_16 = {1{`RANDOM}};
  mem_1_0 = _RAND_16[15:0];
  _RAND_17 = {1{`RANDOM}};
  mem_1_1 = _RAND_17[15:0];
  _RAND_18 = {1{`RANDOM}};
  mem_1_2 = _RAND_18[15:0];
  _RAND_19 = {1{`RANDOM}};
  mem_1_3 = _RAND_19[15:0];
  _RAND_20 = {1{`RANDOM}};
  mem_1_4 = _RAND_20[15:0];
  _RAND_21 = {1{`RANDOM}};
  mem_1_5 = _RAND_21[15:0];
  _RAND_22 = {1{`RANDOM}};
  mem_1_6 = _RAND_22[15:0];
  _RAND_23 = {1{`RANDOM}};
  mem_1_7 = _RAND_23[15:0];
  _RAND_24 = {1{`RANDOM}};
  mem_1_8 = _RAND_24[15:0];
  _RAND_25 = {1{`RANDOM}};
  mem_1_9 = _RAND_25[15:0];
  _RAND_26 = {1{`RANDOM}};
  mem_1_10 = _RAND_26[15:0];
  _RAND_27 = {1{`RANDOM}};
  mem_1_11 = _RAND_27[15:0];
  _RAND_28 = {1{`RANDOM}};
  mem_1_12 = _RAND_28[15:0];
  _RAND_29 = {1{`RANDOM}};
  mem_1_13 = _RAND_29[15:0];
  _RAND_30 = {1{`RANDOM}};
  mem_1_14 = _RAND_30[15:0];
  _RAND_31 = {1{`RANDOM}};
  mem_1_15 = _RAND_31[15:0];
  _RAND_32 = {1{`RANDOM}};
  mem_2_0 = _RAND_32[15:0];
  _RAND_33 = {1{`RANDOM}};
  mem_2_1 = _RAND_33[15:0];
  _RAND_34 = {1{`RANDOM}};
  mem_2_2 = _RAND_34[15:0];
  _RAND_35 = {1{`RANDOM}};
  mem_2_3 = _RAND_35[15:0];
  _RAND_36 = {1{`RANDOM}};
  mem_2_4 = _RAND_36[15:0];
  _RAND_37 = {1{`RANDOM}};
  mem_2_5 = _RAND_37[15:0];
  _RAND_38 = {1{`RANDOM}};
  mem_2_6 = _RAND_38[15:0];
  _RAND_39 = {1{`RANDOM}};
  mem_2_7 = _RAND_39[15:0];
  _RAND_40 = {1{`RANDOM}};
  mem_2_8 = _RAND_40[15:0];
  _RAND_41 = {1{`RANDOM}};
  mem_2_9 = _RAND_41[15:0];
  _RAND_42 = {1{`RANDOM}};
  mem_2_10 = _RAND_42[15:0];
  _RAND_43 = {1{`RANDOM}};
  mem_2_11 = _RAND_43[15:0];
  _RAND_44 = {1{`RANDOM}};
  mem_2_12 = _RAND_44[15:0];
  _RAND_45 = {1{`RANDOM}};
  mem_2_13 = _RAND_45[15:0];
  _RAND_46 = {1{`RANDOM}};
  mem_2_14 = _RAND_46[15:0];
  _RAND_47 = {1{`RANDOM}};
  mem_2_15 = _RAND_47[15:0];
  _RAND_48 = {1{`RANDOM}};
  mem_3_0 = _RAND_48[15:0];
  _RAND_49 = {1{`RANDOM}};
  mem_3_1 = _RAND_49[15:0];
  _RAND_50 = {1{`RANDOM}};
  mem_3_2 = _RAND_50[15:0];
  _RAND_51 = {1{`RANDOM}};
  mem_3_3 = _RAND_51[15:0];
  _RAND_52 = {1{`RANDOM}};
  mem_3_4 = _RAND_52[15:0];
  _RAND_53 = {1{`RANDOM}};
  mem_3_5 = _RAND_53[15:0];
  _RAND_54 = {1{`RANDOM}};
  mem_3_6 = _RAND_54[15:0];
  _RAND_55 = {1{`RANDOM}};
  mem_3_7 = _RAND_55[15:0];
  _RAND_56 = {1{`RANDOM}};
  mem_3_8 = _RAND_56[15:0];
  _RAND_57 = {1{`RANDOM}};
  mem_3_9 = _RAND_57[15:0];
  _RAND_58 = {1{`RANDOM}};
  mem_3_10 = _RAND_58[15:0];
  _RAND_59 = {1{`RANDOM}};
  mem_3_11 = _RAND_59[15:0];
  _RAND_60 = {1{`RANDOM}};
  mem_3_12 = _RAND_60[15:0];
  _RAND_61 = {1{`RANDOM}};
  mem_3_13 = _RAND_61[15:0];
  _RAND_62 = {1{`RANDOM}};
  mem_3_14 = _RAND_62[15:0];
  _RAND_63 = {1{`RANDOM}};
  mem_3_15 = _RAND_63[15:0];
  _RAND_64 = {1{`RANDOM}};
  mem_4_0 = _RAND_64[15:0];
  _RAND_65 = {1{`RANDOM}};
  mem_4_1 = _RAND_65[15:0];
  _RAND_66 = {1{`RANDOM}};
  mem_4_2 = _RAND_66[15:0];
  _RAND_67 = {1{`RANDOM}};
  mem_4_3 = _RAND_67[15:0];
  _RAND_68 = {1{`RANDOM}};
  mem_4_4 = _RAND_68[15:0];
  _RAND_69 = {1{`RANDOM}};
  mem_4_5 = _RAND_69[15:0];
  _RAND_70 = {1{`RANDOM}};
  mem_4_6 = _RAND_70[15:0];
  _RAND_71 = {1{`RANDOM}};
  mem_4_7 = _RAND_71[15:0];
  _RAND_72 = {1{`RANDOM}};
  mem_4_8 = _RAND_72[15:0];
  _RAND_73 = {1{`RANDOM}};
  mem_4_9 = _RAND_73[15:0];
  _RAND_74 = {1{`RANDOM}};
  mem_4_10 = _RAND_74[15:0];
  _RAND_75 = {1{`RANDOM}};
  mem_4_11 = _RAND_75[15:0];
  _RAND_76 = {1{`RANDOM}};
  mem_4_12 = _RAND_76[15:0];
  _RAND_77 = {1{`RANDOM}};
  mem_4_13 = _RAND_77[15:0];
  _RAND_78 = {1{`RANDOM}};
  mem_4_14 = _RAND_78[15:0];
  _RAND_79 = {1{`RANDOM}};
  mem_4_15 = _RAND_79[15:0];
  _RAND_80 = {1{`RANDOM}};
  mem_5_0 = _RAND_80[15:0];
  _RAND_81 = {1{`RANDOM}};
  mem_5_1 = _RAND_81[15:0];
  _RAND_82 = {1{`RANDOM}};
  mem_5_2 = _RAND_82[15:0];
  _RAND_83 = {1{`RANDOM}};
  mem_5_3 = _RAND_83[15:0];
  _RAND_84 = {1{`RANDOM}};
  mem_5_4 = _RAND_84[15:0];
  _RAND_85 = {1{`RANDOM}};
  mem_5_5 = _RAND_85[15:0];
  _RAND_86 = {1{`RANDOM}};
  mem_5_6 = _RAND_86[15:0];
  _RAND_87 = {1{`RANDOM}};
  mem_5_7 = _RAND_87[15:0];
  _RAND_88 = {1{`RANDOM}};
  mem_5_8 = _RAND_88[15:0];
  _RAND_89 = {1{`RANDOM}};
  mem_5_9 = _RAND_89[15:0];
  _RAND_90 = {1{`RANDOM}};
  mem_5_10 = _RAND_90[15:0];
  _RAND_91 = {1{`RANDOM}};
  mem_5_11 = _RAND_91[15:0];
  _RAND_92 = {1{`RANDOM}};
  mem_5_12 = _RAND_92[15:0];
  _RAND_93 = {1{`RANDOM}};
  mem_5_13 = _RAND_93[15:0];
  _RAND_94 = {1{`RANDOM}};
  mem_5_14 = _RAND_94[15:0];
  _RAND_95 = {1{`RANDOM}};
  mem_5_15 = _RAND_95[15:0];
  _RAND_96 = {1{`RANDOM}};
  mem_6_0 = _RAND_96[15:0];
  _RAND_97 = {1{`RANDOM}};
  mem_6_1 = _RAND_97[15:0];
  _RAND_98 = {1{`RANDOM}};
  mem_6_2 = _RAND_98[15:0];
  _RAND_99 = {1{`RANDOM}};
  mem_6_3 = _RAND_99[15:0];
  _RAND_100 = {1{`RANDOM}};
  mem_6_4 = _RAND_100[15:0];
  _RAND_101 = {1{`RANDOM}};
  mem_6_5 = _RAND_101[15:0];
  _RAND_102 = {1{`RANDOM}};
  mem_6_6 = _RAND_102[15:0];
  _RAND_103 = {1{`RANDOM}};
  mem_6_7 = _RAND_103[15:0];
  _RAND_104 = {1{`RANDOM}};
  mem_6_8 = _RAND_104[15:0];
  _RAND_105 = {1{`RANDOM}};
  mem_6_9 = _RAND_105[15:0];
  _RAND_106 = {1{`RANDOM}};
  mem_6_10 = _RAND_106[15:0];
  _RAND_107 = {1{`RANDOM}};
  mem_6_11 = _RAND_107[15:0];
  _RAND_108 = {1{`RANDOM}};
  mem_6_12 = _RAND_108[15:0];
  _RAND_109 = {1{`RANDOM}};
  mem_6_13 = _RAND_109[15:0];
  _RAND_110 = {1{`RANDOM}};
  mem_6_14 = _RAND_110[15:0];
  _RAND_111 = {1{`RANDOM}};
  mem_6_15 = _RAND_111[15:0];
  _RAND_112 = {1{`RANDOM}};
  mem_7_0 = _RAND_112[15:0];
  _RAND_113 = {1{`RANDOM}};
  mem_7_1 = _RAND_113[15:0];
  _RAND_114 = {1{`RANDOM}};
  mem_7_2 = _RAND_114[15:0];
  _RAND_115 = {1{`RANDOM}};
  mem_7_3 = _RAND_115[15:0];
  _RAND_116 = {1{`RANDOM}};
  mem_7_4 = _RAND_116[15:0];
  _RAND_117 = {1{`RANDOM}};
  mem_7_5 = _RAND_117[15:0];
  _RAND_118 = {1{`RANDOM}};
  mem_7_6 = _RAND_118[15:0];
  _RAND_119 = {1{`RANDOM}};
  mem_7_7 = _RAND_119[15:0];
  _RAND_120 = {1{`RANDOM}};
  mem_7_8 = _RAND_120[15:0];
  _RAND_121 = {1{`RANDOM}};
  mem_7_9 = _RAND_121[15:0];
  _RAND_122 = {1{`RANDOM}};
  mem_7_10 = _RAND_122[15:0];
  _RAND_123 = {1{`RANDOM}};
  mem_7_11 = _RAND_123[15:0];
  _RAND_124 = {1{`RANDOM}};
  mem_7_12 = _RAND_124[15:0];
  _RAND_125 = {1{`RANDOM}};
  mem_7_13 = _RAND_125[15:0];
  _RAND_126 = {1{`RANDOM}};
  mem_7_14 = _RAND_126[15:0];
  _RAND_127 = {1{`RANDOM}};
  mem_7_15 = _RAND_127[15:0];
  _RAND_128 = {1{`RANDOM}};
  widx_widx_bin = _RAND_128[3:0];
  _RAND_129 = {1{`RANDOM}};
  ready_reg = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  widx_gray = _RAND_130[3:0];
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
module ClockCrossingReg_w256(
  input          clock,
  input  [255:0] io_d, // @[src/main/scala/util/SynchronizerReg.scala 195:14]
  output [255:0] io_q, // @[src/main/scala/util/SynchronizerReg.scala 195:14]
  input          io_en // @[src/main/scala/util/SynchronizerReg.scala 195:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [255:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [255:0] cdc_reg; // @[src/main/scala/util/SynchronizerReg.scala 201:76]
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
  _RAND_0 = {8{`RANDOM}};
  cdc_reg = _RAND_0[255:0];
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
  output [15:0] io_deq_bits_0, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [15:0] io_deq_bits_1, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [15:0] io_deq_bits_2, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [15:0] io_deq_bits_3, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [15:0] io_deq_bits_4, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [15:0] io_deq_bits_5, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [15:0] io_deq_bits_6, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [15:0] io_deq_bits_7, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [15:0] io_deq_bits_8, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [15:0] io_deq_bits_9, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [15:0] io_deq_bits_10, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [15:0] io_deq_bits_11, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [15:0] io_deq_bits_12, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [15:0] io_deq_bits_13, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [15:0] io_deq_bits_14, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  output [15:0] io_deq_bits_15, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_0_0, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_0_1, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_0_2, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_0_3, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_0_4, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_0_5, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_0_6, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_0_7, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_0_8, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_0_9, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_0_10, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_0_11, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_0_12, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_0_13, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_0_14, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_0_15, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_1_0, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_1_1, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_1_2, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_1_3, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_1_4, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_1_5, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_1_6, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_1_7, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_1_8, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_1_9, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_1_10, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_1_11, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_1_12, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_1_13, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_1_14, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_1_15, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_2_0, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_2_1, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_2_2, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_2_3, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_2_4, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_2_5, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_2_6, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_2_7, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_2_8, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_2_9, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_2_10, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_2_11, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_2_12, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_2_13, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_2_14, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_2_15, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_3_0, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_3_1, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_3_2, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_3_3, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_3_4, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_3_5, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_3_6, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_3_7, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_3_8, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_3_9, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_3_10, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_3_11, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_3_12, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_3_13, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_3_14, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_3_15, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_4_0, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_4_1, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_4_2, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_4_3, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_4_4, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_4_5, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_4_6, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_4_7, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_4_8, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_4_9, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_4_10, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_4_11, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_4_12, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_4_13, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_4_14, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_4_15, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_5_0, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_5_1, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_5_2, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_5_3, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_5_4, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_5_5, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_5_6, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_5_7, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_5_8, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_5_9, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_5_10, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_5_11, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_5_12, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_5_13, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_5_14, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_5_15, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_6_0, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_6_1, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_6_2, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_6_3, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_6_4, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_6_5, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_6_6, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_6_7, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_6_8, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_6_9, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_6_10, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_6_11, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_6_12, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_6_13, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_6_14, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_6_15, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_7_0, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_7_1, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_7_2, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_7_3, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_7_4, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_7_5, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_7_6, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_7_7, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_7_8, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_7_9, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_7_10, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_7_11, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_7_12, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_7_13, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_7_14, // @[src/main/scala/util/AsyncQueue.scala 135:14]
  input  [15:0] io_async_mem_7_15, // @[src/main/scala/util/AsyncQueue.scala 135:14]
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
  wire [255:0] io_deq_bits_deq_bits_reg_io_d; // @[src/main/scala/util/SynchronizerReg.scala 207:25]
  wire [255:0] io_deq_bits_deq_bits_reg_io_q; // @[src/main/scala/util/SynchronizerReg.scala 207:25]
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
  wire [3:0] _GEN_128 = {{3'd0}, _ridx_T_1}; // @[src/main/scala/util/AsyncQueue.scala 53:43]
  wire [3:0] _ridx_incremented_T_1 = ridx_ridx_bin + _GEN_128; // @[src/main/scala/util/AsyncQueue.scala 53:43]
  wire [3:0] ridx_incremented = _ridx_T_2 ? 4'h0 : _ridx_incremented_T_1; // @[src/main/scala/util/AsyncQueue.scala 53:23]
  wire [3:0] _GEN_129 = {{1'd0}, ridx_incremented[3:1]}; // @[src/main/scala/util/AsyncQueue.scala 54:17]
  wire [3:0] ridx = ridx_incremented ^ _GEN_129; // @[src/main/scala/util/AsyncQueue.scala 54:17]
  wire [3:0] widx = widx_widx_gray_io_q; // @[src/main/scala/util/ShiftReg.scala 48:{24,24}]
  wire [2:0] _index_T_2 = {ridx[3], 2'h0}; // @[src/main/scala/util/AsyncQueue.scala 152:75]
  wire [2:0] index = ridx[2:0] ^ _index_T_2; // @[src/main/scala/util/AsyncQueue.scala 152:55]
  wire [15:0] _GEN_1 = 3'h1 == index ? io_async_mem_1_1 : io_async_mem_0_1; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_2 = 3'h2 == index ? io_async_mem_2_1 : _GEN_1; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_3 = 3'h3 == index ? io_async_mem_3_1 : _GEN_2; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_4 = 3'h4 == index ? io_async_mem_4_1 : _GEN_3; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_5 = 3'h5 == index ? io_async_mem_5_1 : _GEN_4; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_6 = 3'h6 == index ? io_async_mem_6_1 : _GEN_5; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_7 = 3'h7 == index ? io_async_mem_7_1 : _GEN_6; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_9 = 3'h1 == index ? io_async_mem_1_0 : io_async_mem_0_0; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_10 = 3'h2 == index ? io_async_mem_2_0 : _GEN_9; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_11 = 3'h3 == index ? io_async_mem_3_0 : _GEN_10; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_12 = 3'h4 == index ? io_async_mem_4_0 : _GEN_11; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_13 = 3'h5 == index ? io_async_mem_5_0 : _GEN_12; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_14 = 3'h6 == index ? io_async_mem_6_0 : _GEN_13; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_15 = 3'h7 == index ? io_async_mem_7_0 : _GEN_14; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_17 = 3'h1 == index ? io_async_mem_1_3 : io_async_mem_0_3; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_18 = 3'h2 == index ? io_async_mem_2_3 : _GEN_17; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_19 = 3'h3 == index ? io_async_mem_3_3 : _GEN_18; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_20 = 3'h4 == index ? io_async_mem_4_3 : _GEN_19; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_21 = 3'h5 == index ? io_async_mem_5_3 : _GEN_20; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_22 = 3'h6 == index ? io_async_mem_6_3 : _GEN_21; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_23 = 3'h7 == index ? io_async_mem_7_3 : _GEN_22; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_25 = 3'h1 == index ? io_async_mem_1_2 : io_async_mem_0_2; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_26 = 3'h2 == index ? io_async_mem_2_2 : _GEN_25; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_27 = 3'h3 == index ? io_async_mem_3_2 : _GEN_26; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_28 = 3'h4 == index ? io_async_mem_4_2 : _GEN_27; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_29 = 3'h5 == index ? io_async_mem_5_2 : _GEN_28; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_30 = 3'h6 == index ? io_async_mem_6_2 : _GEN_29; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_31 = 3'h7 == index ? io_async_mem_7_2 : _GEN_30; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_33 = 3'h1 == index ? io_async_mem_1_5 : io_async_mem_0_5; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_34 = 3'h2 == index ? io_async_mem_2_5 : _GEN_33; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_35 = 3'h3 == index ? io_async_mem_3_5 : _GEN_34; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_36 = 3'h4 == index ? io_async_mem_4_5 : _GEN_35; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_37 = 3'h5 == index ? io_async_mem_5_5 : _GEN_36; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_38 = 3'h6 == index ? io_async_mem_6_5 : _GEN_37; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_39 = 3'h7 == index ? io_async_mem_7_5 : _GEN_38; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_41 = 3'h1 == index ? io_async_mem_1_4 : io_async_mem_0_4; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_42 = 3'h2 == index ? io_async_mem_2_4 : _GEN_41; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_43 = 3'h3 == index ? io_async_mem_3_4 : _GEN_42; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_44 = 3'h4 == index ? io_async_mem_4_4 : _GEN_43; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_45 = 3'h5 == index ? io_async_mem_5_4 : _GEN_44; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_46 = 3'h6 == index ? io_async_mem_6_4 : _GEN_45; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_47 = 3'h7 == index ? io_async_mem_7_4 : _GEN_46; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_49 = 3'h1 == index ? io_async_mem_1_7 : io_async_mem_0_7; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_50 = 3'h2 == index ? io_async_mem_2_7 : _GEN_49; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_51 = 3'h3 == index ? io_async_mem_3_7 : _GEN_50; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_52 = 3'h4 == index ? io_async_mem_4_7 : _GEN_51; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_53 = 3'h5 == index ? io_async_mem_5_7 : _GEN_52; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_54 = 3'h6 == index ? io_async_mem_6_7 : _GEN_53; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_55 = 3'h7 == index ? io_async_mem_7_7 : _GEN_54; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_57 = 3'h1 == index ? io_async_mem_1_6 : io_async_mem_0_6; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_58 = 3'h2 == index ? io_async_mem_2_6 : _GEN_57; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_59 = 3'h3 == index ? io_async_mem_3_6 : _GEN_58; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_60 = 3'h4 == index ? io_async_mem_4_6 : _GEN_59; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_61 = 3'h5 == index ? io_async_mem_5_6 : _GEN_60; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_62 = 3'h6 == index ? io_async_mem_6_6 : _GEN_61; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_63 = 3'h7 == index ? io_async_mem_7_6 : _GEN_62; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [127:0] io_deq_bits_deq_bits_reg_io_d_lo = {_GEN_55,_GEN_63,_GEN_39,_GEN_47,_GEN_23,_GEN_31,_GEN_7,_GEN_15}; // @[src/main/scala/util/SynchronizerReg.scala 209:24]
  wire [15:0] _GEN_65 = 3'h1 == index ? io_async_mem_1_9 : io_async_mem_0_9; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_66 = 3'h2 == index ? io_async_mem_2_9 : _GEN_65; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_67 = 3'h3 == index ? io_async_mem_3_9 : _GEN_66; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_68 = 3'h4 == index ? io_async_mem_4_9 : _GEN_67; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_69 = 3'h5 == index ? io_async_mem_5_9 : _GEN_68; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_70 = 3'h6 == index ? io_async_mem_6_9 : _GEN_69; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_71 = 3'h7 == index ? io_async_mem_7_9 : _GEN_70; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_73 = 3'h1 == index ? io_async_mem_1_8 : io_async_mem_0_8; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_74 = 3'h2 == index ? io_async_mem_2_8 : _GEN_73; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_75 = 3'h3 == index ? io_async_mem_3_8 : _GEN_74; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_76 = 3'h4 == index ? io_async_mem_4_8 : _GEN_75; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_77 = 3'h5 == index ? io_async_mem_5_8 : _GEN_76; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_78 = 3'h6 == index ? io_async_mem_6_8 : _GEN_77; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_79 = 3'h7 == index ? io_async_mem_7_8 : _GEN_78; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_81 = 3'h1 == index ? io_async_mem_1_11 : io_async_mem_0_11; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_82 = 3'h2 == index ? io_async_mem_2_11 : _GEN_81; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_83 = 3'h3 == index ? io_async_mem_3_11 : _GEN_82; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_84 = 3'h4 == index ? io_async_mem_4_11 : _GEN_83; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_85 = 3'h5 == index ? io_async_mem_5_11 : _GEN_84; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_86 = 3'h6 == index ? io_async_mem_6_11 : _GEN_85; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_87 = 3'h7 == index ? io_async_mem_7_11 : _GEN_86; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_89 = 3'h1 == index ? io_async_mem_1_10 : io_async_mem_0_10; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_90 = 3'h2 == index ? io_async_mem_2_10 : _GEN_89; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_91 = 3'h3 == index ? io_async_mem_3_10 : _GEN_90; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_92 = 3'h4 == index ? io_async_mem_4_10 : _GEN_91; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_93 = 3'h5 == index ? io_async_mem_5_10 : _GEN_92; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_94 = 3'h6 == index ? io_async_mem_6_10 : _GEN_93; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_95 = 3'h7 == index ? io_async_mem_7_10 : _GEN_94; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_97 = 3'h1 == index ? io_async_mem_1_13 : io_async_mem_0_13; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_98 = 3'h2 == index ? io_async_mem_2_13 : _GEN_97; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_99 = 3'h3 == index ? io_async_mem_3_13 : _GEN_98; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_100 = 3'h4 == index ? io_async_mem_4_13 : _GEN_99; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_101 = 3'h5 == index ? io_async_mem_5_13 : _GEN_100; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_102 = 3'h6 == index ? io_async_mem_6_13 : _GEN_101; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_103 = 3'h7 == index ? io_async_mem_7_13 : _GEN_102; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_105 = 3'h1 == index ? io_async_mem_1_12 : io_async_mem_0_12; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_106 = 3'h2 == index ? io_async_mem_2_12 : _GEN_105; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_107 = 3'h3 == index ? io_async_mem_3_12 : _GEN_106; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_108 = 3'h4 == index ? io_async_mem_4_12 : _GEN_107; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_109 = 3'h5 == index ? io_async_mem_5_12 : _GEN_108; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_110 = 3'h6 == index ? io_async_mem_6_12 : _GEN_109; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_111 = 3'h7 == index ? io_async_mem_7_12 : _GEN_110; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_113 = 3'h1 == index ? io_async_mem_1_15 : io_async_mem_0_15; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_114 = 3'h2 == index ? io_async_mem_2_15 : _GEN_113; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_115 = 3'h3 == index ? io_async_mem_3_15 : _GEN_114; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_116 = 3'h4 == index ? io_async_mem_4_15 : _GEN_115; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_117 = 3'h5 == index ? io_async_mem_5_15 : _GEN_116; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_118 = 3'h6 == index ? io_async_mem_6_15 : _GEN_117; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_119 = 3'h7 == index ? io_async_mem_7_15 : _GEN_118; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_121 = 3'h1 == index ? io_async_mem_1_14 : io_async_mem_0_14; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_122 = 3'h2 == index ? io_async_mem_2_14 : _GEN_121; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_123 = 3'h3 == index ? io_async_mem_3_14 : _GEN_122; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_124 = 3'h4 == index ? io_async_mem_4_14 : _GEN_123; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_125 = 3'h5 == index ? io_async_mem_5_14 : _GEN_124; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_126 = 3'h6 == index ? io_async_mem_6_14 : _GEN_125; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [15:0] _GEN_127 = 3'h7 == index ? io_async_mem_7_14 : _GEN_126; // @[src/main/scala/util/SynchronizerReg.scala 209:{24,24}]
  wire [127:0] io_deq_bits_deq_bits_reg_io_d_hi = {_GEN_119,_GEN_127,_GEN_103,_GEN_111,_GEN_87,_GEN_95,_GEN_71,_GEN_79}; // @[src/main/scala/util/SynchronizerReg.scala 209:24]
  wire [255:0] _io_deq_bits_WIRE_1 = io_deq_bits_deq_bits_reg_io_q; // @[src/main/scala/util/SynchronizerReg.scala 211:{26,26}]
  reg  valid_reg; // @[src/main/scala/util/AsyncQueue.scala 161:56]
  reg [3:0] ridx_gray; // @[src/main/scala/util/AsyncQueue.scala 164:55]
  AsyncResetSynchronizerShiftReg_w4_d3_i0 widx_widx_gray ( // @[src/main/scala/util/ShiftReg.scala 45:23]
    .clock(widx_widx_gray_clock),
    .reset(widx_widx_gray_reset),
    .io_d(widx_widx_gray_io_d),
    .io_q(widx_widx_gray_io_q)
  );
  ClockCrossingReg_w256 io_deq_bits_deq_bits_reg ( // @[src/main/scala/util/SynchronizerReg.scala 207:25]
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
  assign io_deq_bits_0 = _io_deq_bits_WIRE_1[15:0]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_deq_bits_1 = _io_deq_bits_WIRE_1[31:16]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_deq_bits_2 = _io_deq_bits_WIRE_1[47:32]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_deq_bits_3 = _io_deq_bits_WIRE_1[63:48]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_deq_bits_4 = _io_deq_bits_WIRE_1[79:64]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_deq_bits_5 = _io_deq_bits_WIRE_1[95:80]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_deq_bits_6 = _io_deq_bits_WIRE_1[111:96]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_deq_bits_7 = _io_deq_bits_WIRE_1[127:112]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_deq_bits_8 = _io_deq_bits_WIRE_1[143:128]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_deq_bits_9 = _io_deq_bits_WIRE_1[159:144]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_deq_bits_10 = _io_deq_bits_WIRE_1[175:160]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_deq_bits_11 = _io_deq_bits_WIRE_1[191:176]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_deq_bits_12 = _io_deq_bits_WIRE_1[207:192]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_deq_bits_13 = _io_deq_bits_WIRE_1[223:208]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_deq_bits_14 = _io_deq_bits_WIRE_1[239:224]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
  assign io_deq_bits_15 = _io_deq_bits_WIRE_1[255:240]; // @[src/main/scala/util/SynchronizerReg.scala 211:26]
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
      ridx_gray <= ridx_incremented ^ _GEN_129;
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
  input  [15:0] io_enq_bits_0, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_1, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_2, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_3, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_4, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_5, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_6, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_7, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_8, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_9, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_10, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_11, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_12, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_13, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_14, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_15, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input         io_deq_clock, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input         io_deq_reset, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input         io_deq_ready, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output        io_deq_valid, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_0, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_1, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_2, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_3, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_4, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_5, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_6, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_7, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_8, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_9, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_10, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_11, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_12, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_13, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_14, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_15 // @[src/main/scala/util/AsyncQueue.scala 223:14]
);
  wire  source_clock; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_reset; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_io_enq_ready; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_io_enq_valid; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_4; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_5; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_6; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_7; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_8; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_9; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_10; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_11; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_12; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_13; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_14; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_15; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_4; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_5; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_6; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_7; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_8; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_9; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_10; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_11; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_12; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_13; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_14; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_15; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_4; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_5; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_6; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_7; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_8; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_9; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_10; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_11; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_12; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_13; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_14; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_15; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_4; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_5; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_6; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_7; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_8; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_9; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_10; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_11; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_12; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_13; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_14; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_15; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_4; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_5; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_6; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_7; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_8; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_9; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_10; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_11; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_12; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_13; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_14; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_15; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_4; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_5; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_6; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_7; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_8; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_9; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_10; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_11; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_12; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_13; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_14; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_15; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_4; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_5; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_6; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_7; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_8; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_9; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_10; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_11; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_12; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_13; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_14; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_15; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_4; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_5; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_6; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_7; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_8; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_9; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_10; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_11; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_12; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_13; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_14; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_15; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_4; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_5; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_6; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_7; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_8; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_9; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_10; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_11; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_12; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_13; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_14; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_15; // @[src/main/scala/util/AsyncQueue.scala 224:70]
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
  wire [15:0] sink_io_deq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_4; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_5; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_6; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_7; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_8; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_9; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_10; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_11; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_12; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_13; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_14; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_15; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_4; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_5; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_6; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_7; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_8; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_9; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_10; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_11; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_12; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_13; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_14; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_15; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_4; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_5; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_6; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_7; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_8; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_9; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_10; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_11; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_12; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_13; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_14; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_15; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_4; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_5; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_6; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_7; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_8; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_9; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_10; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_11; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_12; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_13; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_14; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_15; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_4; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_5; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_6; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_7; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_8; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_9; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_10; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_11; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_12; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_13; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_14; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_15; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_4; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_5; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_6; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_7; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_8; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_9; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_10; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_11; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_12; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_13; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_14; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_15; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_4; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_5; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_6; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_7; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_8; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_9; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_10; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_11; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_12; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_13; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_14; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_15; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_4; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_5; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_6; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_7; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_8; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_9; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_10; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_11; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_12; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_13; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_14; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_15; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_4; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_5; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_6; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_7; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_8; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_9; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_10; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_11; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_12; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_13; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_14; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_15; // @[src/main/scala/util/AsyncQueue.scala 225:70]
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
    .io_enq_bits_4(source_io_enq_bits_4),
    .io_enq_bits_5(source_io_enq_bits_5),
    .io_enq_bits_6(source_io_enq_bits_6),
    .io_enq_bits_7(source_io_enq_bits_7),
    .io_enq_bits_8(source_io_enq_bits_8),
    .io_enq_bits_9(source_io_enq_bits_9),
    .io_enq_bits_10(source_io_enq_bits_10),
    .io_enq_bits_11(source_io_enq_bits_11),
    .io_enq_bits_12(source_io_enq_bits_12),
    .io_enq_bits_13(source_io_enq_bits_13),
    .io_enq_bits_14(source_io_enq_bits_14),
    .io_enq_bits_15(source_io_enq_bits_15),
    .io_async_mem_0_0(source_io_async_mem_0_0),
    .io_async_mem_0_1(source_io_async_mem_0_1),
    .io_async_mem_0_2(source_io_async_mem_0_2),
    .io_async_mem_0_3(source_io_async_mem_0_3),
    .io_async_mem_0_4(source_io_async_mem_0_4),
    .io_async_mem_0_5(source_io_async_mem_0_5),
    .io_async_mem_0_6(source_io_async_mem_0_6),
    .io_async_mem_0_7(source_io_async_mem_0_7),
    .io_async_mem_0_8(source_io_async_mem_0_8),
    .io_async_mem_0_9(source_io_async_mem_0_9),
    .io_async_mem_0_10(source_io_async_mem_0_10),
    .io_async_mem_0_11(source_io_async_mem_0_11),
    .io_async_mem_0_12(source_io_async_mem_0_12),
    .io_async_mem_0_13(source_io_async_mem_0_13),
    .io_async_mem_0_14(source_io_async_mem_0_14),
    .io_async_mem_0_15(source_io_async_mem_0_15),
    .io_async_mem_1_0(source_io_async_mem_1_0),
    .io_async_mem_1_1(source_io_async_mem_1_1),
    .io_async_mem_1_2(source_io_async_mem_1_2),
    .io_async_mem_1_3(source_io_async_mem_1_3),
    .io_async_mem_1_4(source_io_async_mem_1_4),
    .io_async_mem_1_5(source_io_async_mem_1_5),
    .io_async_mem_1_6(source_io_async_mem_1_6),
    .io_async_mem_1_7(source_io_async_mem_1_7),
    .io_async_mem_1_8(source_io_async_mem_1_8),
    .io_async_mem_1_9(source_io_async_mem_1_9),
    .io_async_mem_1_10(source_io_async_mem_1_10),
    .io_async_mem_1_11(source_io_async_mem_1_11),
    .io_async_mem_1_12(source_io_async_mem_1_12),
    .io_async_mem_1_13(source_io_async_mem_1_13),
    .io_async_mem_1_14(source_io_async_mem_1_14),
    .io_async_mem_1_15(source_io_async_mem_1_15),
    .io_async_mem_2_0(source_io_async_mem_2_0),
    .io_async_mem_2_1(source_io_async_mem_2_1),
    .io_async_mem_2_2(source_io_async_mem_2_2),
    .io_async_mem_2_3(source_io_async_mem_2_3),
    .io_async_mem_2_4(source_io_async_mem_2_4),
    .io_async_mem_2_5(source_io_async_mem_2_5),
    .io_async_mem_2_6(source_io_async_mem_2_6),
    .io_async_mem_2_7(source_io_async_mem_2_7),
    .io_async_mem_2_8(source_io_async_mem_2_8),
    .io_async_mem_2_9(source_io_async_mem_2_9),
    .io_async_mem_2_10(source_io_async_mem_2_10),
    .io_async_mem_2_11(source_io_async_mem_2_11),
    .io_async_mem_2_12(source_io_async_mem_2_12),
    .io_async_mem_2_13(source_io_async_mem_2_13),
    .io_async_mem_2_14(source_io_async_mem_2_14),
    .io_async_mem_2_15(source_io_async_mem_2_15),
    .io_async_mem_3_0(source_io_async_mem_3_0),
    .io_async_mem_3_1(source_io_async_mem_3_1),
    .io_async_mem_3_2(source_io_async_mem_3_2),
    .io_async_mem_3_3(source_io_async_mem_3_3),
    .io_async_mem_3_4(source_io_async_mem_3_4),
    .io_async_mem_3_5(source_io_async_mem_3_5),
    .io_async_mem_3_6(source_io_async_mem_3_6),
    .io_async_mem_3_7(source_io_async_mem_3_7),
    .io_async_mem_3_8(source_io_async_mem_3_8),
    .io_async_mem_3_9(source_io_async_mem_3_9),
    .io_async_mem_3_10(source_io_async_mem_3_10),
    .io_async_mem_3_11(source_io_async_mem_3_11),
    .io_async_mem_3_12(source_io_async_mem_3_12),
    .io_async_mem_3_13(source_io_async_mem_3_13),
    .io_async_mem_3_14(source_io_async_mem_3_14),
    .io_async_mem_3_15(source_io_async_mem_3_15),
    .io_async_mem_4_0(source_io_async_mem_4_0),
    .io_async_mem_4_1(source_io_async_mem_4_1),
    .io_async_mem_4_2(source_io_async_mem_4_2),
    .io_async_mem_4_3(source_io_async_mem_4_3),
    .io_async_mem_4_4(source_io_async_mem_4_4),
    .io_async_mem_4_5(source_io_async_mem_4_5),
    .io_async_mem_4_6(source_io_async_mem_4_6),
    .io_async_mem_4_7(source_io_async_mem_4_7),
    .io_async_mem_4_8(source_io_async_mem_4_8),
    .io_async_mem_4_9(source_io_async_mem_4_9),
    .io_async_mem_4_10(source_io_async_mem_4_10),
    .io_async_mem_4_11(source_io_async_mem_4_11),
    .io_async_mem_4_12(source_io_async_mem_4_12),
    .io_async_mem_4_13(source_io_async_mem_4_13),
    .io_async_mem_4_14(source_io_async_mem_4_14),
    .io_async_mem_4_15(source_io_async_mem_4_15),
    .io_async_mem_5_0(source_io_async_mem_5_0),
    .io_async_mem_5_1(source_io_async_mem_5_1),
    .io_async_mem_5_2(source_io_async_mem_5_2),
    .io_async_mem_5_3(source_io_async_mem_5_3),
    .io_async_mem_5_4(source_io_async_mem_5_4),
    .io_async_mem_5_5(source_io_async_mem_5_5),
    .io_async_mem_5_6(source_io_async_mem_5_6),
    .io_async_mem_5_7(source_io_async_mem_5_7),
    .io_async_mem_5_8(source_io_async_mem_5_8),
    .io_async_mem_5_9(source_io_async_mem_5_9),
    .io_async_mem_5_10(source_io_async_mem_5_10),
    .io_async_mem_5_11(source_io_async_mem_5_11),
    .io_async_mem_5_12(source_io_async_mem_5_12),
    .io_async_mem_5_13(source_io_async_mem_5_13),
    .io_async_mem_5_14(source_io_async_mem_5_14),
    .io_async_mem_5_15(source_io_async_mem_5_15),
    .io_async_mem_6_0(source_io_async_mem_6_0),
    .io_async_mem_6_1(source_io_async_mem_6_1),
    .io_async_mem_6_2(source_io_async_mem_6_2),
    .io_async_mem_6_3(source_io_async_mem_6_3),
    .io_async_mem_6_4(source_io_async_mem_6_4),
    .io_async_mem_6_5(source_io_async_mem_6_5),
    .io_async_mem_6_6(source_io_async_mem_6_6),
    .io_async_mem_6_7(source_io_async_mem_6_7),
    .io_async_mem_6_8(source_io_async_mem_6_8),
    .io_async_mem_6_9(source_io_async_mem_6_9),
    .io_async_mem_6_10(source_io_async_mem_6_10),
    .io_async_mem_6_11(source_io_async_mem_6_11),
    .io_async_mem_6_12(source_io_async_mem_6_12),
    .io_async_mem_6_13(source_io_async_mem_6_13),
    .io_async_mem_6_14(source_io_async_mem_6_14),
    .io_async_mem_6_15(source_io_async_mem_6_15),
    .io_async_mem_7_0(source_io_async_mem_7_0),
    .io_async_mem_7_1(source_io_async_mem_7_1),
    .io_async_mem_7_2(source_io_async_mem_7_2),
    .io_async_mem_7_3(source_io_async_mem_7_3),
    .io_async_mem_7_4(source_io_async_mem_7_4),
    .io_async_mem_7_5(source_io_async_mem_7_5),
    .io_async_mem_7_6(source_io_async_mem_7_6),
    .io_async_mem_7_7(source_io_async_mem_7_7),
    .io_async_mem_7_8(source_io_async_mem_7_8),
    .io_async_mem_7_9(source_io_async_mem_7_9),
    .io_async_mem_7_10(source_io_async_mem_7_10),
    .io_async_mem_7_11(source_io_async_mem_7_11),
    .io_async_mem_7_12(source_io_async_mem_7_12),
    .io_async_mem_7_13(source_io_async_mem_7_13),
    .io_async_mem_7_14(source_io_async_mem_7_14),
    .io_async_mem_7_15(source_io_async_mem_7_15),
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
    .io_deq_bits_4(sink_io_deq_bits_4),
    .io_deq_bits_5(sink_io_deq_bits_5),
    .io_deq_bits_6(sink_io_deq_bits_6),
    .io_deq_bits_7(sink_io_deq_bits_7),
    .io_deq_bits_8(sink_io_deq_bits_8),
    .io_deq_bits_9(sink_io_deq_bits_9),
    .io_deq_bits_10(sink_io_deq_bits_10),
    .io_deq_bits_11(sink_io_deq_bits_11),
    .io_deq_bits_12(sink_io_deq_bits_12),
    .io_deq_bits_13(sink_io_deq_bits_13),
    .io_deq_bits_14(sink_io_deq_bits_14),
    .io_deq_bits_15(sink_io_deq_bits_15),
    .io_async_mem_0_0(sink_io_async_mem_0_0),
    .io_async_mem_0_1(sink_io_async_mem_0_1),
    .io_async_mem_0_2(sink_io_async_mem_0_2),
    .io_async_mem_0_3(sink_io_async_mem_0_3),
    .io_async_mem_0_4(sink_io_async_mem_0_4),
    .io_async_mem_0_5(sink_io_async_mem_0_5),
    .io_async_mem_0_6(sink_io_async_mem_0_6),
    .io_async_mem_0_7(sink_io_async_mem_0_7),
    .io_async_mem_0_8(sink_io_async_mem_0_8),
    .io_async_mem_0_9(sink_io_async_mem_0_9),
    .io_async_mem_0_10(sink_io_async_mem_0_10),
    .io_async_mem_0_11(sink_io_async_mem_0_11),
    .io_async_mem_0_12(sink_io_async_mem_0_12),
    .io_async_mem_0_13(sink_io_async_mem_0_13),
    .io_async_mem_0_14(sink_io_async_mem_0_14),
    .io_async_mem_0_15(sink_io_async_mem_0_15),
    .io_async_mem_1_0(sink_io_async_mem_1_0),
    .io_async_mem_1_1(sink_io_async_mem_1_1),
    .io_async_mem_1_2(sink_io_async_mem_1_2),
    .io_async_mem_1_3(sink_io_async_mem_1_3),
    .io_async_mem_1_4(sink_io_async_mem_1_4),
    .io_async_mem_1_5(sink_io_async_mem_1_5),
    .io_async_mem_1_6(sink_io_async_mem_1_6),
    .io_async_mem_1_7(sink_io_async_mem_1_7),
    .io_async_mem_1_8(sink_io_async_mem_1_8),
    .io_async_mem_1_9(sink_io_async_mem_1_9),
    .io_async_mem_1_10(sink_io_async_mem_1_10),
    .io_async_mem_1_11(sink_io_async_mem_1_11),
    .io_async_mem_1_12(sink_io_async_mem_1_12),
    .io_async_mem_1_13(sink_io_async_mem_1_13),
    .io_async_mem_1_14(sink_io_async_mem_1_14),
    .io_async_mem_1_15(sink_io_async_mem_1_15),
    .io_async_mem_2_0(sink_io_async_mem_2_0),
    .io_async_mem_2_1(sink_io_async_mem_2_1),
    .io_async_mem_2_2(sink_io_async_mem_2_2),
    .io_async_mem_2_3(sink_io_async_mem_2_3),
    .io_async_mem_2_4(sink_io_async_mem_2_4),
    .io_async_mem_2_5(sink_io_async_mem_2_5),
    .io_async_mem_2_6(sink_io_async_mem_2_6),
    .io_async_mem_2_7(sink_io_async_mem_2_7),
    .io_async_mem_2_8(sink_io_async_mem_2_8),
    .io_async_mem_2_9(sink_io_async_mem_2_9),
    .io_async_mem_2_10(sink_io_async_mem_2_10),
    .io_async_mem_2_11(sink_io_async_mem_2_11),
    .io_async_mem_2_12(sink_io_async_mem_2_12),
    .io_async_mem_2_13(sink_io_async_mem_2_13),
    .io_async_mem_2_14(sink_io_async_mem_2_14),
    .io_async_mem_2_15(sink_io_async_mem_2_15),
    .io_async_mem_3_0(sink_io_async_mem_3_0),
    .io_async_mem_3_1(sink_io_async_mem_3_1),
    .io_async_mem_3_2(sink_io_async_mem_3_2),
    .io_async_mem_3_3(sink_io_async_mem_3_3),
    .io_async_mem_3_4(sink_io_async_mem_3_4),
    .io_async_mem_3_5(sink_io_async_mem_3_5),
    .io_async_mem_3_6(sink_io_async_mem_3_6),
    .io_async_mem_3_7(sink_io_async_mem_3_7),
    .io_async_mem_3_8(sink_io_async_mem_3_8),
    .io_async_mem_3_9(sink_io_async_mem_3_9),
    .io_async_mem_3_10(sink_io_async_mem_3_10),
    .io_async_mem_3_11(sink_io_async_mem_3_11),
    .io_async_mem_3_12(sink_io_async_mem_3_12),
    .io_async_mem_3_13(sink_io_async_mem_3_13),
    .io_async_mem_3_14(sink_io_async_mem_3_14),
    .io_async_mem_3_15(sink_io_async_mem_3_15),
    .io_async_mem_4_0(sink_io_async_mem_4_0),
    .io_async_mem_4_1(sink_io_async_mem_4_1),
    .io_async_mem_4_2(sink_io_async_mem_4_2),
    .io_async_mem_4_3(sink_io_async_mem_4_3),
    .io_async_mem_4_4(sink_io_async_mem_4_4),
    .io_async_mem_4_5(sink_io_async_mem_4_5),
    .io_async_mem_4_6(sink_io_async_mem_4_6),
    .io_async_mem_4_7(sink_io_async_mem_4_7),
    .io_async_mem_4_8(sink_io_async_mem_4_8),
    .io_async_mem_4_9(sink_io_async_mem_4_9),
    .io_async_mem_4_10(sink_io_async_mem_4_10),
    .io_async_mem_4_11(sink_io_async_mem_4_11),
    .io_async_mem_4_12(sink_io_async_mem_4_12),
    .io_async_mem_4_13(sink_io_async_mem_4_13),
    .io_async_mem_4_14(sink_io_async_mem_4_14),
    .io_async_mem_4_15(sink_io_async_mem_4_15),
    .io_async_mem_5_0(sink_io_async_mem_5_0),
    .io_async_mem_5_1(sink_io_async_mem_5_1),
    .io_async_mem_5_2(sink_io_async_mem_5_2),
    .io_async_mem_5_3(sink_io_async_mem_5_3),
    .io_async_mem_5_4(sink_io_async_mem_5_4),
    .io_async_mem_5_5(sink_io_async_mem_5_5),
    .io_async_mem_5_6(sink_io_async_mem_5_6),
    .io_async_mem_5_7(sink_io_async_mem_5_7),
    .io_async_mem_5_8(sink_io_async_mem_5_8),
    .io_async_mem_5_9(sink_io_async_mem_5_9),
    .io_async_mem_5_10(sink_io_async_mem_5_10),
    .io_async_mem_5_11(sink_io_async_mem_5_11),
    .io_async_mem_5_12(sink_io_async_mem_5_12),
    .io_async_mem_5_13(sink_io_async_mem_5_13),
    .io_async_mem_5_14(sink_io_async_mem_5_14),
    .io_async_mem_5_15(sink_io_async_mem_5_15),
    .io_async_mem_6_0(sink_io_async_mem_6_0),
    .io_async_mem_6_1(sink_io_async_mem_6_1),
    .io_async_mem_6_2(sink_io_async_mem_6_2),
    .io_async_mem_6_3(sink_io_async_mem_6_3),
    .io_async_mem_6_4(sink_io_async_mem_6_4),
    .io_async_mem_6_5(sink_io_async_mem_6_5),
    .io_async_mem_6_6(sink_io_async_mem_6_6),
    .io_async_mem_6_7(sink_io_async_mem_6_7),
    .io_async_mem_6_8(sink_io_async_mem_6_8),
    .io_async_mem_6_9(sink_io_async_mem_6_9),
    .io_async_mem_6_10(sink_io_async_mem_6_10),
    .io_async_mem_6_11(sink_io_async_mem_6_11),
    .io_async_mem_6_12(sink_io_async_mem_6_12),
    .io_async_mem_6_13(sink_io_async_mem_6_13),
    .io_async_mem_6_14(sink_io_async_mem_6_14),
    .io_async_mem_6_15(sink_io_async_mem_6_15),
    .io_async_mem_7_0(sink_io_async_mem_7_0),
    .io_async_mem_7_1(sink_io_async_mem_7_1),
    .io_async_mem_7_2(sink_io_async_mem_7_2),
    .io_async_mem_7_3(sink_io_async_mem_7_3),
    .io_async_mem_7_4(sink_io_async_mem_7_4),
    .io_async_mem_7_5(sink_io_async_mem_7_5),
    .io_async_mem_7_6(sink_io_async_mem_7_6),
    .io_async_mem_7_7(sink_io_async_mem_7_7),
    .io_async_mem_7_8(sink_io_async_mem_7_8),
    .io_async_mem_7_9(sink_io_async_mem_7_9),
    .io_async_mem_7_10(sink_io_async_mem_7_10),
    .io_async_mem_7_11(sink_io_async_mem_7_11),
    .io_async_mem_7_12(sink_io_async_mem_7_12),
    .io_async_mem_7_13(sink_io_async_mem_7_13),
    .io_async_mem_7_14(sink_io_async_mem_7_14),
    .io_async_mem_7_15(sink_io_async_mem_7_15),
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
  assign io_deq_bits_4 = sink_io_deq_bits_4; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_5 = sink_io_deq_bits_5; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_6 = sink_io_deq_bits_6; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_7 = sink_io_deq_bits_7; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_8 = sink_io_deq_bits_8; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_9 = sink_io_deq_bits_9; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_10 = sink_io_deq_bits_10; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_11 = sink_io_deq_bits_11; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_12 = sink_io_deq_bits_12; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_13 = sink_io_deq_bits_13; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_14 = sink_io_deq_bits_14; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_15 = sink_io_deq_bits_15; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign source_clock = io_enq_clock;
  assign source_reset = io_enq_reset;
  assign source_io_enq_valid = io_enq_valid; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_0 = io_enq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_1 = io_enq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_2 = io_enq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_3 = io_enq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_4 = io_enq_bits_4; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_5 = io_enq_bits_5; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_6 = io_enq_bits_6; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_7 = io_enq_bits_7; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_8 = io_enq_bits_8; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_9 = io_enq_bits_9; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_10 = io_enq_bits_10; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_11 = io_enq_bits_11; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_12 = io_enq_bits_12; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_13 = io_enq_bits_13; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_14 = io_enq_bits_14; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_15 = io_enq_bits_15; // @[src/main/scala/util/AsyncQueue.scala 227:17]
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
  assign sink_io_async_mem_0_4 = source_io_async_mem_0_4; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_5 = source_io_async_mem_0_5; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_6 = source_io_async_mem_0_6; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_7 = source_io_async_mem_0_7; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_8 = source_io_async_mem_0_8; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_9 = source_io_async_mem_0_9; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_10 = source_io_async_mem_0_10; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_11 = source_io_async_mem_0_11; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_12 = source_io_async_mem_0_12; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_13 = source_io_async_mem_0_13; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_14 = source_io_async_mem_0_14; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_15 = source_io_async_mem_0_15; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_0 = source_io_async_mem_1_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_1 = source_io_async_mem_1_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_2 = source_io_async_mem_1_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_3 = source_io_async_mem_1_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_4 = source_io_async_mem_1_4; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_5 = source_io_async_mem_1_5; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_6 = source_io_async_mem_1_6; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_7 = source_io_async_mem_1_7; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_8 = source_io_async_mem_1_8; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_9 = source_io_async_mem_1_9; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_10 = source_io_async_mem_1_10; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_11 = source_io_async_mem_1_11; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_12 = source_io_async_mem_1_12; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_13 = source_io_async_mem_1_13; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_14 = source_io_async_mem_1_14; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_15 = source_io_async_mem_1_15; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_0 = source_io_async_mem_2_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_1 = source_io_async_mem_2_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_2 = source_io_async_mem_2_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_3 = source_io_async_mem_2_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_4 = source_io_async_mem_2_4; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_5 = source_io_async_mem_2_5; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_6 = source_io_async_mem_2_6; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_7 = source_io_async_mem_2_7; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_8 = source_io_async_mem_2_8; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_9 = source_io_async_mem_2_9; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_10 = source_io_async_mem_2_10; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_11 = source_io_async_mem_2_11; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_12 = source_io_async_mem_2_12; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_13 = source_io_async_mem_2_13; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_14 = source_io_async_mem_2_14; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_15 = source_io_async_mem_2_15; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_0 = source_io_async_mem_3_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_1 = source_io_async_mem_3_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_2 = source_io_async_mem_3_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_3 = source_io_async_mem_3_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_4 = source_io_async_mem_3_4; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_5 = source_io_async_mem_3_5; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_6 = source_io_async_mem_3_6; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_7 = source_io_async_mem_3_7; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_8 = source_io_async_mem_3_8; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_9 = source_io_async_mem_3_9; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_10 = source_io_async_mem_3_10; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_11 = source_io_async_mem_3_11; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_12 = source_io_async_mem_3_12; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_13 = source_io_async_mem_3_13; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_14 = source_io_async_mem_3_14; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_15 = source_io_async_mem_3_15; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_0 = source_io_async_mem_4_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_1 = source_io_async_mem_4_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_2 = source_io_async_mem_4_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_3 = source_io_async_mem_4_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_4 = source_io_async_mem_4_4; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_5 = source_io_async_mem_4_5; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_6 = source_io_async_mem_4_6; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_7 = source_io_async_mem_4_7; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_8 = source_io_async_mem_4_8; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_9 = source_io_async_mem_4_9; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_10 = source_io_async_mem_4_10; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_11 = source_io_async_mem_4_11; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_12 = source_io_async_mem_4_12; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_13 = source_io_async_mem_4_13; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_14 = source_io_async_mem_4_14; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_15 = source_io_async_mem_4_15; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_0 = source_io_async_mem_5_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_1 = source_io_async_mem_5_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_2 = source_io_async_mem_5_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_3 = source_io_async_mem_5_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_4 = source_io_async_mem_5_4; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_5 = source_io_async_mem_5_5; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_6 = source_io_async_mem_5_6; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_7 = source_io_async_mem_5_7; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_8 = source_io_async_mem_5_8; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_9 = source_io_async_mem_5_9; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_10 = source_io_async_mem_5_10; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_11 = source_io_async_mem_5_11; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_12 = source_io_async_mem_5_12; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_13 = source_io_async_mem_5_13; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_14 = source_io_async_mem_5_14; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_15 = source_io_async_mem_5_15; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_0 = source_io_async_mem_6_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_1 = source_io_async_mem_6_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_2 = source_io_async_mem_6_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_3 = source_io_async_mem_6_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_4 = source_io_async_mem_6_4; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_5 = source_io_async_mem_6_5; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_6 = source_io_async_mem_6_6; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_7 = source_io_async_mem_6_7; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_8 = source_io_async_mem_6_8; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_9 = source_io_async_mem_6_9; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_10 = source_io_async_mem_6_10; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_11 = source_io_async_mem_6_11; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_12 = source_io_async_mem_6_12; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_13 = source_io_async_mem_6_13; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_14 = source_io_async_mem_6_14; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_15 = source_io_async_mem_6_15; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_0 = source_io_async_mem_7_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_1 = source_io_async_mem_7_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_2 = source_io_async_mem_7_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_3 = source_io_async_mem_7_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_4 = source_io_async_mem_7_4; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_5 = source_io_async_mem_7_5; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_6 = source_io_async_mem_7_6; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_7 = source_io_async_mem_7_7; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_8 = source_io_async_mem_7_8; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_9 = source_io_async_mem_7_9; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_10 = source_io_async_mem_7_10; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_11 = source_io_async_mem_7_11; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_12 = source_io_async_mem_7_12; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_13 = source_io_async_mem_7_13; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_14 = source_io_async_mem_7_14; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_15 = source_io_async_mem_7_15; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_widx = source_io_async_widx; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_safe_widx_valid = source_io_async_safe_widx_valid; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_safe_source_reset_n = source_io_async_safe_source_reset_n; // @[src/main/scala/util/AsyncQueue.scala 229:17]
endmodule
module AsyncQueue_1(
  input         io_enq_clock, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input         io_enq_reset, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output        io_enq_ready, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input         io_enq_valid, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_0, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_1, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_2, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_3, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_4, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_5, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_6, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_7, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_8, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_9, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_10, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_11, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_12, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_13, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_14, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input  [15:0] io_enq_bits_15, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input         io_deq_clock, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  input         io_deq_reset, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output        io_deq_valid, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_0, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_1, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_2, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_3, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_4, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_5, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_6, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_7, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_8, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_9, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_10, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_11, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_12, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_13, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_14, // @[src/main/scala/util/AsyncQueue.scala 223:14]
  output [15:0] io_deq_bits_15 // @[src/main/scala/util/AsyncQueue.scala 223:14]
);
  wire  source_clock; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_reset; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_io_enq_ready; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire  source_io_enq_valid; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_4; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_5; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_6; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_7; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_8; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_9; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_10; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_11; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_12; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_13; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_14; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_enq_bits_15; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_4; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_5; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_6; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_7; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_8; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_9; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_10; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_11; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_12; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_13; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_14; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_0_15; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_4; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_5; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_6; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_7; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_8; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_9; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_10; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_11; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_12; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_13; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_14; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_1_15; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_4; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_5; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_6; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_7; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_8; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_9; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_10; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_11; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_12; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_13; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_14; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_2_15; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_4; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_5; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_6; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_7; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_8; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_9; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_10; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_11; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_12; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_13; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_14; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_3_15; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_4; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_5; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_6; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_7; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_8; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_9; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_10; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_11; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_12; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_13; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_14; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_4_15; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_4; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_5; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_6; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_7; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_8; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_9; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_10; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_11; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_12; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_13; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_14; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_5_15; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_4; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_5; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_6; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_7; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_8; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_9; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_10; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_11; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_12; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_13; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_14; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_6_15; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_0; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_1; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_2; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_3; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_4; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_5; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_6; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_7; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_8; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_9; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_10; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_11; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_12; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_13; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_14; // @[src/main/scala/util/AsyncQueue.scala 224:70]
  wire [15:0] source_io_async_mem_7_15; // @[src/main/scala/util/AsyncQueue.scala 224:70]
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
  wire [15:0] sink_io_deq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_4; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_5; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_6; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_7; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_8; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_9; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_10; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_11; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_12; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_13; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_14; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_deq_bits_15; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_4; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_5; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_6; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_7; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_8; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_9; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_10; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_11; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_12; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_13; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_14; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_0_15; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_4; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_5; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_6; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_7; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_8; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_9; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_10; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_11; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_12; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_13; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_14; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_1_15; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_4; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_5; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_6; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_7; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_8; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_9; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_10; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_11; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_12; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_13; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_14; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_2_15; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_4; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_5; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_6; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_7; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_8; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_9; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_10; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_11; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_12; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_13; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_14; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_3_15; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_4; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_5; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_6; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_7; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_8; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_9; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_10; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_11; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_12; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_13; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_14; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_4_15; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_4; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_5; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_6; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_7; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_8; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_9; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_10; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_11; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_12; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_13; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_14; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_5_15; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_4; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_5; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_6; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_7; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_8; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_9; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_10; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_11; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_12; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_13; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_14; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_6_15; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_0; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_1; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_2; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_3; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_4; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_5; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_6; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_7; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_8; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_9; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_10; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_11; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_12; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_13; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_14; // @[src/main/scala/util/AsyncQueue.scala 225:70]
  wire [15:0] sink_io_async_mem_7_15; // @[src/main/scala/util/AsyncQueue.scala 225:70]
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
    .io_enq_bits_4(source_io_enq_bits_4),
    .io_enq_bits_5(source_io_enq_bits_5),
    .io_enq_bits_6(source_io_enq_bits_6),
    .io_enq_bits_7(source_io_enq_bits_7),
    .io_enq_bits_8(source_io_enq_bits_8),
    .io_enq_bits_9(source_io_enq_bits_9),
    .io_enq_bits_10(source_io_enq_bits_10),
    .io_enq_bits_11(source_io_enq_bits_11),
    .io_enq_bits_12(source_io_enq_bits_12),
    .io_enq_bits_13(source_io_enq_bits_13),
    .io_enq_bits_14(source_io_enq_bits_14),
    .io_enq_bits_15(source_io_enq_bits_15),
    .io_async_mem_0_0(source_io_async_mem_0_0),
    .io_async_mem_0_1(source_io_async_mem_0_1),
    .io_async_mem_0_2(source_io_async_mem_0_2),
    .io_async_mem_0_3(source_io_async_mem_0_3),
    .io_async_mem_0_4(source_io_async_mem_0_4),
    .io_async_mem_0_5(source_io_async_mem_0_5),
    .io_async_mem_0_6(source_io_async_mem_0_6),
    .io_async_mem_0_7(source_io_async_mem_0_7),
    .io_async_mem_0_8(source_io_async_mem_0_8),
    .io_async_mem_0_9(source_io_async_mem_0_9),
    .io_async_mem_0_10(source_io_async_mem_0_10),
    .io_async_mem_0_11(source_io_async_mem_0_11),
    .io_async_mem_0_12(source_io_async_mem_0_12),
    .io_async_mem_0_13(source_io_async_mem_0_13),
    .io_async_mem_0_14(source_io_async_mem_0_14),
    .io_async_mem_0_15(source_io_async_mem_0_15),
    .io_async_mem_1_0(source_io_async_mem_1_0),
    .io_async_mem_1_1(source_io_async_mem_1_1),
    .io_async_mem_1_2(source_io_async_mem_1_2),
    .io_async_mem_1_3(source_io_async_mem_1_3),
    .io_async_mem_1_4(source_io_async_mem_1_4),
    .io_async_mem_1_5(source_io_async_mem_1_5),
    .io_async_mem_1_6(source_io_async_mem_1_6),
    .io_async_mem_1_7(source_io_async_mem_1_7),
    .io_async_mem_1_8(source_io_async_mem_1_8),
    .io_async_mem_1_9(source_io_async_mem_1_9),
    .io_async_mem_1_10(source_io_async_mem_1_10),
    .io_async_mem_1_11(source_io_async_mem_1_11),
    .io_async_mem_1_12(source_io_async_mem_1_12),
    .io_async_mem_1_13(source_io_async_mem_1_13),
    .io_async_mem_1_14(source_io_async_mem_1_14),
    .io_async_mem_1_15(source_io_async_mem_1_15),
    .io_async_mem_2_0(source_io_async_mem_2_0),
    .io_async_mem_2_1(source_io_async_mem_2_1),
    .io_async_mem_2_2(source_io_async_mem_2_2),
    .io_async_mem_2_3(source_io_async_mem_2_3),
    .io_async_mem_2_4(source_io_async_mem_2_4),
    .io_async_mem_2_5(source_io_async_mem_2_5),
    .io_async_mem_2_6(source_io_async_mem_2_6),
    .io_async_mem_2_7(source_io_async_mem_2_7),
    .io_async_mem_2_8(source_io_async_mem_2_8),
    .io_async_mem_2_9(source_io_async_mem_2_9),
    .io_async_mem_2_10(source_io_async_mem_2_10),
    .io_async_mem_2_11(source_io_async_mem_2_11),
    .io_async_mem_2_12(source_io_async_mem_2_12),
    .io_async_mem_2_13(source_io_async_mem_2_13),
    .io_async_mem_2_14(source_io_async_mem_2_14),
    .io_async_mem_2_15(source_io_async_mem_2_15),
    .io_async_mem_3_0(source_io_async_mem_3_0),
    .io_async_mem_3_1(source_io_async_mem_3_1),
    .io_async_mem_3_2(source_io_async_mem_3_2),
    .io_async_mem_3_3(source_io_async_mem_3_3),
    .io_async_mem_3_4(source_io_async_mem_3_4),
    .io_async_mem_3_5(source_io_async_mem_3_5),
    .io_async_mem_3_6(source_io_async_mem_3_6),
    .io_async_mem_3_7(source_io_async_mem_3_7),
    .io_async_mem_3_8(source_io_async_mem_3_8),
    .io_async_mem_3_9(source_io_async_mem_3_9),
    .io_async_mem_3_10(source_io_async_mem_3_10),
    .io_async_mem_3_11(source_io_async_mem_3_11),
    .io_async_mem_3_12(source_io_async_mem_3_12),
    .io_async_mem_3_13(source_io_async_mem_3_13),
    .io_async_mem_3_14(source_io_async_mem_3_14),
    .io_async_mem_3_15(source_io_async_mem_3_15),
    .io_async_mem_4_0(source_io_async_mem_4_0),
    .io_async_mem_4_1(source_io_async_mem_4_1),
    .io_async_mem_4_2(source_io_async_mem_4_2),
    .io_async_mem_4_3(source_io_async_mem_4_3),
    .io_async_mem_4_4(source_io_async_mem_4_4),
    .io_async_mem_4_5(source_io_async_mem_4_5),
    .io_async_mem_4_6(source_io_async_mem_4_6),
    .io_async_mem_4_7(source_io_async_mem_4_7),
    .io_async_mem_4_8(source_io_async_mem_4_8),
    .io_async_mem_4_9(source_io_async_mem_4_9),
    .io_async_mem_4_10(source_io_async_mem_4_10),
    .io_async_mem_4_11(source_io_async_mem_4_11),
    .io_async_mem_4_12(source_io_async_mem_4_12),
    .io_async_mem_4_13(source_io_async_mem_4_13),
    .io_async_mem_4_14(source_io_async_mem_4_14),
    .io_async_mem_4_15(source_io_async_mem_4_15),
    .io_async_mem_5_0(source_io_async_mem_5_0),
    .io_async_mem_5_1(source_io_async_mem_5_1),
    .io_async_mem_5_2(source_io_async_mem_5_2),
    .io_async_mem_5_3(source_io_async_mem_5_3),
    .io_async_mem_5_4(source_io_async_mem_5_4),
    .io_async_mem_5_5(source_io_async_mem_5_5),
    .io_async_mem_5_6(source_io_async_mem_5_6),
    .io_async_mem_5_7(source_io_async_mem_5_7),
    .io_async_mem_5_8(source_io_async_mem_5_8),
    .io_async_mem_5_9(source_io_async_mem_5_9),
    .io_async_mem_5_10(source_io_async_mem_5_10),
    .io_async_mem_5_11(source_io_async_mem_5_11),
    .io_async_mem_5_12(source_io_async_mem_5_12),
    .io_async_mem_5_13(source_io_async_mem_5_13),
    .io_async_mem_5_14(source_io_async_mem_5_14),
    .io_async_mem_5_15(source_io_async_mem_5_15),
    .io_async_mem_6_0(source_io_async_mem_6_0),
    .io_async_mem_6_1(source_io_async_mem_6_1),
    .io_async_mem_6_2(source_io_async_mem_6_2),
    .io_async_mem_6_3(source_io_async_mem_6_3),
    .io_async_mem_6_4(source_io_async_mem_6_4),
    .io_async_mem_6_5(source_io_async_mem_6_5),
    .io_async_mem_6_6(source_io_async_mem_6_6),
    .io_async_mem_6_7(source_io_async_mem_6_7),
    .io_async_mem_6_8(source_io_async_mem_6_8),
    .io_async_mem_6_9(source_io_async_mem_6_9),
    .io_async_mem_6_10(source_io_async_mem_6_10),
    .io_async_mem_6_11(source_io_async_mem_6_11),
    .io_async_mem_6_12(source_io_async_mem_6_12),
    .io_async_mem_6_13(source_io_async_mem_6_13),
    .io_async_mem_6_14(source_io_async_mem_6_14),
    .io_async_mem_6_15(source_io_async_mem_6_15),
    .io_async_mem_7_0(source_io_async_mem_7_0),
    .io_async_mem_7_1(source_io_async_mem_7_1),
    .io_async_mem_7_2(source_io_async_mem_7_2),
    .io_async_mem_7_3(source_io_async_mem_7_3),
    .io_async_mem_7_4(source_io_async_mem_7_4),
    .io_async_mem_7_5(source_io_async_mem_7_5),
    .io_async_mem_7_6(source_io_async_mem_7_6),
    .io_async_mem_7_7(source_io_async_mem_7_7),
    .io_async_mem_7_8(source_io_async_mem_7_8),
    .io_async_mem_7_9(source_io_async_mem_7_9),
    .io_async_mem_7_10(source_io_async_mem_7_10),
    .io_async_mem_7_11(source_io_async_mem_7_11),
    .io_async_mem_7_12(source_io_async_mem_7_12),
    .io_async_mem_7_13(source_io_async_mem_7_13),
    .io_async_mem_7_14(source_io_async_mem_7_14),
    .io_async_mem_7_15(source_io_async_mem_7_15),
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
    .io_deq_bits_4(sink_io_deq_bits_4),
    .io_deq_bits_5(sink_io_deq_bits_5),
    .io_deq_bits_6(sink_io_deq_bits_6),
    .io_deq_bits_7(sink_io_deq_bits_7),
    .io_deq_bits_8(sink_io_deq_bits_8),
    .io_deq_bits_9(sink_io_deq_bits_9),
    .io_deq_bits_10(sink_io_deq_bits_10),
    .io_deq_bits_11(sink_io_deq_bits_11),
    .io_deq_bits_12(sink_io_deq_bits_12),
    .io_deq_bits_13(sink_io_deq_bits_13),
    .io_deq_bits_14(sink_io_deq_bits_14),
    .io_deq_bits_15(sink_io_deq_bits_15),
    .io_async_mem_0_0(sink_io_async_mem_0_0),
    .io_async_mem_0_1(sink_io_async_mem_0_1),
    .io_async_mem_0_2(sink_io_async_mem_0_2),
    .io_async_mem_0_3(sink_io_async_mem_0_3),
    .io_async_mem_0_4(sink_io_async_mem_0_4),
    .io_async_mem_0_5(sink_io_async_mem_0_5),
    .io_async_mem_0_6(sink_io_async_mem_0_6),
    .io_async_mem_0_7(sink_io_async_mem_0_7),
    .io_async_mem_0_8(sink_io_async_mem_0_8),
    .io_async_mem_0_9(sink_io_async_mem_0_9),
    .io_async_mem_0_10(sink_io_async_mem_0_10),
    .io_async_mem_0_11(sink_io_async_mem_0_11),
    .io_async_mem_0_12(sink_io_async_mem_0_12),
    .io_async_mem_0_13(sink_io_async_mem_0_13),
    .io_async_mem_0_14(sink_io_async_mem_0_14),
    .io_async_mem_0_15(sink_io_async_mem_0_15),
    .io_async_mem_1_0(sink_io_async_mem_1_0),
    .io_async_mem_1_1(sink_io_async_mem_1_1),
    .io_async_mem_1_2(sink_io_async_mem_1_2),
    .io_async_mem_1_3(sink_io_async_mem_1_3),
    .io_async_mem_1_4(sink_io_async_mem_1_4),
    .io_async_mem_1_5(sink_io_async_mem_1_5),
    .io_async_mem_1_6(sink_io_async_mem_1_6),
    .io_async_mem_1_7(sink_io_async_mem_1_7),
    .io_async_mem_1_8(sink_io_async_mem_1_8),
    .io_async_mem_1_9(sink_io_async_mem_1_9),
    .io_async_mem_1_10(sink_io_async_mem_1_10),
    .io_async_mem_1_11(sink_io_async_mem_1_11),
    .io_async_mem_1_12(sink_io_async_mem_1_12),
    .io_async_mem_1_13(sink_io_async_mem_1_13),
    .io_async_mem_1_14(sink_io_async_mem_1_14),
    .io_async_mem_1_15(sink_io_async_mem_1_15),
    .io_async_mem_2_0(sink_io_async_mem_2_0),
    .io_async_mem_2_1(sink_io_async_mem_2_1),
    .io_async_mem_2_2(sink_io_async_mem_2_2),
    .io_async_mem_2_3(sink_io_async_mem_2_3),
    .io_async_mem_2_4(sink_io_async_mem_2_4),
    .io_async_mem_2_5(sink_io_async_mem_2_5),
    .io_async_mem_2_6(sink_io_async_mem_2_6),
    .io_async_mem_2_7(sink_io_async_mem_2_7),
    .io_async_mem_2_8(sink_io_async_mem_2_8),
    .io_async_mem_2_9(sink_io_async_mem_2_9),
    .io_async_mem_2_10(sink_io_async_mem_2_10),
    .io_async_mem_2_11(sink_io_async_mem_2_11),
    .io_async_mem_2_12(sink_io_async_mem_2_12),
    .io_async_mem_2_13(sink_io_async_mem_2_13),
    .io_async_mem_2_14(sink_io_async_mem_2_14),
    .io_async_mem_2_15(sink_io_async_mem_2_15),
    .io_async_mem_3_0(sink_io_async_mem_3_0),
    .io_async_mem_3_1(sink_io_async_mem_3_1),
    .io_async_mem_3_2(sink_io_async_mem_3_2),
    .io_async_mem_3_3(sink_io_async_mem_3_3),
    .io_async_mem_3_4(sink_io_async_mem_3_4),
    .io_async_mem_3_5(sink_io_async_mem_3_5),
    .io_async_mem_3_6(sink_io_async_mem_3_6),
    .io_async_mem_3_7(sink_io_async_mem_3_7),
    .io_async_mem_3_8(sink_io_async_mem_3_8),
    .io_async_mem_3_9(sink_io_async_mem_3_9),
    .io_async_mem_3_10(sink_io_async_mem_3_10),
    .io_async_mem_3_11(sink_io_async_mem_3_11),
    .io_async_mem_3_12(sink_io_async_mem_3_12),
    .io_async_mem_3_13(sink_io_async_mem_3_13),
    .io_async_mem_3_14(sink_io_async_mem_3_14),
    .io_async_mem_3_15(sink_io_async_mem_3_15),
    .io_async_mem_4_0(sink_io_async_mem_4_0),
    .io_async_mem_4_1(sink_io_async_mem_4_1),
    .io_async_mem_4_2(sink_io_async_mem_4_2),
    .io_async_mem_4_3(sink_io_async_mem_4_3),
    .io_async_mem_4_4(sink_io_async_mem_4_4),
    .io_async_mem_4_5(sink_io_async_mem_4_5),
    .io_async_mem_4_6(sink_io_async_mem_4_6),
    .io_async_mem_4_7(sink_io_async_mem_4_7),
    .io_async_mem_4_8(sink_io_async_mem_4_8),
    .io_async_mem_4_9(sink_io_async_mem_4_9),
    .io_async_mem_4_10(sink_io_async_mem_4_10),
    .io_async_mem_4_11(sink_io_async_mem_4_11),
    .io_async_mem_4_12(sink_io_async_mem_4_12),
    .io_async_mem_4_13(sink_io_async_mem_4_13),
    .io_async_mem_4_14(sink_io_async_mem_4_14),
    .io_async_mem_4_15(sink_io_async_mem_4_15),
    .io_async_mem_5_0(sink_io_async_mem_5_0),
    .io_async_mem_5_1(sink_io_async_mem_5_1),
    .io_async_mem_5_2(sink_io_async_mem_5_2),
    .io_async_mem_5_3(sink_io_async_mem_5_3),
    .io_async_mem_5_4(sink_io_async_mem_5_4),
    .io_async_mem_5_5(sink_io_async_mem_5_5),
    .io_async_mem_5_6(sink_io_async_mem_5_6),
    .io_async_mem_5_7(sink_io_async_mem_5_7),
    .io_async_mem_5_8(sink_io_async_mem_5_8),
    .io_async_mem_5_9(sink_io_async_mem_5_9),
    .io_async_mem_5_10(sink_io_async_mem_5_10),
    .io_async_mem_5_11(sink_io_async_mem_5_11),
    .io_async_mem_5_12(sink_io_async_mem_5_12),
    .io_async_mem_5_13(sink_io_async_mem_5_13),
    .io_async_mem_5_14(sink_io_async_mem_5_14),
    .io_async_mem_5_15(sink_io_async_mem_5_15),
    .io_async_mem_6_0(sink_io_async_mem_6_0),
    .io_async_mem_6_1(sink_io_async_mem_6_1),
    .io_async_mem_6_2(sink_io_async_mem_6_2),
    .io_async_mem_6_3(sink_io_async_mem_6_3),
    .io_async_mem_6_4(sink_io_async_mem_6_4),
    .io_async_mem_6_5(sink_io_async_mem_6_5),
    .io_async_mem_6_6(sink_io_async_mem_6_6),
    .io_async_mem_6_7(sink_io_async_mem_6_7),
    .io_async_mem_6_8(sink_io_async_mem_6_8),
    .io_async_mem_6_9(sink_io_async_mem_6_9),
    .io_async_mem_6_10(sink_io_async_mem_6_10),
    .io_async_mem_6_11(sink_io_async_mem_6_11),
    .io_async_mem_6_12(sink_io_async_mem_6_12),
    .io_async_mem_6_13(sink_io_async_mem_6_13),
    .io_async_mem_6_14(sink_io_async_mem_6_14),
    .io_async_mem_6_15(sink_io_async_mem_6_15),
    .io_async_mem_7_0(sink_io_async_mem_7_0),
    .io_async_mem_7_1(sink_io_async_mem_7_1),
    .io_async_mem_7_2(sink_io_async_mem_7_2),
    .io_async_mem_7_3(sink_io_async_mem_7_3),
    .io_async_mem_7_4(sink_io_async_mem_7_4),
    .io_async_mem_7_5(sink_io_async_mem_7_5),
    .io_async_mem_7_6(sink_io_async_mem_7_6),
    .io_async_mem_7_7(sink_io_async_mem_7_7),
    .io_async_mem_7_8(sink_io_async_mem_7_8),
    .io_async_mem_7_9(sink_io_async_mem_7_9),
    .io_async_mem_7_10(sink_io_async_mem_7_10),
    .io_async_mem_7_11(sink_io_async_mem_7_11),
    .io_async_mem_7_12(sink_io_async_mem_7_12),
    .io_async_mem_7_13(sink_io_async_mem_7_13),
    .io_async_mem_7_14(sink_io_async_mem_7_14),
    .io_async_mem_7_15(sink_io_async_mem_7_15),
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
  assign io_deq_bits_4 = sink_io_deq_bits_4; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_5 = sink_io_deq_bits_5; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_6 = sink_io_deq_bits_6; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_7 = sink_io_deq_bits_7; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_8 = sink_io_deq_bits_8; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_9 = sink_io_deq_bits_9; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_10 = sink_io_deq_bits_10; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_11 = sink_io_deq_bits_11; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_12 = sink_io_deq_bits_12; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_13 = sink_io_deq_bits_13; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_14 = sink_io_deq_bits_14; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign io_deq_bits_15 = sink_io_deq_bits_15; // @[src/main/scala/util/AsyncQueue.scala 228:10]
  assign source_clock = io_enq_clock;
  assign source_reset = io_enq_reset;
  assign source_io_enq_valid = io_enq_valid; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_0 = io_enq_bits_0; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_1 = io_enq_bits_1; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_2 = io_enq_bits_2; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_3 = io_enq_bits_3; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_4 = io_enq_bits_4; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_5 = io_enq_bits_5; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_6 = io_enq_bits_6; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_7 = io_enq_bits_7; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_8 = io_enq_bits_8; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_9 = io_enq_bits_9; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_10 = io_enq_bits_10; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_11 = io_enq_bits_11; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_12 = io_enq_bits_12; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_13 = io_enq_bits_13; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_14 = io_enq_bits_14; // @[src/main/scala/util/AsyncQueue.scala 227:17]
  assign source_io_enq_bits_15 = io_enq_bits_15; // @[src/main/scala/util/AsyncQueue.scala 227:17]
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
  assign sink_io_async_mem_0_4 = source_io_async_mem_0_4; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_5 = source_io_async_mem_0_5; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_6 = source_io_async_mem_0_6; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_7 = source_io_async_mem_0_7; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_8 = source_io_async_mem_0_8; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_9 = source_io_async_mem_0_9; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_10 = source_io_async_mem_0_10; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_11 = source_io_async_mem_0_11; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_12 = source_io_async_mem_0_12; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_13 = source_io_async_mem_0_13; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_14 = source_io_async_mem_0_14; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_0_15 = source_io_async_mem_0_15; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_0 = source_io_async_mem_1_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_1 = source_io_async_mem_1_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_2 = source_io_async_mem_1_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_3 = source_io_async_mem_1_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_4 = source_io_async_mem_1_4; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_5 = source_io_async_mem_1_5; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_6 = source_io_async_mem_1_6; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_7 = source_io_async_mem_1_7; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_8 = source_io_async_mem_1_8; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_9 = source_io_async_mem_1_9; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_10 = source_io_async_mem_1_10; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_11 = source_io_async_mem_1_11; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_12 = source_io_async_mem_1_12; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_13 = source_io_async_mem_1_13; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_14 = source_io_async_mem_1_14; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_1_15 = source_io_async_mem_1_15; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_0 = source_io_async_mem_2_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_1 = source_io_async_mem_2_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_2 = source_io_async_mem_2_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_3 = source_io_async_mem_2_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_4 = source_io_async_mem_2_4; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_5 = source_io_async_mem_2_5; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_6 = source_io_async_mem_2_6; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_7 = source_io_async_mem_2_7; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_8 = source_io_async_mem_2_8; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_9 = source_io_async_mem_2_9; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_10 = source_io_async_mem_2_10; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_11 = source_io_async_mem_2_11; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_12 = source_io_async_mem_2_12; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_13 = source_io_async_mem_2_13; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_14 = source_io_async_mem_2_14; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_2_15 = source_io_async_mem_2_15; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_0 = source_io_async_mem_3_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_1 = source_io_async_mem_3_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_2 = source_io_async_mem_3_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_3 = source_io_async_mem_3_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_4 = source_io_async_mem_3_4; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_5 = source_io_async_mem_3_5; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_6 = source_io_async_mem_3_6; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_7 = source_io_async_mem_3_7; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_8 = source_io_async_mem_3_8; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_9 = source_io_async_mem_3_9; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_10 = source_io_async_mem_3_10; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_11 = source_io_async_mem_3_11; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_12 = source_io_async_mem_3_12; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_13 = source_io_async_mem_3_13; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_14 = source_io_async_mem_3_14; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_3_15 = source_io_async_mem_3_15; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_0 = source_io_async_mem_4_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_1 = source_io_async_mem_4_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_2 = source_io_async_mem_4_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_3 = source_io_async_mem_4_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_4 = source_io_async_mem_4_4; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_5 = source_io_async_mem_4_5; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_6 = source_io_async_mem_4_6; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_7 = source_io_async_mem_4_7; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_8 = source_io_async_mem_4_8; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_9 = source_io_async_mem_4_9; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_10 = source_io_async_mem_4_10; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_11 = source_io_async_mem_4_11; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_12 = source_io_async_mem_4_12; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_13 = source_io_async_mem_4_13; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_14 = source_io_async_mem_4_14; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_4_15 = source_io_async_mem_4_15; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_0 = source_io_async_mem_5_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_1 = source_io_async_mem_5_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_2 = source_io_async_mem_5_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_3 = source_io_async_mem_5_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_4 = source_io_async_mem_5_4; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_5 = source_io_async_mem_5_5; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_6 = source_io_async_mem_5_6; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_7 = source_io_async_mem_5_7; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_8 = source_io_async_mem_5_8; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_9 = source_io_async_mem_5_9; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_10 = source_io_async_mem_5_10; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_11 = source_io_async_mem_5_11; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_12 = source_io_async_mem_5_12; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_13 = source_io_async_mem_5_13; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_14 = source_io_async_mem_5_14; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_5_15 = source_io_async_mem_5_15; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_0 = source_io_async_mem_6_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_1 = source_io_async_mem_6_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_2 = source_io_async_mem_6_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_3 = source_io_async_mem_6_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_4 = source_io_async_mem_6_4; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_5 = source_io_async_mem_6_5; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_6 = source_io_async_mem_6_6; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_7 = source_io_async_mem_6_7; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_8 = source_io_async_mem_6_8; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_9 = source_io_async_mem_6_9; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_10 = source_io_async_mem_6_10; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_11 = source_io_async_mem_6_11; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_12 = source_io_async_mem_6_12; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_13 = source_io_async_mem_6_13; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_14 = source_io_async_mem_6_14; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_6_15 = source_io_async_mem_6_15; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_0 = source_io_async_mem_7_0; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_1 = source_io_async_mem_7_1; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_2 = source_io_async_mem_7_2; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_3 = source_io_async_mem_7_3; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_4 = source_io_async_mem_7_4; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_5 = source_io_async_mem_7_5; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_6 = source_io_async_mem_7_6; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_7 = source_io_async_mem_7_7; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_8 = source_io_async_mem_7_8; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_9 = source_io_async_mem_7_9; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_10 = source_io_async_mem_7_10; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_11 = source_io_async_mem_7_11; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_12 = source_io_async_mem_7_12; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_13 = source_io_async_mem_7_13; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_14 = source_io_async_mem_7_14; // @[src/main/scala/util/AsyncQueue.scala 229:17]
  assign sink_io_async_mem_7_15 = source_io_async_mem_7_15; // @[src/main/scala/util/AsyncQueue.scala 229:17]
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
  output [15:0]  io_mainbandIo_txData_bits_0, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [15:0]  io_mainbandIo_txData_bits_1, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [15:0]  io_mainbandIo_txData_bits_2, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [15:0]  io_mainbandIo_txData_bits_3, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [15:0]  io_mainbandIo_txData_bits_4, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [15:0]  io_mainbandIo_txData_bits_5, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [15:0]  io_mainbandIo_txData_bits_6, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [15:0]  io_mainbandIo_txData_bits_7, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [15:0]  io_mainbandIo_txData_bits_8, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [15:0]  io_mainbandIo_txData_bits_9, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [15:0]  io_mainbandIo_txData_bits_10, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [15:0]  io_mainbandIo_txData_bits_11, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [15:0]  io_mainbandIo_txData_bits_12, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [15:0]  io_mainbandIo_txData_bits_13, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [15:0]  io_mainbandIo_txData_bits_14, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [15:0]  io_mainbandIo_txData_bits_15, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output         io_mainbandIo_rxData_ready, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input          io_mainbandIo_rxData_valid, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [15:0]  io_mainbandIo_rxData_bits_0, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [15:0]  io_mainbandIo_rxData_bits_1, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [15:0]  io_mainbandIo_rxData_bits_2, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [15:0]  io_mainbandIo_rxData_bits_3, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [15:0]  io_mainbandIo_rxData_bits_4, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [15:0]  io_mainbandIo_rxData_bits_5, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [15:0]  io_mainbandIo_rxData_bits_6, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [15:0]  io_mainbandIo_rxData_bits_7, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [15:0]  io_mainbandIo_rxData_bits_8, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [15:0]  io_mainbandIo_rxData_bits_9, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [15:0]  io_mainbandIo_rxData_bits_10, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [15:0]  io_mainbandIo_rxData_bits_11, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [15:0]  io_mainbandIo_rxData_bits_12, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [15:0]  io_mainbandIo_rxData_bits_13, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [15:0]  io_mainbandIo_rxData_bits_14, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [15:0]  io_mainbandIo_rxData_bits_15, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output         io_mainbandLaneIO_txData_ready, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input          io_mainbandLaneIO_txData_valid, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  input  [255:0] io_mainbandLaneIO_txData_bits, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output         io_mainbandLaneIO_rxData_valid, // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
  output [255:0] io_mainbandLaneIO_rxData_bits // @[\\src\\main\\scala\\logphy\\Lanes.scala 15:14]
);
  wire  txMBFifo_io_enq_clock; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire  txMBFifo_io_enq_reset; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire  txMBFifo_io_enq_ready; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire  txMBFifo_io_enq_valid; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_enq_bits_0; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_enq_bits_1; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_enq_bits_2; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_enq_bits_3; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_enq_bits_4; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_enq_bits_5; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_enq_bits_6; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_enq_bits_7; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_enq_bits_8; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_enq_bits_9; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_enq_bits_10; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_enq_bits_11; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_enq_bits_12; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_enq_bits_13; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_enq_bits_14; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_enq_bits_15; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire  txMBFifo_io_deq_clock; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire  txMBFifo_io_deq_reset; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire  txMBFifo_io_deq_ready; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire  txMBFifo_io_deq_valid; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_deq_bits_0; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_deq_bits_1; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_deq_bits_2; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_deq_bits_3; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_deq_bits_4; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_deq_bits_5; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_deq_bits_6; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_deq_bits_7; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_deq_bits_8; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_deq_bits_9; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_deq_bits_10; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_deq_bits_11; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_deq_bits_12; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_deq_bits_13; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_deq_bits_14; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire [15:0] txMBFifo_io_deq_bits_15; // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
  wire  rxMBFifo_io_enq_clock; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire  rxMBFifo_io_enq_reset; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire  rxMBFifo_io_enq_ready; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire  rxMBFifo_io_enq_valid; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_enq_bits_0; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_enq_bits_1; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_enq_bits_2; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_enq_bits_3; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_enq_bits_4; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_enq_bits_5; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_enq_bits_6; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_enq_bits_7; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_enq_bits_8; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_enq_bits_9; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_enq_bits_10; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_enq_bits_11; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_enq_bits_12; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_enq_bits_13; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_enq_bits_14; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_enq_bits_15; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire  rxMBFifo_io_deq_clock; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire  rxMBFifo_io_deq_reset; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire  rxMBFifo_io_deq_valid; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_deq_bits_0; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_deq_bits_1; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_deq_bits_2; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_deq_bits_3; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_deq_bits_4; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_deq_bits_5; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_deq_bits_6; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_deq_bits_7; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_deq_bits_8; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_deq_bits_9; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_deq_bits_10; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_deq_bits_11; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_deq_bits_12; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_deq_bits_13; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_deq_bits_14; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [15:0] rxMBFifo_io_deq_bits_15; // @[\\src\\main\\scala\\logphy\\Lanes.scala 28:11]
  wire [7:0] txDataVec_15_0 = io_mainbandLaneIO_txData_bits[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_0_15 = rxMBFifo_io_deq_bits_0[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_15_1 = io_mainbandLaneIO_txData_bits[135:128]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_1_15 = rxMBFifo_io_deq_bits_0[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_0_1 = io_mainbandLaneIO_txData_bits[255:248]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_0_0 = io_mainbandLaneIO_txData_bits[127:120]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_14_0 = io_mainbandLaneIO_txData_bits[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_0_14 = rxMBFifo_io_deq_bits_1[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_14_1 = io_mainbandLaneIO_txData_bits[143:136]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_1_14 = rxMBFifo_io_deq_bits_1[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_1_1 = io_mainbandLaneIO_txData_bits[247:240]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_1_0 = io_mainbandLaneIO_txData_bits[119:112]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_13_0 = io_mainbandLaneIO_txData_bits[23:16]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_0_13 = rxMBFifo_io_deq_bits_2[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_13_1 = io_mainbandLaneIO_txData_bits[151:144]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_1_13 = rxMBFifo_io_deq_bits_2[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_2_1 = io_mainbandLaneIO_txData_bits[239:232]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_2_0 = io_mainbandLaneIO_txData_bits[111:104]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_12_0 = io_mainbandLaneIO_txData_bits[31:24]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_0_12 = rxMBFifo_io_deq_bits_3[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_12_1 = io_mainbandLaneIO_txData_bits[159:152]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_1_12 = rxMBFifo_io_deq_bits_3[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_3_1 = io_mainbandLaneIO_txData_bits[231:224]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_3_0 = io_mainbandLaneIO_txData_bits[103:96]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_11_0 = io_mainbandLaneIO_txData_bits[39:32]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_0_11 = rxMBFifo_io_deq_bits_4[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_11_1 = io_mainbandLaneIO_txData_bits[167:160]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_1_11 = rxMBFifo_io_deq_bits_4[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_4_1 = io_mainbandLaneIO_txData_bits[223:216]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_4_0 = io_mainbandLaneIO_txData_bits[95:88]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_10_0 = io_mainbandLaneIO_txData_bits[47:40]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_0_10 = rxMBFifo_io_deq_bits_5[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_10_1 = io_mainbandLaneIO_txData_bits[175:168]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_1_10 = rxMBFifo_io_deq_bits_5[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_5_1 = io_mainbandLaneIO_txData_bits[215:208]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_5_0 = io_mainbandLaneIO_txData_bits[87:80]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_9_0 = io_mainbandLaneIO_txData_bits[55:48]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_0_9 = rxMBFifo_io_deq_bits_6[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_9_1 = io_mainbandLaneIO_txData_bits[183:176]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_1_9 = rxMBFifo_io_deq_bits_6[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_6_1 = io_mainbandLaneIO_txData_bits[207:200]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_6_0 = io_mainbandLaneIO_txData_bits[79:72]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_8_0 = io_mainbandLaneIO_txData_bits[63:56]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_0_8 = rxMBFifo_io_deq_bits_7[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_8_1 = io_mainbandLaneIO_txData_bits[191:184]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_1_8 = rxMBFifo_io_deq_bits_7[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] txDataVec_7_1 = io_mainbandLaneIO_txData_bits[199:192]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] txDataVec_7_0 = io_mainbandLaneIO_txData_bits[71:64]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 61:14]
  wire [7:0] rxDataVec_0_7 = rxMBFifo_io_deq_bits_8[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_1_7 = rxMBFifo_io_deq_bits_8[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_0_6 = rxMBFifo_io_deq_bits_9[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_1_6 = rxMBFifo_io_deq_bits_9[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_0_5 = rxMBFifo_io_deq_bits_10[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_1_5 = rxMBFifo_io_deq_bits_10[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_0_4 = rxMBFifo_io_deq_bits_11[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_1_4 = rxMBFifo_io_deq_bits_11[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_0_3 = rxMBFifo_io_deq_bits_12[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_1_3 = rxMBFifo_io_deq_bits_12[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_0_2 = rxMBFifo_io_deq_bits_13[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_1_2 = rxMBFifo_io_deq_bits_13[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_0_1 = rxMBFifo_io_deq_bits_14[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_1_1 = rxMBFifo_io_deq_bits_14[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_0_0 = rxMBFifo_io_deq_bits_15[7:0]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [7:0] rxDataVec_1_0 = rxMBFifo_io_deq_bits_15[15:8]; // @[\\src\\main\\scala\\logphy\\Lanes.scala 66:17]
  wire [63:0] io_mainbandLaneIO_rxData_bits_lo_lo = {rxDataVec_0_7,rxDataVec_0_6,rxDataVec_0_5,rxDataVec_0_4,
    rxDataVec_0_3,rxDataVec_0_2,rxDataVec_0_1,rxDataVec_0_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 70:46]
  wire [127:0] io_mainbandLaneIO_rxData_bits_lo = {rxDataVec_0_15,rxDataVec_0_14,rxDataVec_0_13,rxDataVec_0_12,
    rxDataVec_0_11,rxDataVec_0_10,rxDataVec_0_9,rxDataVec_0_8,io_mainbandLaneIO_rxData_bits_lo_lo}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 70:46]
  wire [63:0] io_mainbandLaneIO_rxData_bits_hi_lo = {rxDataVec_1_7,rxDataVec_1_6,rxDataVec_1_5,rxDataVec_1_4,
    rxDataVec_1_3,rxDataVec_1_2,rxDataVec_1_1,rxDataVec_1_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 70:46]
  wire [127:0] io_mainbandLaneIO_rxData_bits_hi = {rxDataVec_1_15,rxDataVec_1_14,rxDataVec_1_13,rxDataVec_1_12,
    rxDataVec_1_11,rxDataVec_1_10,rxDataVec_1_9,rxDataVec_1_8,io_mainbandLaneIO_rxData_bits_hi_lo}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 70:46]
  AsyncQueue txMBFifo ( // @[\\src\\main\\scala\\logphy\\Lanes.scala 21:11]
    .io_enq_clock(txMBFifo_io_enq_clock),
    .io_enq_reset(txMBFifo_io_enq_reset),
    .io_enq_ready(txMBFifo_io_enq_ready),
    .io_enq_valid(txMBFifo_io_enq_valid),
    .io_enq_bits_0(txMBFifo_io_enq_bits_0),
    .io_enq_bits_1(txMBFifo_io_enq_bits_1),
    .io_enq_bits_2(txMBFifo_io_enq_bits_2),
    .io_enq_bits_3(txMBFifo_io_enq_bits_3),
    .io_enq_bits_4(txMBFifo_io_enq_bits_4),
    .io_enq_bits_5(txMBFifo_io_enq_bits_5),
    .io_enq_bits_6(txMBFifo_io_enq_bits_6),
    .io_enq_bits_7(txMBFifo_io_enq_bits_7),
    .io_enq_bits_8(txMBFifo_io_enq_bits_8),
    .io_enq_bits_9(txMBFifo_io_enq_bits_9),
    .io_enq_bits_10(txMBFifo_io_enq_bits_10),
    .io_enq_bits_11(txMBFifo_io_enq_bits_11),
    .io_enq_bits_12(txMBFifo_io_enq_bits_12),
    .io_enq_bits_13(txMBFifo_io_enq_bits_13),
    .io_enq_bits_14(txMBFifo_io_enq_bits_14),
    .io_enq_bits_15(txMBFifo_io_enq_bits_15),
    .io_deq_clock(txMBFifo_io_deq_clock),
    .io_deq_reset(txMBFifo_io_deq_reset),
    .io_deq_ready(txMBFifo_io_deq_ready),
    .io_deq_valid(txMBFifo_io_deq_valid),
    .io_deq_bits_0(txMBFifo_io_deq_bits_0),
    .io_deq_bits_1(txMBFifo_io_deq_bits_1),
    .io_deq_bits_2(txMBFifo_io_deq_bits_2),
    .io_deq_bits_3(txMBFifo_io_deq_bits_3),
    .io_deq_bits_4(txMBFifo_io_deq_bits_4),
    .io_deq_bits_5(txMBFifo_io_deq_bits_5),
    .io_deq_bits_6(txMBFifo_io_deq_bits_6),
    .io_deq_bits_7(txMBFifo_io_deq_bits_7),
    .io_deq_bits_8(txMBFifo_io_deq_bits_8),
    .io_deq_bits_9(txMBFifo_io_deq_bits_9),
    .io_deq_bits_10(txMBFifo_io_deq_bits_10),
    .io_deq_bits_11(txMBFifo_io_deq_bits_11),
    .io_deq_bits_12(txMBFifo_io_deq_bits_12),
    .io_deq_bits_13(txMBFifo_io_deq_bits_13),
    .io_deq_bits_14(txMBFifo_io_deq_bits_14),
    .io_deq_bits_15(txMBFifo_io_deq_bits_15)
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
    .io_enq_bits_4(rxMBFifo_io_enq_bits_4),
    .io_enq_bits_5(rxMBFifo_io_enq_bits_5),
    .io_enq_bits_6(rxMBFifo_io_enq_bits_6),
    .io_enq_bits_7(rxMBFifo_io_enq_bits_7),
    .io_enq_bits_8(rxMBFifo_io_enq_bits_8),
    .io_enq_bits_9(rxMBFifo_io_enq_bits_9),
    .io_enq_bits_10(rxMBFifo_io_enq_bits_10),
    .io_enq_bits_11(rxMBFifo_io_enq_bits_11),
    .io_enq_bits_12(rxMBFifo_io_enq_bits_12),
    .io_enq_bits_13(rxMBFifo_io_enq_bits_13),
    .io_enq_bits_14(rxMBFifo_io_enq_bits_14),
    .io_enq_bits_15(rxMBFifo_io_enq_bits_15),
    .io_deq_clock(rxMBFifo_io_deq_clock),
    .io_deq_reset(rxMBFifo_io_deq_reset),
    .io_deq_valid(rxMBFifo_io_deq_valid),
    .io_deq_bits_0(rxMBFifo_io_deq_bits_0),
    .io_deq_bits_1(rxMBFifo_io_deq_bits_1),
    .io_deq_bits_2(rxMBFifo_io_deq_bits_2),
    .io_deq_bits_3(rxMBFifo_io_deq_bits_3),
    .io_deq_bits_4(rxMBFifo_io_deq_bits_4),
    .io_deq_bits_5(rxMBFifo_io_deq_bits_5),
    .io_deq_bits_6(rxMBFifo_io_deq_bits_6),
    .io_deq_bits_7(rxMBFifo_io_deq_bits_7),
    .io_deq_bits_8(rxMBFifo_io_deq_bits_8),
    .io_deq_bits_9(rxMBFifo_io_deq_bits_9),
    .io_deq_bits_10(rxMBFifo_io_deq_bits_10),
    .io_deq_bits_11(rxMBFifo_io_deq_bits_11),
    .io_deq_bits_12(rxMBFifo_io_deq_bits_12),
    .io_deq_bits_13(rxMBFifo_io_deq_bits_13),
    .io_deq_bits_14(rxMBFifo_io_deq_bits_14),
    .io_deq_bits_15(rxMBFifo_io_deq_bits_15)
  );
  assign io_mainbandIo_txData_valid = txMBFifo_io_deq_valid; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_0 = txMBFifo_io_deq_bits_0; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_1 = txMBFifo_io_deq_bits_1; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_2 = txMBFifo_io_deq_bits_2; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_3 = txMBFifo_io_deq_bits_3; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_4 = txMBFifo_io_deq_bits_4; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_5 = txMBFifo_io_deq_bits_5; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_6 = txMBFifo_io_deq_bits_6; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_7 = txMBFifo_io_deq_bits_7; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_8 = txMBFifo_io_deq_bits_8; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_9 = txMBFifo_io_deq_bits_9; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_10 = txMBFifo_io_deq_bits_10; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_11 = txMBFifo_io_deq_bits_11; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_12 = txMBFifo_io_deq_bits_12; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_13 = txMBFifo_io_deq_bits_13; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_14 = txMBFifo_io_deq_bits_14; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_txData_bits_15 = txMBFifo_io_deq_bits_15; // @[\\src\\main\\scala\\logphy\\Lanes.scala 40:19]
  assign io_mainbandIo_rxData_ready = rxMBFifo_io_enq_ready; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign io_mainbandLaneIO_txData_ready = txMBFifo_io_enq_ready; // @[\\src\\main\\scala\\logphy\\Lanes.scala 72:34]
  assign io_mainbandLaneIO_rxData_valid = rxMBFifo_io_deq_valid; // @[\\src\\main\\scala\\logphy\\Lanes.scala 47:34]
  assign io_mainbandLaneIO_rxData_bits = {io_mainbandLaneIO_rxData_bits_hi,io_mainbandLaneIO_rxData_bits_lo}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 70:46]
  assign txMBFifo_io_enq_clock = clock; // @[\\src\\main\\scala\\logphy\\Lanes.scala 41:25]
  assign txMBFifo_io_enq_reset = reset; // @[\\src\\main\\scala\\logphy\\Lanes.scala 42:25]
  assign txMBFifo_io_enq_valid = io_mainbandLaneIO_txData_valid; // @[\\src\\main\\scala\\logphy\\Lanes.scala 46:25]
  assign txMBFifo_io_enq_bits_0 = {txDataVec_0_1,txDataVec_0_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_enq_bits_1 = {txDataVec_1_1,txDataVec_1_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_enq_bits_2 = {txDataVec_2_1,txDataVec_2_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_enq_bits_3 = {txDataVec_3_1,txDataVec_3_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_enq_bits_4 = {txDataVec_4_1,txDataVec_4_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_enq_bits_5 = {txDataVec_5_1,txDataVec_5_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_enq_bits_6 = {txDataVec_6_1,txDataVec_6_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_enq_bits_7 = {txDataVec_7_1,txDataVec_7_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_enq_bits_8 = {txDataVec_8_1,txDataVec_8_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_enq_bits_9 = {txDataVec_9_1,txDataVec_9_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_enq_bits_10 = {txDataVec_10_1,txDataVec_10_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_enq_bits_11 = {txDataVec_11_1,txDataVec_11_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_enq_bits_12 = {txDataVec_12_1,txDataVec_12_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_enq_bits_13 = {txDataVec_13_1,txDataVec_13_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_enq_bits_14 = {txDataVec_14_1,txDataVec_14_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
  assign txMBFifo_io_enq_bits_15 = {txDataVec_15_1,txDataVec_15_0}; // @[\\src\\main\\scala\\logphy\\Lanes.scala 68:45]
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
  assign rxMBFifo_io_enq_bits_4 = io_mainbandIo_rxData_bits_4; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign rxMBFifo_io_enq_bits_5 = io_mainbandIo_rxData_bits_5; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign rxMBFifo_io_enq_bits_6 = io_mainbandIo_rxData_bits_6; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign rxMBFifo_io_enq_bits_7 = io_mainbandIo_rxData_bits_7; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign rxMBFifo_io_enq_bits_8 = io_mainbandIo_rxData_bits_8; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign rxMBFifo_io_enq_bits_9 = io_mainbandIo_rxData_bits_9; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign rxMBFifo_io_enq_bits_10 = io_mainbandIo_rxData_bits_10; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign rxMBFifo_io_enq_bits_11 = io_mainbandIo_rxData_bits_11; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign rxMBFifo_io_enq_bits_12 = io_mainbandIo_rxData_bits_12; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign rxMBFifo_io_enq_bits_13 = io_mainbandIo_rxData_bits_13; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign rxMBFifo_io_enq_bits_14 = io_mainbandIo_rxData_bits_14; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign rxMBFifo_io_enq_bits_15 = io_mainbandIo_rxData_bits_15; // @[\\src\\main\\scala\\logphy\\Lanes.scala 35:19]
  assign rxMBFifo_io_deq_clock = clock; // @[\\src\\main\\scala\\logphy\\Lanes.scala 36:25]
  assign rxMBFifo_io_deq_reset = reset; // @[\\src\\main\\scala\\logphy\\Lanes.scala 37:25]
endmodule
module SidebandSerializer(
  input          clock,
  input          reset,
  output         io_in_ready, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 164:14]
  input          io_in_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 164:14]
  input  [127:0] io_in_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 164:14]
  output [127:0] io_out_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 164:14]
  output         io_out_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 164:14]
  input          io_out_credit // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 164:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [127:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [127:0] data; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 175:17]
  reg  sending; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 177:24]
  reg [5:0] current_credit; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 180:31]
  reg  isComplete; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 181:27]
  wire [127:0] _io_in_ready_T_1 = io_in_bits & 128'h1f; // @[\\src\\main\\scala\\sideband\\sb-msg-encoding.scala 368:31]
  wire  _io_in_ready_T_8 = 128'h10 == _io_in_ready_T_1 | 128'h11 == _io_in_ready_T_1 | 128'h19 == _io_in_ready_T_1; // @[\\src\\main\\scala\\sideband\\sb-msg-encoding.scala 368:58]
  wire  _io_in_ready_T_9 = current_credit > 6'h0; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 185:24]
  wire  _io_in_ready_T_10 = _io_in_ready_T_8 | current_credit > 6'h0; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 185:5]
  wire  _T = io_in_ready & io_in_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  _GEN_2 = _T | sending; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 189:20 191:13 177:24]
  wire [5:0] _current_credit_T_1 = current_credit - 6'h1; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 199:69]
  wire [5:0] _current_credit_T_3 = current_credit + 6'h1; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 202:58]
  assign io_in_ready = ~sending & _io_in_ready_T_10; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 183:28]
  assign io_out_bits = data; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 187:22]
  assign io_out_valid = (_io_in_ready_T_9 | isComplete) & sending; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 186:59]
  always @(posedge clock) begin
    if (io_out_valid) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 195:22]
      data <= 128'h0; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 195:29]
    end else if (_T) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 189:20]
      data <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 190:10]
    end
    if (reset) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 177:24]
      sending <= 1'h0; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 177:24]
    end else if (io_out_valid) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 197:18]
      sending <= 1'h0; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 198:13]
    end else begin
      sending <= _GEN_2;
    end
    if (reset) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 180:31]
      current_credit <= 6'h20; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 180:31]
    end else if (io_out_credit) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 202:23]
      current_credit <= _current_credit_T_3; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 202:40]
    end else if (io_out_valid) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 197:18]
      if (~isComplete) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 199:34]
        current_credit <= _current_credit_T_1; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 199:51]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 181:27]
      isComplete <= 1'h0; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 181:27]
    end else if (_T) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 189:20]
      isComplete <= _io_in_ready_T_8; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 192:16]
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
  data = _RAND_0[127:0];
  _RAND_1 = {1{`RANDOM}};
  sending = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  current_credit = _RAND_2[5:0];
  _RAND_3 = {1{`RANDOM}};
  isComplete = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue(
  input          clock,
  input          reset,
  output         io_enq_ready, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  input          io_enq_valid, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  input  [127:0] io_enq_bits, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  input          io_deq_ready, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  output         io_deq_valid, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  output [127:0] io_deq_bits // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [127:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [127:0] ram [0:3]; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire  ram_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire [1:0] ram_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire [127:0] ram_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire [127:0] ram_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire [1:0] ram_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire  ram_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire  ram_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  reg [1:0] enq_ptr_value; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  reg [1:0] deq_ptr_value; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  reg  maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 277:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[src/main/scala/chisel3/util/Decoupled.scala 278:33]
  wire  empty = ptr_match & ~maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 279:25]
  wire  full = ptr_match & maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 280:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [1:0] _value_T_1 = enq_ptr_value + 2'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire [1:0] _value_T_3 = deq_ptr_value + 2'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  assign ram_io_deq_bits_MPORT_en = 1'h1;
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = enq_ptr_value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[src/main/scala/chisel3/util/Decoupled.scala 304:19]
  assign io_deq_valid = ~empty; // @[src/main/scala/chisel3/util/Decoupled.scala 303:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 311:17]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      enq_ptr_value <= 2'h0; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else if (do_enq) begin // @[src/main/scala/chisel3/util/Decoupled.scala 287:16]
      enq_ptr_value <= _value_T_1; // @[src/main/scala/chisel3/util/Counter.scala 77:15]
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      deq_ptr_value <= 2'h0; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else if (do_deq) begin // @[src/main/scala/chisel3/util/Decoupled.scala 291:16]
      deq_ptr_value <= _value_T_3; // @[src/main/scala/chisel3/util/Counter.scala 77:15]
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Decoupled.scala 277:27]
      maybe_full <= 1'h0; // @[src/main/scala/chisel3/util/Decoupled.scala 277:27]
    end else if (do_enq != do_deq) begin // @[src/main/scala/chisel3/util/Decoupled.scala 294:27]
      maybe_full <= do_enq; // @[src/main/scala/chisel3/util/Decoupled.scala 295:16]
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
  _RAND_0 = {4{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram[initvar] = _RAND_0[127:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_1(
  input          clock,
  input          reset,
  output         io_enq_ready, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  input          io_enq_valid, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  input  [127:0] io_enq_bits, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  input          io_deq_ready, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  output         io_deq_valid, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  output [127:0] io_deq_bits // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [127:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [127:0] ram [0:31]; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire  ram_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire [4:0] ram_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire [127:0] ram_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire [127:0] ram_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire [4:0] ram_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire  ram_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire  ram_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  reg [4:0] enq_ptr_value; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  reg [4:0] deq_ptr_value; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  reg  maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 277:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[src/main/scala/chisel3/util/Decoupled.scala 278:33]
  wire  empty = ptr_match & ~maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 279:25]
  wire  full = ptr_match & maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 280:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [4:0] _value_T_1 = enq_ptr_value + 5'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire [4:0] _value_T_3 = deq_ptr_value + 5'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  assign ram_io_deq_bits_MPORT_en = 1'h1;
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = enq_ptr_value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[src/main/scala/chisel3/util/Decoupled.scala 304:19]
  assign io_deq_valid = ~empty; // @[src/main/scala/chisel3/util/Decoupled.scala 303:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 311:17]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      enq_ptr_value <= 5'h0; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else if (do_enq) begin // @[src/main/scala/chisel3/util/Decoupled.scala 287:16]
      enq_ptr_value <= _value_T_1; // @[src/main/scala/chisel3/util/Counter.scala 77:15]
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      deq_ptr_value <= 5'h0; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else if (do_deq) begin // @[src/main/scala/chisel3/util/Decoupled.scala 291:16]
      deq_ptr_value <= _value_T_3; // @[src/main/scala/chisel3/util/Counter.scala 77:15]
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Decoupled.scala 277:27]
      maybe_full <= 1'h0; // @[src/main/scala/chisel3/util/Decoupled.scala 277:27]
    end else if (do_enq != do_deq) begin // @[src/main/scala/chisel3/util/Decoupled.scala 294:27]
      maybe_full <= do_enq; // @[src/main/scala/chisel3/util/Decoupled.scala 295:16]
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
  _RAND_0 = {4{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    ram[initvar] = _RAND_0[127:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SidebandEnqArbiter(
  output         io_out_0_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 115:14]
  output [127:0] io_out_0_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 115:14]
  output         io_out_1_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 115:14]
  output [127:0] io_out_1_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 115:14]
  output         io_out_2_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 115:14]
  output [127:0] io_out_2_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 115:14]
  input          io_in_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 115:14]
  input  [127:0] io_in_bits // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 115:14]
);
  wire [127:0] _io_out_0_valid_T = io_in_bits & 128'h1f; // @[\\src\\main\\scala\\sideband\\sb-msg-encoding.scala 368:31]
  wire  _io_out_0_valid_T_7 = 128'h10 == _io_out_0_valid_T | 128'h11 == _io_out_0_valid_T | 128'h19 == _io_out_0_valid_T
    ; // @[\\src\\main\\scala\\sideband\\sb-msg-encoding.scala 368:58]
  wire  _io_out_1_valid_T_4 = 128'h12 == _io_out_0_valid_T | 128'h1b == _io_out_0_valid_T; // @[\\src\\main\\scala\\sideband\\sb-msg-encoding.scala 369:40]
  wire  _io_out_2_valid_T_1 = ~io_in_bits[4]; // @[\\src\\main\\scala\\sideband\\sb-msg-encoding.scala 370:28]
  assign io_out_0_valid = io_in_valid & _io_out_0_valid_T_7; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 125:34]
  assign io_out_0_bits = io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 120:38]
  assign io_out_1_valid = io_in_valid & _io_out_1_valid_T_4; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 126:34]
  assign io_out_1_bits = io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 120:38]
  assign io_out_2_valid = io_in_valid & _io_out_2_valid_T_1; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 127:34]
  assign io_out_2_bits = io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 120:38]
endmodule
module SidebandDeqArbiter(
  input          io_out_ready, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 131:14]
  output         io_out_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 131:14]
  output [127:0] io_out_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 131:14]
  output         io_in_0_ready, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 131:14]
  input          io_in_0_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 131:14]
  input  [127:0] io_in_0_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 131:14]
  output         io_in_1_ready, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 131:14]
  input          io_in_1_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 131:14]
  input  [127:0] io_in_1_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 131:14]
  output         io_in_2_ready, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 131:14]
  input          io_in_2_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 131:14]
  input  [127:0] io_in_2_bits // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 131:14]
);
  wire  _GEN_1 = io_in_2_valid & io_out_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 148:30 150:22 154:40]
  wire [127:0] _GEN_2 = io_in_2_valid ? io_in_2_bits : io_in_0_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 148:30 152:17 155:17]
  wire  _GEN_4 = io_in_1_valid & io_out_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 143:30 145:22]
  wire  _GEN_5 = io_in_1_valid ? 1'h0 : _GEN_1; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 143:30 145:22]
  wire [127:0] _GEN_6 = io_in_1_valid ? io_in_1_bits : _GEN_2; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 143:30 147:17]
  assign io_out_valid = io_in_0_valid | io_in_1_valid | io_in_2_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 136:52]
  assign io_out_bits = io_in_0_valid ? io_in_0_bits : _GEN_6; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 138:24 142:17]
  assign io_in_0_ready = io_in_0_valid & io_out_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 138:24 140:22]
  assign io_in_1_ready = io_in_0_valid ? 1'h0 : _GEN_4; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 138:24 140:22]
  assign io_in_2_ready = io_in_0_valid ? 1'h0 : _GEN_5; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 138:24 140:22]
endmodule
module SidebandPriorityQueue(
  input          clock,
  input          reset,
  input          io_enq_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 85:14]
  input  [127:0] io_enq_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 85:14]
  input          io_deq_ready, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 85:14]
  output         io_deq_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 85:14]
  output [127:0] io_deq_bits // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 85:14]
);
  wire  p0_queue_clock; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 90:24]
  wire  p0_queue_reset; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 90:24]
  wire  p0_queue_io_enq_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 90:24]
  wire  p0_queue_io_enq_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 90:24]
  wire [127:0] p0_queue_io_enq_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 90:24]
  wire  p0_queue_io_deq_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 90:24]
  wire  p0_queue_io_deq_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 90:24]
  wire [127:0] p0_queue_io_deq_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 90:24]
  wire  p1_queue_clock; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 93:24]
  wire  p1_queue_reset; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 93:24]
  wire  p1_queue_io_enq_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 93:24]
  wire  p1_queue_io_enq_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 93:24]
  wire [127:0] p1_queue_io_enq_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 93:24]
  wire  p1_queue_io_deq_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 93:24]
  wire  p1_queue_io_deq_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 93:24]
  wire [127:0] p1_queue_io_deq_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 93:24]
  wire  p2_queue_clock; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 96:24]
  wire  p2_queue_reset; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 96:24]
  wire  p2_queue_io_enq_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 96:24]
  wire  p2_queue_io_enq_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 96:24]
  wire [127:0] p2_queue_io_enq_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 96:24]
  wire  p2_queue_io_deq_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 96:24]
  wire  p2_queue_io_deq_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 96:24]
  wire [127:0] p2_queue_io_deq_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 96:24]
  wire  enq_arb_io_out_0_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 100:23]
  wire [127:0] enq_arb_io_out_0_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 100:23]
  wire  enq_arb_io_out_1_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 100:23]
  wire [127:0] enq_arb_io_out_1_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 100:23]
  wire  enq_arb_io_out_2_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 100:23]
  wire [127:0] enq_arb_io_out_2_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 100:23]
  wire  enq_arb_io_in_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 100:23]
  wire [127:0] enq_arb_io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 100:23]
  wire  deq_arb_io_out_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 101:23]
  wire  deq_arb_io_out_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 101:23]
  wire [127:0] deq_arb_io_out_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 101:23]
  wire  deq_arb_io_in_0_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 101:23]
  wire  deq_arb_io_in_0_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 101:23]
  wire [127:0] deq_arb_io_in_0_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 101:23]
  wire  deq_arb_io_in_1_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 101:23]
  wire  deq_arb_io_in_1_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 101:23]
  wire [127:0] deq_arb_io_in_1_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 101:23]
  wire  deq_arb_io_in_2_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 101:23]
  wire  deq_arb_io_in_2_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 101:23]
  wire [127:0] deq_arb_io_in_2_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 101:23]
  Queue p0_queue ( // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 90:24]
    .clock(p0_queue_clock),
    .reset(p0_queue_reset),
    .io_enq_ready(p0_queue_io_enq_ready),
    .io_enq_valid(p0_queue_io_enq_valid),
    .io_enq_bits(p0_queue_io_enq_bits),
    .io_deq_ready(p0_queue_io_deq_ready),
    .io_deq_valid(p0_queue_io_deq_valid),
    .io_deq_bits(p0_queue_io_deq_bits)
  );
  Queue_1 p1_queue ( // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 93:24]
    .clock(p1_queue_clock),
    .reset(p1_queue_reset),
    .io_enq_ready(p1_queue_io_enq_ready),
    .io_enq_valid(p1_queue_io_enq_valid),
    .io_enq_bits(p1_queue_io_enq_bits),
    .io_deq_ready(p1_queue_io_deq_ready),
    .io_deq_valid(p1_queue_io_deq_valid),
    .io_deq_bits(p1_queue_io_deq_bits)
  );
  Queue_1 p2_queue ( // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 96:24]
    .clock(p2_queue_clock),
    .reset(p2_queue_reset),
    .io_enq_ready(p2_queue_io_enq_ready),
    .io_enq_valid(p2_queue_io_enq_valid),
    .io_enq_bits(p2_queue_io_enq_bits),
    .io_deq_ready(p2_queue_io_deq_ready),
    .io_deq_valid(p2_queue_io_deq_valid),
    .io_deq_bits(p2_queue_io_deq_bits)
  );
  SidebandEnqArbiter enq_arb ( // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 100:23]
    .io_out_0_valid(enq_arb_io_out_0_valid),
    .io_out_0_bits(enq_arb_io_out_0_bits),
    .io_out_1_valid(enq_arb_io_out_1_valid),
    .io_out_1_bits(enq_arb_io_out_1_bits),
    .io_out_2_valid(enq_arb_io_out_2_valid),
    .io_out_2_bits(enq_arb_io_out_2_bits),
    .io_in_valid(enq_arb_io_in_valid),
    .io_in_bits(enq_arb_io_in_bits)
  );
  SidebandDeqArbiter deq_arb ( // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 101:23]
    .io_out_ready(deq_arb_io_out_ready),
    .io_out_valid(deq_arb_io_out_valid),
    .io_out_bits(deq_arb_io_out_bits),
    .io_in_0_ready(deq_arb_io_in_0_ready),
    .io_in_0_valid(deq_arb_io_in_0_valid),
    .io_in_0_bits(deq_arb_io_in_0_bits),
    .io_in_1_ready(deq_arb_io_in_1_ready),
    .io_in_1_valid(deq_arb_io_in_1_valid),
    .io_in_1_bits(deq_arb_io_in_1_bits),
    .io_in_2_ready(deq_arb_io_in_2_ready),
    .io_in_2_valid(deq_arb_io_in_2_valid),
    .io_in_2_bits(deq_arb_io_in_2_bits)
  );
  assign io_deq_valid = deq_arb_io_out_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 111:18]
  assign io_deq_bits = deq_arb_io_out_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 111:18]
  assign p0_queue_clock = clock;
  assign p0_queue_reset = reset;
  assign p0_queue_io_enq_valid = enq_arb_io_out_0_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 104:21]
  assign p0_queue_io_enq_bits = enq_arb_io_out_0_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 104:21]
  assign p0_queue_io_deq_ready = deq_arb_io_in_0_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 108:20]
  assign p1_queue_clock = clock;
  assign p1_queue_reset = reset;
  assign p1_queue_io_enq_valid = enq_arb_io_out_1_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 105:21]
  assign p1_queue_io_enq_bits = enq_arb_io_out_1_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 105:21]
  assign p1_queue_io_deq_ready = deq_arb_io_in_1_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 109:20]
  assign p2_queue_clock = clock;
  assign p2_queue_reset = reset;
  assign p2_queue_io_enq_valid = enq_arb_io_out_2_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 106:21]
  assign p2_queue_io_enq_bits = enq_arb_io_out_2_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 106:21]
  assign p2_queue_io_deq_ready = deq_arb_io_in_2_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 110:20]
  assign enq_arb_io_in_valid = io_enq_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 103:17]
  assign enq_arb_io_in_bits = io_enq_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 103:17]
  assign deq_arb_io_out_ready = io_deq_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 111:18]
  assign deq_arb_io_in_0_valid = p0_queue_io_deq_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 108:20]
  assign deq_arb_io_in_0_bits = p0_queue_io_deq_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 108:20]
  assign deq_arb_io_in_1_valid = p1_queue_io_deq_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 109:20]
  assign deq_arb_io_in_1_bits = p1_queue_io_deq_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 109:20]
  assign deq_arb_io_in_2_valid = p2_queue_io_deq_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 110:20]
  assign deq_arb_io_in_2_bits = p2_queue_io_deq_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 110:20]
endmodule
module SidebandDeserializer(
  input          clock,
  input          reset,
  input  [127:0] io_in_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 211:14]
  input          io_in_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 211:14]
  output         io_out_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 211:14]
  output [127:0] io_out_bits // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 211:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [127:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [127:0] data_0; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 221:17]
  reg  receiving; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 223:26]
  wire  _GEN_2 = io_in_valid ? 1'h0 : receiving; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 233:18 223:26 233:30]
  wire  _GEN_3 = io_out_valid | _GEN_2; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 235:{21,33}]
  assign io_out_valid = ~receiving; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 226:19]
  assign io_out_bits = data_0; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 227:15]
  always @(posedge clock) begin
    if (io_in_valid) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 229:21]
      data_0 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 230:21]
    end
    receiving <= reset | _GEN_3; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 223:{26,26}]
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
  data_0 = _RAND_0[127:0];
  _RAND_1 = {1{`RANDOM}};
  receiving = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SidebandNode(
  input          clock,
  input          reset,
  output         io_inner_layer_to_node_ready, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 58:14]
  input          io_inner_layer_to_node_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 58:14]
  input  [127:0] io_inner_layer_to_node_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 58:14]
  input          io_inner_node_to_layer_ready, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 58:14]
  output         io_inner_node_to_layer_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 58:14]
  output [127:0] io_inner_node_to_layer_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 58:14]
  output [127:0] io_outer_tx_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 58:14]
  output         io_outer_tx_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 58:14]
  input          io_outer_tx_credit, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 58:14]
  input  [127:0] io_outer_rx_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 58:14]
  input          io_outer_rx_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 58:14]
  output         io_outer_rx_credit // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 58:14]
);
  wire  tx_ser_clock; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 60:22]
  wire  tx_ser_reset; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 60:22]
  wire  tx_ser_io_in_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 60:22]
  wire  tx_ser_io_in_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 60:22]
  wire [127:0] tx_ser_io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 60:22]
  wire [127:0] tx_ser_io_out_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 60:22]
  wire  tx_ser_io_out_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 60:22]
  wire  tx_ser_io_out_credit; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 60:22]
  wire  rx_queue_clock; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 61:24]
  wire  rx_queue_reset; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 61:24]
  wire  rx_queue_io_enq_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 61:24]
  wire [127:0] rx_queue_io_enq_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 61:24]
  wire  rx_queue_io_deq_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 61:24]
  wire  rx_queue_io_deq_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 61:24]
  wire [127:0] rx_queue_io_deq_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 61:24]
  wire  rx_des_clock; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 62:22]
  wire  rx_des_reset; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 62:22]
  wire [127:0] rx_des_io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 62:22]
  wire  rx_des_io_in_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 62:22]
  wire  rx_des_io_out_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 62:22]
  wire [127:0] rx_des_io_out_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 62:22]
  wire  _io_outer_rx_credit_T = rx_queue_io_deq_ready & rx_queue_io_deq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [127:0] _io_outer_rx_credit_T_1 = rx_queue_io_deq_bits & 128'h1f; // @[\\src\\main\\scala\\sideband\\sb-msg-encoding.scala 368:31]
  wire  _io_outer_rx_credit_T_8 = 128'h10 == _io_outer_rx_credit_T_1 | 128'h11 == _io_outer_rx_credit_T_1 | 128'h19 ==
    _io_outer_rx_credit_T_1; // @[\\src\\main\\scala\\sideband\\sb-msg-encoding.scala 368:58]
  SidebandSerializer tx_ser ( // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 60:22]
    .clock(tx_ser_clock),
    .reset(tx_ser_reset),
    .io_in_ready(tx_ser_io_in_ready),
    .io_in_valid(tx_ser_io_in_valid),
    .io_in_bits(tx_ser_io_in_bits),
    .io_out_bits(tx_ser_io_out_bits),
    .io_out_valid(tx_ser_io_out_valid),
    .io_out_credit(tx_ser_io_out_credit)
  );
  SidebandPriorityQueue rx_queue ( // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 61:24]
    .clock(rx_queue_clock),
    .reset(rx_queue_reset),
    .io_enq_valid(rx_queue_io_enq_valid),
    .io_enq_bits(rx_queue_io_enq_bits),
    .io_deq_ready(rx_queue_io_deq_ready),
    .io_deq_valid(rx_queue_io_deq_valid),
    .io_deq_bits(rx_queue_io_deq_bits)
  );
  SidebandDeserializer rx_des ( // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 62:22]
    .clock(rx_des_clock),
    .reset(rx_des_reset),
    .io_in_bits(rx_des_io_in_bits),
    .io_in_valid(rx_des_io_in_valid),
    .io_out_valid(rx_des_io_out_valid),
    .io_out_bits(rx_des_io_out_bits)
  );
  assign io_inner_layer_to_node_ready = tx_ser_io_in_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 76:32]
  assign io_inner_node_to_layer_valid = rx_queue_io_deq_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 81:26]
  assign io_inner_node_to_layer_bits = rx_queue_io_deq_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 81:26]
  assign io_outer_tx_bits = tx_ser_io_out_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 65:15]
  assign io_outer_tx_valid = tx_ser_io_out_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 65:15]
  assign io_outer_rx_credit = _io_outer_rx_credit_T & ~_io_outer_rx_credit_T_8; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 68:46]
  assign tx_ser_clock = clock;
  assign tx_ser_reset = reset;
  assign tx_ser_io_in_valid = io_inner_layer_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 79:22]
  assign tx_ser_io_in_bits = io_inner_layer_to_node_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 78:21]
  assign tx_ser_io_out_credit = io_outer_tx_credit; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 65:15]
  assign rx_queue_clock = clock;
  assign rx_queue_reset = reset;
  assign rx_queue_io_enq_valid = rx_des_io_out_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 73:19]
  assign rx_queue_io_enq_bits = rx_des_io_out_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 73:19]
  assign rx_queue_io_deq_ready = io_inner_node_to_layer_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 81:26]
  assign rx_des_clock = clock;
  assign rx_des_reset = reset;
  assign rx_des_io_in_bits = io_outer_rx_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 67:20]
  assign rx_des_io_in_valid = io_outer_rx_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 66:21]
endmodule
module sidebandOneInTwoOutSwitch(
  output         io_outer_node_to_layer_ready, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 54:14]
  input          io_outer_node_to_layer_valid, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 54:14]
  input  [127:0] io_outer_node_to_layer_bits, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 54:14]
  input          io_inner_node_to_layer_ready, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 54:14]
  output         io_inner_node_to_layer_valid, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 54:14]
  output [127:0] io_inner_node_to_layer_bits, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 54:14]
  input          io_node_to_node_ready, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 54:14]
  output         io_node_to_node_valid, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 54:14]
  output [127:0] io_node_to_node_bits // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 54:14]
);
  wire  _io_inner_node_to_layer_valid_T_1 = io_outer_node_to_layer_bits[58:56] == 3'h0; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 61:19]
  wire  _io_node_to_node_valid_T_1 = io_outer_node_to_layer_bits[58:56] != 3'h0; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 64:19]
  assign io_outer_node_to_layer_ready = _io_inner_node_to_layer_valid_T_1 ? io_inner_node_to_layer_ready :
    io_node_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 67:38]
  assign io_inner_node_to_layer_valid = io_outer_node_to_layer_valid & _io_inner_node_to_layer_valid_T_1; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 60:64]
  assign io_inner_node_to_layer_bits = io_outer_node_to_layer_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 62:31]
  assign io_node_to_node_valid = io_outer_node_to_layer_valid & _io_node_to_node_valid_T_1; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 63:57]
  assign io_node_to_node_bits = io_outer_node_to_layer_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 65:24]
endmodule
module sidebandTwoInOneOutSwitch(
  input          io_outer_layer_to_node_ready, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 75:14]
  output         io_outer_layer_to_node_valid, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 75:14]
  output [127:0] io_outer_layer_to_node_bits, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 75:14]
  output         io_inner_layer_to_node_ready, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 75:14]
  input          io_inner_layer_to_node_valid, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 75:14]
  input  [127:0] io_inner_layer_to_node_bits, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 75:14]
  output         io_node_to_node_ready, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 75:14]
  input          io_node_to_node_valid, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 75:14]
  input  [127:0] io_node_to_node_bits // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 75:14]
);
  wire [127:0] _priority_node_to_node_T = io_node_to_node_bits & 128'h1f; // @[\\src\\main\\scala\\sideband\\sb-msg-encoding.scala 368:31]
  wire  _priority_node_to_node_T_7 = 128'h10 == _priority_node_to_node_T | 128'h11 == _priority_node_to_node_T | 128'h19
     == _priority_node_to_node_T; // @[\\src\\main\\scala\\sideband\\sb-msg-encoding.scala 368:58]
  wire  _priority_node_to_node_T_12 = 128'h12 == _priority_node_to_node_T | 128'h1b == _priority_node_to_node_T; // @[\\src\\main\\scala\\sideband\\sb-msg-encoding.scala 369:40]
  wire [1:0] _priority_node_to_node_T_13 = _priority_node_to_node_T_12 ? 2'h1 : 2'h2; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 90:8]
  wire [1:0] priority_node_to_node = _priority_node_to_node_T_7 ? 2'h0 : _priority_node_to_node_T_13; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 87:31]
  wire [127:0] _priority_inner_layer_to_node_T = io_inner_layer_to_node_bits & 128'h1f; // @[\\src\\main\\scala\\sideband\\sb-msg-encoding.scala 368:31]
  wire  _priority_inner_layer_to_node_T_7 = 128'h10 == _priority_inner_layer_to_node_T | 128'h11 ==
    _priority_inner_layer_to_node_T | 128'h19 == _priority_inner_layer_to_node_T; // @[\\src\\main\\scala\\sideband\\sb-msg-encoding.scala 368:58]
  wire  _priority_inner_layer_to_node_T_12 = 128'h12 == _priority_inner_layer_to_node_T | 128'h1b ==
    _priority_inner_layer_to_node_T; // @[\\src\\main\\scala\\sideband\\sb-msg-encoding.scala 369:40]
  wire [1:0] _priority_inner_layer_to_node_T_13 = _priority_inner_layer_to_node_T_12 ? 2'h1 : 2'h2; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 95:8]
  wire [1:0] priority_inner_layer_to_node = _priority_inner_layer_to_node_T_7 ? 2'h0 :
    _priority_inner_layer_to_node_T_13; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 92:38]
  wire  _flag_T = io_node_to_node_valid & io_inner_layer_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 98:27]
  wire  _flag_T_1 = priority_inner_layer_to_node > priority_node_to_node; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 99:34]
  wire  flag = _flag_T ? _flag_T_1 : io_node_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 97:14]
  assign io_outer_layer_to_node_valid = io_node_to_node_valid | io_inner_layer_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 103:57]
  assign io_outer_layer_to_node_bits = flag ? io_node_to_node_bits : io_inner_layer_to_node_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 104:37]
  assign io_inner_layer_to_node_ready = flag ? 1'h0 : io_outer_layer_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 110:38]
  assign io_node_to_node_ready = flag & io_outer_layer_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 109:31]
endmodule
module sidebandSwitcher(
  input          io_inner_node_to_layer_below_ready, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 10:14]
  output         io_inner_node_to_layer_below_valid, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 10:14]
  output [127:0] io_inner_node_to_layer_below_bits, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 10:14]
  output         io_inner_layer_to_node_below_ready, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 10:14]
  input          io_inner_layer_to_node_below_valid, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 10:14]
  input  [127:0] io_inner_layer_to_node_below_bits, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 10:14]
  output         io_outer_node_to_layer_above_ready, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 10:14]
  input          io_outer_node_to_layer_above_valid, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 10:14]
  input  [127:0] io_outer_node_to_layer_above_bits, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 10:14]
  input          io_outer_layer_to_node_above_ready, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 10:14]
  output         io_outer_layer_to_node_above_valid, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 10:14]
  output [127:0] io_outer_layer_to_node_above_bits, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 10:14]
  output         io_outer_node_to_layer_below_ready, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 10:14]
  input          io_outer_node_to_layer_below_valid, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 10:14]
  input  [127:0] io_outer_node_to_layer_below_bits, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 10:14]
  input          io_outer_layer_to_node_below_ready, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 10:14]
  output         io_outer_layer_to_node_below_valid, // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 10:14]
  output [127:0] io_outer_layer_to_node_below_bits // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 10:14]
);
  wire  outer_node_to_layer_below_subswitch_io_outer_node_to_layer_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 19:51]
  wire  outer_node_to_layer_below_subswitch_io_outer_node_to_layer_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 19:51]
  wire [127:0] outer_node_to_layer_below_subswitch_io_outer_node_to_layer_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 19:51]
  wire  outer_node_to_layer_below_subswitch_io_inner_node_to_layer_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 19:51]
  wire  outer_node_to_layer_below_subswitch_io_inner_node_to_layer_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 19:51]
  wire [127:0] outer_node_to_layer_below_subswitch_io_inner_node_to_layer_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 19:51]
  wire  outer_node_to_layer_below_subswitch_io_node_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 19:51]
  wire  outer_node_to_layer_below_subswitch_io_node_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 19:51]
  wire [127:0] outer_node_to_layer_below_subswitch_io_node_to_node_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 19:51]
  wire  outer_node_to_layer_above_subswitch_io_outer_node_to_layer_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 22:51]
  wire  outer_node_to_layer_above_subswitch_io_outer_node_to_layer_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 22:51]
  wire [127:0] outer_node_to_layer_above_subswitch_io_outer_node_to_layer_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 22:51]
  wire  outer_node_to_layer_above_subswitch_io_inner_node_to_layer_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 22:51]
  wire  outer_node_to_layer_above_subswitch_io_inner_node_to_layer_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 22:51]
  wire [127:0] outer_node_to_layer_above_subswitch_io_inner_node_to_layer_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 22:51]
  wire  outer_node_to_layer_above_subswitch_io_node_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 22:51]
  wire  outer_node_to_layer_above_subswitch_io_node_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 22:51]
  wire [127:0] outer_node_to_layer_above_subswitch_io_node_to_node_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 22:51]
  wire  outer_layer_to_node_above_subswitch_io_outer_layer_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 35:51]
  wire  outer_layer_to_node_above_subswitch_io_outer_layer_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 35:51]
  wire [127:0] outer_layer_to_node_above_subswitch_io_outer_layer_to_node_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 35:51]
  wire  outer_layer_to_node_above_subswitch_io_inner_layer_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 35:51]
  wire  outer_layer_to_node_above_subswitch_io_inner_layer_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 35:51]
  wire [127:0] outer_layer_to_node_above_subswitch_io_inner_layer_to_node_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 35:51]
  wire  outer_layer_to_node_above_subswitch_io_node_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 35:51]
  wire  outer_layer_to_node_above_subswitch_io_node_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 35:51]
  wire [127:0] outer_layer_to_node_above_subswitch_io_node_to_node_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 35:51]
  wire  outer_layer_to_node_below_subswitch_io_outer_layer_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 38:51]
  wire  outer_layer_to_node_below_subswitch_io_outer_layer_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 38:51]
  wire [127:0] outer_layer_to_node_below_subswitch_io_outer_layer_to_node_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 38:51]
  wire  outer_layer_to_node_below_subswitch_io_inner_layer_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 38:51]
  wire  outer_layer_to_node_below_subswitch_io_inner_layer_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 38:51]
  wire [127:0] outer_layer_to_node_below_subswitch_io_inner_layer_to_node_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 38:51]
  wire  outer_layer_to_node_below_subswitch_io_node_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 38:51]
  wire  outer_layer_to_node_below_subswitch_io_node_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 38:51]
  wire [127:0] outer_layer_to_node_below_subswitch_io_node_to_node_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 38:51]
  sidebandOneInTwoOutSwitch outer_node_to_layer_below_subswitch ( // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 19:51]
    .io_outer_node_to_layer_ready(outer_node_to_layer_below_subswitch_io_outer_node_to_layer_ready),
    .io_outer_node_to_layer_valid(outer_node_to_layer_below_subswitch_io_outer_node_to_layer_valid),
    .io_outer_node_to_layer_bits(outer_node_to_layer_below_subswitch_io_outer_node_to_layer_bits),
    .io_inner_node_to_layer_ready(outer_node_to_layer_below_subswitch_io_inner_node_to_layer_ready),
    .io_inner_node_to_layer_valid(outer_node_to_layer_below_subswitch_io_inner_node_to_layer_valid),
    .io_inner_node_to_layer_bits(outer_node_to_layer_below_subswitch_io_inner_node_to_layer_bits),
    .io_node_to_node_ready(outer_node_to_layer_below_subswitch_io_node_to_node_ready),
    .io_node_to_node_valid(outer_node_to_layer_below_subswitch_io_node_to_node_valid),
    .io_node_to_node_bits(outer_node_to_layer_below_subswitch_io_node_to_node_bits)
  );
  sidebandOneInTwoOutSwitch outer_node_to_layer_above_subswitch ( // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 22:51]
    .io_outer_node_to_layer_ready(outer_node_to_layer_above_subswitch_io_outer_node_to_layer_ready),
    .io_outer_node_to_layer_valid(outer_node_to_layer_above_subswitch_io_outer_node_to_layer_valid),
    .io_outer_node_to_layer_bits(outer_node_to_layer_above_subswitch_io_outer_node_to_layer_bits),
    .io_inner_node_to_layer_ready(outer_node_to_layer_above_subswitch_io_inner_node_to_layer_ready),
    .io_inner_node_to_layer_valid(outer_node_to_layer_above_subswitch_io_inner_node_to_layer_valid),
    .io_inner_node_to_layer_bits(outer_node_to_layer_above_subswitch_io_inner_node_to_layer_bits),
    .io_node_to_node_ready(outer_node_to_layer_above_subswitch_io_node_to_node_ready),
    .io_node_to_node_valid(outer_node_to_layer_above_subswitch_io_node_to_node_valid),
    .io_node_to_node_bits(outer_node_to_layer_above_subswitch_io_node_to_node_bits)
  );
  sidebandTwoInOneOutSwitch outer_layer_to_node_above_subswitch ( // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 35:51]
    .io_outer_layer_to_node_ready(outer_layer_to_node_above_subswitch_io_outer_layer_to_node_ready),
    .io_outer_layer_to_node_valid(outer_layer_to_node_above_subswitch_io_outer_layer_to_node_valid),
    .io_outer_layer_to_node_bits(outer_layer_to_node_above_subswitch_io_outer_layer_to_node_bits),
    .io_inner_layer_to_node_ready(outer_layer_to_node_above_subswitch_io_inner_layer_to_node_ready),
    .io_inner_layer_to_node_valid(outer_layer_to_node_above_subswitch_io_inner_layer_to_node_valid),
    .io_inner_layer_to_node_bits(outer_layer_to_node_above_subswitch_io_inner_layer_to_node_bits),
    .io_node_to_node_ready(outer_layer_to_node_above_subswitch_io_node_to_node_ready),
    .io_node_to_node_valid(outer_layer_to_node_above_subswitch_io_node_to_node_valid),
    .io_node_to_node_bits(outer_layer_to_node_above_subswitch_io_node_to_node_bits)
  );
  sidebandTwoInOneOutSwitch outer_layer_to_node_below_subswitch ( // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 38:51]
    .io_outer_layer_to_node_ready(outer_layer_to_node_below_subswitch_io_outer_layer_to_node_ready),
    .io_outer_layer_to_node_valid(outer_layer_to_node_below_subswitch_io_outer_layer_to_node_valid),
    .io_outer_layer_to_node_bits(outer_layer_to_node_below_subswitch_io_outer_layer_to_node_bits),
    .io_inner_layer_to_node_ready(outer_layer_to_node_below_subswitch_io_inner_layer_to_node_ready),
    .io_inner_layer_to_node_valid(outer_layer_to_node_below_subswitch_io_inner_layer_to_node_valid),
    .io_inner_layer_to_node_bits(outer_layer_to_node_below_subswitch_io_inner_layer_to_node_bits),
    .io_node_to_node_ready(outer_layer_to_node_below_subswitch_io_node_to_node_ready),
    .io_node_to_node_valid(outer_layer_to_node_below_subswitch_io_node_to_node_valid),
    .io_node_to_node_bits(outer_layer_to_node_below_subswitch_io_node_to_node_bits)
  );
  assign io_inner_node_to_layer_below_valid = outer_node_to_layer_below_subswitch_io_inner_node_to_layer_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 29:62]
  assign io_inner_node_to_layer_below_bits = outer_node_to_layer_below_subswitch_io_inner_node_to_layer_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 29:62]
  assign io_inner_layer_to_node_below_ready = outer_layer_to_node_below_subswitch_io_inner_layer_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 49:62]
  assign io_outer_node_to_layer_above_ready = outer_node_to_layer_above_subswitch_io_outer_node_to_layer_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 27:62]
  assign io_outer_layer_to_node_above_valid = outer_layer_to_node_above_subswitch_io_outer_layer_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 45:62]
  assign io_outer_layer_to_node_above_bits = outer_layer_to_node_above_subswitch_io_outer_layer_to_node_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 45:62]
  assign io_outer_node_to_layer_below_ready = outer_node_to_layer_below_subswitch_io_outer_node_to_layer_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 26:62]
  assign io_outer_layer_to_node_below_valid = outer_layer_to_node_below_subswitch_io_outer_layer_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 46:62]
  assign io_outer_layer_to_node_below_bits = outer_layer_to_node_below_subswitch_io_outer_layer_to_node_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 46:62]
  assign outer_node_to_layer_below_subswitch_io_outer_node_to_layer_valid = io_outer_node_to_layer_below_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 26:62]
  assign outer_node_to_layer_below_subswitch_io_outer_node_to_layer_bits = io_outer_node_to_layer_below_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 26:62]
  assign outer_node_to_layer_below_subswitch_io_inner_node_to_layer_ready = io_inner_node_to_layer_below_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 29:62]
  assign outer_node_to_layer_below_subswitch_io_node_to_node_ready =
    outer_layer_to_node_above_subswitch_io_node_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 12:41 42:55]
  assign outer_node_to_layer_above_subswitch_io_outer_node_to_layer_valid = io_outer_node_to_layer_above_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 27:62]
  assign outer_node_to_layer_above_subswitch_io_outer_node_to_layer_bits = io_outer_node_to_layer_above_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 27:62]
  assign outer_node_to_layer_above_subswitch_io_inner_node_to_layer_ready = 1'h0; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 30:62]
  assign outer_node_to_layer_above_subswitch_io_node_to_node_ready =
    outer_layer_to_node_below_subswitch_io_node_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 15:41 43:55]
  assign outer_layer_to_node_above_subswitch_io_outer_layer_to_node_ready = io_outer_layer_to_node_above_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 45:62]
  assign outer_layer_to_node_above_subswitch_io_inner_layer_to_node_valid = 1'h0; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 48:62]
  assign outer_layer_to_node_above_subswitch_io_inner_layer_to_node_bits = 128'h0; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 48:62]
  assign outer_layer_to_node_above_subswitch_io_node_to_node_valid =
    outer_node_to_layer_below_subswitch_io_node_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 12:41 32:31]
  assign outer_layer_to_node_above_subswitch_io_node_to_node_bits =
    outer_node_to_layer_below_subswitch_io_node_to_node_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 12:41 32:31]
  assign outer_layer_to_node_below_subswitch_io_outer_layer_to_node_ready = io_outer_layer_to_node_below_ready; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 46:62]
  assign outer_layer_to_node_below_subswitch_io_inner_layer_to_node_valid = io_inner_layer_to_node_below_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 49:62]
  assign outer_layer_to_node_below_subswitch_io_inner_layer_to_node_bits = io_inner_layer_to_node_below_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 49:62]
  assign outer_layer_to_node_below_subswitch_io_node_to_node_valid =
    outer_node_to_layer_above_subswitch_io_node_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 15:41 33:31]
  assign outer_layer_to_node_below_subswitch_io_node_to_node_bits =
    outer_node_to_layer_above_subswitch_io_node_to_node_bits; // @[\\src\\main\\scala\\sideband\\sidebandSwitcher.scala 15:41 33:31]
endmodule
module SidebandLinkSerializer(
  input          clock,
  input          reset,
  output         io_in_ready, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 244:14]
  input          io_in_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 244:14]
  input  [127:0] io_in_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 244:14]
  output         io_out_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 244:14]
  output         io_out_clock // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 244:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [127:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [127:0] data; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 255:17]
  reg [4:0] counter; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 259:26]
  reg  done; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 263:21]
  wire  _T = io_in_ready & io_in_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  _counter_next_T = counter == 5'h1f; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 260:31]
  wire [4:0] _counter_next_T_2 = counter + 5'h1; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 260:55]
  reg  sending; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 262:24]
  reg  waited; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 264:23]
  reg [6:0] sendCount; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap = sendCount == 7'h7f; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [6:0] _wrap_value_T_1 = sendCount + 7'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire  sendDone = sending & wrap_wrap; // @[src/main/scala/chisel3/util/Counter.scala 118:{16,23} 117:24]
  wire  _GEN_4 = _T | sending; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 277:20 279:13 262:24]
  wire  _GEN_5 = _T ? 1'h0 : waited; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 277:20 280:12 264:23]
  wire [127:0] _data_T = {{1'd0}, data[127:1]}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 284:32]
  wire  _GEN_9 = sendDone | done; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 286:18 288:10 263:21]
  wire  _GEN_11 = done ? _counter_next_T : _GEN_5; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 291:14 293:12]
  assign io_in_ready = waited; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 269:15]
  assign io_out_bits = data[0]; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 271:22]
  assign io_out_clock = sending & clock; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 270:22]
  always @(posedge clock) begin
    if (sending) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 284:17]
      data <= _data_T; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 284:24]
    end else if (_T) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 277:20]
      data <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 278:10]
    end
    if (reset) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 259:26]
      counter <= 5'h0; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 259:26]
    end else if (done) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 259:26]
      if (_T) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 277:20]
        counter <= 5'h0; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 281:18]
      end else if (counter == 5'h1f) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 260:22]
        counter <= 5'h1f;
      end else begin
        counter <= _counter_next_T_2;
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 263:21]
      done <= 1'h0; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 263:21]
    end else begin
      done <= _GEN_9;
    end
    if (reset) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 262:24]
      sending <= 1'h0; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 262:24]
    end else if (sendDone) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 286:18]
      sending <= 1'h0; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 287:13]
    end else begin
      sending <= _GEN_4;
    end
    waited <= reset | _GEN_11; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 264:{23,23}]
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      sendCount <= 7'h0; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else if (sending) begin // @[src/main/scala/chisel3/util/Counter.scala 118:16]
      sendCount <= _wrap_value_T_1; // @[src/main/scala/chisel3/util/Counter.scala 77:15]
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
  data = _RAND_0[127:0];
  _RAND_1 = {1{`RANDOM}};
  counter = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  done = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  sending = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  waited = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  sendCount = _RAND_5[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SidebandLinkDeserializer(
  input          clock,
  input          reset,
  input          io_in_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 303:14]
  input          io_in_remote_clock, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 303:14]
  input          io_out_ready, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 303:14]
  output         io_out_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 303:14]
  output [127:0] io_out_bits // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 303:14]
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
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
`endif // RANDOMIZE_REG_INIT
  reg  data_0; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_1; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_2; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_3; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_4; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_5; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_6; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_7; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_8; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_9; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_10; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_11; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_12; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_13; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_14; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_15; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_16; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_17; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_18; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_19; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_20; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_21; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_22; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_23; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_24; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_25; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_26; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_27; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_28; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_29; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_30; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_31; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_32; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_33; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_34; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_35; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_36; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_37; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_38; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_39; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_40; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_41; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_42; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_43; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_44; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_45; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_46; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_47; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_48; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_49; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_50; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_51; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_52; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_53; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_54; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_55; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_56; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_57; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_58; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_59; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_60; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_61; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_62; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_63; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_64; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_65; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_66; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_67; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_68; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_69; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_70; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_71; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_72; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_73; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_74; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_75; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_76; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_77; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_78; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_79; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_80; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_81; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_82; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_83; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_84; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_85; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_86; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_87; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_88; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_89; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_90; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_91; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_92; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_93; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_94; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_95; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_96; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_97; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_98; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_99; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_100; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_101; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_102; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_103; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_104; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_105; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_106; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_107; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_108; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_109; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_110; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_111; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_112; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_113; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_114; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_115; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_116; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_117; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_118; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_119; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_120; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_121; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_122; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_123; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_124; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_125; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_126; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  data_127; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 315:17]
  reg  receiving; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 317:26]
  reg [6:0] recvCount; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap = recvCount == 7'h7f; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [6:0] _wrap_value_T_1 = recvCount + 7'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  reg [6:0] recvCount_delay; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 323:34]
  wire  _GEN_130 = wrap_wrap ? 1'h0 : receiving; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 327:20 317:26 327:32]
  wire  _T = io_out_ready & io_out_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  _GEN_131 = _T | _GEN_130; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 328:{23,35}]
  wire [7:0] io_out_bits_lo_lo_lo_lo = {data_7,data_6,data_5,data_4,data_3,data_2,data_1,data_0}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  wire [15:0] io_out_bits_lo_lo_lo = {data_15,data_14,data_13,data_12,data_11,data_10,data_9,data_8,
    io_out_bits_lo_lo_lo_lo}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  wire [7:0] io_out_bits_lo_lo_hi_lo = {data_23,data_22,data_21,data_20,data_19,data_18,data_17,data_16}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  wire [31:0] io_out_bits_lo_lo = {data_31,data_30,data_29,data_28,data_27,data_26,data_25,data_24,
    io_out_bits_lo_lo_hi_lo,io_out_bits_lo_lo_lo}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  wire [7:0] io_out_bits_lo_hi_lo_lo = {data_39,data_38,data_37,data_36,data_35,data_34,data_33,data_32}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  wire [15:0] io_out_bits_lo_hi_lo = {data_47,data_46,data_45,data_44,data_43,data_42,data_41,data_40,
    io_out_bits_lo_hi_lo_lo}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  wire [7:0] io_out_bits_lo_hi_hi_lo = {data_55,data_54,data_53,data_52,data_51,data_50,data_49,data_48}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  wire [31:0] io_out_bits_lo_hi = {data_63,data_62,data_61,data_60,data_59,data_58,data_57,data_56,
    io_out_bits_lo_hi_hi_lo,io_out_bits_lo_hi_lo}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  wire [63:0] io_out_bits_lo = {io_out_bits_lo_hi,io_out_bits_lo_lo}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  wire [7:0] io_out_bits_hi_lo_lo_lo = {data_71,data_70,data_69,data_68,data_67,data_66,data_65,data_64}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  wire [15:0] io_out_bits_hi_lo_lo = {data_79,data_78,data_77,data_76,data_75,data_74,data_73,data_72,
    io_out_bits_hi_lo_lo_lo}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  wire [7:0] io_out_bits_hi_lo_hi_lo = {data_87,data_86,data_85,data_84,data_83,data_82,data_81,data_80}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  wire [31:0] io_out_bits_hi_lo = {data_95,data_94,data_93,data_92,data_91,data_90,data_89,data_88,
    io_out_bits_hi_lo_hi_lo,io_out_bits_hi_lo_lo}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  wire [7:0] io_out_bits_hi_hi_lo_lo = {data_103,data_102,data_101,data_100,data_99,data_98,data_97,data_96}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  wire [15:0] io_out_bits_hi_hi_lo = {data_111,data_110,data_109,data_108,data_107,data_106,data_105,data_104,
    io_out_bits_hi_hi_lo_lo}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  wire [7:0] io_out_bits_hi_hi_hi_lo = {data_119,data_118,data_117,data_116,data_115,data_114,data_113,data_112}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  wire [31:0] io_out_bits_hi_hi = {data_127,data_126,data_125,data_124,data_123,data_122,data_121,data_120,
    io_out_bits_hi_hi_hi_lo,io_out_bits_hi_hi_lo}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  wire [63:0] io_out_bits_hi = {io_out_bits_hi_hi,io_out_bits_hi_lo}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  assign io_out_valid = ~receiving; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 329:21]
  assign io_out_bits = {io_out_bits_hi,io_out_bits_lo}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 331:25]
  always @(posedge clock) begin
    if (7'h0 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_0 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h1 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_1 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h2 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_2 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h3 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_3 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h4 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_4 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h5 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_5 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h6 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_6 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h7 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_7 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h8 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_8 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h9 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_9 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'ha == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_10 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'hb == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_11 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'hc == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_12 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'hd == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_13 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'he == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_14 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'hf == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_15 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h10 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_16 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h11 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_17 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h12 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_18 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h13 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_19 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h14 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_20 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h15 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_21 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h16 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_22 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h17 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_23 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h18 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_24 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h19 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_25 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h1a == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_26 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h1b == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_27 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h1c == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_28 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h1d == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_29 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h1e == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_30 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h1f == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_31 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h20 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_32 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h21 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_33 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h22 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_34 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h23 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_35 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h24 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_36 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h25 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_37 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h26 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_38 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h27 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_39 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h28 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_40 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h29 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_41 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h2a == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_42 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h2b == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_43 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h2c == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_44 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h2d == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_45 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h2e == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_46 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h2f == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_47 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h30 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_48 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h31 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_49 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h32 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_50 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h33 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_51 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h34 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_52 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h35 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_53 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h36 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_54 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h37 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_55 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h38 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_56 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h39 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_57 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h3a == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_58 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h3b == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_59 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h3c == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_60 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h3d == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_61 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h3e == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_62 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h3f == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_63 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h40 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_64 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h41 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_65 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h42 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_66 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h43 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_67 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h44 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_68 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h45 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_69 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h46 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_70 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h47 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_71 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h48 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_72 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h49 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_73 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h4a == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_74 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h4b == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_75 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h4c == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_76 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h4d == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_77 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h4e == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_78 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h4f == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_79 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h50 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_80 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h51 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_81 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h52 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_82 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h53 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_83 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h54 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_84 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h55 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_85 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h56 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_86 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h57 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_87 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h58 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_88 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h59 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_89 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h5a == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_90 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h5b == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_91 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h5c == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_92 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h5d == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_93 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h5e == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_94 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h5f == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_95 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h60 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_96 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h61 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_97 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h62 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_98 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h63 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_99 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h64 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_100 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h65 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_101 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h66 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_102 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h67 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_103 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h68 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_104 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h69 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_105 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h6a == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_106 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h6b == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_107 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h6c == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_108 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h6d == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_109 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h6e == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_110 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h6f == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_111 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h70 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_112 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h71 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_113 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h72 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_114 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h73 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_115 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h74 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_116 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h75 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_117 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h76 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_118 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h77 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_119 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h78 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_120 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h79 == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_121 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h7a == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_122 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h7b == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_123 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h7c == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_124 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h7d == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_125 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h7e == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_126 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    if (7'h7f == recvCount_delay) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
      data_127 <= io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 326:27]
    end
    receiving <= reset | _GEN_131; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 317:{26,26}]
  end
  always @(posedge io_in_remote_clock) begin
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      recvCount <= 7'h0; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else begin
      recvCount <= _wrap_value_T_1;
    end
    if (reset) begin // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 323:34]
      recvCount_delay <= 7'h0; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 323:34]
    end else begin
      recvCount_delay <= recvCount; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 324:21]
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
  data_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  data_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  data_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  data_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  data_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  data_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  data_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  data_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  data_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  data_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  data_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  data_11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  data_12 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  data_13 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  data_14 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  data_15 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  data_16 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  data_17 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  data_18 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  data_19 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  data_20 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  data_21 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  data_22 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  data_23 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  data_24 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  data_25 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  data_26 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  data_27 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  data_28 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  data_29 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  data_30 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  data_31 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  data_32 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  data_33 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  data_34 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  data_35 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  data_36 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  data_37 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  data_38 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  data_39 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  data_40 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  data_41 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  data_42 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  data_43 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  data_44 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  data_45 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  data_46 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  data_47 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  data_48 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  data_49 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  data_50 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  data_51 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  data_52 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  data_53 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  data_54 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  data_55 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  data_56 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  data_57 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  data_58 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  data_59 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  data_60 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  data_61 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  data_62 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  data_63 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  data_64 = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  data_65 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  data_66 = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  data_67 = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  data_68 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  data_69 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  data_70 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  data_71 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  data_72 = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  data_73 = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  data_74 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  data_75 = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  data_76 = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  data_77 = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  data_78 = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  data_79 = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  data_80 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  data_81 = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  data_82 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  data_83 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  data_84 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  data_85 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  data_86 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  data_87 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  data_88 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  data_89 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  data_90 = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  data_91 = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  data_92 = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  data_93 = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  data_94 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  data_95 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  data_96 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  data_97 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  data_98 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  data_99 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  data_100 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  data_101 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  data_102 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  data_103 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  data_104 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  data_105 = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  data_106 = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  data_107 = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  data_108 = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  data_109 = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  data_110 = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  data_111 = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  data_112 = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  data_113 = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  data_114 = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  data_115 = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  data_116 = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  data_117 = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  data_118 = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  data_119 = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  data_120 = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  data_121 = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  data_122 = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  data_123 = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  data_124 = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  data_125 = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  data_126 = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  data_127 = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  receiving = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  recvCount = _RAND_129[6:0];
  _RAND_130 = {1{`RANDOM}};
  recvCount_delay = _RAND_130[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SidebandLinkNode(
  input          clock,
  input          reset,
  input          io_rxMode, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 22:14]
  output         io_inner_layer_to_node_ready, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 22:14]
  input          io_inner_layer_to_node_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 22:14]
  input  [127:0] io_inner_layer_to_node_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 22:14]
  input          io_inner_node_to_layer_ready, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 22:14]
  output         io_inner_node_to_layer_valid, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 22:14]
  output [127:0] io_inner_node_to_layer_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 22:14]
  output         io_outer_tx_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 22:14]
  output         io_outer_tx_clock, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 22:14]
  input          io_outer_rx_bits, // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 22:14]
  input          io_outer_rx_clock // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 22:14]
);
  wire  tx_ser_clock; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 24:22]
  wire  tx_ser_reset; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 24:22]
  wire  tx_ser_io_in_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 24:22]
  wire  tx_ser_io_in_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 24:22]
  wire [127:0] tx_ser_io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 24:22]
  wire  tx_ser_io_out_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 24:22]
  wire  tx_ser_io_out_clock; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 24:22]
  wire  rx_des_clock; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 25:22]
  wire  rx_des_reset; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 25:22]
  wire  rx_des_io_in_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 25:22]
  wire  rx_des_io_in_remote_clock; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 25:22]
  wire  rx_des_io_out_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 25:22]
  wire  rx_des_io_out_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 25:22]
  wire [127:0] rx_des_io_out_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 25:22]
  wire  rx_queue_clock; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 26:24]
  wire  rx_queue_reset; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 26:24]
  wire  rx_queue_io_enq_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 26:24]
  wire [127:0] rx_queue_io_enq_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 26:24]
  wire  rx_queue_io_deq_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 26:24]
  wire  rx_queue_io_deq_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 26:24]
  wire [127:0] rx_queue_io_deq_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 26:24]
  wire [69:0] tx_ser_io_in_bits_hi = {io_inner_layer_to_node_bits[127:59],1'h0}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 39:27]
  SidebandLinkSerializer tx_ser ( // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 24:22]
    .clock(tx_ser_clock),
    .reset(tx_ser_reset),
    .io_in_ready(tx_ser_io_in_ready),
    .io_in_valid(tx_ser_io_in_valid),
    .io_in_bits(tx_ser_io_in_bits),
    .io_out_bits(tx_ser_io_out_bits),
    .io_out_clock(tx_ser_io_out_clock)
  );
  SidebandLinkDeserializer rx_des ( // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 25:22]
    .clock(rx_des_clock),
    .reset(rx_des_reset),
    .io_in_bits(rx_des_io_in_bits),
    .io_in_remote_clock(rx_des_io_in_remote_clock),
    .io_out_ready(rx_des_io_out_ready),
    .io_out_valid(rx_des_io_out_valid),
    .io_out_bits(rx_des_io_out_bits)
  );
  SidebandPriorityQueue rx_queue ( // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 26:24]
    .clock(rx_queue_clock),
    .reset(rx_queue_reset),
    .io_enq_valid(rx_queue_io_enq_valid),
    .io_enq_bits(rx_queue_io_enq_bits),
    .io_deq_ready(rx_queue_io_deq_ready),
    .io_deq_valid(rx_queue_io_deq_valid),
    .io_deq_bits(rx_queue_io_deq_bits)
  );
  assign io_inner_layer_to_node_ready = tx_ser_io_in_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 37:32]
  assign io_inner_node_to_layer_valid = io_rxMode ? rx_queue_io_deq_valid : rx_des_io_out_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 46:39 47:28 51:28]
  assign io_inner_node_to_layer_bits = io_rxMode ? rx_queue_io_deq_bits : rx_des_io_out_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 46:39 47:28 51:28]
  assign io_outer_tx_bits = tx_ser_io_out_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 29:15]
  assign io_outer_tx_clock = tx_ser_io_out_clock; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 29:15]
  assign tx_ser_clock = clock;
  assign tx_ser_reset = reset;
  assign tx_ser_io_in_valid = io_inner_layer_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 44:22]
  assign tx_ser_io_in_bits = {tx_ser_io_in_bits_hi,io_inner_layer_to_node_bits[57:0]}; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 39:27]
  assign rx_des_clock = clock;
  assign rx_des_reset = reset;
  assign rx_des_io_in_bits = io_outer_rx_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 31:20]
  assign rx_des_io_in_remote_clock = io_outer_rx_clock; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 30:21]
  assign rx_des_io_out_ready = io_rxMode | io_inner_node_to_layer_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 34:19 46:39 51:28]
  assign rx_queue_clock = clock;
  assign rx_queue_reset = reset;
  assign rx_queue_io_enq_valid = io_rxMode & rx_des_io_out_valid; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 34:19 46:39 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  assign rx_queue_io_enq_bits = rx_des_io_out_bits; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 34:19 46:39]
  assign rx_queue_io_deq_ready = io_rxMode & io_inner_node_to_layer_ready; // @[\\src\\main\\scala\\sideband\\sidebandNode.scala 46:39 47:28 src/main/scala/chisel3/util/Decoupled.scala 90:20]
endmodule
module PHYSidebandChannel(
  input          clock,
  input          reset,
  output [127:0] io_to_upper_layer_tx_bits, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  output         io_to_upper_layer_tx_valid, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  input          io_to_upper_layer_tx_credit, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  input  [127:0] io_to_upper_layer_rx_bits, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  input          io_to_upper_layer_rx_valid, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  output         io_to_upper_layer_rx_credit, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  output         io_to_lower_layer_tx_bits, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  output         io_to_lower_layer_tx_clock, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  input          io_to_lower_layer_rx_bits, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  input          io_to_lower_layer_rx_clock, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  input          io_inner_inputMode, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  input          io_inner_rxMode, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  output         io_inner_rawInput_ready, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  input          io_inner_rawInput_valid, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  input  [127:0] io_inner_rawInput_bits, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  input          io_inner_switcherBundle_node_to_layer_below_ready, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  output         io_inner_switcherBundle_node_to_layer_below_valid, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  output [127:0] io_inner_switcherBundle_node_to_layer_below_bits, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  output         io_inner_switcherBundle_layer_to_node_below_ready, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  input          io_inner_switcherBundle_layer_to_node_below_valid, // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
  input  [127:0] io_inner_switcherBundle_layer_to_node_below_bits // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 39:14]
);
  wire  upper_node_clock; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 42:26]
  wire  upper_node_reset; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 42:26]
  wire  upper_node_io_inner_layer_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 42:26]
  wire  upper_node_io_inner_layer_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 42:26]
  wire [127:0] upper_node_io_inner_layer_to_node_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 42:26]
  wire  upper_node_io_inner_node_to_layer_ready; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 42:26]
  wire  upper_node_io_inner_node_to_layer_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 42:26]
  wire [127:0] upper_node_io_inner_node_to_layer_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 42:26]
  wire [127:0] upper_node_io_outer_tx_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 42:26]
  wire  upper_node_io_outer_tx_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 42:26]
  wire  upper_node_io_outer_tx_credit; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 42:26]
  wire [127:0] upper_node_io_outer_rx_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 42:26]
  wire  upper_node_io_outer_rx_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 42:26]
  wire  upper_node_io_outer_rx_credit; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 42:26]
  wire  switcher_io_inner_node_to_layer_below_ready; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
  wire  switcher_io_inner_node_to_layer_below_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
  wire [127:0] switcher_io_inner_node_to_layer_below_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
  wire  switcher_io_inner_layer_to_node_below_ready; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
  wire  switcher_io_inner_layer_to_node_below_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
  wire [127:0] switcher_io_inner_layer_to_node_below_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
  wire  switcher_io_outer_node_to_layer_above_ready; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
  wire  switcher_io_outer_node_to_layer_above_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
  wire [127:0] switcher_io_outer_node_to_layer_above_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
  wire  switcher_io_outer_layer_to_node_above_ready; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
  wire  switcher_io_outer_layer_to_node_above_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
  wire [127:0] switcher_io_outer_layer_to_node_above_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
  wire  switcher_io_outer_node_to_layer_below_ready; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
  wire  switcher_io_outer_node_to_layer_below_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
  wire [127:0] switcher_io_outer_node_to_layer_below_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
  wire  switcher_io_outer_layer_to_node_below_ready; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
  wire  switcher_io_outer_layer_to_node_below_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
  wire [127:0] switcher_io_outer_layer_to_node_below_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
  wire  lower_node_clock; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 44:26]
  wire  lower_node_reset; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 44:26]
  wire  lower_node_io_rxMode; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 44:26]
  wire  lower_node_io_inner_layer_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 44:26]
  wire  lower_node_io_inner_layer_to_node_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 44:26]
  wire [127:0] lower_node_io_inner_layer_to_node_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 44:26]
  wire  lower_node_io_inner_node_to_layer_ready; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 44:26]
  wire  lower_node_io_inner_node_to_layer_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 44:26]
  wire [127:0] lower_node_io_inner_node_to_layer_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 44:26]
  wire  lower_node_io_outer_tx_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 44:26]
  wire  lower_node_io_outer_tx_clock; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 44:26]
  wire  lower_node_io_outer_rx_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 44:26]
  wire  lower_node_io_outer_rx_clock; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 44:26]
  SidebandNode upper_node ( // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 42:26]
    .clock(upper_node_clock),
    .reset(upper_node_reset),
    .io_inner_layer_to_node_ready(upper_node_io_inner_layer_to_node_ready),
    .io_inner_layer_to_node_valid(upper_node_io_inner_layer_to_node_valid),
    .io_inner_layer_to_node_bits(upper_node_io_inner_layer_to_node_bits),
    .io_inner_node_to_layer_ready(upper_node_io_inner_node_to_layer_ready),
    .io_inner_node_to_layer_valid(upper_node_io_inner_node_to_layer_valid),
    .io_inner_node_to_layer_bits(upper_node_io_inner_node_to_layer_bits),
    .io_outer_tx_bits(upper_node_io_outer_tx_bits),
    .io_outer_tx_valid(upper_node_io_outer_tx_valid),
    .io_outer_tx_credit(upper_node_io_outer_tx_credit),
    .io_outer_rx_bits(upper_node_io_outer_rx_bits),
    .io_outer_rx_valid(upper_node_io_outer_rx_valid),
    .io_outer_rx_credit(upper_node_io_outer_rx_credit)
  );
  sidebandSwitcher switcher ( // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 43:24]
    .io_inner_node_to_layer_below_ready(switcher_io_inner_node_to_layer_below_ready),
    .io_inner_node_to_layer_below_valid(switcher_io_inner_node_to_layer_below_valid),
    .io_inner_node_to_layer_below_bits(switcher_io_inner_node_to_layer_below_bits),
    .io_inner_layer_to_node_below_ready(switcher_io_inner_layer_to_node_below_ready),
    .io_inner_layer_to_node_below_valid(switcher_io_inner_layer_to_node_below_valid),
    .io_inner_layer_to_node_below_bits(switcher_io_inner_layer_to_node_below_bits),
    .io_outer_node_to_layer_above_ready(switcher_io_outer_node_to_layer_above_ready),
    .io_outer_node_to_layer_above_valid(switcher_io_outer_node_to_layer_above_valid),
    .io_outer_node_to_layer_above_bits(switcher_io_outer_node_to_layer_above_bits),
    .io_outer_layer_to_node_above_ready(switcher_io_outer_layer_to_node_above_ready),
    .io_outer_layer_to_node_above_valid(switcher_io_outer_layer_to_node_above_valid),
    .io_outer_layer_to_node_above_bits(switcher_io_outer_layer_to_node_above_bits),
    .io_outer_node_to_layer_below_ready(switcher_io_outer_node_to_layer_below_ready),
    .io_outer_node_to_layer_below_valid(switcher_io_outer_node_to_layer_below_valid),
    .io_outer_node_to_layer_below_bits(switcher_io_outer_node_to_layer_below_bits),
    .io_outer_layer_to_node_below_ready(switcher_io_outer_layer_to_node_below_ready),
    .io_outer_layer_to_node_below_valid(switcher_io_outer_layer_to_node_below_valid),
    .io_outer_layer_to_node_below_bits(switcher_io_outer_layer_to_node_below_bits)
  );
  SidebandLinkNode lower_node ( // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 44:26]
    .clock(lower_node_clock),
    .reset(lower_node_reset),
    .io_rxMode(lower_node_io_rxMode),
    .io_inner_layer_to_node_ready(lower_node_io_inner_layer_to_node_ready),
    .io_inner_layer_to_node_valid(lower_node_io_inner_layer_to_node_valid),
    .io_inner_layer_to_node_bits(lower_node_io_inner_layer_to_node_bits),
    .io_inner_node_to_layer_ready(lower_node_io_inner_node_to_layer_ready),
    .io_inner_node_to_layer_valid(lower_node_io_inner_node_to_layer_valid),
    .io_inner_node_to_layer_bits(lower_node_io_inner_node_to_layer_bits),
    .io_outer_tx_bits(lower_node_io_outer_tx_bits),
    .io_outer_tx_clock(lower_node_io_outer_tx_clock),
    .io_outer_rx_bits(lower_node_io_outer_rx_bits),
    .io_outer_rx_clock(lower_node_io_outer_rx_clock)
  );
  assign io_to_upper_layer_tx_bits = upper_node_io_outer_tx_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 47:21]
  assign io_to_upper_layer_tx_valid = upper_node_io_outer_tx_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 47:21]
  assign io_to_upper_layer_rx_credit = upper_node_io_outer_rx_credit; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 47:21]
  assign io_to_lower_layer_tx_bits = lower_node_io_outer_tx_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 48:21]
  assign io_to_lower_layer_tx_clock = lower_node_io_outer_tx_clock; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 48:21]
  assign io_inner_rawInput_ready = io_inner_inputMode ? 1'h0 : lower_node_io_inner_layer_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 53:48 src/main/scala/chisel3/util/Decoupled.scala 90:20 \\src\\main\\scala\\sideband\\sidebandChannel.scala 58:39]
  assign io_inner_switcherBundle_node_to_layer_below_valid = switcher_io_inner_node_to_layer_below_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 64:27]
  assign io_inner_switcherBundle_node_to_layer_below_bits = switcher_io_inner_node_to_layer_below_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 64:27]
  assign io_inner_switcherBundle_layer_to_node_below_ready = switcher_io_inner_layer_to_node_below_ready; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 64:27]
  assign upper_node_clock = clock;
  assign upper_node_reset = reset;
  assign upper_node_io_inner_layer_to_node_valid = switcher_io_outer_layer_to_node_above_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 51:37]
  assign upper_node_io_inner_layer_to_node_bits = switcher_io_outer_layer_to_node_above_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 51:37]
  assign upper_node_io_inner_node_to_layer_ready = switcher_io_outer_node_to_layer_above_ready; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 52:37]
  assign upper_node_io_outer_tx_credit = io_to_upper_layer_tx_credit; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 47:21]
  assign upper_node_io_outer_rx_bits = io_to_upper_layer_rx_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 47:21]
  assign upper_node_io_outer_rx_valid = io_to_upper_layer_rx_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 47:21]
  assign switcher_io_inner_node_to_layer_below_ready = io_inner_switcherBundle_node_to_layer_below_ready; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 64:27]
  assign switcher_io_inner_layer_to_node_below_valid = io_inner_switcherBundle_layer_to_node_below_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 64:27]
  assign switcher_io_inner_layer_to_node_below_bits = io_inner_switcherBundle_layer_to_node_below_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 64:27]
  assign switcher_io_outer_node_to_layer_above_valid = upper_node_io_inner_node_to_layer_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 52:37]
  assign switcher_io_outer_node_to_layer_above_bits = upper_node_io_inner_node_to_layer_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 52:37]
  assign switcher_io_outer_layer_to_node_above_ready = upper_node_io_inner_layer_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 51:37]
  assign switcher_io_outer_node_to_layer_below_valid = lower_node_io_inner_node_to_layer_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 60:37]
  assign switcher_io_outer_node_to_layer_below_bits = lower_node_io_inner_node_to_layer_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 60:37]
  assign switcher_io_outer_layer_to_node_below_ready = io_inner_inputMode & lower_node_io_inner_layer_to_node_ready; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 53:48 55:39 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  assign lower_node_clock = clock;
  assign lower_node_reset = reset;
  assign lower_node_io_rxMode = io_inner_rxMode; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 61:24]
  assign lower_node_io_inner_layer_to_node_valid = io_inner_inputMode ? switcher_io_outer_layer_to_node_below_valid :
    io_inner_rawInput_valid; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 53:48 55:39 58:39]
  assign lower_node_io_inner_layer_to_node_bits = io_inner_inputMode ? switcher_io_outer_layer_to_node_below_bits :
    io_inner_rawInput_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 53:48 55:39 58:39]
  assign lower_node_io_inner_node_to_layer_ready = switcher_io_outer_node_to_layer_below_ready; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 60:37]
  assign lower_node_io_outer_rx_bits = io_to_lower_layer_rx_bits; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 48:21]
  assign lower_node_io_outer_rx_clock = io_to_lower_layer_rx_clock; // @[\\src\\main\\scala\\sideband\\sidebandChannel.scala 48:21]
endmodule
module LogicalPhy(
  input          clock,
  input          reset,
  output         io_rdi_lpData_ready, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_rdi_lpData_valid, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_rdi_lpData_irdy, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [511:0] io_rdi_lpData_bits, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_rdi_plData_valid, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [511:0] io_rdi_plData_bits, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_rdi_lpRetimerCrd, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_rdi_plRetimerCrd, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [3:0]   io_rdi_lpStateReq, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_rdi_lpLinkError, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [3:0]   io_rdi_plStateStatus, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_rdi_plInbandPres, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_rdi_plError, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_rdi_plCorrectableError, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_rdi_plNonFatalError, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_rdi_plTrainError, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_rdi_plPhyInRecenter, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_rdi_plStallReq, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_rdi_lpStallAck, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [2:0]   io_rdi_plSpeedMode, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [2:0]   io_rdi_plLinkWidth, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_rdi_plClkReq, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_rdi_lpClkAck, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_rdi_lpWakeReq, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_rdi_plWakeAck, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_rdi_plConfig_valid, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [31:0]  io_rdi_plConfig_bits, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_rdi_plConfigCredit, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_rdi_lpConfig_valid, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [31:0]  io_rdi_lpConfig_bits, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_rdi_lpConfigCredit, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_mbAfe_fifoParams_clk, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_mbAfe_fifoParams_reset, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_mbAfe_txData_ready, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_mbAfe_txData_valid, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [15:0]  io_mbAfe_txData_bits_0, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [15:0]  io_mbAfe_txData_bits_1, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [15:0]  io_mbAfe_txData_bits_2, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [15:0]  io_mbAfe_txData_bits_3, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [15:0]  io_mbAfe_txData_bits_4, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [15:0]  io_mbAfe_txData_bits_5, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [15:0]  io_mbAfe_txData_bits_6, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [15:0]  io_mbAfe_txData_bits_7, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [15:0]  io_mbAfe_txData_bits_8, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [15:0]  io_mbAfe_txData_bits_9, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [15:0]  io_mbAfe_txData_bits_10, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [15:0]  io_mbAfe_txData_bits_11, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [15:0]  io_mbAfe_txData_bits_12, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [15:0]  io_mbAfe_txData_bits_13, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [15:0]  io_mbAfe_txData_bits_14, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [15:0]  io_mbAfe_txData_bits_15, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_mbAfe_rxData_ready, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_mbAfe_rxData_valid, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [15:0]  io_mbAfe_rxData_bits_0, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [15:0]  io_mbAfe_rxData_bits_1, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [15:0]  io_mbAfe_rxData_bits_2, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [15:0]  io_mbAfe_rxData_bits_3, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [15:0]  io_mbAfe_rxData_bits_4, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [15:0]  io_mbAfe_rxData_bits_5, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [15:0]  io_mbAfe_rxData_bits_6, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [15:0]  io_mbAfe_rxData_bits_7, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [15:0]  io_mbAfe_rxData_bits_8, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [15:0]  io_mbAfe_rxData_bits_9, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [15:0]  io_mbAfe_rxData_bits_10, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [15:0]  io_mbAfe_rxData_bits_11, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [15:0]  io_mbAfe_rxData_bits_12, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [15:0]  io_mbAfe_rxData_bits_13, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [15:0]  io_mbAfe_rxData_bits_14, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input  [15:0]  io_mbAfe_rxData_bits_15, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output [2:0]   io_mbAfe_txFreqSel, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_mbAfe_rxEn, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_mbAfe_pllLock, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_sbAfe_fifoParams_clk, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_sbAfe_fifoParams_reset, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_sbAfe_txData, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_sbAfe_txClock, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_sbAfe_rxData, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_sbAfe_rxClock, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  output         io_sbAfe_rxEn, // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
  input          io_sbAfe_pllLock // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 22:14]
);
  wire  trainingModule_clock; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire  trainingModule_reset; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire  trainingModule_io_mainbandFSMIO_rxEn; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire  trainingModule_io_mainbandFSMIO_pllLock; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire  trainingModule_io_sidebandFSMIO_rxData_ready; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire  trainingModule_io_sidebandFSMIO_rxData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire [127:0] trainingModule_io_sidebandFSMIO_rxData_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire  trainingModule_io_sidebandFSMIO_patternTxData_ready; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire  trainingModule_io_sidebandFSMIO_patternTxData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire [127:0] trainingModule_io_sidebandFSMIO_patternTxData_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire  trainingModule_io_sidebandFSMIO_packetTxData_ready; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire  trainingModule_io_sidebandFSMIO_packetTxData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire [127:0] trainingModule_io_sidebandFSMIO_packetTxData_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire  trainingModule_io_sidebandFSMIO_rxMode; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire  trainingModule_io_sidebandFSMIO_txMode; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire  trainingModule_io_sidebandFSMIO_pllLock; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire [3:0] trainingModule_io_rdi_rdiBringupIO_lpStateReq; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire [3:0] trainingModule_io_rdi_rdiBringupIO_plStateStatus; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire  trainingModule_io_rdi_rdiBringupIO_plStallReq; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire  trainingModule_io_rdi_rdiBringupIO_lpStallAck; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire  trainingModule_io_rdi_rdiBringupIO_lpLinkError; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire [2:0] trainingModule_io_currentState; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
  wire  rdiDataMapper_clock; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 71:29]
  wire  rdiDataMapper_reset; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 71:29]
  wire  rdiDataMapper_io_rdi_lpData_ready; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 71:29]
  wire  rdiDataMapper_io_rdi_lpData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 71:29]
  wire  rdiDataMapper_io_rdi_lpData_irdy; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 71:29]
  wire [511:0] rdiDataMapper_io_rdi_lpData_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 71:29]
  wire  rdiDataMapper_io_rdi_plData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 71:29]
  wire [511:0] rdiDataMapper_io_rdi_plData_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 71:29]
  wire  rdiDataMapper_io_mainbandLaneIO_txData_ready; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 71:29]
  wire  rdiDataMapper_io_mainbandLaneIO_txData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 71:29]
  wire [255:0] rdiDataMapper_io_mainbandLaneIO_txData_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 71:29]
  wire  rdiDataMapper_io_mainbandLaneIO_rxData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 71:29]
  wire [255:0] rdiDataMapper_io_mainbandLaneIO_rxData_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 71:29]
  wire  lanes_clock; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire  lanes_reset; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire  lanes_io_mainbandIo_fifoParams_clk; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire  lanes_io_mainbandIo_fifoParams_reset; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire  lanes_io_mainbandIo_txData_ready; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire  lanes_io_mainbandIo_txData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_txData_bits_0; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_txData_bits_1; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_txData_bits_2; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_txData_bits_3; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_txData_bits_4; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_txData_bits_5; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_txData_bits_6; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_txData_bits_7; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_txData_bits_8; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_txData_bits_9; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_txData_bits_10; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_txData_bits_11; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_txData_bits_12; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_txData_bits_13; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_txData_bits_14; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_txData_bits_15; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire  lanes_io_mainbandIo_rxData_ready; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire  lanes_io_mainbandIo_rxData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_rxData_bits_0; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_rxData_bits_1; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_rxData_bits_2; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_rxData_bits_3; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_rxData_bits_4; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_rxData_bits_5; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_rxData_bits_6; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_rxData_bits_7; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_rxData_bits_8; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_rxData_bits_9; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_rxData_bits_10; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_rxData_bits_11; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_rxData_bits_12; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_rxData_bits_13; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_rxData_bits_14; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [15:0] lanes_io_mainbandIo_rxData_bits_15; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire  lanes_io_mainbandLaneIO_txData_ready; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire  lanes_io_mainbandLaneIO_txData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [255:0] lanes_io_mainbandLaneIO_txData_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire  lanes_io_mainbandLaneIO_rxData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire [255:0] lanes_io_mainbandLaneIO_rxData_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
  wire  sidebandChannel_clock; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire  sidebandChannel_reset; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire [127:0] sidebandChannel_io_to_upper_layer_tx_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire  sidebandChannel_io_to_upper_layer_tx_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire  sidebandChannel_io_to_upper_layer_tx_credit; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire [127:0] sidebandChannel_io_to_upper_layer_rx_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire  sidebandChannel_io_to_upper_layer_rx_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire  sidebandChannel_io_to_upper_layer_rx_credit; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire  sidebandChannel_io_to_lower_layer_tx_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire  sidebandChannel_io_to_lower_layer_tx_clock; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire  sidebandChannel_io_to_lower_layer_rx_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire  sidebandChannel_io_to_lower_layer_rx_clock; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire  sidebandChannel_io_inner_inputMode; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire  sidebandChannel_io_inner_rxMode; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire  sidebandChannel_io_inner_rawInput_ready; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire  sidebandChannel_io_inner_rawInput_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire [127:0] sidebandChannel_io_inner_rawInput_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire  sidebandChannel_io_inner_switcherBundle_node_to_layer_below_ready; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire  sidebandChannel_io_inner_switcherBundle_node_to_layer_below_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire [127:0] sidebandChannel_io_inner_switcherBundle_node_to_layer_below_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire  sidebandChannel_io_inner_switcherBundle_layer_to_node_below_ready; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire  sidebandChannel_io_inner_switcherBundle_layer_to_node_below_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  wire [127:0] sidebandChannel_io_inner_switcherBundle_layer_to_node_below_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
  LinkTrainingFSM trainingModule ( // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 29:11]
    .clock(trainingModule_clock),
    .reset(trainingModule_reset),
    .io_mainbandFSMIO_rxEn(trainingModule_io_mainbandFSMIO_rxEn),
    .io_mainbandFSMIO_pllLock(trainingModule_io_mainbandFSMIO_pllLock),
    .io_sidebandFSMIO_rxData_ready(trainingModule_io_sidebandFSMIO_rxData_ready),
    .io_sidebandFSMIO_rxData_valid(trainingModule_io_sidebandFSMIO_rxData_valid),
    .io_sidebandFSMIO_rxData_bits(trainingModule_io_sidebandFSMIO_rxData_bits),
    .io_sidebandFSMIO_patternTxData_ready(trainingModule_io_sidebandFSMIO_patternTxData_ready),
    .io_sidebandFSMIO_patternTxData_valid(trainingModule_io_sidebandFSMIO_patternTxData_valid),
    .io_sidebandFSMIO_patternTxData_bits(trainingModule_io_sidebandFSMIO_patternTxData_bits),
    .io_sidebandFSMIO_packetTxData_ready(trainingModule_io_sidebandFSMIO_packetTxData_ready),
    .io_sidebandFSMIO_packetTxData_valid(trainingModule_io_sidebandFSMIO_packetTxData_valid),
    .io_sidebandFSMIO_packetTxData_bits(trainingModule_io_sidebandFSMIO_packetTxData_bits),
    .io_sidebandFSMIO_rxMode(trainingModule_io_sidebandFSMIO_rxMode),
    .io_sidebandFSMIO_txMode(trainingModule_io_sidebandFSMIO_txMode),
    .io_sidebandFSMIO_pllLock(trainingModule_io_sidebandFSMIO_pllLock),
    .io_rdi_rdiBringupIO_lpStateReq(trainingModule_io_rdi_rdiBringupIO_lpStateReq),
    .io_rdi_rdiBringupIO_plStateStatus(trainingModule_io_rdi_rdiBringupIO_plStateStatus),
    .io_rdi_rdiBringupIO_plStallReq(trainingModule_io_rdi_rdiBringupIO_plStallReq),
    .io_rdi_rdiBringupIO_lpStallAck(trainingModule_io_rdi_rdiBringupIO_lpStallAck),
    .io_rdi_rdiBringupIO_lpLinkError(trainingModule_io_rdi_rdiBringupIO_lpLinkError),
    .io_currentState(trainingModule_io_currentState)
  );
  RdiDataMapper rdiDataMapper ( // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 71:29]
    .clock(rdiDataMapper_clock),
    .reset(rdiDataMapper_reset),
    .io_rdi_lpData_ready(rdiDataMapper_io_rdi_lpData_ready),
    .io_rdi_lpData_valid(rdiDataMapper_io_rdi_lpData_valid),
    .io_rdi_lpData_irdy(rdiDataMapper_io_rdi_lpData_irdy),
    .io_rdi_lpData_bits(rdiDataMapper_io_rdi_lpData_bits),
    .io_rdi_plData_valid(rdiDataMapper_io_rdi_plData_valid),
    .io_rdi_plData_bits(rdiDataMapper_io_rdi_plData_bits),
    .io_mainbandLaneIO_txData_ready(rdiDataMapper_io_mainbandLaneIO_txData_ready),
    .io_mainbandLaneIO_txData_valid(rdiDataMapper_io_mainbandLaneIO_txData_valid),
    .io_mainbandLaneIO_txData_bits(rdiDataMapper_io_mainbandLaneIO_txData_bits),
    .io_mainbandLaneIO_rxData_valid(rdiDataMapper_io_mainbandLaneIO_rxData_valid),
    .io_mainbandLaneIO_rxData_bits(rdiDataMapper_io_mainbandLaneIO_rxData_bits)
  );
  Lanes lanes ( // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 73:21]
    .clock(lanes_clock),
    .reset(lanes_reset),
    .io_mainbandIo_fifoParams_clk(lanes_io_mainbandIo_fifoParams_clk),
    .io_mainbandIo_fifoParams_reset(lanes_io_mainbandIo_fifoParams_reset),
    .io_mainbandIo_txData_ready(lanes_io_mainbandIo_txData_ready),
    .io_mainbandIo_txData_valid(lanes_io_mainbandIo_txData_valid),
    .io_mainbandIo_txData_bits_0(lanes_io_mainbandIo_txData_bits_0),
    .io_mainbandIo_txData_bits_1(lanes_io_mainbandIo_txData_bits_1),
    .io_mainbandIo_txData_bits_2(lanes_io_mainbandIo_txData_bits_2),
    .io_mainbandIo_txData_bits_3(lanes_io_mainbandIo_txData_bits_3),
    .io_mainbandIo_txData_bits_4(lanes_io_mainbandIo_txData_bits_4),
    .io_mainbandIo_txData_bits_5(lanes_io_mainbandIo_txData_bits_5),
    .io_mainbandIo_txData_bits_6(lanes_io_mainbandIo_txData_bits_6),
    .io_mainbandIo_txData_bits_7(lanes_io_mainbandIo_txData_bits_7),
    .io_mainbandIo_txData_bits_8(lanes_io_mainbandIo_txData_bits_8),
    .io_mainbandIo_txData_bits_9(lanes_io_mainbandIo_txData_bits_9),
    .io_mainbandIo_txData_bits_10(lanes_io_mainbandIo_txData_bits_10),
    .io_mainbandIo_txData_bits_11(lanes_io_mainbandIo_txData_bits_11),
    .io_mainbandIo_txData_bits_12(lanes_io_mainbandIo_txData_bits_12),
    .io_mainbandIo_txData_bits_13(lanes_io_mainbandIo_txData_bits_13),
    .io_mainbandIo_txData_bits_14(lanes_io_mainbandIo_txData_bits_14),
    .io_mainbandIo_txData_bits_15(lanes_io_mainbandIo_txData_bits_15),
    .io_mainbandIo_rxData_ready(lanes_io_mainbandIo_rxData_ready),
    .io_mainbandIo_rxData_valid(lanes_io_mainbandIo_rxData_valid),
    .io_mainbandIo_rxData_bits_0(lanes_io_mainbandIo_rxData_bits_0),
    .io_mainbandIo_rxData_bits_1(lanes_io_mainbandIo_rxData_bits_1),
    .io_mainbandIo_rxData_bits_2(lanes_io_mainbandIo_rxData_bits_2),
    .io_mainbandIo_rxData_bits_3(lanes_io_mainbandIo_rxData_bits_3),
    .io_mainbandIo_rxData_bits_4(lanes_io_mainbandIo_rxData_bits_4),
    .io_mainbandIo_rxData_bits_5(lanes_io_mainbandIo_rxData_bits_5),
    .io_mainbandIo_rxData_bits_6(lanes_io_mainbandIo_rxData_bits_6),
    .io_mainbandIo_rxData_bits_7(lanes_io_mainbandIo_rxData_bits_7),
    .io_mainbandIo_rxData_bits_8(lanes_io_mainbandIo_rxData_bits_8),
    .io_mainbandIo_rxData_bits_9(lanes_io_mainbandIo_rxData_bits_9),
    .io_mainbandIo_rxData_bits_10(lanes_io_mainbandIo_rxData_bits_10),
    .io_mainbandIo_rxData_bits_11(lanes_io_mainbandIo_rxData_bits_11),
    .io_mainbandIo_rxData_bits_12(lanes_io_mainbandIo_rxData_bits_12),
    .io_mainbandIo_rxData_bits_13(lanes_io_mainbandIo_rxData_bits_13),
    .io_mainbandIo_rxData_bits_14(lanes_io_mainbandIo_rxData_bits_14),
    .io_mainbandIo_rxData_bits_15(lanes_io_mainbandIo_rxData_bits_15),
    .io_mainbandLaneIO_txData_ready(lanes_io_mainbandLaneIO_txData_ready),
    .io_mainbandLaneIO_txData_valid(lanes_io_mainbandLaneIO_txData_valid),
    .io_mainbandLaneIO_txData_bits(lanes_io_mainbandLaneIO_txData_bits),
    .io_mainbandLaneIO_rxData_valid(lanes_io_mainbandLaneIO_rxData_valid),
    .io_mainbandLaneIO_rxData_bits(lanes_io_mainbandLaneIO_rxData_bits)
  );
  PHYSidebandChannel sidebandChannel ( // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 86:11]
    .clock(sidebandChannel_clock),
    .reset(sidebandChannel_reset),
    .io_to_upper_layer_tx_bits(sidebandChannel_io_to_upper_layer_tx_bits),
    .io_to_upper_layer_tx_valid(sidebandChannel_io_to_upper_layer_tx_valid),
    .io_to_upper_layer_tx_credit(sidebandChannel_io_to_upper_layer_tx_credit),
    .io_to_upper_layer_rx_bits(sidebandChannel_io_to_upper_layer_rx_bits),
    .io_to_upper_layer_rx_valid(sidebandChannel_io_to_upper_layer_rx_valid),
    .io_to_upper_layer_rx_credit(sidebandChannel_io_to_upper_layer_rx_credit),
    .io_to_lower_layer_tx_bits(sidebandChannel_io_to_lower_layer_tx_bits),
    .io_to_lower_layer_tx_clock(sidebandChannel_io_to_lower_layer_tx_clock),
    .io_to_lower_layer_rx_bits(sidebandChannel_io_to_lower_layer_rx_bits),
    .io_to_lower_layer_rx_clock(sidebandChannel_io_to_lower_layer_rx_clock),
    .io_inner_inputMode(sidebandChannel_io_inner_inputMode),
    .io_inner_rxMode(sidebandChannel_io_inner_rxMode),
    .io_inner_rawInput_ready(sidebandChannel_io_inner_rawInput_ready),
    .io_inner_rawInput_valid(sidebandChannel_io_inner_rawInput_valid),
    .io_inner_rawInput_bits(sidebandChannel_io_inner_rawInput_bits),
    .io_inner_switcherBundle_node_to_layer_below_ready(sidebandChannel_io_inner_switcherBundle_node_to_layer_below_ready
      ),
    .io_inner_switcherBundle_node_to_layer_below_valid(sidebandChannel_io_inner_switcherBundle_node_to_layer_below_valid
      ),
    .io_inner_switcherBundle_node_to_layer_below_bits(sidebandChannel_io_inner_switcherBundle_node_to_layer_below_bits),
    .io_inner_switcherBundle_layer_to_node_below_ready(sidebandChannel_io_inner_switcherBundle_layer_to_node_below_ready
      ),
    .io_inner_switcherBundle_layer_to_node_below_valid(sidebandChannel_io_inner_switcherBundle_layer_to_node_below_valid
      ),
    .io_inner_switcherBundle_layer_to_node_below_bits(sidebandChannel_io_inner_switcherBundle_layer_to_node_below_bits)
  );
  assign io_rdi_lpData_ready = rdiDataMapper_io_rdi_lpData_ready; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 82:31]
  assign io_rdi_plData_valid = rdiDataMapper_io_rdi_plData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 83:17]
  assign io_rdi_plData_bits = rdiDataMapper_io_rdi_plData_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 83:17]
  assign io_rdi_plRetimerCrd = 1'h0; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 53:23]
  assign io_rdi_plStateStatus = trainingModule_io_rdi_rdiBringupIO_plStateStatus; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 65:24]
  assign io_rdi_plInbandPres = trainingModule_io_currentState == 3'h4; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 69:57]
  assign io_rdi_plError = trainingModule_io_currentState == 3'h5; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 43:52]
  assign io_rdi_plCorrectableError = 1'h0; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 50:29]
  assign io_rdi_plNonFatalError = 1'h0; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 49:26]
  assign io_rdi_plTrainError = trainingModule_io_currentState == 3'h5; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 44:57]
  assign io_rdi_plPhyInRecenter = io_rdi_plStateStatus == 4'hb; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 55:50]
  assign io_rdi_plStallReq = trainingModule_io_rdi_rdiBringupIO_plStallReq; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 63:21]
  assign io_rdi_plSpeedMode = 3'h0; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 56:22]
  assign io_rdi_plLinkWidth = 3'h2; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 58:22]
  assign io_rdi_plClkReq = 1'h1; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 59:19]
  assign io_rdi_plWakeAck = 1'h1; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 60:20]
  assign io_rdi_plConfig_valid = sidebandChannel_io_to_upper_layer_tx_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 94:46]
  assign io_rdi_plConfig_bits = sidebandChannel_io_to_upper_layer_tx_bits[31:0]; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 93:45]
  assign io_rdi_lpConfigCredit = sidebandChannel_io_to_upper_layer_rx_credit; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 98:47]
  assign io_mbAfe_txData_valid = lanes_io_mainbandIo_txData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 76:30]
  assign io_mbAfe_txData_bits_0 = lanes_io_mainbandIo_txData_bits_0; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 76:30]
  assign io_mbAfe_txData_bits_1 = lanes_io_mainbandIo_txData_bits_1; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 76:30]
  assign io_mbAfe_txData_bits_2 = lanes_io_mainbandIo_txData_bits_2; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 76:30]
  assign io_mbAfe_txData_bits_3 = lanes_io_mainbandIo_txData_bits_3; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 76:30]
  assign io_mbAfe_txData_bits_4 = lanes_io_mainbandIo_txData_bits_4; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 76:30]
  assign io_mbAfe_txData_bits_5 = lanes_io_mainbandIo_txData_bits_5; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 76:30]
  assign io_mbAfe_txData_bits_6 = lanes_io_mainbandIo_txData_bits_6; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 76:30]
  assign io_mbAfe_txData_bits_7 = lanes_io_mainbandIo_txData_bits_7; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 76:30]
  assign io_mbAfe_txData_bits_8 = lanes_io_mainbandIo_txData_bits_8; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 76:30]
  assign io_mbAfe_txData_bits_9 = lanes_io_mainbandIo_txData_bits_9; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 76:30]
  assign io_mbAfe_txData_bits_10 = lanes_io_mainbandIo_txData_bits_10; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 76:30]
  assign io_mbAfe_txData_bits_11 = lanes_io_mainbandIo_txData_bits_11; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 76:30]
  assign io_mbAfe_txData_bits_12 = lanes_io_mainbandIo_txData_bits_12; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 76:30]
  assign io_mbAfe_txData_bits_13 = lanes_io_mainbandIo_txData_bits_13; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 76:30]
  assign io_mbAfe_txData_bits_14 = lanes_io_mainbandIo_txData_bits_14; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 76:30]
  assign io_mbAfe_txData_bits_15 = lanes_io_mainbandIo_txData_bits_15; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 76:30]
  assign io_mbAfe_rxData_ready = lanes_io_mainbandIo_rxData_ready; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 77:30]
  assign io_mbAfe_txFreqSel = 3'h0; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 57:22]
  assign io_mbAfe_rxEn = trainingModule_io_mainbandFSMIO_rxEn; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 36:40]
  assign io_sbAfe_txData = sidebandChannel_io_to_lower_layer_tx_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 117:19]
  assign io_sbAfe_txClock = sidebandChannel_io_to_lower_layer_tx_clock; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 118:20]
  assign io_sbAfe_rxEn = 1'h1; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 37:40]
  assign trainingModule_clock = clock;
  assign trainingModule_reset = reset;
  assign trainingModule_io_mainbandFSMIO_pllLock = io_mbAfe_pllLock; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 34:43]
  assign trainingModule_io_sidebandFSMIO_rxData_valid =
    sidebandChannel_io_inner_switcherBundle_node_to_layer_below_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 102:63]
  assign trainingModule_io_sidebandFSMIO_rxData_bits = sidebandChannel_io_inner_switcherBundle_node_to_layer_below_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 102:63]
  assign trainingModule_io_sidebandFSMIO_patternTxData_ready = sidebandChannel_io_inner_rawInput_ready; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 103:37]
  assign trainingModule_io_sidebandFSMIO_packetTxData_ready =
    sidebandChannel_io_inner_switcherBundle_layer_to_node_below_ready; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 101:63]
  assign trainingModule_io_sidebandFSMIO_pllLock = io_sbAfe_pllLock; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 35:43]
  assign trainingModule_io_rdi_rdiBringupIO_lpStateReq = io_rdi_lpStateReq; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 38:49]
  assign trainingModule_io_rdi_rdiBringupIO_lpStallAck = io_rdi_lpStallAck; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 64:21]
  assign trainingModule_io_rdi_rdiBringupIO_lpLinkError = io_rdi_lpLinkError; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 66:22]
  assign rdiDataMapper_clock = clock;
  assign rdiDataMapper_reset = reset;
  assign rdiDataMapper_io_rdi_lpData_valid = io_rdi_lpData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 82:31]
  assign rdiDataMapper_io_rdi_lpData_irdy = io_rdi_lpData_irdy; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 82:31]
  assign rdiDataMapper_io_rdi_lpData_bits = io_rdi_lpData_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 82:31]
  assign rdiDataMapper_io_mainbandLaneIO_txData_ready = lanes_io_mainbandLaneIO_txData_ready; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 79:35]
  assign rdiDataMapper_io_mainbandLaneIO_rxData_valid = lanes_io_mainbandLaneIO_rxData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 79:35]
  assign rdiDataMapper_io_mainbandLaneIO_rxData_bits = lanes_io_mainbandLaneIO_rxData_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 79:35]
  assign lanes_clock = clock;
  assign lanes_reset = reset;
  assign lanes_io_mainbandIo_fifoParams_clk = io_mbAfe_fifoParams_clk; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 78:34]
  assign lanes_io_mainbandIo_fifoParams_reset = io_mbAfe_fifoParams_reset; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 78:34]
  assign lanes_io_mainbandIo_txData_ready = io_mbAfe_txData_ready; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 76:30]
  assign lanes_io_mainbandIo_rxData_valid = io_mbAfe_rxData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 77:30]
  assign lanes_io_mainbandIo_rxData_bits_0 = io_mbAfe_rxData_bits_0; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 77:30]
  assign lanes_io_mainbandIo_rxData_bits_1 = io_mbAfe_rxData_bits_1; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 77:30]
  assign lanes_io_mainbandIo_rxData_bits_2 = io_mbAfe_rxData_bits_2; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 77:30]
  assign lanes_io_mainbandIo_rxData_bits_3 = io_mbAfe_rxData_bits_3; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 77:30]
  assign lanes_io_mainbandIo_rxData_bits_4 = io_mbAfe_rxData_bits_4; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 77:30]
  assign lanes_io_mainbandIo_rxData_bits_5 = io_mbAfe_rxData_bits_5; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 77:30]
  assign lanes_io_mainbandIo_rxData_bits_6 = io_mbAfe_rxData_bits_6; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 77:30]
  assign lanes_io_mainbandIo_rxData_bits_7 = io_mbAfe_rxData_bits_7; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 77:30]
  assign lanes_io_mainbandIo_rxData_bits_8 = io_mbAfe_rxData_bits_8; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 77:30]
  assign lanes_io_mainbandIo_rxData_bits_9 = io_mbAfe_rxData_bits_9; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 77:30]
  assign lanes_io_mainbandIo_rxData_bits_10 = io_mbAfe_rxData_bits_10; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 77:30]
  assign lanes_io_mainbandIo_rxData_bits_11 = io_mbAfe_rxData_bits_11; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 77:30]
  assign lanes_io_mainbandIo_rxData_bits_12 = io_mbAfe_rxData_bits_12; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 77:30]
  assign lanes_io_mainbandIo_rxData_bits_13 = io_mbAfe_rxData_bits_13; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 77:30]
  assign lanes_io_mainbandIo_rxData_bits_14 = io_mbAfe_rxData_bits_14; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 77:30]
  assign lanes_io_mainbandIo_rxData_bits_15 = io_mbAfe_rxData_bits_15; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 77:30]
  assign lanes_io_mainbandLaneIO_txData_valid = rdiDataMapper_io_mainbandLaneIO_txData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 79:35]
  assign lanes_io_mainbandLaneIO_txData_bits = rdiDataMapper_io_mainbandLaneIO_txData_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 79:35]
  assign sidebandChannel_clock = clock;
  assign sidebandChannel_reset = reset;
  assign sidebandChannel_io_to_upper_layer_tx_credit = io_rdi_plConfigCredit; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 95:47]
  assign sidebandChannel_io_to_upper_layer_rx_bits = {{96'd0}, io_rdi_lpConfig_bits}; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 96:45]
  assign sidebandChannel_io_to_upper_layer_rx_valid = io_rdi_lpConfig_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 97:46]
  assign sidebandChannel_io_to_lower_layer_rx_bits = io_sbAfe_rxData; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 119:19]
  assign sidebandChannel_io_to_lower_layer_rx_clock = io_sbAfe_rxClock; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 120:20]
  assign sidebandChannel_io_inner_inputMode = trainingModule_io_sidebandFSMIO_txMode; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 104:38]
  assign sidebandChannel_io_inner_rxMode = trainingModule_io_sidebandFSMIO_rxMode; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 105:35]
  assign sidebandChannel_io_inner_rawInput_valid = trainingModule_io_sidebandFSMIO_patternTxData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 103:37]
  assign sidebandChannel_io_inner_rawInput_bits = trainingModule_io_sidebandFSMIO_patternTxData_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 103:37]
  assign sidebandChannel_io_inner_switcherBundle_node_to_layer_below_ready =
    trainingModule_io_sidebandFSMIO_rxData_ready; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 102:63]
  assign sidebandChannel_io_inner_switcherBundle_layer_to_node_below_valid =
    trainingModule_io_sidebandFSMIO_packetTxData_valid; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 101:63]
  assign sidebandChannel_io_inner_switcherBundle_layer_to_node_below_bits =
    trainingModule_io_sidebandFSMIO_packetTxData_bits; // @[\\src\\main\\scala\\logphy\\LogicalPhy.scala 101:63]
endmodule
