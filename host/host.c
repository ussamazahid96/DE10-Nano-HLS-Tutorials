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

#define NUM_ARRAYS 3
#define ELEMENTS 64
#define CMA_BASE 0

int main()
{

    long PAGESIZE = sysconf(_SC_PAGESIZE);
    int fd = open("/dev/mem", (O_RDWR|O_SYNC));
    if(fd < 0) {
        perror("fd open failed");
        exit(EXIT_FAILURE);
    }

    void * ACCL_TOP_csr;
    ACCL_TOP_csr = mmap(NULL, TOP_0_ACCL_TOP_INTERNAL_INST_SPAN, 
                       (PROT_READ | PROT_WRITE), MAP_SHARED, 
                       fd, (TOP_0_ACCL_TOP_INTERNAL_INST_BASE & ~(PAGESIZE-1)));
    if(ACCL_TOP_csr == MAP_FAILED) {
        perror("ACCL_TOP_csr failed");
        close(fd);
        exit(EXIT_FAILURE);
    }

    uint32_t * cma_buffer;
    cma_buffer = (uint32_t*) mmap(NULL, NUM_ARRAYS*ELEMENTS*sizeof(int), 
                       (PROT_READ | PROT_WRITE), 
                        MAP_SHARED, 
                        fd, CMA_BASE);
    if(cma_buffer == MAP_FAILED) {
        perror("cma_buffer failed");
        close(fd);
        exit(EXIT_FAILURE);
    }

    uint32_t * array_a = cma_buffer;
    uint32_t * array_b = cma_buffer+ELEMENTS;
    uint32_t * array_c = cma_buffer+2*ELEMENTS;

    int gold_ref[ELEMENTS];
    srand(123);
    for(unsigned int i = 0; i<ELEMENTS; i++)
    {
        array_a[i] = rand()%64 - 32;
        array_b[i] = rand()%64 - 32;
        array_c[i] = 0;
        gold_ref[i] =  array_a[i] + array_b[i];
    }

    
    uint32_t * ACCL_TOP_A = (ACCL_TOP_csr + ACCL_TOP_CSR_ARG_A_REG);
    uint32_t * ACCL_TOP_B = (ACCL_TOP_csr + ACCL_TOP_CSR_ARG_B_REG);
    uint32_t * ACCL_TOP_C = (ACCL_TOP_csr + ACCL_TOP_CSR_ARG_C_REG);
    uint32_t * ACCL_TOP_START = (ACCL_TOP_csr + ACCL_TOP_CSR_START_REG);

    alt_write_dword(ACCL_TOP_A, CMA_BASE*sizeof(int));
    alt_write_dword(ACCL_TOP_B, CMA_BASE+ELEMENTS*sizeof(int));
    alt_write_dword(ACCL_TOP_C, CMA_BASE+2*ELEMENTS*sizeof(int));
    alt_setbits_dword(ACCL_TOP_START, 0x1);

    while(!(alt_read_dword(ACCL_TOP_csr + ACCL_TOP_CSR_INTERRUPT_STATUS_REG) & 0x1));
    
    printf("%s\n", "Printing Data");
    for(unsigned int i = 0; i<ELEMENTS; i++)
    {
        printf("Reference = %d, Hardware = %d\n", gold_ref[i], array_c[i]);
        if (gold_ref[i] != array_c[i])
        {
            perror("Test failed!!!\n");
            break;
        }
    }    

    int result = 0;
    result = munmap(ACCL_TOP_csr, TOP_0_ACCL_TOP_INTERNAL_INST_SPAN); 
    if(result < 0) {
        perror("ACCL_TOP_csr munmap failed");
        close(fd);
        exit(EXIT_FAILURE);
    }   
    result = munmap(cma_buffer, NUM_ARRAYS*ELEMENTS*sizeof(int)); 
    if(result < 0) {
        perror("ACCL_TOP_csr munmap failed");
        exit(EXIT_FAILURE);
    }   

    close(fd);
    printf("Clean exit\n");
    return 0;
}
