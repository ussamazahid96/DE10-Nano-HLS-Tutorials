#include "HLS/hls.h"

#define ELEMENTS 64


hls_avalon_slave_component component 
void ACCL_TOP(hls_avalon_slave_memory_argument(ELEMENTS*sizeof(int)) int *a, 
              hls_avalon_slave_memory_argument(ELEMENTS*sizeof(int)) int *b, 
              hls_avalon_slave_memory_argument(ELEMENTS*sizeof(int)) int *c) 
{
    #pragma unroll 8
    for (int i=0; i<ELEMENTS; ++i)
        c[i]=a[i]+b[i];
}