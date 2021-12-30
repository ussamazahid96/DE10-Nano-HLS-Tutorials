from devmem import DevMem
import random
import numpy as np
import struct
NUM_ARRAYS = 3
ELEMENTS = 64
SIZE_OF_INT = 4
CMA_BASE = 0
a = 0x20
b = 0x28
c = 0x30
start = 0x8
done = 0x18

ACCL_TOP_csr = DevMem(0xc0000000, 64)
cma_buffer = DevMem(CMA_BASE, NUM_ARRAYS*ELEMENTS*SIZE_OF_INT)


ARRAY_A, ARRAY_B, ARRAY_C = 0, ELEMENTS*SIZE_OF_INT, 2*SIZE_OF_INT*ELEMENTS
ARRAY_A_DATA, ARRAY_B_DATA, ARRAY_C_DATA = [], [], []
ref = []
for i in range(ELEMENTS):
    elem_a = random.randint(-ELEMENTS, ELEMENTS)
    elem_b = random.randint(-ELEMENTS, ELEMENTS)
    ref.append(elem_a+elem_b)
    ARRAY_A_DATA.append(elem_a)
    ARRAY_B_DATA.append(elem_b)
    ARRAY_C_DATA.append(0)

cma_buffer.write(ARRAY_A, ARRAY_A_DATA)
cma_buffer.write(ARRAY_B, ARRAY_B_DATA)
cma_buffer.write(ARRAY_C, ARRAY_C_DATA)

ACCL_TOP_csr.write(a, [CMA_BASE+ARRAY_A])
ACCL_TOP_csr.write(b, [CMA_BASE+ARRAY_B])
ACCL_TOP_csr.write(c, [CMA_BASE+ARRAY_C])

ACCL_TOP_csr.write(start, [1])
while not (ACCL_TOP_csr.read(done, 1).data[0] & 0x1):
    pass

pred = cma_buffer.read(ARRAY_C, ELEMENTS).data

for i in range(ELEMENTS):
    val =  pred[i]
    print("Reference = {}, Hardware = {}".format(ref[i], val))
    if val != ref[i]:
        raise Exception("Test failed!!!")
        exit(-1)
print("Test Passed")
