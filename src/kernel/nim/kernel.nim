import multiboot

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
  archInit(mbInfo)
  println("Assyria 0.0.1")
  # asm """
  # 	int $0x42
  #   mov $0, %eax
  #   mov $0, %ecx
  #   div %ecx
  # """
