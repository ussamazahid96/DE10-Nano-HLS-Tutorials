#include "HLS/hls.h"

#define ELEMENTS 64
#define UNROLL_FACTOR 1

hls_avalon_agent_component component
void ACCL_TOP(
            ihc::mm_master<
                           int, 
                           ihc::aspace<1>,
                           ihc::awidth<32>, 
                           ihc::dwidth<UNROLL_FACTOR*8*sizeof(int)>, 
                           ihc::align<UNROLL_FACTOR*sizeof(int)>,
                           ihc::latency<0>, 
                           ihc::maxburst<8>,
                           ihc::waitrequest<true>
                          >  hls_avalon_agent_register_argument &a,
            ihc::mm_master<
                           int, 
                           ihc::aspace<1>,
                           ihc::awidth<32>, 
                           ihc::dwidth<UNROLL_FACTOR*8*sizeof(int)>, 
                           ihc::align<UNROLL_FACTOR*sizeof(int)>,
                           ihc::latency<0>, 
                           ihc::maxburst<8>,
                           ihc::waitrequest<true>
                          >  hls_avalon_agent_register_argument &b,
            ihc::mm_master<
                           int, 
                           ihc::aspace<1>,
                           ihc::awidth<32>, 
                           ihc::dwidth<UNROLL_FACTOR*8*sizeof(int)>, 
                           ihc::align<UNROLL_FACTOR*sizeof(int)>,
                           ihc::latency<0>, 
                           ihc::maxburst<8>,
                           ihc::waitrequest<true>
                          >  hls_avalon_agent_register_argument &c
            ) 
{

    // #pragma unroll UNROLL_FACTOR
    for (int i=0; i<ELEMENTS; ++i)
        c[i] = a[i] + b[i];

}