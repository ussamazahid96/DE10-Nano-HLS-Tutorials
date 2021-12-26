#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <fcntl.h>    // open
#include <sys/mman.h> // mmap
#include <error.h>

// The Altera SoC Abstraction Layer (SoCAL) API Reference Manual
#include "socal/socal.h"
#include "socal/hps.h"

#include "hps_0.h"
#include "mymult_csr.h"

int main()
{
	int fd = open("/dev/mem", (O_RDWR|O_SYNC));
    if(fd < 0) {
        perror("fd open failed");
        exit(EXIT_FAILURE);
    }

	void * mymult_map;
	mymult_map = mmap(NULL, MYMULT_0_MYMULT_INTERNAL_INST_SPAN, 
					   (PROT_READ | PROT_WRITE), MAP_SHARED, 
					   fd, MYMULT_0_MYMULT_INTERNAL_INST_BASE);
    if(mymult_map == MAP_FAILED) {
        perror("mymult_map failed");
        close(fd);
        exit(EXIT_FAILURE);
    }

	uint32_t * mymult_a = 0;
	mymult_a = (uint32_t*)(mymult_map + MYMULT_CSR_ARG_A_REG);
	uint32_t * mymult_b = 0;
	mymult_b = (uint32_t*)(mymult_map + MYMULT_CSR_ARG_B_REG);
	uint32_t * mymult_c = 0;
	mymult_c = (uint32_t*)(mymult_map + MYMULT_CSR_RETURNDATA_REG);


	uint32_t * mymult_start = 0;
	mymult_start = (uint32_t*)(mymult_map + MYMULT_CSR_START_REG);

	// uint32_t * mymult_busy = 0;
	// mymult_busy = (uint32_t*)(mymult_map + MYMULT_CSR_BUSY_REG);
	// printf("%s = 0x%x\n", "BUSY", *mymult_busy);



	alt_write_dword(mymult_a, -3);
	alt_write_dword(mymult_b, 7);
	alt_setbits_dword(mymult_start, 0x1);

	uint64_t done = alt_read_dword(mymult_map + MYMULT_CSR_INTERRUPT_STATUS_REG);
	while(!(done & 0x1));

	uint64_t reg_c = alt_read_dword(mymult_c);
	
	printf("%s = %d\n",   "A", *mymult_a);
	printf("%s = %d\n",   "B", *mymult_b);
	printf("%s = %d\n", "RES",  (int) reg_c);


    int result = 0;
    result = munmap(mymult_map, MYMULT_0_MYMULT_INTERNAL_INST_SPAN); 
    if(result < 0) {
        perror("mymult_map munmap failed");
        close(fd);
        exit(EXIT_FAILURE);
    }	


	close(fd);
	printf("Clean exit\n");
	return 0;
}
