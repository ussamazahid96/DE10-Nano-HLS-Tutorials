from devmem import DevMem
import random
start = 0x8
status = 0x18

ELEMENTS = 64

ACC_TOP_csr = DevMem(0xff200000, 32)
ACC_TOP_A = DevMem(0xff200200, 256)
ACC_TOP_B = DevMem(0xff200400, 256)
ACC_TOP_C = DevMem(0xff200600, 256)


ARG_A = []
ARG_B = []
for i in range(ELEMENTS):
    ARG_A.append(random.randint(-ELEMENTS,ELEMENTS))
    ARG_B.append(random.randint(-ELEMENTS,ELEMENTS))

ACC_TOP_A.write(0, ARG_A)
ACC_TOP_B.write(0, ARG_B)
ACC_TOP_csr.write(start, [1])
while not (ACC_TOP_csr.read(status, 1).data[0] & 0x1):
    pass

print("A====")
print(ACC_TOP_A.read(0, ELEMENTS).data)
print("B====")
print(ACC_TOP_B.read(0, ELEMENTS).data)
res = ACC_TOP_C.read(0, ELEMENTS).data
print("C====")
print(res)

for i in range(ELEMENTS):
    if res[i] != ARG_A[i] + ARG_B[i]:
        raise Exception("test failed")
        exit(-1)
print("Test Passed")

