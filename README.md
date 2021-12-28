# DE10-Nano-HLS-Tutorials

Note that this repository is under development, there might be bugs lurking around.

`main` branch has example for avalon slave register and control and status registers (csr) with ARM host code working for C, C++ and python.

`avalon_slave_memory` branch has example for avalon slave memory arguments with ARM host code working for python.


## Dependencies

1. Quartus Prime Lite
2. Intel HLS compiler
3. FPGA-SoC-Linux for DE10-Nano

## Setup

1. Manually adding the IP
2. RD/WR access to `/dev/mem` on DE10-Nano

## TODO

1. Negative Values in Python Host + improve it


## Acknowledgements

1. devmem
2. programmer
3. intel-socfpga-hwlib
4. Pump_axi project template

