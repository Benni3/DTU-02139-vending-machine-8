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
  wire [3:0] decoder_io_sw; // @[src/main/scala/DisplayMultiplexer.scala 43:23]
  wire [6:0] decoder_io_seg; // @[src/main/scala/DisplayMultiplexer.scala 43:23]
  reg [15:0] refreshCounter; // @[src/main/scala/DisplayMultiplexer.scala 17:31]
  reg [1:0] digitSel; // @[src/main/scala/DisplayMultiplexer.scala 18:25]
  wire [3:0] digits_0 = io_sum[3:0]; // @[src/main/scala/DisplayMultiplexer.scala 24:22]
  wire [3:0] digits_1 = io_sum[7:4]; // @[src/main/scala/DisplayMultiplexer.scala 25:22]
  wire [3:0] digits_2 = io_price[3:0]; // @[src/main/scala/DisplayMultiplexer.scala 26:24]
  wire [3:0] digits_3 = io_price[7:4]; // @[src/main/scala/DisplayMultiplexer.scala 27:24]
  wire [1:0] _digitSel_T_1 = digitSel + 2'h1; // @[src/main/scala/DisplayMultiplexer.scala 31:26]
  wire [15:0] _refreshCounter_T_1 = refreshCounter + 16'h1; // @[src/main/scala/DisplayMultiplexer.scala 33:38]
  wire  _T_1 = 2'h0 == digitSel; // @[src/main/scala/DisplayMultiplexer.scala 36:20]
  wire  _T_2 = 2'h1 == digitSel; // @[src/main/scala/DisplayMultiplexer.scala 36:20]
  wire  _T_3 = 2'h2 == digitSel; // @[src/main/scala/DisplayMultiplexer.scala 36:20]
  wire  _T_4 = 2'h3 == digitSel; // @[src/main/scala/DisplayMultiplexer.scala 36:20]
  wire [3:0] _GEN_2 = 2'h3 == digitSel ? digits_3 : 4'h0; // @[src/main/scala/DisplayMultiplexer.scala 36:20 40:29 21:34]
  wire [3:0] _GEN_3 = 2'h2 == digitSel ? digits_2 : _GEN_2; // @[src/main/scala/DisplayMultiplexer.scala 36:20 39:29]
  wire [3:0] _GEN_4 = 2'h1 == digitSel ? digits_1 : _GEN_3; // @[src/main/scala/DisplayMultiplexer.scala 36:20 38:29]
  wire [6:0] sevSeg = ~decoder_io_seg; // @[src/main/scala/DisplayMultiplexer.scala 47:13]
  wire [3:0] _GEN_6 = _T_4 ? 4'h8 : 4'h1; // @[src/main/scala/DisplayMultiplexer.scala 49:20 53:22 13:27]
  wire [3:0] _GEN_7 = _T_3 ? 4'h4 : _GEN_6; // @[src/main/scala/DisplayMultiplexer.scala 49:20 52:22]
  wire [3:0] _GEN_8 = _T_2 ? 4'h2 : _GEN_7; // @[src/main/scala/DisplayMultiplexer.scala 49:20 51:22]
  wire [3:0] select = _T_1 ? 4'h1 : _GEN_8; // @[src/main/scala/DisplayMultiplexer.scala 49:20 50:22]
  SevenSegDecoder decoder ( // @[src/main/scala/DisplayMultiplexer.scala 43:23]
    .io_sw(decoder_io_sw),
    .io_seg(decoder_io_seg)
  );
  assign io_seg = ~sevSeg; // @[src/main/scala/DisplayMultiplexer.scala 58:13]
  assign io_an = ~select; // @[src/main/scala/DisplayMultiplexer.scala 59:12]
  assign decoder_io_sw = 2'h0 == digitSel ? digits_0 : _GEN_4; // @[src/main/scala/DisplayMultiplexer.scala 36:20 37:29]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/DisplayMultiplexer.scala 17:31]
      refreshCounter <= 16'h0; // @[src/main/scala/DisplayMultiplexer.scala 17:31]
    end else if (refreshCounter == 16'hc34f) begin // @[src/main/scala/DisplayMultiplexer.scala 29:45]
      refreshCounter <= 16'h0; // @[src/main/scala/DisplayMultiplexer.scala 30:20]
    end else begin
      refreshCounter <= _refreshCounter_T_1; // @[src/main/scala/DisplayMultiplexer.scala 33:20]
    end
    if (reset) begin // @[src/main/scala/DisplayMultiplexer.scala 18:25]
      digitSel <= 2'h0; // @[src/main/scala/DisplayMultiplexer.scala 18:25]
    end else if (refreshCounter == 16'hc34f) begin // @[src/main/scala/DisplayMultiplexer.scala 29:45]
      digitSel <= _digitSel_T_1; // @[src/main/scala/DisplayMultiplexer.scala 31:14]
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
  input  [2:0] io_sel, // @[src/main/scala/Main.scala 6:16]
  input        io_coin5, // @[src/main/scala/Main.scala 6:16]
  input        io_coin2, // @[src/main/scala/Main.scala 6:16]
  input  [4:0] io_sw, // @[src/main/scala/Main.scala 6:16]
  output       io_led1, // @[src/main/scala/Main.scala 6:16]
  output       io_led2, // @[src/main/scala/Main.scala 6:16]
  output [7:0] io_alarm, // @[src/main/scala/Main.scala 6:16]
  output [7:0] io_releaseCan, // @[src/main/scala/Main.scala 6:16]
  output [6:0] io_seg, // @[src/main/scala/Main.scala 6:16]
  output [3:0] io_an // @[src/main/scala/Main.scala 6:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  display_clock; // @[src/main/scala/Main.scala 73:25]
  wire  display_reset; // @[src/main/scala/Main.scala 73:25]
  wire [7:0] display_io_sum; // @[src/main/scala/Main.scala 73:25]
  wire [7:0] display_io_price; // @[src/main/scala/Main.scala 73:25]
  wire [6:0] display_io_seg; // @[src/main/scala/Main.scala 73:25]
  wire [3:0] display_io_an; // @[src/main/scala/Main.scala 73:25]
  reg [7:0] sum; // @[src/main/scala/Main.scala 27:22]
  reg  coin2Pressed; // @[src/main/scala/Main.scala 30:31]
  reg  coin5Pressed; // @[src/main/scala/Main.scala 31:31]
  reg  buyPressed; // @[src/main/scala/Main.scala 32:31]
  wire [7:0] _sum_T_1 = sum + 8'h2; // @[src/main/scala/Main.scala 43:20]
  wire  _GEN_0 = ~io_coin2 & coin2Pressed ? 1'h0 : coin2Pressed; // @[src/main/scala/Main.scala 44:43 45:22 30:31]
  wire  _GEN_1 = io_coin2 & ~coin2Pressed | _GEN_0; // @[src/main/scala/Main.scala 41:37 42:22]
  wire [7:0] _GEN_2 = io_coin2 & ~coin2Pressed ? _sum_T_1 : sum; // @[src/main/scala/Main.scala 41:37 43:13 27:22]
  wire [7:0] _sum_T_3 = sum + 8'h5; // @[src/main/scala/Main.scala 51:20]
  wire  _GEN_3 = ~io_coin5 & coin5Pressed ? 1'h0 : coin5Pressed; // @[src/main/scala/Main.scala 52:43 53:22 31:31]
  wire  _GEN_4 = io_coin5 & ~coin5Pressed | _GEN_3; // @[src/main/scala/Main.scala 49:37 50:22]
  wire [7:0] _GEN_5 = io_coin5 & ~coin5Pressed ? _sum_T_3 : _GEN_2; // @[src/main/scala/Main.scala 49:37 51:13]
  wire [7:0] _GEN_14 = {{3'd0}, io_sw}; // @[src/main/scala/Main.scala 60:18]
  wire  _T_10 = sum >= _GEN_14; // @[src/main/scala/Main.scala 60:18]
  wire  _GEN_8 = sum >= _GEN_14 ? 1'h0 : 1'h1; // @[src/main/scala/Main.scala 36:13 60:28 65:17]
  wire  _GEN_9 = ~io_buy & buyPressed ? 1'h0 : buyPressed; // @[src/main/scala/Main.scala 68:39 69:20 32:31]
  wire  _GEN_10 = io_buy & ~buyPressed | _GEN_9; // @[src/main/scala/Main.scala 57:33 58:20]
  wire  _GEN_11 = io_buy & ~buyPressed & _T_10; // @[src/main/scala/Main.scala 35:13 57:33]
  wire  _GEN_13 = io_buy & ~buyPressed & _GEN_8; // @[src/main/scala/Main.scala 36:13 57:33]
  DisplayMultiplexer display ( // @[src/main/scala/Main.scala 73:25]
    .clock(display_clock),
    .reset(display_reset),
    .io_sum(display_io_sum),
    .io_price(display_io_price),
    .io_seg(display_io_seg),
    .io_an(display_io_an)
  );
  assign io_led1 = io_buy & ~buyPressed & _T_10; // @[src/main/scala/Main.scala 35:13 57:33]
  assign io_led2 = io_buy & ~buyPressed & _GEN_8; // @[src/main/scala/Main.scala 36:13 57:33]
  assign io_alarm = {{7'd0}, _GEN_13};
  assign io_releaseCan = {{7'd0}, _GEN_11};
  assign io_seg = display_io_seg; // @[src/main/scala/Main.scala 77:12]
  assign io_an = display_io_an; // @[src/main/scala/Main.scala 78:12]
  assign display_clock = clock;
  assign display_reset = reset;
  assign display_io_sum = sum; // @[src/main/scala/Main.scala 74:20]
  assign display_io_price = {{3'd0}, io_sw}; // @[src/main/scala/Main.scala 75:22]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/Main.scala 27:22]
      sum <= 8'h0; // @[src/main/scala/Main.scala 27:22]
    end else if (io_buy & ~buyPressed) begin // @[src/main/scala/Main.scala 57:33]
      if (sum >= _GEN_14) begin // @[src/main/scala/Main.scala 60:28]
        sum <= 8'h0; // @[src/main/scala/Main.scala 63:13]
      end else begin
        sum <= _GEN_5;
      end
    end else begin
      sum <= _GEN_5;
    end
    if (reset) begin // @[src/main/scala/Main.scala 30:31]
      coin2Pressed <= 1'h0; // @[src/main/scala/Main.scala 30:31]
    end else begin
      coin2Pressed <= _GEN_1;
    end
    if (reset) begin // @[src/main/scala/Main.scala 31:31]
      coin5Pressed <= 1'h0; // @[src/main/scala/Main.scala 31:31]
    end else begin
      coin5Pressed <= _GEN_4;
    end
    if (reset) begin // @[src/main/scala/Main.scala 32:31]
      buyPressed <= 1'h0; // @[src/main/scala/Main.scala 32:31]
    end else begin
      buyPressed <= _GEN_10;
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
