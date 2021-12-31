#include <iostream>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>

// The Altera SoC Abstraction Layer (SoCAL) API Reference Manual
#include "socal/socal.h"
#include "socal/hps.h"

#include "hps_0.h"
#include "ACCL_TOP_csr.h"

#define ELEMENTS 64

int main()
{
    unsigned int PAGESIZE = sysconf(_SC_PAGESIZE);
    int fd = open("/dev/mem", (O_RDWR | O_SYNC));
    if(fd < 0) {
        std::cerr << "fd open failed" << std::endl;
        exit(-1);
    }
    uint8_t* ACCL_TOP_csr;
    ACCL_TOP_csr = reinterpret_cast<uint8_t*>(mmap(NULL, TOP_0_ACCL_TOP_INTERNAL_INST_AVS_CRA_SPAN, 
                       (PROT_READ | PROT_WRITE), MAP_SHARED, 
                       fd, (TOP_0_ACCL_TOP_INTERNAL_INST_AVS_CRA_BASE & ~(PAGESIZE-1)))); 
    if(ACCL_TOP_csr == MAP_FAILED) {
        std::cerr << "ACCL_TOP_csr failed" << std::endl;
        close(fd);
        exit(-1);
    }
  
    void * ACCL_TOP_A;
    ACCL_TOP_A = mmap(NULL, TOP_0_ACCL_TOP_INTERNAL_INST_AVS_A_SPAN, 
                       (PROT_READ | PROT_WRITE), MAP_SHARED, 
                       fd, (TOP_0_ACCL_TOP_INTERNAL_INST_AVS_A_BASE & ~(PAGESIZE-1)));
    if(ACCL_TOP_A == MAP_FAILED) {
        std::cerr << "ACCL_TOP_A failed" << std::endl;
        close(fd);
        exit(-1);
    }

    void * ACCL_TOP_B;
    ACCL_TOP_B = mmap(NULL, TOP_0_ACCL_TOP_INTERNAL_INST_AVS_B_SPAN, 
                       (PROT_READ | PROT_WRITE), MAP_SHARED, 
                       fd, (TOP_0_ACCL_TOP_INTERNAL_INST_AVS_B_BASE & ~(PAGESIZE-1))); 
    if(ACCL_TOP_B == MAP_FAILED) {
        std::cerr << "ACCL_TOP_B failed" << std::endl;
        close(fd);
        exit(-1);
    }

    void* ACCL_TOP_C;
    ACCL_TOP_C = mmap(NULL, TOP_0_ACCL_TOP_INTERNAL_INST_AVS_C_SPAN, 
                       (PROT_READ | PROT_WRITE), MAP_SHARED, 
                       fd, (TOP_0_ACCL_TOP_INTERNAL_INST_AVS_C_BASE & ~(PAGESIZE-1))); 
    if(ACCL_TOP_C == MAP_FAILED) {
        std::cerr << "ACCL_TOP_C failed" << std::endl;
        close(fd);
        exit(-1);
    }




    uint32_t mask = ~(4-1);
    uint32_t base_addr_offset = TOP_0_ACCL_TOP_INTERNAL_INST_AVS_A_BASE - (TOP_0_ACCL_TOP_INTERNAL_INST_AVS_A_BASE & ~(PAGESIZE-1));
    uint32_t correct_addrA = (base_addr_offset & mask) + reinterpret_cast<uint32_t>(ACCL_TOP_A); 
    
    base_addr_offset = TOP_0_ACCL_TOP_INTERNAL_INST_AVS_B_BASE - (TOP_0_ACCL_TOP_INTERNAL_INST_AVS_B_BASE & ~(PAGESIZE-1));
    uint32_t correct_addrB = (base_addr_offset & mask) + reinterpret_cast<uint32_t>(ACCL_TOP_B);     
    
    base_addr_offset = TOP_0_ACCL_TOP_INTERNAL_INST_AVS_C_BASE - (TOP_0_ACCL_TOP_INTERNAL_INST_AVS_C_BASE & ~(PAGESIZE-1));
    uint32_t correct_addrC = (base_addr_offset & mask) + reinterpret_cast<uint32_t>(ACCL_TOP_C); 
    srand(321);
    int array_a[ELEMENTS], array_b[ELEMENTS], ref[ELEMENTS];
    for(unsigned int i=0; i<ELEMENTS; i++)
    {
        array_a[i] = rand() % 128 - 64;
        array_b[i] = rand() % 128 - 64;
        ref[i] = array_a[i] + array_b[i];
        alt_write_word(correct_addrA+i*sizeof(int), array_a[i]);
        alt_write_word(correct_addrB+i*sizeof(int), array_b[i]);
        alt_write_word(correct_addrC+i*sizeof(int), 0);

    }

    uint8_t* ACCL_TOP_start = (ACCL_TOP_csr + ACCL_TOP_CSR_START_REG);
    alt_setbits_dword(ACCL_TOP_start, 0x1);
    while(!(alt_read_dword(ACCL_TOP_csr + ACCL_TOP_CSR_INTERRUPT_STATUS_REG) & 0x1));

    std::cout << "Printing Data" << std::endl;
    for(unsigned int i=0; i<ELEMENTS; i++)
    {
        int pred = alt_read_word(correct_addrC+i*4);
        std::cout << "Reference = " << ref[i] << ", Hardware = "  << pred << std::endl;
        if(ref[i] != pred)
        {
            std::cerr << "Test failed!!!" << std::endl;
            break;
        }
    }    

    int result = 0;
    result = munmap(ACCL_TOP_csr, TOP_0_ACCL_TOP_INTERNAL_INST_AVS_CRA_SPAN); 
    if(result < 0) {
        std::cerr << "ACCL_TOP_csr munmap failed" << std::endl;
        close(fd);
        exit(-1);
    }
    result = munmap(ACCL_TOP_A, TOP_0_ACCL_TOP_INTERNAL_INST_AVS_A_SPAN); 
    if(result < 0) {
        std::cerr << "ACCL_TOP_A munmap failed" << std::endl;
        close(fd);
        exit(-1);
    }
    result = munmap(ACCL_TOP_B, TOP_0_ACCL_TOP_INTERNAL_INST_AVS_B_SPAN); 
    if(result < 0) {
        std::cerr << "ACCL_TOP_B munmap failed" << std::endl;
        close(fd);
        exit(-1);
    }
    result = munmap(ACCL_TOP_C, TOP_0_ACCL_TOP_INTERNAL_INST_AVS_C_SPAN); 
    if(result < 0) {
        std::cerr << "ACCL_TOP_C munmap failed" << std::endl;
        close(fd);
        exit(-1);
    }
    close(fd);    
    std::cout << "Clean Exit" << std::endl;
    return 0;

}
