
#!/bin/bash

cd hls
make
cd ..
export QUARTUS_ROOTDIR = $(which quartus)/../../
make

# /opt/intelFPGA/18.1/embedded/embedded_command_shell.sh
# sopc2dts -i soc_system.sopcinfo -o soc_system.dts -t dts -b soc_system_board_info.xml -b hps_common_board_info.xml --bridge-removal all --clocks -v
# dtc -I dts -O dtb -o soc_system.dtb soc_system.dts
