# tiny-tapeout-D2DAdapter

# Research Project Code

This repository contains code written during a research project for Dr Arafin.The design passes simulation testbenches written in Verilog and Cocotb, and integrates with Tiny Tapeout's automated GitHub Actions flow for GDS hardening and verification

## Files Description
- `src/D2DAdapter.v` – Main Verilog source file. Contains the full D2D Adapter RTL design.
- `info.yaml` – Tiny Tapeout configuration file describing project metadata (top module name, source files, pinout, clock settings, etc.).
- `test/tb_D2DAdapter.v` – Verilog testbench for basic simulation of the D2DAdapter module using traditional RTL methods.
- `test/test_d2d_adapter.py` – Cocotb-based Python testbench for asynchronous simulation and verification of the D2DAdapter design.
- `test/requirements.txt` – Python dependencies required to run the Cocotb testbench locally and inside GitHub Actions.
- `.github/workflows/` – GitHub Actions workflows that automate running tests, building GDS, and performing precheck validations.



