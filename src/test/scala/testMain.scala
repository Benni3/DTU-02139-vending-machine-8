import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class VendingMachineTest extends AnyFlatSpec with ChiselScalatestTester {

  private def initDut(dut: VendingMachine): Unit = {
    dut.io.buy.poke(false.B)
    dut.io.sel.poke(0.U)
    dut.io.coin2.poke(false.B)
    dut.io.coin5.poke(false.B)
    dut.io.sw.poke(0.U)
    dut.clock.step(1)
  }

  "VendingMachine" should "accept a 2-coin without triggering release or alarm" in {
    test(new VendingMachine()).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      initDut(dut)

      dut.io.coin2.poke(true.B)
      dut.clock.step(1)

      dut.io.coin2.poke(false.B)
      dut.clock.step(1)

      dut.io.led1.expect(false.B)
      dut.io.led2.expect(false.B)
      dut.io.releaseCan.expect(0.U)
      dut.io.alarm.expect(0.U)
    }
  }

  it should "accept a 5-coin without triggering release or alarm" in {
    test(new VendingMachine()).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      initDut(dut)

      dut.io.coin5.poke(true.B)
      dut.clock.step(1)

      dut.io.coin5.poke(false.B)
      dut.clock.step(1)

      dut.io.led1.expect(false.B)
      dut.io.led2.expect(false.B)
      dut.io.releaseCan.expect(0.U)
      dut.io.alarm.expect(0.U)
    }
  }

  it should "release can when enough money has been inserted and buy is pressed" in {
    test(new VendingMachine()).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      initDut(dut)

      dut.io.sw.poke(5.U)
      dut.clock.step(1)

      dut.io.coin5.poke(true.B)
      dut.clock.step(1)
      dut.io.coin5.poke(false.B)
      dut.clock.step(1)

      dut.io.buy.poke(true.B)

      dut.io.led1.expect(true.B)
      dut.io.led2.expect(false.B)
      dut.io.releaseCan.expect(1.U)
      dut.io.alarm.expect(0.U)

      dut.clock.step(1)

      dut.io.buy.poke(false.B)
      dut.clock.step(1)
    }
  }

  it should "trigger alarm when not enough money has been inserted and buy is pressed" in {
    test(new VendingMachine()).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      initDut(dut)

      dut.io.sw.poke(10.U)
      dut.clock.step(1)

      dut.io.coin2.poke(true.B)
      dut.clock.step(1)
      dut.io.coin2.poke(false.B)
      dut.clock.step(1)

      dut.io.buy.poke(true.B)

      dut.io.led1.expect(false.B)
      dut.io.led2.expect(true.B)
      dut.io.releaseCan.expect(0.U)
      dut.io.alarm.expect(1.U)

      dut.clock.step(1)

      dut.io.buy.poke(false.B)
      dut.clock.step(1)
    }
  }

  it should "only count coin2 once while held high" in {
    test(new VendingMachine()).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      initDut(dut)

      dut.io.sw.poke(4.U)
      dut.clock.step(1)

      dut.io.coin2.poke(true.B)
      dut.clock.step(3)

      dut.io.coin2.poke(false.B)
      dut.clock.step(1)

      dut.io.buy.poke(true.B)

      dut.io.led1.expect(false.B)
      dut.io.led2.expect(true.B)
      dut.io.releaseCan.expect(0.U)
      dut.io.alarm.expect(1.U)

      dut.clock.step(1)

      dut.io.buy.poke(false.B)
      dut.clock.step(1)
    }
  }

  it should "only count coin5 once while held high" in {
    test(new VendingMachine()).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      initDut(dut)

      dut.io.sw.poke(8.U)
      dut.clock.step(1)

      dut.io.coin5.poke(true.B)
      dut.clock.step(3)

      dut.io.coin5.poke(false.B)
      dut.clock.step(1)

      dut.io.buy.poke(true.B)

      dut.io.led1.expect(false.B)
      dut.io.led2.expect(true.B)
      dut.io.releaseCan.expect(0.U)
      dut.io.alarm.expect(1.U)

      dut.clock.step(1)

      dut.io.buy.poke(false.B)
      dut.clock.step(1)
    }
  }

  it should "allow combining coins to reach the price" in {
    test(new VendingMachine()).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      initDut(dut)

      dut.io.sw.poke(7.U)
      dut.clock.step(1)

      dut.io.coin5.poke(true.B)
      dut.clock.step(1)
      dut.io.coin5.poke(false.B)
      dut.clock.step(1)

      dut.io.coin2.poke(true.B)
      dut.clock.step(1)
      dut.io.coin2.poke(false.B)
      dut.clock.step(1)

      dut.io.buy.poke(true.B)

      dut.io.led1.expect(true.B)
      dut.io.led2.expect(false.B)
      dut.io.releaseCan.expect(1.U)
      dut.io.alarm.expect(0.U)

      dut.clock.step(1)

      dut.io.buy.poke(false.B)
      dut.clock.step(1)
    }
  }
}