# Smart Dustbin using Verilog

## Description

A Smart Dustbin is an automated waste-management system designed using Verilog HDL.
The system detects an object near the dustbin and automatically opens the lid.
It also provides an indication when the dustbin is full.

## Features

- Automatic lid opening
- Automatic lid closing
- Bin-full detection
- Verilog HDL implementation
- Testbench for functional verification
- Simulation waveform generation

## Project Structure

- `src/` - Verilog design source code
- `testbench/` - Verilog testbench
- `simulation/` - Simulation output files
- `docs/` - Simulation waveform screenshots

## Working

When `object_detected` becomes HIGH, the lid opens.
If no object is detected, the lid remains open for a predefined number of clock cycles
and then closes automatically.

When `bin_full` is HIGH, the full indicator is activated and the lid remains closed.

## Simulation

The design can be simulated using tools such as:

- Icarus Verilog
- GTKWave
- ModelSim
- Vivado

The testbench generates a VCD waveform file that can be viewed using GTKWave.

## Inputs

| Signal | Description |
|---|---|
| `clk` | System clock |
| `reset` | Reset signal |
| `object_detected` | Indicates object/person detection |
| `bin_full` | Indicates that the bin is full |

## Outputs

| Signal | Description |
|---|---|
| `lid_open` | Controls the dustbin lid |
| `full_led` | Indicates full dustbin |

## Author

Your Name
