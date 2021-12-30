# DE10-Nano-HLS-Tutorials

Note that this repository is under development, there might be bugs lurking around.

`main` branch has example for avalon slave register and control and status registers (csr) with ARM host code working for C, C++ and python.

`avalon_slave_memory` branch has example for avalon slave memory arguments with ARM host code working for python.

`MM_master` branch has an example for the avalon memory mapped master interface with ARM host code working for C, C++ and python.

## Dependencies

1. Quartus Prime Lite version 21.1
2. Intel HLS compiler version 21.4
3. FPGA-SoC-Linux for DE10-Nano

## Setup

1. Manually adding the IP
2. RD/WR access to `/dev/mem` on DE10-Nano

## TODO

1. Add ModelSim RTL simulation
2. Improve host codes

## Acknowledgements

1. devmem
2. programmer
3. intel-socfpga-hwlib
4. Pump_axi project template