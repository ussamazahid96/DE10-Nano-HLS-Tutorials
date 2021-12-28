#include <iostream>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>

// The Altera SoC Abstraction Layer (SoCAL) API Reference Manual
#include "socal/socal.h"
#include "socal/hps.h"

#include "hps_0.h"
#include "ACCL_TOP_csr.h"

int main()
{
    int fd = open("/dev/mem", (O_RDWR | O_SYNC));
    if(fd < 0) {
        std::cerr << "fd open failed" << std::endl;
        exit(-1);
    }

    uint8_t* ACCL_TOP_csr;
    ACCL_TOP_csr = reinterpret_cast<uint8_t*>(mmap(NULL, TOP_0_ACCL_TOP_INTERNAL_INST_SPAN, 
                       (PROT_READ | PROT_WRITE), MAP_SHARED, 
                       fd, TOP_0_ACCL_TOP_INTERNAL_INST_BASE)); 
    if(ACCL_TOP_csr == MAP_FAILED) {
        std::cerr << "ACCL_TOP_csr failed" << std::endl;
        close(fd);
        exit(-1);
    }

    uint8_t* ACCL_TOP_A = (ACCL_TOP_csr + ACCL_TOP_CSR_ARG_A_REG);
    uint8_t* ACCL_TOP_B = (ACCL_TOP_csr + ACCL_TOP_CSR_ARG_B_REG);
    uint8_t* ACCL_TOP_C = (ACCL_TOP_csr + ACCL_TOP_CSR_RETURNDATA_REG);
    uint8_t* ACCL_TOP_START = (ACCL_TOP_csr + ACCL_TOP_CSR_START_REG);

    alt_write_dword(ACCL_TOP_A, -3);
    alt_write_dword(ACCL_TOP_B, 5);
    alt_setbits_dword(ACCL_TOP_START, 0x1);

    while(!(alt_read_dword(ACCL_TOP_csr + ACCL_TOP_CSR_INTERRUPT_STATUS_REG) & 0x1));

    std::cout << "Printing Data" << std::endl;
    std::cout <<  (int) alt_read_dword(ACCL_TOP_A) << std::endl;
    std::cout <<  (int) alt_read_dword(ACCL_TOP_B) << std::endl;
    std::cout <<  (int) alt_read_dword(ACCL_TOP_C) << std::endl;
    
    int result = 0;
    result = munmap(ACCL_TOP_csr, TOP_0_ACCL_TOP_INTERNAL_INST_SPAN); 
    if(result < 0) {
        std::cerr << "ACCL_TOP_csr munmap failed" << std::endl;
        close(fd);
        exit(-1);
    }
    close(fd);
    std::cout << "Clean Exit" << std::endl;
    return 0;

}