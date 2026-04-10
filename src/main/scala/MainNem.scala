class VendingMachine extends Module {
    val io = IO(new Bundle {
        val buy = Input(Bool())
        val sel = Input(UInt(3.W))
        val coin5 = Input(Bool())
        val coin2 = Input(Bool())

        val sw = Input(UInt(5.W))
        val led1 = Output(Bool()) // for release can
        val led2 = Output(Bool()) // for alarm

        val alarm = Output(UInt(8.W))
        val releaseCan = Output(UInt(8.W))

    })

    // Calcluate SUM and PRICE

    val price = io.sw
    val sum = RegInit(0.U(8.W))

    val coin2Pressed = 0.U
    val coin5Pressed = 0.U
    val buyPressed = 0.U

    when(coin2 & !coin2Pressed){ // Rising edge detection
        coin2Pressed := 1.U
        sum := sum + 2.U
    } .elsewhen(!coin2 & coin2Pressed) { // Falling Edge detection
        coin2Pressed := 0.U
    }

    when(coin5 & !coin5Pressed) {  // Rising edge detection
      coin5Pressed := 1.U
      sum := sum + 5.U  
    } .elsewhen(!coin5 & coin5Pressed) { // Falling Edge detection
      coin5Pressed := 0.U
    }
    

    // Display SUM and PRICE

    val display = Module(new DisplayMultiplexer)


    // Compare and ALARM and RELEASE

    io.alarm := 0.U
    io.releaseCan := 0.U

    when(io.buy === 1.U) {
        when(sum >= price) {
                io.releaseCan := 1.U
                sum := 0.U
        } .otherwise {
                io.alarm := 1.U
        }

        
    }