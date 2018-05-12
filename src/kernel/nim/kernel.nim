import multiboot
import mem

import io
import arch

proc printMMapEntry(mmapEntry: MMapEntry): void =
  print("Base: ")
  printInt(mmapEntry.base, 16)
  print(", Limit: ")
  printInt(mmapEntry.limit, 16)
  print(", Type: ")
  printInt(mmapEntry.kind.uint, 10)
  print("\n")

proc printMMap(mmapPtr: MMapPtr, length: uint32): void =
  var i = (length div sizeOf(MMapEntry).uint32).int - 1
  while i >= 0:
    printMMapEntry(mmapPtr[i])
    dec(i)

proc kernel_main(mbInfo: MultibootInfoPtr, magic: int): void {.exportc.} =
  multibootInfoPtr = mbInfo
  archInit()
  initMem()
  println("Assyria 0.0.1")
  var memory = alloc(34) # actual alloc + size of block
  printInt(cast[uint32](memory), 16)
  println("")
  free(memory)
  memory = alloc(2)
  printInt(cast[uint32](memory), 16)
  println("")
  # asm """
  #   int $0x42
  #   mov $0, %eax
  #   mov $0, %ecx
  #   div %ecx
  # """
