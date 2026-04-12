import chisel3._
import chisel3.util._
import chisel3.stage.ChiselStage

class VendingMachine extends Module {
    val io = IO(new Bundle {
        val buy = Input(Bool())
        val coin5 = Input(Bool())
        val coin2 = Input(Bool())

<<<<<<< HEAD
        val price = Input(UInt(5.W))
=======
        val sw = Input(UInt(5.W))
        val led1 = Output(Bool()) // for releaseCan
        val led2 = Output(Bool()) // for alarm
>>>>>>> refs/remotes/origin/main

        val alarm = Output(Bool())
        val releaseCan = Output(Bool())

        val seg = Output(UInt(7.W))
        val an  = Output(UInt(4.W))
    })

<<<<<<< HEAD
    val currentPrice = io.price
=======

    // Calcluate SUM and PRICE

    val price = io.sw.asUInt
>>>>>>> refs/remotes/origin/main
    val sum = RegInit(0.U(8.W))

    val coin2Pressed = RegInit(false.B)
    val coin5Pressed = RegInit(false.B)
    val buyPressed   = RegInit(false.B)

    val releaseCounter = RegInit(0.U(29.W))
    val alarmCounter   = RegInit(0.U(29.W))

    val releaseActive = RegInit(false.B)
    val alarmActive   = RegInit(false.B)

    val holdTime = 300000000.U // 3 seconds at 100 MHz

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

    // Buy button edge detect + decision
    when(io.buy && !buyPressed) {
        buyPressed := true.B

        when(sum >= currentPrice) {
            releaseActive := true.B
            releaseCounter := holdTime
            sum := 0.U
        }.otherwise {
            alarmActive := true.B
            alarmCounter := holdTime
        }
    }.elsewhen(!io.buy && buyPressed) {
        buyPressed := false.B
    }

    // Countdown for release LED
    when(releaseActive) {
        when(releaseCounter === 0.U) {
            releaseActive := false.B
        }.otherwise {
            releaseCounter := releaseCounter - 1.U
        }
    }

    // Countdown for alarm LED
    when(alarmActive) {
        when(alarmCounter === 0.U) {
            alarmActive := false.B
        }.otherwise {
            alarmCounter := alarmCounter - 1.U
        }
    }

    io.releaseCan := releaseActive
    io.alarm := alarmActive

    val display = Module(new DisplayMultiplexer(50000))
    display.io.sum := sum
    display.io.price := currentPrice

    io.seg := display.io.seg
    io.an  := display.io.an
}

object Main extends App {
  (new ChiselStage).emitVerilog(new VendingMachine(), Array("--target-dir", "generated"))
}