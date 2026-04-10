class VendingMachine extends Module {
    val io = IO(new Bundle {
        val coin2 = Input(Bool())
        val coin5 = Input(Bool())
        val buy = Input(Bool())
        val sel = Input(UInt(3.W))
        val alarm = Output(UInt(8.W))
        val releaseCan = Output(UInt(8.W))
        
    })

    */
    val sum = RegInit(0.U(8.W))
    sum := sum + io.coin2 + io.coin5

    ////// price afhænger af basys 3 input (kodes senere )
    
    val price = RegInit(0.U(8.W))
    when (io.coin5) {
        price := price + 5.U
    } .elsewhen (io.coin2) {
        price := price + 2.U
    }

    io.alarm := 0.U
    io.releaseCan := 0.U

    when(io.buy) {
        when(sum >= price) {
                io.releaseCan := 1.U
                sum := 0.U
        } .otherwise {
                io.alarm := 1.U
        }   
    }

    //when alarm is 1, then it should light up the red led on basys 3, and when release can is 1, then it should light up the green led on basys 3.

    
}