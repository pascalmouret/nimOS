
type
  #[
  Multiboot Memory Map Structure (in bytes)
            +-------------------+
    0       | size              |
            +-------------------+
    4       | base              |
    12      | limit             |
            +-------------------+
    20      | type              |
            +-------------------+
  ]#
  MMapEntryKind* {.size: sizeOf(uint32).} = enum
    Undefined,
    Usable,
    Unknown,
    Acpi,
    Reserved,
    Damaged
  MMapEntry* = object
    size*: uint32
    base*: uint64
    limit*: uint64
    kind*: MMapEntryKind
  MMap* = UncheckedArray[MMapEntry]
  MMapPtr* = ptr MMap

  #[
  Multiboot Information Structure (in bytes)
            +-------------------+
    0       | flags             |    (required)
            +-------------------+
    4       | mem_lower         |    (present if flags[0] is set)
    8       | mem_upper         |    (present if flags[0] is set)
            +-------------------+
    12      | boot_device       |    (present if flags[1] is set)
            +-------------------+
    16      | cmdline           |    (present if flags[2] is set)
            +-------------------+
    20      | mods_count        |    (present if flags[3] is set)
    24      | mods_addr         |    (present if flags[3] is set)
            +-------------------+
    28 - 40 | syms              |    (present if flags[4] or
            |                   |                flags[5] is set)
            +-------------------+
    44      | mmap_length       |    (present if flags[6] is set)
    48      | mmap_addr         |    (present if flags[6] is set)
            +-------------------+
    52      | drives_length     |    (present if flags[7] is set)
    56      | drives_addr       |    (present if flags[7] is set)
            +-------------------+
    60      | config_table      |    (present if flags[8] is set)
            +-------------------+
    64      | boot_loader_name  |    (present if flags[9] is set)
            +-------------------+
    68      | apm_table         |    (present if flags[10] is set)
            +-------------------+
    72      | vbe_control_info  |    (present if flags[11] is set)
    76      | vbe_mode_info     |
    80      | vbe_mode          |
    82      | vbe_interface_seg |
    84      | vbe_interface_off |
    86      | vbe_interface_len |
            +-------------------+
    88      | framebuffer_addr  |    (present if flags[12] is set)
    96      | framebuffer_pitch |
    100     | framebuffer_width |
    104     | framebuffer_height|
    108     | framebuffer_bpp   |
    109     | framebuffer_type  |
    110-115 | color_info        |
            +-------------------+
  ]#
  MultibootInfo* = object
    flags*: uint32
    memLower*: uint32
    memUpper*: uint32
    bootDevie*: uint32
    cmdLine*: cstring  # actually a cstring
    modsCount*: uint32
    modsAddr*: uint32
    syms1*: uint32
    syms2*: uint32
    syms3*: uint32
    syms4*: uint32
    mmapLength*: uint32
    mmapPtr*: ptr MMap
  MultibootInfoPtr* = ptr MultibootInfo


# this pointer is set immidiately after call into kernel
var multibootInfoPtr*: MultibootInfoPtr
