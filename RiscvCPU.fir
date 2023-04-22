circuit RiscvCPU :
  module Alu :
    input clock : Clock
    input reset : Reset
    output io : { flip input1 : UInt<32>, flip input2 : UInt<32>, flip func3 : UInt<3>, out : UInt<32>}

    io.out <= UInt<1>("h0") @[rv_alu.scala 22:10]
    node _T = eq(UInt<1>("h0"), io.func3) @[rv_alu.scala 23:20]
    when _T : @[rv_alu.scala 23:20]
      node _io_out_T = add(io.input1, io.input2) @[rv_alu.scala 24:36]
      node _io_out_T_1 = tail(_io_out_T, 1) @[rv_alu.scala 24:36]
      io.out <= _io_out_T_1 @[rv_alu.scala 24:23]
    else :
      node _T_1 = eq(UInt<3>("h7"), io.func3) @[rv_alu.scala 23:20]
      when _T_1 : @[rv_alu.scala 23:20]
        node _io_out_T_2 = and(io.input1, io.input2) @[rv_alu.scala 25:36]
        io.out <= _io_out_T_2 @[rv_alu.scala 25:23]
      else :
        node _T_2 = eq(UInt<3>("h6"), io.func3) @[rv_alu.scala 23:20]
        when _T_2 : @[rv_alu.scala 23:20]
          node _io_out_T_3 = xor(io.input1, io.input2) @[rv_alu.scala 26:36]
          io.out <= _io_out_T_3 @[rv_alu.scala 26:23]
        else :
          node _T_3 = eq(UInt<3>("h4"), io.func3) @[rv_alu.scala 23:20]
          when _T_3 : @[rv_alu.scala 23:20]
            node _io_out_T_4 = or(io.input1, io.input2) @[rv_alu.scala 27:36]
            io.out <= _io_out_T_4 @[rv_alu.scala 27:23]

  module RegisterBank :
    input clock : Clock
    input reset : Reset
    output io : { flip din : UInt<32>, flip rsd : UInt<5>, flip rs1 : UInt<5>, flip rs2 : UInt<5>, outrs1 : UInt<32>, outrs2 : UInt<32>}

    cmem mem : UInt<32> [32] @[rv_alu.scala 91:18]
    node rsdzero = eq(io.rsd, UInt<1>("h0")) @[rv_alu.scala 92:26]
    node rs1zero = eq(io.rs1, UInt<1>("h0")) @[rv_alu.scala 93:24]
    node rs2zero = eq(io.rs2, UInt<1>("h0")) @[rv_alu.scala 94:24]
    node _T = eq(rsdzero, UInt<1>("h0")) @[rv_alu.scala 96:8]
    when _T : @[rv_alu.scala 96:17]
      infer mport MPORT = mem[io.rsd], clock @[rv_alu.scala 97:8]
      MPORT <= io.din @[rv_alu.scala 97:17]
    infer mport io_outrs1_MPORT = mem[io.rs1], clock @[rv_alu.scala 100:36]
    node _io_outrs1_T = mux(rs1zero, UInt<1>("h0"), io_outrs1_MPORT) @[rv_alu.scala 100:19]
    io.outrs1 <= _io_outrs1_T @[rv_alu.scala 100:13]
    infer mport io_outrs2_MPORT = mem[io.rs2], clock @[rv_alu.scala 101:36]
    node _io_outrs2_T = mux(rs2zero, UInt<1>("h0"), io_outrs2_MPORT) @[rv_alu.scala 101:19]
    io.outrs2 <= _io_outrs2_T @[rv_alu.scala 101:13]

  module RiscvCPU :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip mIn : UInt<32>, mWrite : UInt<1>, mOut : UInt<1>, mAddr : UInt<1>, halted : UInt<1>, db_aluout : UInt<32>}

    inst alu of Alu @[rv_alu.scala 116:19]
    alu.clock <= clock
    alu.reset <= reset
    inst regs of RegisterBank @[rv_alu.scala 117:20]
    regs.clock <= clock
    regs.reset <= reset
    reg PC : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[rv_alu.scala 119:19]
    node _PC4_T = add(PC, UInt<3>("h4")) @[rv_alu.scala 121:16]
    node PC4 = tail(_PC4_T, 1) @[rv_alu.scala 121:16]
    reg state_fetch : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[rv_alu.scala 123:29]
    reg state_fetch2 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[rv_alu.scala 124:29]
    reg state_decode : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[rv_alu.scala 125:29]
    reg state_exec : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[rv_alu.scala 126:27]
    reg rd : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[rv_alu.scala 128:20]
    reg rs1 : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[rv_alu.scala 129:20]
    reg rs2 : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[rv_alu.scala 130:20]
    reg imm : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[rv_alu.scala 131:20]
    reg aluOP : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[rv_alu.scala 132:22]
    aluOP <= aluOP @[rv_alu.scala 134:9]
    rs1 <= rs1 @[rv_alu.scala 135:7]
    rs2 <= rs2 @[rv_alu.scala 136:7]
    rd <= rd @[rv_alu.scala 137:6]
    imm <= imm @[rv_alu.scala 138:7]
    state_fetch <= state_exec @[rv_alu.scala 140:15]
    state_fetch2 <= state_fetch @[rv_alu.scala 141:16]
    state_decode <= state_fetch2 @[rv_alu.scala 142:16]
    state_exec <= state_decode @[rv_alu.scala 143:14]
    io.mWrite <= UInt<1>("h0") @[rv_alu.scala 145:13]
    node _io_mAddr_T = mux(state_fetch, PC, UInt<1>("h0")) @[rv_alu.scala 146:18]
    io.mAddr <= _io_mAddr_T @[rv_alu.scala 146:12]
    io.mOut <= UInt<1>("h0") @[rv_alu.scala 147:11]
    io.halted <= UInt<1>("h0") @[rv_alu.scala 148:13]
    alu.io.input1 <= regs.io.outrs1 @[rv_alu.scala 150:17]
    node _alu_io_input2_T = eq(rd, UInt<1>("h0")) @[rv_alu.scala 151:27]
    node _alu_io_input2_T_1 = mux(_alu_io_input2_T, imm, regs.io.outrs2) @[rv_alu.scala 151:23]
    alu.io.input2 <= _alu_io_input2_T_1 @[rv_alu.scala 151:17]
    alu.io.func3 <= aluOP @[rv_alu.scala 152:16]
    regs.io.din <= alu.io.out @[rv_alu.scala 153:15]
    io.db_aluout <= alu.io.out @[rv_alu.scala 155:16]
    regs.io.rs1 <= rs1 @[rv_alu.scala 157:15]
    regs.io.rs2 <= rs2 @[rv_alu.scala 158:15]
    regs.io.rsd <= rd @[rv_alu.scala 159:15]
    wire inst : { rest : UInt<25>, opcode : UInt<7>} @[rv_alu.scala 162:29]
    wire _inst_WIRE : UInt<32>
    _inst_WIRE <= io.mIn
    node _inst_T = bits(_inst_WIRE, 6, 0) @[rv_alu.scala 162:29]
    inst.opcode <= _inst_T @[rv_alu.scala 162:29]
    node _inst_T_1 = bits(_inst_WIRE, 31, 7) @[rv_alu.scala 162:29]
    inst.rest <= _inst_T_1 @[rv_alu.scala 162:29]
    wire inst_I : { imm : UInt<12>, rs1 : UInt<5>, func3 : UInt<3>, rd : UInt<5>, opcode : UInt<7>} @[rv_alu.scala 163:31]
    wire _inst_I_WIRE : UInt<32>
    _inst_I_WIRE <= io.mIn
    node _inst_I_T = bits(_inst_I_WIRE, 6, 0) @[rv_alu.scala 163:31]
    inst_I.opcode <= _inst_I_T @[rv_alu.scala 163:31]
    node _inst_I_T_1 = bits(_inst_I_WIRE, 11, 7) @[rv_alu.scala 163:31]
    inst_I.rd <= _inst_I_T_1 @[rv_alu.scala 163:31]
    node _inst_I_T_2 = bits(_inst_I_WIRE, 14, 12) @[rv_alu.scala 163:31]
    inst_I.func3 <= _inst_I_T_2 @[rv_alu.scala 163:31]
    node _inst_I_T_3 = bits(_inst_I_WIRE, 19, 15) @[rv_alu.scala 163:31]
    inst_I.rs1 <= _inst_I_T_3 @[rv_alu.scala 163:31]
    node _inst_I_T_4 = bits(_inst_I_WIRE, 31, 20) @[rv_alu.scala 163:31]
    inst_I.imm <= _inst_I_T_4 @[rv_alu.scala 163:31]
    wire inst_R : { func7 : UInt<7>, rs2 : UInt<5>, rs1 : UInt<5>, func3 : UInt<3>, rd : UInt<5>, opcode : UInt<7>} @[rv_alu.scala 164:31]
    wire _inst_R_WIRE : UInt<32>
    _inst_R_WIRE <= io.mIn
    node _inst_R_T = bits(_inst_R_WIRE, 6, 0) @[rv_alu.scala 164:31]
    inst_R.opcode <= _inst_R_T @[rv_alu.scala 164:31]
    node _inst_R_T_1 = bits(_inst_R_WIRE, 11, 7) @[rv_alu.scala 164:31]
    inst_R.rd <= _inst_R_T_1 @[rv_alu.scala 164:31]
    node _inst_R_T_2 = bits(_inst_R_WIRE, 14, 12) @[rv_alu.scala 164:31]
    inst_R.func3 <= _inst_R_T_2 @[rv_alu.scala 164:31]
    node _inst_R_T_3 = bits(_inst_R_WIRE, 19, 15) @[rv_alu.scala 164:31]
    inst_R.rs1 <= _inst_R_T_3 @[rv_alu.scala 164:31]
    node _inst_R_T_4 = bits(_inst_R_WIRE, 24, 20) @[rv_alu.scala 164:31]
    inst_R.rs2 <= _inst_R_T_4 @[rv_alu.scala 164:31]
    node _inst_R_T_5 = bits(_inst_R_WIRE, 31, 25) @[rv_alu.scala 164:31]
    inst_R.func7 <= _inst_R_T_5 @[rv_alu.scala 164:31]
    node op_ALU = eq(inst.opcode, UInt<6>("h33")) @[rv_alu.scala 166:29]
    node op_ALUI = eq(inst.opcode, UInt<5>("h13")) @[rv_alu.scala 167:29]
    when state_fetch : @[rv_alu.scala 171:20]
      aluOP <= UInt<1>("h0") @[rv_alu.scala 172:10]
      rs1 <= UInt<1>("h0") @[rv_alu.scala 173:9]
      rs2 <= UInt<1>("h0") @[rv_alu.scala 174:9]
      rd <= UInt<1>("h0") @[rv_alu.scala 175:8]
      imm <= UInt<1>("h0") @[rv_alu.scala 176:9]
    when state_decode : @[rv_alu.scala 179:21]
      aluOP <= inst_R.func3 @[rv_alu.scala 182:10]
      PC <= PC4 @[rv_alu.scala 183:8]
      rs1 <= inst_R.rs1 @[rv_alu.scala 185:9]
      rd <= inst_I.rd @[rv_alu.scala 186:8]
    node _T = and(op_ALU, state_decode) @[rv_alu.scala 189:15]
    when _T : @[rv_alu.scala 189:31]
      rs2 <= inst_R.rs2 @[rv_alu.scala 191:9]
      imm <= UInt<1>("h0") @[rv_alu.scala 192:9]
    else :
      when op_ALUI : @[rv_alu.scala 193:23]
        rs2 <= UInt<1>("h0") @[rv_alu.scala 195:9]
        node _imm_T = cat(UInt<1>("h0"), inst_I.imm) @[rv_alu.scala 196:16]
        imm <= _imm_T @[rv_alu.scala 196:9]

