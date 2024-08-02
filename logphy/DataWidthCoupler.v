module DataWidthCoupler(
  input        clock,
  input        reset,
  output       io_in_ready, // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 22:14]
  input        io_in_valid, // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 22:14]
  input  [3:0] io_in_bits, // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 22:14]
  input        io_out_ready, // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 22:14]
  output       io_out_valid, // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 22:14]
  output [3:0] io_out_bits // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 22:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  currentState; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 29:37]
  reg [3:0] inData_0; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 79:14]
  wire  _T_3 = io_in_ready & io_in_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  _T_10 = io_out_ready & io_out_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  _GEN_4 = _T_10 ? 1'h0 : currentState; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 102:27 103:24 29:37]
  wire  _GEN_7 = currentState ? _GEN_4 : currentState; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 87:26 29:37]
  wire  _GEN_11 = ~currentState | _GEN_7; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 87:26]
  assign io_in_ready = ~currentState; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 87:26]
  assign io_out_valid = ~currentState ? 1'h0 : currentState; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 87:26 src/main/scala/chisel3/util/Decoupled.scala 74:20]
  assign io_out_bits = inData_0; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 101:21 87:26]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 29:37]
      currentState <= 1'h0; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 29:37]
    end else begin
      currentState <= _GEN_11;
    end
    if (reset) begin // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 79:14]
      inData_0 <= 4'h0; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 79:14]
    end else if (~currentState) begin // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 87:26]
      if (_T_3) begin // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 90:26]
        inData_0 <= io_in_bits; // @[\\src\\main\\scala\\logphy\\DataWidthCoupler.scala 91:50]
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
  inData_0 = _RAND_1[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
