
#!/bin/bash

cd hls
make
cd ..
export QUARTUS_ROOTDIR=$(which quartus)/../../
make

