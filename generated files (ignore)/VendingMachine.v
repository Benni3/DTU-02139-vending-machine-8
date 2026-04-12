module SevenSegDecoder(
  input  [3:0] io_sw, // @[src/main/scala/SevenSegDecoder.scala 5:14]
  output [6:0] io_seg // @[src/main/scala/SevenSegDecoder.scala 5:14]
);
  wire [6:0] _GEN_0 = 4'h9 == io_sw ? 7'h6f : 7'h0; // @[src/main/scala/SevenSegDecoder.scala 15:18 11:27 25:30]
  wire [6:0] _GEN_1 = 4'h8 == io_sw ? 7'h7f : _GEN_0; // @[src/main/scala/SevenSegDecoder.scala 15:18 24:30]
  wire [6:0] _GEN_2 = 4'h7 == io_sw ? 7'h7 : _GEN_1; // @[src/main/scala/SevenSegDecoder.scala 15:18 23:30]
  wire [6:0] _GEN_3 = 4'h6 == io_sw ? 7'h7d : _GEN_2; // @[src/main/scala/SevenSegDecoder.scala 15:18 22:30]
  wire [6:0] _GEN_4 = 4'h5 == io_sw ? 7'h6d : _GEN_3; // @[src/main/scala/SevenSegDecoder.scala 15:18 21:30]
  wire [6:0] _GEN_5 = 4'h4 == io_sw ? 7'h66 : _GEN_4; // @[src/main/scala/SevenSegDecoder.scala 15:18 20:30]
  wire [6:0] _GEN_6 = 4'h3 == io_sw ? 7'h4f : _GEN_5; // @[src/main/scala/SevenSegDecoder.scala 15:18 19:30]
  wire [6:0] _GEN_7 = 4'h2 == io_sw ? 7'h5b : _GEN_6; // @[src/main/scala/SevenSegDecoder.scala 15:18 18:30]
  wire [6:0] _GEN_8 = 4'h1 == io_sw ? 7'h6 : _GEN_7; // @[src/main/scala/SevenSegDecoder.scala 15:18 17:30]
  wire [6:0] sevSeg = 4'h0 == io_sw ? 7'h3f : _GEN_8; // @[src/main/scala/SevenSegDecoder.scala 15:18 16:30]
  assign io_seg = ~sevSeg; // @[src/main/scala/SevenSegDecoder.scala 30:13]
endmodule
module DisplayMultiplexer(
  input        clock,
  input        reset,
  input  [7:0] io_sum, // @[src/main/scala/DisplayMultiplexer.scala 5:14]
  input  [7:0] io_price, // @[src/main/scala/DisplayMultiplexer.scala 5:14]
  output [6:0] io_seg, // @[src/main/scala/DisplayMultiplexer.scala 5:14]
  output [3:0] io_an // @[src/main/scala/DisplayMultiplexer.scala 5:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] decoder_io_sw; // @[src/main/scala/DisplayMultiplexer.scala 50:23]
  wire [6:0] decoder_io_seg; // @[src/main/scala/DisplayMultiplexer.scala 50:23]
  reg [15:0] refreshCounter; // @[src/main/scala/DisplayMultiplexer.scala 17:31]
  reg [1:0] digitSel; // @[src/main/scala/DisplayMultiplexer.scala 18:25]
  wire [7:0] _GEN_5 = io_price % 8'ha; // @[src/main/scala/DisplayMultiplexer.scala 23:28]
  wire [3:0] priceOnes = _GEN_5[3:0]; // @[src/main/scala/DisplayMultiplexer.scala 23:28]
  wire [7:0] priceTens = io_price / 4'ha; // @[src/main/scala/DisplayMultiplexer.scala 24:28]
  wire [7:0] _GEN_9 = io_sum % 8'ha; // @[src/main/scala/DisplayMultiplexer.scala 26:24]
  wire [3:0] sumOnes = _GEN_9[3:0]; // @[src/main/scala/DisplayMultiplexer.scala 26:24]
  wire [7:0] sumTens = io_sum / 4'ha; // @[src/main/scala/DisplayMultiplexer.scala 27:24]
  wire [1:0] _digitSel_T_1 = digitSel + 2'h1; // @[src/main/scala/DisplayMultiplexer.scala 38:26]
  wire [15:0] _refreshCounter_T_1 = refreshCounter + 16'h1; // @[src/main/scala/DisplayMultiplexer.scala 40:38]
  wire  _T_1 = 2'h0 == digitSel; // @[src/main/scala/DisplayMultiplexer.scala 43:20]
  wire  _T_2 = 2'h1 == digitSel; // @[src/main/scala/DisplayMultiplexer.scala 43:20]
  wire  _T_3 = 2'h2 == digitSel; // @[src/main/scala/DisplayMultiplexer.scala 43:20]
  wire  _T_4 = 2'h3 == digitSel; // @[src/main/scala/DisplayMultiplexer.scala 43:20]
  wire [3:0] digits_3 = sumTens[3:0]; // @[src/main/scala/DisplayMultiplexer.scala 20:20 33:13]
  wire [3:0] _GEN_2 = 2'h3 == digitSel ? digits_3 : 4'h0; // @[src/main/scala/DisplayMultiplexer.scala 43:20 47:29 21:34]
  wire [3:0] _GEN_3 = 2'h2 == digitSel ? sumOnes : _GEN_2; // @[src/main/scala/DisplayMultiplexer.scala 43:20 46:29]
  wire [3:0] digits_1 = priceTens[3:0]; // @[src/main/scala/DisplayMultiplexer.scala 20:20 31:13]
  wire [3:0] _GEN_4 = 2'h1 == digitSel ? digits_1 : _GEN_3; // @[src/main/scala/DisplayMultiplexer.scala 43:20 45:29]
  wire [6:0] sevSeg = ~decoder_io_seg; // @[src/main/scala/DisplayMultiplexer.scala 54:13]
  wire [3:0] _GEN_6 = _T_4 ? 4'h8 : 4'h1; // @[src/main/scala/DisplayMultiplexer.scala 56:20 60:22 13:27]
  wire [3:0] _GEN_7 = _T_3 ? 4'h4 : _GEN_6; // @[src/main/scala/DisplayMultiplexer.scala 56:20 59:22]
  wire [3:0] _GEN_8 = _T_2 ? 4'h2 : _GEN_7; // @[src/main/scala/DisplayMultiplexer.scala 56:20 58:22]
  wire [3:0] select = _T_1 ? 4'h1 : _GEN_8; // @[src/main/scala/DisplayMultiplexer.scala 56:20 57:22]
  SevenSegDecoder decoder ( // @[src/main/scala/DisplayMultiplexer.scala 50:23]
    .io_sw(decoder_io_sw),
    .io_seg(decoder_io_seg)
  );
  assign io_seg = ~sevSeg; // @[src/main/scala/DisplayMultiplexer.scala 65:13]
  assign io_an = ~select; // @[src/main/scala/DisplayMultiplexer.scala 66:12]
  assign decoder_io_sw = 2'h0 == digitSel ? priceOnes : _GEN_4; // @[src/main/scala/DisplayMultiplexer.scala 43:20 44:29]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/DisplayMultiplexer.scala 17:31]
      refreshCounter <= 16'h0; // @[src/main/scala/DisplayMultiplexer.scala 17:31]
    end else if (refreshCounter == 16'hc34f) begin // @[src/main/scala/DisplayMultiplexer.scala 36:45]
      refreshCounter <= 16'h0; // @[src/main/scala/DisplayMultiplexer.scala 37:20]
    end else begin
      refreshCounter <= _refreshCounter_T_1; // @[src/main/scala/DisplayMultiplexer.scala 40:20]
    end
    if (reset) begin // @[src/main/scala/DisplayMultiplexer.scala 18:25]
      digitSel <= 2'h0; // @[src/main/scala/DisplayMultiplexer.scala 18:25]
    end else if (refreshCounter == 16'hc34f) begin // @[src/main/scala/DisplayMultiplexer.scala 36:45]
      digitSel <= _digitSel_T_1; // @[src/main/scala/DisplayMultiplexer.scala 38:14]
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
  refreshCounter = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  digitSel = _RAND_1[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module VendingMachine(
  input        clock,
  input        reset,
  input        io_buy, // @[src/main/scala/Main.scala 6:16]
  input        io_coin5, // @[src/main/scala/Main.scala 6:16]
  input        io_coin2, // @[src/main/scala/Main.scala 6:16]
  input  [4:0] io_price, // @[src/main/scala/Main.scala 6:16]
  output       io_alarm, // @[src/main/scala/Main.scala 6:16]
  output       io_releaseCan, // @[src/main/scala/Main.scala 6:16]
  output [6:0] io_seg, // @[src/main/scala/Main.scala 6:16]
  output [3:0] io_an // @[src/main/scala/Main.scala 6:16]
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
  wire  display_clock; // @[src/main/scala/Main.scala 88:25]
  wire  display_reset; // @[src/main/scala/Main.scala 88:25]
  wire [7:0] display_io_sum; // @[src/main/scala/Main.scala 88:25]
  wire [7:0] display_io_price; // @[src/main/scala/Main.scala 88:25]
  wire [6:0] display_io_seg; // @[src/main/scala/Main.scala 88:25]
  wire [3:0] display_io_an; // @[src/main/scala/Main.scala 88:25]
  reg [7:0] sum; // @[src/main/scala/Main.scala 21:22]
  reg  coin2Pressed; // @[src/main/scala/Main.scala 23:31]
  reg  coin5Pressed; // @[src/main/scala/Main.scala 24:31]
  reg  buyPressed; // @[src/main/scala/Main.scala 25:31]
  reg [28:0] releaseCounter; // @[src/main/scala/Main.scala 27:33]
  reg [28:0] alarmCounter; // @[src/main/scala/Main.scala 28:33]
  reg  releaseActive; // @[src/main/scala/Main.scala 30:32]
  reg  alarmActive; // @[src/main/scala/Main.scala 31:32]
  wire [7:0] _sum_T_1 = sum + 8'h2; // @[src/main/scala/Main.scala 38:20]
  wire  _GEN_0 = ~io_coin2 & coin2Pressed ? 1'h0 : coin2Pressed; // @[src/main/scala/Main.scala 39:43 40:22 23:31]
  wire  _GEN_1 = io_coin2 & ~coin2Pressed | _GEN_0; // @[src/main/scala/Main.scala 36:37 37:22]
  wire [7:0] _GEN_2 = io_coin2 & ~coin2Pressed ? _sum_T_1 : sum; // @[src/main/scala/Main.scala 36:37 38:13 21:22]
  wire [7:0] _sum_T_3 = sum + 8'h5; // @[src/main/scala/Main.scala 46:20]
  wire  _GEN_3 = ~io_coin5 & coin5Pressed ? 1'h0 : coin5Pressed; // @[src/main/scala/Main.scala 47:43 48:22 24:31]
  wire  _GEN_4 = io_coin5 & ~coin5Pressed | _GEN_3; // @[src/main/scala/Main.scala 44:37 45:22]
  wire [7:0] _GEN_5 = io_coin5 & ~coin5Pressed ? _sum_T_3 : _GEN_2; // @[src/main/scala/Main.scala 44:37 46:13]
  wire [7:0] _GEN_26 = {{3'd0}, io_price}; // @[src/main/scala/Main.scala 55:18]
  wire  _GEN_6 = sum >= _GEN_26 | releaseActive; // @[src/main/scala/Main.scala 55:35 56:27 30:32]
  wire [28:0] _GEN_7 = sum >= _GEN_26 ? 29'h11e1a300 : releaseCounter; // @[src/main/scala/Main.scala 55:35 57:28 27:33]
  wire  _GEN_9 = sum >= _GEN_26 ? alarmActive : 1'h1; // @[src/main/scala/Main.scala 31:32 55:35 60:25]
  wire [28:0] _GEN_10 = sum >= _GEN_26 ? alarmCounter : 29'h11e1a300; // @[src/main/scala/Main.scala 28:33 55:35 61:26]
  wire  _GEN_11 = ~io_buy & buyPressed ? 1'h0 : buyPressed; // @[src/main/scala/Main.scala 63:39 64:20 25:31]
  wire  _GEN_12 = io_buy & ~buyPressed | _GEN_11; // @[src/main/scala/Main.scala 52:33 53:20]
  wire  _GEN_13 = io_buy & ~buyPressed ? _GEN_6 : releaseActive; // @[src/main/scala/Main.scala 30:32 52:33]
  wire [28:0] _GEN_14 = io_buy & ~buyPressed ? _GEN_7 : releaseCounter; // @[src/main/scala/Main.scala 27:33 52:33]
  wire  _GEN_16 = io_buy & ~buyPressed ? _GEN_9 : alarmActive; // @[src/main/scala/Main.scala 31:32 52:33]
  wire [28:0] _GEN_17 = io_buy & ~buyPressed ? _GEN_10 : alarmCounter; // @[src/main/scala/Main.scala 28:33 52:33]
  wire [28:0] _releaseCounter_T_1 = releaseCounter - 29'h1; // @[src/main/scala/Main.scala 72:46]
  wire [28:0] _alarmCounter_T_1 = alarmCounter - 29'h1; // @[src/main/scala/Main.scala 81:42]
  DisplayMultiplexer display ( // @[src/main/scala/Main.scala 88:25]
    .clock(display_clock),
    .reset(display_reset),
    .io_sum(display_io_sum),
    .io_price(display_io_price),
    .io_seg(display_io_seg),
    .io_an(display_io_an)
  );
  assign io_alarm = alarmActive; // @[src/main/scala/Main.scala 86:14]
  assign io_releaseCan = releaseActive; // @[src/main/scala/Main.scala 85:19]
  assign io_seg = display_io_seg; // @[src/main/scala/Main.scala 92:12]
  assign io_an = display_io_an; // @[src/main/scala/Main.scala 93:12]
  assign display_clock = clock;
  assign display_reset = reset;
  assign display_io_sum = sum; // @[src/main/scala/Main.scala 89:20]
  assign display_io_price = {{3'd0}, io_price}; // @[src/main/scala/Main.scala 90:22]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/Main.scala 21:22]
      sum <= 8'h0; // @[src/main/scala/Main.scala 21:22]
    end else if (io_buy & ~buyPressed) begin // @[src/main/scala/Main.scala 52:33]
      if (sum >= _GEN_26) begin // @[src/main/scala/Main.scala 55:35]
        sum <= 8'h0; // @[src/main/scala/Main.scala 58:17]
      end else begin
        sum <= _GEN_5;
      end
    end else begin
      sum <= _GEN_5;
    end
    if (reset) begin // @[src/main/scala/Main.scala 23:31]
      coin2Pressed <= 1'h0; // @[src/main/scala/Main.scala 23:31]
    end else begin
      coin2Pressed <= _GEN_1;
    end
    if (reset) begin // @[src/main/scala/Main.scala 24:31]
      coin5Pressed <= 1'h0; // @[src/main/scala/Main.scala 24:31]
    end else begin
      coin5Pressed <= _GEN_4;
    end
    if (reset) begin // @[src/main/scala/Main.scala 25:31]
      buyPressed <= 1'h0; // @[src/main/scala/Main.scala 25:31]
    end else begin
      buyPressed <= _GEN_12;
    end
    if (reset) begin // @[src/main/scala/Main.scala 27:33]
      releaseCounter <= 29'h0; // @[src/main/scala/Main.scala 27:33]
    end else if (releaseActive) begin // @[src/main/scala/Main.scala 68:25]
      if (releaseCounter == 29'h0) begin // @[src/main/scala/Main.scala 69:38]
        releaseCounter <= _GEN_14;
      end else begin
        releaseCounter <= _releaseCounter_T_1; // @[src/main/scala/Main.scala 72:28]
      end
    end else begin
      releaseCounter <= _GEN_14;
    end
    if (reset) begin // @[src/main/scala/Main.scala 28:33]
      alarmCounter <= 29'h0; // @[src/main/scala/Main.scala 28:33]
    end else if (alarmActive) begin // @[src/main/scala/Main.scala 77:23]
      if (alarmCounter == 29'h0) begin // @[src/main/scala/Main.scala 78:36]
        alarmCounter <= _GEN_17;
      end else begin
        alarmCounter <= _alarmCounter_T_1; // @[src/main/scala/Main.scala 81:26]
      end
    end else begin
      alarmCounter <= _GEN_17;
    end
    if (reset) begin // @[src/main/scala/Main.scala 30:32]
      releaseActive <= 1'h0; // @[src/main/scala/Main.scala 30:32]
    end else if (releaseActive) begin // @[src/main/scala/Main.scala 68:25]
      if (releaseCounter == 29'h0) begin // @[src/main/scala/Main.scala 69:38]
        releaseActive <= 1'h0; // @[src/main/scala/Main.scala 70:27]
      end else begin
        releaseActive <= _GEN_13;
      end
    end else begin
      releaseActive <= _GEN_13;
    end
    if (reset) begin // @[src/main/scala/Main.scala 31:32]
      alarmActive <= 1'h0; // @[src/main/scala/Main.scala 31:32]
    end else if (alarmActive) begin // @[src/main/scala/Main.scala 77:23]
      if (alarmCounter == 29'h0) begin // @[src/main/scala/Main.scala 78:36]
        alarmActive <= 1'h0; // @[src/main/scala/Main.scala 79:25]
      end else begin
        alarmActive <= _GEN_16;
      end
    end else begin
      alarmActive <= _GEN_16;
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
  sum = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  coin2Pressed = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  coin5Pressed = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  buyPressed = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  releaseCounter = _RAND_4[28:0];
  _RAND_5 = {1{`RANDOM}};
  alarmCounter = _RAND_5[28:0];
  _RAND_6 = {1{`RANDOM}};
  releaseActive = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  alarmActive = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
