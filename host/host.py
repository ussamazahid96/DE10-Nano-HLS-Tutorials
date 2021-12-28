from devmem import DevMem

a = 0x28
b = 0x30
c = 0x20
start = 0x8
status = 0x18

mymult_reader = DevMem(0xff200000, 64)
mymult_writer = DevMem(0xff200000, 64)

mymult_writer.write(a, [8])
mymult_writer.write(b, [8])
mymult_writer.write(start, [1])
while not (mymult_reader.read(status, 1).data[0] & 0x1):
	pass

print(mymult_reader.read(a, 1).data[0])
print(mymult_reader.read(b, 1).data[0])
print(mymult_reader.read(c, 1).data[0])

