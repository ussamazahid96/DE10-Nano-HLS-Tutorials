#include <iostream>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>

// The Altera SoC Abstraction Layer (SoCAL) API Reference Manual
#include "socal/socal.h"
#include "socal/hps.h"

#include "hps_0.h"
#include "ACCL_TOP_csr.h"

#define ELEMENTS 10
#define NUM_ARRAYS 2
#define CMA_BASE 0

uint32_t correction(uint32_t BASE, uint8_t in)
{
    unsigned int PAGESIZE = sysconf(_SC_PAGESIZE);
    uint32_t mask = ~(4-1);
    uint32_t base_addr_offset = BASE - (BASE & ~(PAGESIZE-1));
    uint32_t correct_addr = (base_addr_offset & mask) + in; 
    return correct_addr;
}

int main()
{

    unsigned int PAGESIZE = sysconf(_SC_PAGESIZE);
    int fd = open("/dev/mem", (O_RDWR | O_SYNC));
    if(fd < 0) {
        std::cerr << "fd open failed" << std::endl;
        exit(-1);
    }
    uint8_t* ACCL_TOP_csr;
    ACCL_TOP_csr = reinterpret_cast<uint8_t*>(mmap(NULL, TOP_0_ACCL_TOP_INTERNAL_INST_SPAN, 
                       (PROT_READ | PROT_WRITE), MAP_SHARED, 
                       fd, (TOP_0_ACCL_TOP_INTERNAL_INST_BASE & ~(PAGESIZE-1)))); 
    if(ACCL_TOP_csr == MAP_FAILED) {
        std::cerr << "ACCL_TOP_csr failed" << std::endl;
        close(fd);
        exit(-1);
    }
  
    uint8_t * mem_to_stream_dma_csr;
    mem_to_stream_dma_csr = reinterpret_cast<uint8_t*>(mmap(NULL, MSGDMA_0_CSR_SPAN, 
                       (PROT_READ | PROT_WRITE), MAP_SHARED, 
                       fd, (MSGDMA_0_CSR_BASE & ~(PAGESIZE-1))));
    if(mem_to_stream_dma_csr == MAP_FAILED) {
        std::cerr << "mem_to_stream_dma_csr failed" << std::endl;
        close(fd);
        exit(-1);
    }

    uint8_t * mem_to_stream_dma_des;
    mem_to_stream_dma_des = reinterpret_cast<uint8_t*>(mmap(NULL, MSGDMA_0_DESCRIPTOR_SLAVE_SPAN, 
                       (PROT_READ | PROT_WRITE), MAP_SHARED, 
                       fd, (MSGDMA_0_DESCRIPTOR_SLAVE_BASE & ~(PAGESIZE-1)))); 
    if(mem_to_stream_dma_des == MAP_FAILED) {
        std::cerr << "mem_to_stream_dma_des failed" << std::endl;
        close(fd);
        exit(-1);
    }

    uint8_t * stream_to_mem_dma_csr;
    stream_to_mem_dma_csr = reinterpret_cast<uint8_t*>(mmap(NULL, MSGDMA_1_CSR_SPAN, 
                       (PROT_READ | PROT_WRITE), MAP_SHARED, 
                       fd, (MSGDMA_1_CSR_BASE & ~(PAGESIZE-1))));
    if(stream_to_mem_dma_csr == MAP_FAILED) {
        std::cerr << "stream_to_mem_dma_csr failed" << std::endl;
        close(fd);
        exit(-1);
    }

    uint8_t * stream_to_mem_dma_des;
    stream_to_mem_dma_des = reinterpret_cast<uint8_t*>(mmap(NULL, MSGDMA_1_DESCRIPTOR_SLAVE_SPAN, 
                       (PROT_READ | PROT_WRITE), MAP_SHARED, 
                       fd, (MSGDMA_1_DESCRIPTOR_SLAVE_BASE & ~(PAGESIZE-1)))); 
    if(stream_to_mem_dma_des == MAP_FAILED) {
        std::cerr << "stream_to_mem_dma_des failed" << std::endl;
        close(fd);
        exit(-1);
    }


    uint32_t * cma_buffer;
    cma_buffer = (uint32_t*) mmap(NULL, NUM_ARRAYS*ELEMENTS*sizeof(int), 
                       (PROT_READ | PROT_WRITE), 
                        MAP_SHARED, 
                        fd, CMA_BASE);
    if(cma_buffer == MAP_FAILED) {
        std::cerr << "cma_buffer failed" << std::endl;
        close(fd);
        exit(-1);
    }

    uint32_t * array_a = cma_buffer;
    uint32_t * array_b = cma_buffer+ELEMENTS;

    int gold_ref[ELEMENTS];
    srand(0);
    for(unsigned int i = 0; i<ELEMENTS; i++)
    {
        array_a[i] = rand()%64 - 32;
        array_b[i] = 0;
        gold_ref[i] =  -1*array_a[i];

    }

    uint8_t* ACCL_TOP_N = ACCL_TOP_csr + ACCL_TOP_CSR_ARG_N_REG;
    alt_write_word(ACCL_TOP_N, ELEMENTS);

    // dma 1 init
    uint8_t * mts_ctrl_reg  = mem_to_stream_dma_csr + correction(MSGDMA_0_CSR_BASE, 0x4);
    uint8_t * mts_status_reg = mem_to_stream_dma_csr + correction(MSGDMA_0_CSR_BASE, 0x0);
    alt_write_word(mts_ctrl_reg, 1 << 1);
    while(alt_read_word(mts_status_reg) & 0x40);
    alt_write_word(mts_ctrl_reg, 1 << 4);
    // dma 1 descriptor load
    uint8_t * raddr = mem_to_stream_dma_des+correction(MSGDMA_0_DESCRIPTOR_SLAVE_BASE, 0x0);
    uint8_t * waddr = mem_to_stream_dma_des+correction(MSGDMA_0_DESCRIPTOR_SLAVE_BASE, 0x4);
    uint8_t * len = mem_to_stream_dma_des+correction(MSGDMA_0_DESCRIPTOR_SLAVE_BASE, 0x8);
    uint8_t * ctrl = mem_to_stream_dma_des+correction(MSGDMA_0_DESCRIPTOR_SLAVE_BASE, 0xc);
    alt_write_word(raddr, CMA_BASE);
    alt_write_word(waddr, 0);
    alt_write_word(len, ELEMENTS*sizeof(int));
    alt_write_word(ctrl, 1 << 31);

        
    // dma 2 init
    uint8_t * stm_ctrl_reg = stream_to_mem_dma_csr+correction(MSGDMA_1_CSR_BASE, 0x4);
    uint8_t * stm_status_reg = stream_to_mem_dma_csr+correction(MSGDMA_1_CSR_BASE, 0x0);
    alt_write_word(stm_ctrl_reg, 1 << 1);
    while(alt_read_word(stm_status_reg) & 0x40);
    alt_write_word(stm_ctrl_reg, 1 << 4);
    // dma 2 descriptor load
    raddr = stream_to_mem_dma_des+correction(MSGDMA_1_DESCRIPTOR_SLAVE_BASE, 0x0);
    waddr = stream_to_mem_dma_des+correction(MSGDMA_1_DESCRIPTOR_SLAVE_BASE, 0x4);
    len = stream_to_mem_dma_des+correction(MSGDMA_1_DESCRIPTOR_SLAVE_BASE, 0x8);
    ctrl = stream_to_mem_dma_des+correction(MSGDMA_1_DESCRIPTOR_SLAVE_BASE, 0xc);
    alt_write_word(raddr, 0);
    alt_write_word(waddr, CMA_BASE+ELEMENTS*sizeof(int));
    alt_write_word(len, ELEMENTS*sizeof(int));
    alt_write_word(ctrl, 1 << 31);

    // starting the acclerator
    uint8_t* ACCL_TOP_start = (ACCL_TOP_csr + ACCL_TOP_CSR_START_REG);
    alt_setbits_dword(ACCL_TOP_start, 0x1);
    while(!(alt_read_dword(ACCL_TOP_csr + ACCL_TOP_CSR_INTERRUPT_STATUS_REG) & 0x1));

    std::cout << "Printing Data" << std::endl;
    for(unsigned int i = 0; i < ELEMENTS; i++)
    {
        std::cout << "Reference = " << gold_ref[i] << ", Hardware = " << (int) array_b[i] << std::endl;
        if (gold_ref[i] != (int) array_b[i])
        {
            std::cerr << "Test failed!!!" << std::endl;
            break;
        }
    }    

    int result = 0;
    result = munmap(ACCL_TOP_csr, TOP_0_ACCL_TOP_INTERNAL_INST_SPAN); 
    if(result < 0) {
        std::cerr << "ACCL_TOP_csr munmap failed" << std::endl;
        close(fd);
        exit(-1);
    }
    result = munmap(mem_to_stream_dma_csr, MSGDMA_0_CSR_SPAN); 
    if(result < 0) {
        std::cerr << "mem_to_stream_dma_csr munmap failed" << std::endl;
        close(fd);
        exit(-1);
    }
    result = munmap(mem_to_stream_dma_des, MSGDMA_0_DESCRIPTOR_SLAVE_SPAN); 
    if(result < 0) {
        std::cerr << "mem_to_stream_dma_des munmap failed" << std::endl;
        close(fd);
        exit(-1);
    }
    result = munmap(stream_to_mem_dma_csr, MSGDMA_1_CSR_SPAN); 
    if(result < 0) {
        std::cerr << "stream_to_mem_dma_csr munmap failed" << std::endl;
        close(fd);
        exit(-1);
    }
    result = munmap(stream_to_mem_dma_des, MSGDMA_1_DESCRIPTOR_SLAVE_SPAN); 
    if(result < 0) {
        std::cerr << "stream_to_mem_dma_des munmap failed" << std::endl;
        close(fd);
        exit(-1);
    }
    close(fd);    
    std::cout << "Clean Exit" << std::endl;
    return 0;

}
