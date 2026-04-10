import chisel3._
import chisel3.util._

class SevenSegDecoder extends Module {
  val io = IO(new Bundle {
    val sw = Input(UInt(4.W))
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
  })

  val sevSeg = WireDefault(0.U(7.W))

  // ***** your code starts here *****

    switch(io.sw){
      is("b0000".U) { sevSeg := "b0111111".U } // 0
      is("b0001".U) { sevSeg := "b0000110".U } // 1
      is("b0010".U) { sevSeg := "b1011011".U } // 2
      is("b0011".U) { sevSeg := "b1001111".U } // 3
      is("b0100".U) { sevSeg := "b1100110".U } // 4
      is("b0101".U) { sevSeg := "b1101101".U } // 5
      is("b0110".U) { sevSeg := "b1111101".U } // 6
      is("b0111".U) { sevSeg := "b0000111".U } // 7
      is("b1000".U) { sevSeg := "b1111111".U } // 8
      is("b1001".U) { sevSeg := "b1101111".U } // 9
  }

  // ***** your code ends here *****

  io.seg := ~sevSeg
  io.an := "b1110".U
}

// generate Verilog
object SevenSegDecoder extends App {
  emitVerilog(new SevenSegDecoder())
}


