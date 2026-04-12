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

  // ***** your code starts here *****

  val refreshCounter = RegInit(0.U(log2Ceil(maxCount).W))
  val digitSel = RegInit(0.U(2.W))

  val digits = Wire(Vec(4, UInt(4.W)))
  val currentNibble = WireDefault(0.U(4.W))

  val priceOnes = io.price % 10.U
  val priceTens = io.price / 10.U

  val sumOnes = io.sum % 10.U
  val sumTens = io.sum / 10.U

  // rightmost two = sum, leftmost two = price
  digits(0) := priceOnes
  digits(1) := priceTens
  digits(2) := sumOnes
  digits(3) := sumTens
  

  when(refreshCounter === (maxCount - 1).U) {
    refreshCounter := 0.U
    digitSel := digitSel + 1.U
  } .otherwise {
    refreshCounter := refreshCounter + 1.U
  }

  switch(digitSel) {
    is(0.U) { currentNibble := digits(0) }
    is(1.U) { currentNibble := digits(1) }
    is(2.U) { currentNibble := digits(2) }
    is(3.U) { currentNibble := digits(3) }
  }

  val decoder = Module(new SevenSegDecoder)
  decoder.io.sw := currentNibble

  // decoder.io.seg is already active-low, so invert it back internally
  sevSeg := ~decoder.io.seg

  switch(digitSel) {
    is(0.U) { select := "b0001".U }
    is(1.U) { select := "b0010".U }
    is(2.U) { select := "b0100".U }
    is(3.U) { select := "b1000".U }
  }

  // ***** your code ends here *****

  io.seg := ~sevSeg
  io.an := ~select
}