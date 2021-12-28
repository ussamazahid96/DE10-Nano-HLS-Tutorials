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

#define ELEMENTS 64

int main()
{
    long PAGESIZE = sysconf(_SC_PAGESIZE);
    int fd = open("/dev/mem", (O_RDWR|O_SYNC));
    if(fd < 0) {
        perror("fd open failed");
        exit(EXIT_FAILURE);
    }
    uint8_t * ACCL_TOP_csr;
    ACCL_TOP_csr = (uint8_t *) mmap(NULL, TOP_0_ACCL_TOP_INTERNAL_INST_AVS_CRA_SPAN, 
                       (PROT_READ | PROT_WRITE), MAP_SHARED, 
                       fd, (TOP_0_ACCL_TOP_INTERNAL_INST_AVS_CRA_BASE & ~(PAGESIZE-1)));
    if(ACCL_TOP_csr == MAP_FAILED) {
        perror("ACCL_TOP_csr failed");
        close(fd);
        exit(EXIT_FAILURE);
    }
    
    uint32_t * ACCL_TOP_A;
    ACCL_TOP_A = (uint32_t *) mmap(NULL, TOP_0_ACCL_TOP_INTERNAL_INST_AVS_A_SPAN, 
                       (PROT_READ | PROT_WRITE), MAP_SHARED, 
                       fd, (TOP_0_ACCL_TOP_INTERNAL_INST_AVS_A_BASE & ~(PAGESIZE-1)));
    if(ACCL_TOP_A == MAP_FAILED) {
        perror("ACCL_TOP_A failed");
        close(fd);
        exit(EXIT_FAILURE);
    }

    void * ACCL_TOP_B;
    ACCL_TOP_B = mmap(NULL, TOP_0_ACCL_TOP_INTERNAL_INST_AVS_B_SPAN, 
                       (PROT_READ | PROT_WRITE), MAP_SHARED, 
                       fd, (TOP_0_ACCL_TOP_INTERNAL_INST_AVS_B_BASE & ~(PAGESIZE-1)));
    if(ACCL_TOP_B == MAP_FAILED) {
        perror("ACCL_TOP_B failed");
        close(fd);
        exit(EXIT_FAILURE);
    }

    void * ACCL_TOP_C;
    ACCL_TOP_C = mmap(NULL, TOP_0_ACCL_TOP_INTERNAL_INST_AVS_C_SPAN, 
                       (PROT_READ | PROT_WRITE), MAP_SHARED, 
                       fd, (TOP_0_ACCL_TOP_INTERNAL_INST_AVS_C_BASE & ~(PAGESIZE-1)));
    if(ACCL_TOP_C == MAP_FAILED) {
        perror("ACCL_TOP_C failed");
        close(fd);
        exit(EXIT_FAILURE);
    }

    printf("%s\n", "Printing Data");
    uint32_t mask = ~(4-1);
    uint32_t base_addr_offset = TOP_0_ACCL_TOP_INTERNAL_INST_AVS_A_BASE - (TOP_0_ACCL_TOP_INTERNAL_INST_AVS_A_BASE & ~(PAGESIZE-1));
    uint32_t *correct_addrA = (base_addr_offset & mask) + ACCL_TOP_A; 
    for(unsigned int i=0; i<ELEMENTS; i++){
        alt_write_word(correct_addrA+i, i);
    }
    base_addr_offset = TOP_0_ACCL_TOP_INTERNAL_INST_AVS_B_BASE - (TOP_0_ACCL_TOP_INTERNAL_INST_AVS_B_BASE & ~(PAGESIZE-1));
    uint32_t *correct_addrB = (base_addr_offset & mask) + ACCL_TOP_B; 
    for(unsigned int i=0; i<ELEMENTS; i++){
        alt_write_word(correct_addrB+i, i);
    }

    
    printf("%s\n", "A====");
    for(int i=0; i<ELEMENTS; i++)
    {
        printf("%d, ", alt_read_word(correct_addrA+i));
        if((i+1)%(ELEMENTS/4) == 0)
        {
            printf("\n");
        }
    }
    printf("%s\n", "B====");
    for(int i=0; i<ELEMENTS; i++)
    {
        printf("%d, ", alt_read_word(correct_addrB+i));
        if((i+1)%(ELEMENTS/4) == 0)
        {
            printf("\n");
        }
    }

    uint8_t* ACCL_TOP_start = (ACCL_TOP_csr + ACCL_TOP_CSR_START_REG);
    alt_setbits_dword(ACCL_TOP_start, 0x1);
    while(!(alt_read_dword(ACCL_TOP_csr + ACCL_TOP_CSR_INTERRUPT_STATUS_REG) & 0x1));

    printf("%s\n", "C====");    
    base_addr_offset = TOP_0_ACCL_TOP_INTERNAL_INST_AVS_C_BASE - (TOP_0_ACCL_TOP_INTERNAL_INST_AVS_C_BASE & ~(PAGESIZE-1));
    uint32_t *correct_addrC = (base_addr_offset & mask) + ACCL_TOP_C; 
    for(int i=0; i<ELEMENTS; i++)
    {
        printf("%d, ", alt_read_word(correct_addrC+i));
        if((i+1)%(ELEMENTS/4) == 0)
        {
            printf("\n");
        }
    }


    int result = 0;
    result = munmap(ACCL_TOP_csr, TOP_0_ACCL_TOP_INTERNAL_INST_AVS_CRA_SPAN); 
    if(result < 0) {
        perror("ACCL_TOP_csr munmap failed");
        close(fd);
        exit(EXIT_FAILURE);
    }   
    result = munmap(ACCL_TOP_A, TOP_0_ACCL_TOP_INTERNAL_INST_AVS_A_SPAN); 
    if(result < 0) {
        perror("ACCL_TOP_A munmap failed");
        close(fd);
        exit(EXIT_FAILURE);
    }
    result = munmap(ACCL_TOP_B, TOP_0_ACCL_TOP_INTERNAL_INST_AVS_B_SPAN); 
    if(result < 0) {
        perror("ACCL_TOP_B munmap failed");
        close(fd);
        exit(EXIT_FAILURE);
    }
    result = munmap(ACCL_TOP_C, TOP_0_ACCL_TOP_INTERNAL_INST_AVS_C_SPAN); 
    if(result < 0) {
        perror("ACCL_TOP_C munmap failed");
        close(fd);
        exit(EXIT_FAILURE);
    }
    close(fd);
    printf("Clean exit\n");
    return 0;
}
