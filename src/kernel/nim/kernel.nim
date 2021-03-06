import multiboot
import mem

import io
import arch
import arch_constants

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

proc memTest: void =
  var memory = alloc(34) # actual alloc + size of block
  printInt(cast[uint32](memory), 16)
  println("")
  free(memory)
  memory = alloc(2)
  printInt(cast[uint32](memory), 16)
  println("")
  memory = alloc(10 * PAGE_SIZE)
  memset(memory, 10 * PAGE_SIZE, PAGE_SIZE)

proc kernel_main(mbInfo: MultibootInfoPtr, magic: int): void {.exportc.} =
  multibootInfoPtr = mbInfo
  mbInfo.mmapPtr = cast[MMapPtr](cast[uint32](mbInfo.mmapPtr) + 0xC0000000.uint32)
  archInit()
  memInit()
  println("Assyria 0.0.1")
  printMMap(mbInfo.mmapPtr, mbInfo.mmapLength)
  memTest()
  println("")
  asm """
    int $0x42
    mov $0, %eax
    mov $0, %ecx
    div %ecx
  """
