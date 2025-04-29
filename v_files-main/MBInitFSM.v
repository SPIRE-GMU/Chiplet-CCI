module MBInitFSM(
  input          clock,
  input          reset,
  input          io_sbTrainIO_msgReq_ready, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 26:14]
  output         io_sbTrainIO_msgReq_valid, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 26:14]
  output [127:0] io_sbTrainIO_msgReq_bits_msg, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 26:14]
  output [63:0]  io_sbTrainIO_msgReq_bits_timeoutCycles, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 26:14]
  output         io_sbTrainIO_msgReqStatus_ready, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 26:14]
  input          io_sbTrainIO_msgReqStatus_valid, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 26:14]
  input          io_sbTrainIO_msgReqStatus_bits_status, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 26:14]
  input  [63:0]  io_sbTrainIO_msgReqStatus_bits_data, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 26:14]
  input          io_patternGeneratorIO_transmitReq_ready, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 26:14]
  output         io_patternGeneratorIO_transmitReq_valid, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 26:14]
  output         io_patternGeneratorIO_transmitReq_bits_pattern, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 26:14]
  output [31:0]  io_patternGeneratorIO_transmitReq_bits_timeoutCycles, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 26:14]
  output         io_patternGeneratorIO_transmitReq_bits_sideband, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 26:14]
  output         io_patternGeneratorIO_transmitPatternStatus_ready, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 26:14]
  input          io_patternGeneratorIO_transmitPatternStatus_valid, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 26:14]
  input          io_patternGeneratorIO_transmitPatternStatus_bits, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 26:14]
  output         io_transition, // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 26:14]
  output         io_error // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 26:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 46:30]
  reg [1:0] paramSubState; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 48:38]
  wire  _T_13 = io_sbTrainIO_msgReqStatus_ready & io_sbTrainIO_msgReqStatus_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [2:0] _GEN_2 = io_sbTrainIO_msgReqStatus_bits_status ? 3'h4 : state; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 151:15 152:25 47:35]
  wire [2:0] _GEN_5 = _T_13 ? _GEN_2 : state; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 147:48 47:35]
  wire [2:0] _GEN_8 = io_sbTrainIO_msgReqStatus_bits_status ? 3'h4 : 3'h3; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 186:15 187:25 189:25]
  wire [2:0] _GEN_9 = _T_13 ? _GEN_8 : state; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 183:48 47:35]
  wire [2:0] _GEN_11 = 2'h3 == paramSubState ? _GEN_9 : state; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29 47:35]
  wire [2:0] _GEN_18 = 2'h2 == paramSubState ? state : _GEN_11; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29 47:35]
  wire [2:0] _GEN_21 = 2'h1 == paramSubState ? _GEN_5 : _GEN_18; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29]
  wire [2:0] _GEN_33 = 2'h0 == paramSubState ? state : _GEN_21; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29 47:35]
  wire [2:0] nextState = 3'h0 == state ? _GEN_33 : state; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 87:17 47:35]
  wire [1:0] _GEN_0 = nextState == 3'h0 & state != 3'h0 ? 2'h0 : paramSubState; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 49:60 50:19 48:38]
  reg [3:0] maxDataRate; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 66:36]
  reg [63:0] reqData; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 127:28]
  wire [142:0] io_sbTrainIO_msgReq_bits_msgReq_msg_new_msg = {54'h0,6'h0,maxDataRate,79'h20000a54000001b}; // @[\\src\\main\\scala\\sideband\\sb-msg-encoding.scala 405:22]
  wire  _T_9 = io_sbTrainIO_msgReq_ready & io_sbTrainIO_msgReq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire [1:0] _GEN_3 = io_sbTrainIO_msgReqStatus_bits_status ? _GEN_0 : 2'h2; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 151:15 154:29]
  wire [1:0] _GEN_6 = _T_13 ? _GEN_3 : _GEN_0; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 147:48]
  wire  _exchangedMaxDataRate_T_1 = maxDataRate >= reqData[3:0]; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 162:25]
  wire [3:0] exchangedMaxDataRate = _exchangedMaxDataRate_T_1 ? reqData[3:0] : maxDataRate; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 161:38]
  wire [142:0] io_sbTrainIO_msgReq_bits_msgReq_msg_new_msg_1 = {51'h0,2'h0,reqData[10],reqData[9],5'h0,
    exchangedMaxDataRate,79'h20000aa4000001b}; // @[\\src\\main\\scala\\sideband\\sb-msg-encoding.scala 405:22]
  wire [1:0] _GEN_7 = _T_9 ? 2'h3 : _GEN_0; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 177:42 178:27]
  wire [3:0] _GEN_13 = 2'h2 == paramSubState ? exchangedMaxDataRate : maxDataRate; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29 166:23 66:36]
  wire [127:0] io_sbTrainIO_msgReq_bits_msgReq_1_msg = io_sbTrainIO_msgReq_bits_msgReq_msg_new_msg_1[127:0]; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 101:26 111:20]
  wire [1:0] _GEN_16 = 2'h2 == paramSubState ? _GEN_7 : _GEN_0; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29]
  wire  _GEN_17 = 2'h2 == paramSubState ? 1'h0 : 2'h3 == paramSubState; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  wire  _GEN_19 = 2'h1 == paramSubState | _GEN_17; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29 146:43]
  wire  _GEN_23 = 2'h1 == paramSubState ? 1'h0 : 2'h2 == paramSubState; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  wire  _GEN_27 = 2'h0 == paramSubState | _GEN_23; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29 131:37]
  wire [127:0] io_sbTrainIO_msgReq_bits_msgReq_msg = io_sbTrainIO_msgReq_bits_msgReq_msg_new_msg[127:0]; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 101:26 111:20]
  wire  _GEN_31 = 2'h0 == paramSubState ? 1'h0 : _GEN_19; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  assign io_sbTrainIO_msgReq_valid = 3'h0 == state & _GEN_27; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 87:17 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  assign io_sbTrainIO_msgReq_bits_msg = 2'h0 == paramSubState ? io_sbTrainIO_msgReq_bits_msgReq_msg :
    io_sbTrainIO_msgReq_bits_msgReq_1_msg; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29 132:36]
  assign io_sbTrainIO_msgReq_bits_timeoutCycles = 64'h61a800; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29 132:36]
  assign io_sbTrainIO_msgReqStatus_ready = 3'h0 == state & _GEN_31; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 87:17 src/main/scala/chisel3/util/Decoupled.scala 90:20]
  assign io_patternGeneratorIO_transmitReq_valid = 1'h0; // @[src/main/scala/chisel3/util/Decoupled.scala 74:20]
  assign io_patternGeneratorIO_transmitReq_bits_pattern = 1'h0;
  assign io_patternGeneratorIO_transmitReq_bits_timeoutCycles = 32'h0;
  assign io_patternGeneratorIO_transmitReq_bits_sideband = 1'h0;
  assign io_patternGeneratorIO_transmitPatternStatus_ready = 1'h0; // @[src/main/scala/chisel3/util/Decoupled.scala 90:20]
  assign io_transition = nextState == 3'h3 | nextState == 3'h4; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 53:45]
  assign io_error = state == 3'h4; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 54:21]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 46:30]
      state <= 3'h0; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 46:30]
    end else if (3'h0 == state) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 87:17]
      if (!(2'h0 == paramSubState)) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29]
        if (2'h1 == paramSubState) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29]
          state <= _GEN_5;
        end else begin
          state <= _GEN_18;
        end
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 48:38]
      paramSubState <= 2'h0; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 48:38]
    end else if (3'h0 == state) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 87:17]
      if (2'h0 == paramSubState) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29]
        if (_T_9) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 141:42]
          paramSubState <= 2'h1; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 142:27]
        end else begin
          paramSubState <= _GEN_0;
        end
      end else if (2'h1 == paramSubState) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29]
        paramSubState <= _GEN_6;
      end else begin
        paramSubState <= _GEN_16;
      end
    end else begin
      paramSubState <= _GEN_0;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 66:36]
      maxDataRate <= 4'h0; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 66:36]
    end else if (3'h0 == state) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 87:17]
      if (!(2'h0 == paramSubState)) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29]
        if (!(2'h1 == paramSubState)) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29]
          maxDataRate <= _GEN_13;
        end
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 127:28]
      reqData <= 64'h0; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 127:28]
    end else if (!(2'h0 == paramSubState)) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29]
      if (2'h1 == paramSubState) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 129:29]
        if (_T_13) begin // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 147:48]
          reqData <= io_sbTrainIO_msgReqStatus_bits_data; // @[\\src\\main\\scala\\logphy\\MBInitFSM.scala 148:21]
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
  state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  paramSubState = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  maxDataRate = _RAND_2[3:0];
  _RAND_3 = {2{`RANDOM}};
  reqData = _RAND_3[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
