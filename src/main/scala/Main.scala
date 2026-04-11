import chisel3._
import chisel3.util._

class VendingMachine extends Module {
    val io = IO(new Bundle {
        val buy = Input(Bool())
        val sel = Input(UInt(3.W))
        val coin5 = Input(Bool())
        val coin2 = Input(Bool())

        val sw = Input(UInt(5.W))
        val led1 = Output(Bool()) // for releaseCan
        val led2 = Output(Bool()) // for alarm

        val alarm = Output(UInt(8.W))
        val releaseCan = Output(UInt(8.W))

        val seg = Output(UInt(7.W))
        val an  = Output(UInt(4.W))

    })


    // Calcluate SUM and PRICE

    val price = io.sw.asUInt
    val sum = RegInit(0.U(8.W))

     // Edge-detect registers
    val coin2Pressed = RegInit(false.B)
    val coin5Pressed = RegInit(false.B)
    val buyPressed   = RegInit(false.B)

    // Default outputs
    io.led1 := false.B
    io.led2 := false.B
    io.alarm := 0.U
    io.releaseCan := 0.U

    // Rising-edge detect for coin2
    when(io.coin2 && !coin2Pressed) {
        coin2Pressed := true.B
        sum := sum + 2.U
    }.elsewhen(!io.coin2 && coin2Pressed) {
        coin2Pressed := false.B
    }

    // Rising-edge detect for coin5
    when(io.coin5 && !coin5Pressed) {
        coin5Pressed := true.B
        sum := sum + 5.U
    }.elsewhen(!io.coin5 && coin5Pressed) {
        coin5Pressed := false.B
    }

    // BUY LOGIC
    when(io.buy && !buyPressed) {
        buyPressed := true.B

        when(sum >= price) {
        io.led1 := true.B
        io.releaseCan := 1.U
        sum := 0.U
        }.otherwise {
        io.led2 := true.B
        io.alarm := 1.U
        }
    }.elsewhen(!io.buy && buyPressed) {
        buyPressed := false.B
    }

    // Display module
    val display = Module(new DisplayMultiplexer(50000))
    display.io.sum := sum
    display.io.price := price

    io.seg := display.io.seg
    io.an  := display.io.an

}