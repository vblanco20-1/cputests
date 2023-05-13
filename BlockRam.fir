FIRRTL version 1.2.0
circuit BlockRam :
  module BlockRam :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip addr : UInt<10>, flip write : UInt<1>, flip mask : UInt<1>[4], flip in : UInt<32>, out : UInt<32>} @[\\src\\main\\scala\\gcd\\rv_alu.scala 419:14]

    smem mem : UInt<32> [64] @[\\src\\main\\scala\\gcd\\rv_alu.scala 429:26]
    wire read : UInt<32> @[\\src\\main\\scala\\gcd\\rv_alu.scala 433:20]
    wire data : UInt<8>[4] @[\\src\\main\\scala\\gcd\\rv_alu.scala 434:20]
    node adress = shr(io.addr, 2) @[\\src\\main\\scala\\gcd\\rv_alu.scala 435:26]
    node _read_T = bits(adress, 5, 0) @[\\src\\main\\scala\\gcd\\rv_alu.scala 437:16]
    infer mport read_MPORT = mem[_read_T], clock @[\\src\\main\\scala\\gcd\\rv_alu.scala 437:16]
    read <= read_MPORT @[\\src\\main\\scala\\gcd\\rv_alu.scala 437:10]
    node _data_0_T = bits(io.in, 7, 0) @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:39]
    node _data_0_T_1 = bits(read, 7, 0) @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:69]
    node _data_0_T_2 = mux(io.mask[0], _data_0_T, _data_0_T_1) @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:21]
    data[0] <= _data_0_T_2 @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:15]
    node _data_1_T = bits(io.in, 15, 8) @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:39]
    node _data_1_T_1 = bits(read, 15, 8) @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:69]
    node _data_1_T_2 = mux(io.mask[1], _data_1_T, _data_1_T_1) @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:21]
    data[1] <= _data_1_T_2 @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:15]
    node _data_2_T = bits(io.in, 23, 16) @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:39]
    node _data_2_T_1 = bits(read, 23, 16) @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:69]
    node _data_2_T_2 = mux(io.mask[2], _data_2_T, _data_2_T_1) @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:21]
    data[2] <= _data_2_T_2 @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:15]
    node _data_3_T = bits(io.in, 31, 24) @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:39]
    node _data_3_T_1 = bits(read, 31, 24) @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:69]
    node _data_3_T_2 = mux(io.mask[3], _data_3_T, _data_3_T_1) @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:21]
    data[3] <= _data_3_T_2 @[\\src\\main\\scala\\gcd\\rv_alu.scala 440:15]
    when io.write : @[\\src\\main\\scala\\gcd\\rv_alu.scala 442:20]
      node _T = bits(adress, 5, 0) @[\\src\\main\\scala\\gcd\\rv_alu.scala 446:14]
      infer mport MPORT = mem[_T], clock @[\\src\\main\\scala\\gcd\\rv_alu.scala 446:14]
      node lo = cat(data[1], data[0]) @[\\src\\main\\scala\\gcd\\rv_alu.scala 446:31]
      node hi = cat(data[3], data[2]) @[\\src\\main\\scala\\gcd\\rv_alu.scala 446:31]
      node _T_1 = cat(hi, lo) @[\\src\\main\\scala\\gcd\\rv_alu.scala 446:31]
      MPORT <= _T_1 @[\\src\\main\\scala\\gcd\\rv_alu.scala 446:23]
    io.out <= read @[\\src\\main\\scala\\gcd\\rv_alu.scala 455:12]

