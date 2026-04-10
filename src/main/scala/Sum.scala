import chisel3._
import chisel3.util._

class Sum extends Module {
  val io = IO(new Bundle {

    // For seven seg display
    val sw = Input(UInt(4.W))
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))


  })
}