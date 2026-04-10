class VendingMachine extends Module {
    val io = IO(new Bundle {
        val coin2 = Input(UInt(8.W))
        val coin5 = Input(UInt(8.W))
        val buy = Input(UInt(8.W))
        val sel = Input(UInt(3.W))
        val alarm = Output(UInt(8.W))
        val releaseCan = Output(UInt(8.W))
        
    })

    */
    val sum = RegInit(0.U(8.W))
    sum := sum + io.coin2 + io.coin5

    ////// price afhænger af basys 3 input (kodes seneere )
    val price = Mux(io.sel === 0.U, 2.U, Mux(io.sel === 1.U, 5.U, 8.U))
    io.alarm := 0.U
    io.releaseCan := 0.U

    when(io.buy === 1.U) {
        when(sum ) {
                io.releaseCan := 1.U
                sum := 0.U
        }
    }