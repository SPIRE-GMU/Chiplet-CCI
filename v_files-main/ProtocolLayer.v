module ProtocolLayer(
  input          clock,
  input          reset,
  input          io_fdi_lpData_ready, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output         io_fdi_lpData_valid, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output         io_fdi_lpData_irdy, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output [511:0] io_fdi_lpData_bits, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plData_valid, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input  [511:0] io_fdi_plData_bits, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output         io_fdi_lpRetimerCrd, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output         io_fdi_lpCorruptCrc, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output         io_fdi_lpDllp_valid, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output [127:0] io_fdi_lpDllp_bits, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output         io_fdi_lpDllpOfc, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output         io_fdi_lpStream_protoStack, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output [2:0]   io_fdi_lpStream_protoType, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plRetimerCrd, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plDllp_valid, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input  [127:0] io_fdi_plDllp_bits, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plDllpOfc, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plStream_protoStack, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input  [2:0]   io_fdi_plStream_protoType, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plFlitCancel, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output [3:0]   io_fdi_lpStateReq, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output         io_fdi_lpLinkError, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input  [3:0]   io_fdi_plStateStatus, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plInbandPres, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plError, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plCerror, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plNfError, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plTrainError, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plRxActiveReq, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output         io_fdi_lpRxActiveStatus, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input  [2:0]   io_fdi_plProtocol, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input  [2:0]   io_fdi_plProtocolFlitFormat, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plProtocolValid, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plStallReq, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output         io_fdi_lpStallAck, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plPhyInRecenter, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plPhyInL1, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plPhyInL2, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input  [2:0]   io_fdi_plSpeedMode, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input  [2:0]   io_fdi_plLinkWidth, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plClkReq, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output         io_fdi_lpClkAck, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output         io_fdi_lpWakeReq, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plWakeAck, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_plConfig_valid, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input  [127:0] io_fdi_plConfig_bits, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output         io_fdi_plConfigCredit, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output         io_fdi_lpConfig_valid, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output [127:0] io_fdi_lpConfig_bits, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fdi_lpConfigCredit, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output [3:0]   io_TLplStateStatus, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_TLlpData_valid, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input  [511:0] io_TLlpData_bits, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_TLlpData_irdy, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output         io_TLlpData_ready, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output [511:0] io_TLplData_bits, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  output         io_TLplData_valid, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_TLready_to_rcv, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_fault, // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
  input          io_soft_reset // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 22:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  lp_rx_active_sts_reg; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 65:39]
  wire  lp_rx_active_pl_state = io_fdi_plStateStatus == 4'h1; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 70:55]
  wire  _GEN_0 = io_fdi_plRxActiveReq & io_TLready_to_rcv & lp_rx_active_pl_state | lp_rx_active_sts_reg; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 72:78 73:30 65:39]
  reg [3:0] lp_state_req_reg; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 78:35]
  wire  _reqActive_T_1 = lp_state_req_reg == 4'h0; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 81:38]
  wire  _reqActive_T_2 = io_fdi_plStateStatus == 4'h0 & _reqActive_T_1; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 80:63]
  wire  _reqActive_T_3 = _reqActive_T_2 & io_fdi_plInbandPres; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 81:58]
  wire  reqActive = _reqActive_T_3 | io_fdi_plStateStatus == 4'h9; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 82:42]
  reg  lp_stall_reg; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 99:31]
  assign io_fdi_lpData_valid = io_TLlpData_valid; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 39:25]
  assign io_fdi_lpData_irdy = io_TLlpData_irdy; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 40:24]
  assign io_fdi_lpData_bits = io_TLlpData_bits; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 38:24]
  assign io_fdi_lpRetimerCrd = 1'h0; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 47:25]
  assign io_fdi_lpCorruptCrc = 1'h0; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 48:25]
  assign io_fdi_lpDllp_valid = 1'h0; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 49:25]
  assign io_fdi_lpDllp_bits = 128'h0; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 50:24]
  assign io_fdi_lpDllpOfc = 1'h0; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 51:22]
  assign io_fdi_lpStream_protoStack = 1'h0; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 57:25 58:26]
  assign io_fdi_lpStream_protoType = 3'h4; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 57:25 59:25]
  assign io_fdi_lpStateReq = lp_state_req_reg; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 90:23]
  assign io_fdi_lpLinkError = io_fault; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 94:24]
  assign io_fdi_lpRxActiveStatus = lp_rx_active_sts_reg; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 75:29]
  assign io_fdi_lpStallAck = lp_stall_reg; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 101:23]
  assign io_fdi_lpClkAck = 1'h1; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 53:21]
  assign io_fdi_lpWakeReq = 1'h1; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 54:22]
  assign io_fdi_plConfigCredit = 1'h0; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 120:27]
  assign io_fdi_lpConfig_valid = 1'h0; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 117:27]
  assign io_fdi_lpConfig_bits = 128'h0; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 116:26]
  assign io_TLplStateStatus = io_fdi_plStateStatus; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 36:24]
  assign io_TLlpData_ready = io_fdi_lpData_ready; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 41:23]
  assign io_TLplData_bits = io_fdi_plData_bits; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 44:22]
  assign io_TLplData_valid = io_fdi_plData_valid; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 43:23]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 65:39]
      lp_rx_active_sts_reg <= 1'h0; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 65:39]
    end else begin
      lp_rx_active_sts_reg <= _GEN_0;
    end
    if (reset) begin // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 78:35]
      lp_state_req_reg <= 4'h0; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 78:35]
    end else if (reqActive) begin // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 84:21]
      lp_state_req_reg <= 4'h1; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 85:26]
    end else if (~reqActive & io_soft_reset) begin // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 86:48]
      lp_state_req_reg <= 4'h9; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 87:26]
    end else begin
      lp_state_req_reg <= 4'h0; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 88:36]
    end
    if (reset) begin // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 99:31]
      lp_stall_reg <= 1'h0; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 99:31]
    end else begin
      lp_stall_reg <= io_fdi_plStallReq; // @[\\src\\main\\scala\\protocol\\ProtocolLayer.scala 100:18]
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
  lp_rx_active_sts_reg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  lp_state_req_reg = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  lp_stall_reg = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
