include kernel.multiboot

import io
import str

proc printMMapEntry(mmapEntry: MMapEntry): void =
  print("Base: ")
  printInt(mmapEntry.base, 16)
  print(", Limit: ")
  printInt(mmapEntry.limit, 16)
  print(", Type: ")
  printInt(mmapEntry.kind, 10)
  print("\n")

proc printMMap(mmapPtr: MMapPtr, length: uint32): void =
  var i = (length div sizeOf(MMapEntry).uint32).int - 1
  while i >= 0:
    printMMapEntry(mmapPtr[i])
    dec(i)

proc kernel_main(mbInfo: MultibootInfoPtr, magic: int): void {.exportc.} =
  clear()
  printInt(mbInfo.memLower * 1024, 16)
  print("\n\n")

  printMMap(mbInfo.mmapPtr, mbInfo.mmapLength)