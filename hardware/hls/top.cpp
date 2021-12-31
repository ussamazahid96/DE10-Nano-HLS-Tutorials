#include "HLS/hls.h"


hls_avalon_slave_component component 
void ACCL_TOP(ihc::stream_in<int, ihc::bitsPerSymbol<8>, ihc::firstSymbolInHighOrderBits<true>>&a, 
              ihc::stream_out<int, ihc::bitsPerSymbol<8>, ihc::firstSymbolInHighOrderBits<true>>&b,
              hls_avalon_slave_register_argument int N) 
{
    int reg_a=0;
    for (int i=0; i<N; ++i)
    {
        reg_a = a.read();
        b.write(-1*reg_a);
    }
}