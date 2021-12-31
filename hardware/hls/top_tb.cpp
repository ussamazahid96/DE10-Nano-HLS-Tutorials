#include <iostream>
#include "assert.h"
#include "top.cpp"

#define ELEMENTS 10

int main() 
{
    int a[ELEMENTS];
    ihc::stream_in<int, ihc::bitsPerSymbol<8>, ihc::firstSymbolInHighOrderBits<true>> as;
    ihc::stream_out<int, ihc::bitsPerSymbol<8>, ihc::firstSymbolInHighOrderBits<true>> bs;
    
    srand(0);
    for (int i=0; i<ELEMENTS; ++i) {
        a[i]=rand() % 100 - 50;
        as.write(a[i]);
    }

    ACCL_TOP(as, bs, ELEMENTS);

    for (int i=0; i<ELEMENTS; ++i) 
    {
        int b = bs.read();
        std:: cout << a[i] << " * " << -1 << " = " << b << std::endl; 
        assert(b == -1*a[i]);
    }
    return 0;
}

