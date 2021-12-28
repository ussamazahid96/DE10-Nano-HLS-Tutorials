#include "HLS/hls.h"

hls_avalon_slave_component component 
int ACCL_TOP(hls_avalon_slave_register_argument int a, hls_avalon_slave_register_argument int b)
{
    return a*b;
}