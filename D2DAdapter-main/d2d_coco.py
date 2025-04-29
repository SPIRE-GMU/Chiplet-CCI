import cocotb
from cocotb.clock import Clock
from cocotb.regression import TestFactory
from cocotb.triggers import RisingEdge
import random


async def generate_clock(dut):
    """Generate a clock signal with a 10ns period."""
    clock = Clock(dut.clock, 10, units="ns")  
    await cocotb.start(clock.start())  


async def reset_dut(dut):
    """Reset the DUT."""
    dut.reset <= 1  
    await RisingEdge(dut.clock)  
    dut.reset <= 0  
    await RisingEdge(dut.clock)  


@cocotb.test()
async def test_signal_on_rising_edge(dut):
    """Test that io_fdi_lpData_ready behaves correctly after a clock edge."""

    await generate_clock(dut)
    await reset_dut(dut)

 
    dut.io_fdi_lpData_ready.value = 1
    await RisingEdge(dut.clock)  

   
    assert dut.io_fdi_lpData_ready.value == 1, f"Expected 1 after clock edge, got {dut.io_fdi_lpData_ready.value}"

   
    dut.io_fdi_lpData_ready.value = 0  
    await RisingEdge(dut.clock)  

   
    assert dut.io_fdi_lpData_ready.value == 0, f"Expected 0 after clock edge, got {dut.io_fdi_lpData_ready.value}"


@cocotb.test()
async def test_d2d_adapter_random_inputs(dut):
    """Test D2DAdapter with random inputs."""

  
    await generate_clock(dut)

   
    await reset_dut(dut)

    for _ in range(10):
        random_value = random.randint(0, 1)
        dut.io_fdi_lpData_ready.value = random_value  
        await RisingEdge(dut.clock)  

        
        assert dut.io_fdi_lpData_ready.value == random_value, \
            f"Output should match random input {random_value}, but found {dut.io_fdi_lpData_ready.value}"
