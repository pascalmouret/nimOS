proc memmove(dstPtr: ptr void, srcPtr: ptr void, length: uint): ptr {.exportc.} =
  var dst = cast[ptr char[]](dstPtr)
  let src = cast[ptr char[]](srcPtr)
  if (dstPtr < srcPtr):
    for i in 0 .. length - 1:
      dst[i] = src[i]
  else:
    for i in length - 1 .. 0:
      dst[i] = src[i]
  return dstPtr

const VGA_WIDTH = 80
const VGA_HEIGHT = 25
const VRAM_LENGTH = VGA_WIDTH * VGA_HEIGHT

type VGAColor = enum
  VGABlack,
  VGABlue,
  VGAGreen,
  VGACyan,
  VGARed,
  VGAMagenta,
  VGABrown,
  VGALightGrey,
  VGADarkGrey,
  VGALightBlue,
  VGALightGreen,
  VGALightCyan,
  VGALightRed,
  VGALightMagenta,
  VGALightBrown,
  VGAWhite

type VGAEntry = distinct uint16
type VGAColorMix = distinct uint8
type VGABuffer = ptr array[VRAM_LENGTH, VGAEntry]

const vram = cast[VGABuffer](0xB8000)

proc vgaColorMix(front: VGAColor, back: VGAColor): VGAColorMix =
  return cast[VGAColorMix](ord(front).uint8 or (ord(back).uint8 shl 4))

proc vgaEntry(c: char, color: VGAColorMix): VGAEntry =
  return cast[VGAEntry](c.uint16 or (color.uint16 shl 8))

var currentRow = 0
var currentCol = 0
const defaultColor: VGAColorMix = vgaColorMix(VGAWhite, VGABlack)

proc clearScreen(): void =
  var i = 0
  while (i < VGAWidth*VGAHeight):
    vram[i] = vgaEntry(' ', defaultColor)
    inc(i)

proc scroll(): void =
  for i in 0 .. (VRAM_LENGTH - VGA_WIDTH) - 1:
    vram[i] = vram[i + VGA_WIDTH]
  for i in (VRAM_LENGTH - VGA_WIDTH) - 1 .. VRAM_LENGTH - 1:
    vram[i] = vgaEntry(' ', defaultColor)

proc print(c: char): void =
  if (c != '\n'):
    vram[VGA_WIDTH * currentRow + currentCol] = vgaEntry(c, defaultColor)
    inc(currentCol)
  if (currentCol >= VGA_WIDTH or c == '\n'):
    inc(currentRow)
    currentCol = 0

proc println*(s: string): void =
  for c in 0 .. s.len - 1:
    print(s[c])
  print('\n')

proc kernel_main(): void {.exportc.} =
  clearScreen()
  println("Hello, NIM Kernel!")
  println("version 0.0.0.0.0.1")
  scroll()
