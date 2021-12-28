#include "HLS/stdio.h"
#include "assert.h"
#include "top.cpp"

int main() 
{
    int a[ELEMENTS], b[ELEMENTS], c[ELEMENTS];

    srand(0);
    for (int i=0; i<ELEMENTS; ++i) {
        a[i]=rand() % 10;
        b[i]=rand() % 10;
    }

    ACCL_TOP(a, b, c);

    for (int i=0; i<ELEMENTS; ++i) {
        printf("%d + %d = %d\n", a[i], b[i], c[i]);
        assert(c[i] == a[i] + b[i]);
    }
    return 0;
}

