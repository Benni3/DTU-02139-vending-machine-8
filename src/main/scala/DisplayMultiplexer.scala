import chisel3._
import chisel3.util._

class DisplayMultiplexer(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val sum = Input(UInt(8.W))
    val price = Input(UInt(8.W))
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
  })

  val sevSeg = WireDefault("b1111111".U(7.W))
  val select = WireDefault("b0001".U(4.W))

// *** your code starts here

  // Counter register
  val refreshCounter = RegInit(0.U(log2Ceil(maxCount).W))
  val digitSel = RegInit(0.U(2.W))

  // 4 digits (4-bit each)
  val digits = Wire(Vec(4, UInt(4.W)))

  // Rightmost two displays = sum, leftmost two = price
  digits(0) := io.price(3, 0)      // rightmost
  digits(1) := io.price(7, 4)
  digits(2) := io.sum(3, 0)
  digits(3) := io.sum(7, 4)    // leftmost

  when(refreshCounter === (maxCount - 1).U) {
    refreshCounter := 0.U
    digitSel := digitSel + 1.U
  } .otherwise {
    refreshCounter := refreshCounter + 1.U
  }

  val currentNibble = Wire(UInt(4.W))
  currentNibble := digits(digitSel)

  val decoder = Module(new SevenSegDec)
  decoder.io.in := currentNibble
  sevSeg := decoder.io.out

  switch(digitSel) {
    is(0.U) { select := "b0001".U }
    is(1.U) { select := "b0010".U }
    is(2.U) { select := "b0100".U }
    is(3.U) { select := "b1000".U }
  }

  // *** your code ends here

  io.seg := ~sevSeg
  io.an := ~select
}
