#include "HLS/stdio.h"
#include "assert.h"
#include "top.cpp"

int main() 
{
    int a[ELEMENTS], b[ELEMENTS], c[ELEMENTS];
        ihc::mm_master<
                       int, 
                       ihc::aspace<1>,
                       ihc::awidth<32>, 
                       ihc::dwidth<UNROLL_FACTOR*8*sizeof(int)>, 
                       ihc::align<UNROLL_FACTOR*sizeof(int)>,
                       ihc::latency<0>, 
                       ihc::maxburst<8>,
                       ihc::waitrequest<true>
                      >  mm_a(a, sizeof(int)*ELEMENTS); 
        ihc::mm_master<
                       int, 
                       ihc::aspace<1>,
                       ihc::awidth<32>, 
                       ihc::dwidth<UNROLL_FACTOR*8*sizeof(int)>, 
                       ihc::align<UNROLL_FACTOR*sizeof(int)>,
                       ihc::latency<0>, 
                       ihc::maxburst<8>,
                       ihc::waitrequest<true>
                      >  mm_b(b, sizeof(int)*ELEMENTS); 
        ihc::mm_master<
                       int, 
                       ihc::aspace<1>,
                       ihc::awidth<32>, 
                       ihc::dwidth<UNROLL_FACTOR*8*sizeof(int)>, 
                       ihc::align<UNROLL_FACTOR*sizeof(int)>,
                       ihc::latency<0>, 
                       ihc::maxburst<8>,
                       ihc::waitrequest<true>
                      >  mm_c(c, sizeof(int)*ELEMENTS); 

    int res = 0;
    int res_test = 0;
    srand(0);
    for (int i=0; i<ELEMENTS; ++i) {
        a[i]=rand() % 10;
        b[i]=rand() % 10;
    }

    ACCL_TOP(mm_a, mm_b, mm_c);

    for (int i=0; i<ELEMENTS; ++i) {
        printf("%d + %d = %d\n", a[i], b[i], c[i]);
        assert(c[i] == a[i] + b[i]);
    }
    return 0;
}

