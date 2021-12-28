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
#include "ACCL_TOP_csr.h"

int main()
{
    int fd = open("/dev/mem", (O_RDWR|O_SYNC));
    if(fd < 0) {
        perror("fd open failed");
        exit(EXIT_FAILURE);
    }

    void * ACCL_TOP_csr;
    ACCL_TOP_csr = mmap(NULL, TOP_0_ACCL_TOP_INTERNAL_INST_SPAN, 
                       (PROT_READ | PROT_WRITE), MAP_SHARED, 
                       fd, TOP_0_ACCL_TOP_INTERNAL_INST_BASE);
    if(ACCL_TOP_csr == MAP_FAILED) {
        perror("ACCL_TOP_csr failed");
        close(fd);
        exit(EXIT_FAILURE);
    }
    
    uint32_t * ACCL_TOP_A = (ACCL_TOP_csr + ACCL_TOP_CSR_ARG_A_REG);
    uint32_t * ACCL_TOP_B = (ACCL_TOP_csr + ACCL_TOP_CSR_ARG_B_REG);
    uint32_t * ACCL_TOP_C = (ACCL_TOP_csr + ACCL_TOP_CSR_RETURNDATA_REG);
    uint32_t * ACCL_TOP_START = (ACCL_TOP_csr + ACCL_TOP_CSR_START_REG);


    alt_write_dword(ACCL_TOP_A, 6);
    alt_write_dword(ACCL_TOP_B, 2);
    alt_setbits_dword(ACCL_TOP_START, 0x1);

    while(!(alt_read_dword(ACCL_TOP_csr + ACCL_TOP_CSR_INTERRUPT_STATUS_REG) & 0x1));

    uint64_t reg_c = alt_read_dword(ACCL_TOP_C);
    
    printf("%s\n", "Printing Data");
    printf("%s = %d\n",   "A", *ACCL_TOP_A);
    printf("%s = %d\n",   "B", *ACCL_TOP_B);
    printf("%s = %d\n", "RES",  (int) reg_c);


    int result = 0;
    result = munmap(ACCL_TOP_csr, TOP_0_ACCL_TOP_INTERNAL_INST_SPAN); 
    if(result < 0) {
        perror("ACCL_TOP_csr munmap failed");
        close(fd);
        exit(EXIT_FAILURE);
    }   


    close(fd);
    printf("Clean exit\n");
    return 0;
}
