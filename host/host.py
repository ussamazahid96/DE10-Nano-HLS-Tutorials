from devmem import DevMem
import random
a = 0x28
b = 0x30
c = 0x20
start = 0x8
status = 0x18

ACCL_TOP_csr = DevMem(0xff200000, 64)

elem_a = random.randint(-2**15, 2**15-1)
elem_b = random.randint(-2**15, 2**15-1)

ACCL_TOP_csr.write(a, [elem_a])
ACCL_TOP_csr.write(b, [elem_b])
ACCL_TOP_csr.write(start, [1])
while not (ACCL_TOP_csr.read(status, 1).data[0] & 0x1):
    pass

print(ACCL_TOP_csr.read(a, 1).data[0])
print(ACCL_TOP_csr.read(b, 1).data[0])
print(ACCL_TOP_csr.read(c, 1).data[0])

if ACCL_TOP_csr.read(c, 1).data[0] != elem_a*elem_b:
    raise Exception("Test failed!!!")
else:
    print("Test Passed") 

