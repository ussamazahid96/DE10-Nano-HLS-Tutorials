#include <iostream>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>

// The Altera SoC Abstraction Layer (SoCAL) API Reference Manual
#include "socal/socal.h"
#include "socal/hps.h"

#include "hps_0.h"
#include "mymult_csr.h"

int main()
{
    int fd = open("/dev/mem", (O_RDWR | O_SYNC));
    if(fd < 0) {
        std::cerr << "fd open failed" << std::endl;
        exit(-1);
    }

    uint8_t* mymult_map;
    mymult_map = reinterpret_cast<uint8_t*>(mmap(NULL, MYMULT_0_MYMULT_INTERNAL_INST_SPAN, 
                       (PROT_READ | PROT_WRITE), MAP_SHARED, 
                       fd, MYMULT_0_MYMULT_INTERNAL_INST_BASE)); 
    if(mymult_map == MAP_FAILED) {
        std::cerr << "mymult_map failed" << std::endl;
        close(fd);
        exit(-1);
    }

    uint8_t* mymult_a = (mymult_map + MYMULT_CSR_ARG_A_REG);
    uint8_t* mymult_b = (mymult_map + MYMULT_CSR_ARG_B_REG);
    uint8_t* mymult_c = (mymult_map + MYMULT_CSR_RETURNDATA_REG);
    uint8_t* mymult_start = (mymult_map + MYMULT_CSR_START_REG);

    // std::cout << "Printing Pointers" << std::endl;
    // std::cout <<  (int*) mymult_map << std::endl;
    // std::cout <<  (int*) mymult_a << std::endl;
    // std::cout <<  (int*) mymult_b << std::endl;
    // std::cout <<  (int*) mymult_c << std::endl;

    alt_write_dword(mymult_a, -3);
    alt_write_dword(mymult_b, 5);
    alt_setbits_dword(mymult_start, 0x1);

    uint64_t done = alt_read_dword(mymult_map + MYMULT_CSR_INTERRUPT_STATUS_REG);
    while(!(done & 0x1));

    std::cout << "Printing Data" << std::endl;
    std::cout <<  (int) alt_read_dword(mymult_a) << std::endl;
    std::cout <<  (int) alt_read_dword(mymult_b) << std::endl;
    std::cout <<  (int) alt_read_dword(mymult_c) << std::endl;
    
    int result = 0;
    result = munmap(mymult_map, MYMULT_0_MYMULT_INTERNAL_INST_SPAN); 
    if(result < 0) {
        std::cerr << "mymult_map munmap failed" << std::endl;
        close(fd);
        exit(-1);
    }
    close(fd);
    std::cout << "Clean Exit" << std::endl;
    return 0;

}