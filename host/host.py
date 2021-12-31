from devmem import DevMem
import random

CMA_BASE = 0
NUM_ARRAYS = 2
SIZE_OF_INT = 4
ELEMENTS = 10

start = 0x8
done = 0x18

dma_status_reg = 0x0
dma_control_reg = 0x4

ACCL_TOP_csr = DevMem(0xff200000, 64)

mem_to_stream_dma_csr = DevMem(0xff200040, 32)
mem_to_stream_dma_des = DevMem(0xff200060, 16)

stream_to_mem_dma_csr = DevMem(0xff200080, 32)
stream_to_mem_dma_des = DevMem(0xff200100, 16)

cma_buffer = DevMem(CMA_BASE, NUM_ARRAYS*ELEMENTS*SIZE_OF_INT)

ARRAY_A, ARRAY_B = 0, ELEMENTS*SIZE_OF_INT
ARRAY_A_DATA, ARRAY_B_DATA = [], []
ref = []
for i in range(ELEMENTS):
    elem_a = random.randint(-100, 100)
    ref.append(-1*elem_a)
    ARRAY_A_DATA.append(elem_a)
    ARRAY_B_DATA.append(0)

cma_buffer.write(ARRAY_A, ARRAY_A_DATA)
cma_buffer.write(ARRAY_B, ARRAY_B_DATA)

ACCL_TOP_csr.write(0x20, [ELEMENTS])
# resetting the dma
mem_to_stream_dma_csr.write(dma_control_reg, [1 << 1])
while(mem_to_stream_dma_csr.read(dma_status_reg, 1).data[0] & 0x40):
    pass
# enable interupt
mem_to_stream_dma_csr.write(dma_control_reg, [1 << 4])
# loading the descriptor
mem_to_stream_dma_des.write(0x0, [CMA_BASE+ARRAY_A])
mem_to_stream_dma_des.write(0x4, [0])
mem_to_stream_dma_des.write(0x8, [ELEMENTS*SIZE_OF_INT])
mem_to_stream_dma_des.write(0xc, [-(1 << 31)])


# do the same with dma 2
# resetting the dma
stream_to_mem_dma_csr.write(dma_control_reg, [1 << 1])
while(stream_to_mem_dma_csr.read(dma_status_reg, 1).data[0] & 0x40):
   pass
# enable interupt
stream_to_mem_dma_csr.write(dma_control_reg, [1 << 4])
# loading the descriptor
stream_to_mem_dma_des.write(0x0, [0])
stream_to_mem_dma_des.write(0x4, [CMA_BASE+ARRAY_B])
stream_to_mem_dma_des.write(0x8, [ELEMENTS*SIZE_OF_INT])
stream_to_mem_dma_des.write(0xc, [-(1 << 31)])

ACCL_TOP_csr.write(start, [1])

print(cma_buffer.read(CMA_BASE + ARRAY_A, ELEMENTS).data)
pred = cma_buffer.read(CMA_BASE + ARRAY_B, ELEMENTS).data
print(pred)

for i in range(ELEMENTS):
    if pred[i] != -1*ARRAY_A_DATA[i]:
        raise Exception("Test Failed!!!")
print("Test Passed")
