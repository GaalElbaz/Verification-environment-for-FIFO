# FIFO Verification Environment

## Description

This project implements a verification environment for a FIFO (First-In-First-Out) data structure using SystemVerilog and Xilinx Vivado. The verification environment is designed to ensure the fundamental functionality of the FIFO memory, including data writing, reading, and boundary condition testing such as overflow and underflow scenarios.

## Code Overview

The verification environment consists of several SystemVerilog classes and modules:

- **transaction**: Represents a packet of data with control and data signals.
- **generator**: Generates random stimuli and sends data to the driver.
- **driver**: Applies stimuli to the DUT (Device Under Test) and manages the clock signal.
- **monitor**: Collects results from the DUT and sends them to the scoreboard.
- **scoreboard**: Compares expected results with actual results and reports any discrepancies.
- **environment**: Orchestrates the testbench components, including initialization, test execution, and post-test tasks.
- **fifo_tb**: Top-level module instantiating the FIFO DUT and the verification environment.

The verification environment follows a structured approach, starting with initializing the components, generating input stimuli, applying them to the DUT, monitoring its behavior, comparing the results, and ending the simulation after a specified number of stimuli.
