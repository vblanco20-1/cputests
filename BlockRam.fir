FIRRTL version 1.2.0
circuit BlockRam :
  module BlockRam :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip addr : UInt<30>, flip write : UInt<1>, flip mask : UInt<1>[4], flip in : UInt<32>, out : UInt<32>} @[\\src\\main\\scala\\gcd\\rv_cpu.scala 432:14]

    smem memROM : UInt<32> [16384] @[\\src\\main\\scala\\gcd\\rv_cpu.scala 443:29]
    smem memRAM : UInt<8>[4] [16384] @[\\src\\main\\scala\\gcd\\rv_cpu.scala 448:29]
    wire readROM : UInt<32> @[\\src\\main\\scala\\gcd\\rv_cpu.scala 451:23]
    wire readRAM : UInt<32> @[\\src\\main\\scala\\gcd\\rv_cpu.scala 452:23]
    wire data : UInt<8>[4] @[\\src\\main\\scala\\gcd\\rv_cpu.scala 453:20]
    node _adressMasked_T = shr(UInt<16>("hffff"), 2) @[\\src\\main\\scala\\gcd\\rv_cpu.scala 455:45]
    node adressMasked = and(io.addr, _adressMasked_T) @[\\src\\main\\scala\\gcd\\rv_cpu.scala 455:33]
    reg addrRom : UInt<1>, clock with :
      reset => (UInt<1>("h0"), addrRom) @[\\src\\main\\scala\\gcd\\rv_cpu.scala 457:22]
    node _readROM_T = bits(adressMasked, 13, 0) @[\\src\\main\\scala\\gcd\\rv_cpu.scala 459:22]
    infer mport readROM_MPORT = memROM[_readROM_T], clock @[\\src\\main\\scala\\gcd\\rv_cpu.scala 459:22]
    readROM <= readROM_MPORT @[\\src\\main\\scala\\gcd\\rv_cpu.scala 459:13]
    node _readRAM_T = bits(adressMasked, 13, 0) @[\\src\\main\\scala\\gcd\\rv_cpu.scala 460:22]
    infer mport readRAM_MPORT = memRAM[_readRAM_T], clock @[\\src\\main\\scala\\gcd\\rv_cpu.scala 460:22]
    node readRAM_lo = cat(readRAM_MPORT[1], readRAM_MPORT[0]) @[\\src\\main\\scala\\gcd\\rv_cpu.scala 460:37]
    node readRAM_hi = cat(readRAM_MPORT[3], readRAM_MPORT[2]) @[\\src\\main\\scala\\gcd\\rv_cpu.scala 460:37]
    node _readRAM_T_1 = cat(readRAM_hi, readRAM_lo) @[\\src\\main\\scala\\gcd\\rv_cpu.scala 460:37]
    readRAM <= _readRAM_T_1 @[\\src\\main\\scala\\gcd\\rv_cpu.scala 460:13]
    node _addrRom_T = eq(adressMasked, io.addr) @[\\src\\main\\scala\\gcd\\rv_cpu.scala 462:29]
    addrRom <= _addrRom_T @[\\src\\main\\scala\\gcd\\rv_cpu.scala 462:13]
    node _data_0_T = bits(io.in, 7, 0) @[\\src\\main\\scala\\gcd\\rv_cpu.scala 466:23]
    data[0] <= _data_0_T @[\\src\\main\\scala\\gcd\\rv_cpu.scala 466:15]
    node _data_1_T = bits(io.in, 15, 8) @[\\src\\main\\scala\\gcd\\rv_cpu.scala 466:23]
    data[1] <= _data_1_T @[\\src\\main\\scala\\gcd\\rv_cpu.scala 466:15]
    node _data_2_T = bits(io.in, 23, 16) @[\\src\\main\\scala\\gcd\\rv_cpu.scala 466:23]
    data[2] <= _data_2_T @[\\src\\main\\scala\\gcd\\rv_cpu.scala 466:15]
    node _data_3_T = bits(io.in, 31, 24) @[\\src\\main\\scala\\gcd\\rv_cpu.scala 466:23]
    data[3] <= _data_3_T @[\\src\\main\\scala\\gcd\\rv_cpu.scala 466:15]
    node _T = bits(adressMasked, 13, 0)
    write mport MPORT = memRAM[_T], clock
    when io.mask[0] :
      MPORT[0] <= data[0]
    when io.mask[1] :
      MPORT[1] <= data[1]
    when io.mask[2] :
      MPORT[2] <= data[2]
    when io.mask[3] :
      MPORT[3] <= data[3]
    node _io_out_T = mux(addrRom, readROM, readRAM) @[\\src\\main\\scala\\gcd\\rv_cpu.scala 473:16]
    io.out <= _io_out_T @[\\src\\main\\scala\\gcd\\rv_cpu.scala 473:10]

