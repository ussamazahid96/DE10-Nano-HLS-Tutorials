#include "HLS/stdio.h"
#include "assert.h"
#include "top.cpp"

#define ELEMENTS 10 

int main() {
	srand(0);
	int a[ELEMENTS];
	int b[ELEMENTS];
	int result[ELEMENTS];
	
	for (int i=0; i<ELEMENTS; ++i) {
		a[i]=rand()%10;
		b[i]=rand()%10;
		result[i]=ACCL_TOP(a[i],b[i]);
	}

	for (int i=0; i<ELEMENTS; ++i) {				
		printf("%d*%d=%d\n", a[i], b[i], result[i]);
		assert (result[i]==a[i]*b[i]);
	}
	return 0;
}

