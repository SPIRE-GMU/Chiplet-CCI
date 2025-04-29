module RdiBringup(
  input          clock,
  input          reset,
  output         io_rdiIO_plClkReq, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  input          io_rdiIO_lpClkAck, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  input          io_rdiIO_lpWakeReq, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  output         io_rdiIO_plWakeAck, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  input  [3:0]   io_rdiIO_lpStateReq, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  output [3:0]   io_rdiIO_plStateStatus, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  output         io_rdiIO_plStallReq, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  input          io_rdiIO_lpStallAck, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  input          io_rdiIO_lpLinkError, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  input          io_sbTrainIO_msgReq_ready, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  output         io_sbTrainIO_msgReq_valid, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  output [127:0] io_sbTrainIO_msgReq_bits_msg, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  output [63:0]  io_sbTrainIO_msgReq_bits_timeoutCycles, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  output         io_sbTrainIO_msgReqStatus_ready, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  input          io_sbTrainIO_msgReqStatus_valid, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  input          io_sbTrainIO_msgReqStatus_bits_status, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  input  [63:0]  io_sbTrainIO_msgReqStatus_bits_data, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  output         io_active, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  input          io_internalError, // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
  input          io_internalRetrain // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 33:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] state; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 53:30]
  wire [3:0] _GEN_0 = io_internalRetrain ? 4'hb : state; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 62:34 63:15 55:35]
  wire [3:0] _GEN_1 = io_internalError | io_rdiIO_lpLinkError ? 4'ha : _GEN_0; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 60:50 61:15]
  reg [2:0] resetSubstate; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 66:38]
  wire  _T_1 = state != 4'h0; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 67:14]
  reg [3:0] prevReq; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 77:32]
  wire [3:0] _GEN_4 = _T_1 | prevReq == 4'h0 ? io_rdiIO_lpStateReq : _GEN_1; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 82:67 83:17]
  wire [3:0] _GEN_5 = io_rdiIO_lpStateReq != 4'h0 ? _GEN_4 : _GEN_1; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 81:49]
  wire  _T_33 = io_sbTrainIO_msgReqStatus_ready & io_sbTrainIO_msgReqStatus_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [3:0] _GEN_11 = _T_33 ? 4'h1 : _GEN_5; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 134:48 135:23]
  wire [3:0] _GEN_13 = 3'h6 == resetSubstate ? _GEN_11 : _GEN_5; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 89:29]
  wire [3:0] _GEN_19 = 3'h5 == resetSubstate ? _GEN_5 : _GEN_13; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 89:29]
  wire [3:0] _GEN_25 = 3'h4 == resetSubstate ? _GEN_5 : _GEN_19; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 89:29]
  wire [3:0] _GEN_31 = 3'h3 == resetSubstate ? _GEN_5 : _GEN_25; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 89:29]
  wire [3:0] _GEN_38 = 3'h2 == resetSubstate ? _GEN_5 : _GEN_31; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 89:29]
  wire [3:0] nextState = 4'h0 == state ? _GEN_38 : _GEN_5; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 87:17]
  wire [2:0] _GEN_2 = state != 4'h0 & nextState == 4'h0 ? 3'h2 : resetSubstate; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 67:66 68:19 66:38]
  reg [1:0] stallReqAckState; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 71:41]
  wire  _T_5 = nextState == 4'h1; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 72:47]
  wire [1:0] _GEN_3 = state != 4'h1 & nextState == 4'h1 ? 2'h0 : stallReqAckState; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 72:68 73:22 71:41]
  wire  _T_21 = io_sbTrainIO_msgReq_ready & io_sbTrainIO_msgReq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [2:0] _GEN_8 = _T_21 ? 3'h4 : _GEN_2; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 108:42 109:27]
  wire [2:0] _GEN_9 = _T_33 ? 3'h5 : _GEN_2; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 114:48 115:27]
  wire [2:0] _GEN_10 = _T_33 ? 3'h6 : _GEN_2; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 128:48 129:27]
  wire [2:0] _GEN_17 = 3'h5 == resetSubstate ? _GEN_10 : _GEN_2; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 89:29]
  wire  _GEN_18 = 3'h5 == resetSubstate ? 1'h0 : 3'h6 == resetSubstate; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 89:29 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  wire  _GEN_20 = 3'h4 == resetSubstate | _GEN_18; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 89:29 113:43]
  wire [2:0] _GEN_21 = 3'h4 == resetSubstate ? _GEN_9 : _GEN_17; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 89:29]
  wire  _GEN_22 = 3'h4 == resetSubstate ? 1'h0 : 3'h5 == resetSubstate; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 89:29 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  wire  _GEN_26 = 3'h3 == resetSubstate | _GEN_22; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 89:29 99:37]
  wire [142:0] _GEN_27 = 3'h3 == resetSubstate ? 143'h200000140004012 : 143'h200000140008012; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 89:29 100:40]
  wire  _GEN_30 = 3'h3 == resetSubstate ? 1'h0 : _GEN_20; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 89:29 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  wire  _GEN_34 = 3'h2 == resetSubstate ? 1'h0 : _GEN_26; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 89:29 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  wire  _GEN_37 = 3'h2 == resetSubstate ? 1'h0 : _GEN_30; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 89:29 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  reg [3:0] nextStateReq; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 141:33]
  wire  _T_44 = nextState == 4'hb | nextState == 4'h9 | nextState == 4'hc; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 145:80]
  wire [1:0] _GEN_39 = _T_44 ? 2'h1 : _GEN_3; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 146:13 149:30]
  wire [3:0] _GEN_40 = _T_44 ? 4'h1 : nextState; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 146:13 150:19 59:9]
  wire [1:0] _GEN_42 = io_rdiIO_lpStallAck ? 2'h2 : _GEN_3; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 155:37 156:30]
  wire [3:0] _GEN_43 = io_rdiIO_lpStallAck ? 4'h1 : nextState; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 155:37 157:19 59:9]
  wire [3:0] _GEN_44 = ~io_rdiIO_lpStallAck ? nextStateReq : nextState; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 161:38 162:19 59:9]
  wire [3:0] _GEN_45 = 2'h2 == stallReqAckState ? _GEN_44 : nextState; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 142:32 59:9]
  wire [1:0] _GEN_46 = 2'h1 == stallReqAckState ? _GEN_42 : _GEN_3; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 142:32]
  wire [3:0] _GEN_47 = 2'h1 == stallReqAckState ? _GEN_43 : _GEN_45; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 142:32]
  assign io_rdiIO_plClkReq = 1'h1; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 41:21]
  assign io_rdiIO_plWakeAck = 1'h1; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 42:22]
  assign io_rdiIO_plStateStatus = state; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 54:26]
  assign io_rdiIO_plStallReq = stallReqAckState == 2'h1; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 76:43]
  assign io_sbTrainIO_msgReq_valid = 4'h0 == state & _GEN_34; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 87:17 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  assign io_sbTrainIO_msgReq_bits_msg = _GEN_27[127:0];
  assign io_sbTrainIO_msgReq_bits_timeoutCycles = 64'hf4240;
  assign io_sbTrainIO_msgReqStatus_ready = 4'h0 == state & _GEN_37; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 87:17 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  assign io_active = state == 4'h1; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 56:22]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 53:30]
      state <= 4'h0; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 53:30]
    end else if (4'h0 == state) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 87:17]
      if (3'h2 == resetSubstate) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 89:29]
        if (_T_5) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 93:13]
          state <= 4'h0; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 94:19]
        end else begin
          state <= nextState; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 59:9]
        end
      end else begin
        state <= nextState; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 59:9]
      end
    end else if (4'h1 == state) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 87:17]
      if (2'h0 == stallReqAckState) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 142:32]
        state <= _GEN_40;
      end else begin
        state <= _GEN_47;
      end
    end else begin
      state <= nextState; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 59:9]
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 66:38]
      resetSubstate <= 3'h2; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 66:38]
    end else if (4'h0 == state) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 87:17]
      if (3'h2 == resetSubstate) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 89:29]
        if (_T_5) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 93:13]
          resetSubstate <= 3'h3; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 95:27]
        end else begin
          resetSubstate <= _GEN_2;
        end
      end else if (3'h3 == resetSubstate) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 89:29]
        resetSubstate <= _GEN_8;
      end else begin
        resetSubstate <= _GEN_21;
      end
    end else begin
      resetSubstate <= _GEN_2;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 77:32]
      prevReq <= 4'h0; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 77:32]
    end else begin
      prevReq <= io_rdiIO_lpStateReq; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 78:11]
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 71:41]
      stallReqAckState <= 2'h0; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 71:41]
    end else if (4'h0 == state) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 87:17]
      stallReqAckState <= _GEN_3;
    end else if (4'h1 == state) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 87:17]
      if (2'h0 == stallReqAckState) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 142:32]
        stallReqAckState <= _GEN_39;
      end else begin
        stallReqAckState <= _GEN_46;
      end
    end else begin
      stallReqAckState <= _GEN_3;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 141:33]
      nextStateReq <= 4'h0; // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 141:33]
    end else if (2'h0 == stallReqAckState) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 142:32]
      if (_T_44) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 146:13]
        if (4'h0 == state) begin // @[\\src\\main\\scala\\logphy\\RdiBringup.scala 87:17]
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
