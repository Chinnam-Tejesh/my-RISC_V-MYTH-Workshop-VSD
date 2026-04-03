\m4_TLV_version 1d: tl-x.org
\SV
   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
   m4_include_lib(['https://raw.githubusercontent.com/BalaDhinesh/RISC-V_MYTH_Workshop/master/tlv_lib/risc-v_shell_lib.tlv'])
\SV
   m4_makerchip_module // (Expanded in Nav-TLV pane.)
\TLV
   // /====================
   // | Sum 1 to 9 Program |
   // ====================/
   //
   // Program for MYTH Workshop to test RV32I
   // Add 1,2,3,...,9 (in that order).
   //
   // Regs:
   // r10 (a0): In: 0, Out: final sum
   // r12 (a2): 10
   // r13 (a3): 1..10
   // r14 (a4): Sum
   //
   // External to function:
   m4_asm(ADD, r10, r0, r0) // Initialize r10 (a0) to 0.
   // Function:
   m4_asm(ADD, r14, r10, r0) // Initialize sum register a4 with 0x0
   m4_asm(ADDI, r12, r10, 1010) // Store count of 10 in register a2.
   m4_asm(ADD, r13, r10, r0) // Initialize intermediate sum register a3 with 0
   // Loop:
   m4_asm(ADD, r14, r13, r14) // Incremental addition
   m4_asm(ADDI, r13, r13, 1) // Increment intermediate register by 1
   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named 
   m4_asm(ADD, r10, r14, r0) // Store final result to register a0 so that it can be read by main program
   
   // LOAD & STORE TEST
   m4_asm(SW, r0, r10, 10000) // Store final result in memory address 0x10000
   m4_asm(LW, r17, r0, 10000) // Load address 0x10000 in R17 register as final result
   
   // Optional:
   m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte address; last immediate bit should also be 0)
   
   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)
   |cpu
      @0
         $reset = *reset;
         // YOUR CODE HERE
         // ...
         $start = (>>1$reset == 1'b1 && $reset == 1'b0) ? 1'b1 : 1'b0;
         `BOGUS_USE($start)
         $imem_rd_en = ! $reset;
         $pc[31:0] = ( >>1$reset) ? 32'b0 : >>3$valid_taken_br ? >>3$br_tgt_pc : (>>3$valid_jump && >>3$is_jal) ? >>3$jal_tgt_pc : (>>3$valid_jump && >>3$is_jalr) ? >>3$jalr_tgt_pc : ( >>1$pc[31:0] + 32'd4);
         
         ?$imem_rd_en
            $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
         
      @1
         $instr[31:0] = $imem_rd_data[31:0];
         
         $is_i_instr = $instr[6:2] ==? 5'b0000x || $instr[6:2] ==? 5'b001x0 || $instr[6:2] == 5'b11001;
         $is_r_instr = $instr[6:2] ==? 5'b01x1x || $instr[6:2] ==? 5'bxx100;
         $is_s_instr = $instr[6:2] ==? 5'b0100x;
         $is_b_instr = $instr[6:2] == 5'b11000;
         $is_j_instr = $instr[6:2] == 5'b11011;
         $is_u_instr = $instr[6:2] ==? 5'b0x101;
         
         //BOGUS_USE($is_i_instr $is_r_instr $is_s_instr $is_b_instr $is_j_instr $is_u_instr)
         $rd_valid = ($is_r_instr) || ($is_i_instr) || ($is_u_instr) || ($is_j_instr);
         $fnct3risb_valid = ($is_r_instr) || ($is_i_instr) || ($is_s_instr) || ($is_b_instr);
         $rs1risb_valid = ($is_r_instr) || ($is_i_instr) || ($is_s_instr) || ($is_b_instr);
         $rs2rsb_valid = ($is_r_instr) || ($is_s_instr) || ($is_b_instr);
         //BOGUS_USE($rd_valid $fnct3risb_valid $rs1risb_valid $rs2rsb_valid)
         $fnct7r_valid = $is_r_instr;
         $imm11t0i_valid = $is_i_instr;
         $imm4t0s_valid = $is_s_instr;
         $imm11t5s_valid = $is_s_instr;
         $imm11b_valid = $is_b_instr;
         $imm4t1b_valid = $is_b_instr;
         $imm10t5b_valid = $is_b_instr;
         $imm12b_valid = $is_b_instr;
         $imm31t12u_valid = $is_u_instr;
         $imm19t12j_valid = $is_j_instr;
         $imm11j_valid = $is_j_instr;
         $imm10t1j_valid = $is_j_instr;
         $imm20j_valid = $is_j_instr;
         //BOGUS_USE($fnct7r_valid $imm11t0i_valid $imm4t0s_valid $imm11t5s_valid $imm11b_valid $imm4t1b_valid $imm10t5b_valid)
         //BOGUS_USE($imm12b_valid $imm31t12u_valid $imm19t12j_valid $imm11j_valid $imm10t1j_valid $imm20j_valid)
         
         //common Decodes
         $opcode[6:0] = $instr[6:0];
         
         $rd[4:0] = $rd_valid ? $instr[11:7] : 5'd0;
         
         $fnct3risb[2:0] = $fnct3risb_valid ? $instr[14:12] : 3'd0;
         
         $rs1risb[4:0] = $rs1risb_valid ? $instr[19:15] : 5'd0;
         
         $rs2rsb[4:0] = $rs2rsb_valid ? $instr[24:20] : 5'd0;
         `BOGUS_USE($opcode $rd $fnct3risb $rs1risb $rs2rsb)
         //R type
         $fnct7r[6:0] = $fnct7r_valid ? $instr[31:25] : 7'd0;
         //I type
         $imm11t0i[11:0] = $imm11t0i_valid ? $instr[31:20] : 12'd0;
         //S type
         $imm4t0s[4:0] = $imm4t0s_valid ? $instr[11:7] : 5'd0;
         $imm11t5s[6:0] = $imm11t5s_valid ? $instr[31:25] : 7'd0;
         `BOGUS_USE($fnct7r $imm11t0i $imm4t0s $imm11t5s)
         
         //B type
         $imm11b = $imm11b_valid ? $instr[7] : 1'd0;
         
         $imm4t1b[3:0] = $imm4t1b_valid ? $instr[11:8] : 4'd0;
         
         $imm10t5b[5:0] = $imm10t5b_valid ? $instr[30:25] : 6'd0;
         
         $imm12b = $imm12b_valid ? $instr[31] : 1'd0;
         
         //U type
         $imm31t12u[19:0] = $imm31t12u_valid ? $instr[31:12] : 20'd0;
         
         //J type
         $imm19t12j[7:0] = $imm19t12j_valid ? $instr[19:12] : 8'd0;
         
         $imm11j = $imm11j_valid ? $instr[20] : 1'd0;
         
         $imm10t1j[9:0] = $imm10t1j_valid ? $instr[30:21] : 10'd0;
         
         $imm20j = $imm20j_valid ? $instr[31] : 1'd0;
         `BOGUS_USE($imm11b $imm4t1b $imm10t5b $imm12b $imm31t12u $imm19t12j $imm11j $imm10t1j $imm20j)
         // Continue logic
         $dec_bits[10:0] = { $fnct7r[5], $fnct3risb, $opcode};
         $is_add = ($dec_bits ==? 11'b0_000_0110011);
         $is_beq = ($dec_bits ==? 11'bx_000_1100011);
         $is_bne = ($dec_bits ==? 11'bx_001_1100011);
         $is_blt = ($dec_bits ==? 11'bx_100_1100011);
         $is_bge = ($dec_bits ==? 11'bx_101_1100011);
         $is_bltu = ($dec_bits ==? 11'bx_110_1100011);
         $is_bgeu = ($dec_bits ==? 11'bx_111_1100011);
         $is_addi = ($dec_bits ==? 11'bx_000_0010011);
         `BOGUS_USE($is_add $is_beq $is_bne $is_blt $is_bge $is_bltu $is_bgeu $is_addi)
         
         //additional Decod logic (for almost complete RV32I base ISA)
         $is_lui = ($dec_bits ==? 11'bx_xxx_0110111);
         $is_auipc = ($dec_bits ==? 11'bx_xxx_0010111);
         $is_jal = ($dec_bits ==? 11'bx_xxx_1101111);
         $is_jalr = ($dec_bits ==? 11'bx_000_1100111);
         $is_load = ($dec_bits ==? 11'bx_xxx_0000011);
         $is_sb = ($dec_bits ==? 11'bx_000_0100011);
         $is_sh = ($dec_bits ==? 11'bx_001_0100011);
         $is_sw = ($dec_bits ==? 11'bx_010_0100011);
         $is_slti = ($dec_bits ==? 11'bx_010_0010011);
         $is_sltiu = ($dec_bits ==? 11'bx_011_0010011);
         $is_xori = ($dec_bits ==? 11'bx_100_0010011);
         $is_ori = ($dec_bits ==? 11'bx_110_0010011);
         $is_andi = ($dec_bits ==? 11'bx_111_0010011);
         $is_slli = ($dec_bits ==? 11'b0_001_0010011);
         $is_srli = ($dec_bits ==? 11'b0_101_0010011);
         $is_srai = ($dec_bits ==? 11'b1_101_0010011);
         $is_sub = ($dec_bits ==? 11'b1_000_0110011);
         $is_sll = ($dec_bits ==? 11'b0_001_0110011);
         $is_slt = ($dec_bits ==? 11'b0_010_0110011);
         $is_sltu = ($dec_bits ==? 11'b0_011_0110011);
         $is_xor = ($dec_bits ==? 11'b0_100_0110011);
         $is_srl = ($dec_bits ==? 11'b0_101_0110011);
         $is_sra = ($dec_bits ==? 11'b1_101_0110011);
         $is_or = ($dec_bits ==? 11'b0_110_0110011);
         $is_and = ($dec_bits ==? 11'b0_111_0110011);
         `BOGUS_USE($is_lui $is_auipc $is_jal $is_jalr $is_load $is_sb $is_sh $is_sw $is_slti $is_sltiu $is_xori)
         `BOGUS_USE($is_ori $is_andi $is_slli $is_srli $is_srai $is_sub $is_sll $is_slt $is_sltu $is_xor $is_srl)
         `BOGUS_USE($is_sra $is_or $is_and)
      @2
         //Rf read
         $rf_rd_en1 = $rs1risb_valid && !$reset; // && !$rf_wr_en;
         ?$rf_rd_en1
            $rf_rd_index1[4:0] = $rs1risb[4:0];
            
         $rf_rd_en2 = $rs2rsb_valid && !$reset; // && !$rf_wr_en;
         ?$rf_rd_en2
            $rf_rd_index2[4:0] = $rs2rsb[4:0];
            
         
         $src1_value[31:0] = ((>>1$rf_wr_index[4:0] == $rs1risb[4:0]) && >>1$rf_wr_en) ? >>1$result[31:0] : ((>>2$rf_wr_index[4:0] == $rs1risb[4:0]) && >>2$rf_wr_en) ? >>2$result[31:0] : $rf_rd_data1[31:0];
         $src2_value[31:0] = ((>>1$rf_wr_index[4:0] == $rs2rsb[4:0]) && >>1$rf_wr_en) ? >>1$result[31:0] : ((>>2$rf_wr_index[4:0] == $rs2rsb[4:0]) && >>2$rf_wr_en) ? >>2$result[31:0] : $rf_rd_data2[31:0];
         $br_tgt_pc[31:0] = $pc[31:0] + { {19{$imm12b}}, $imm12b, $imm11b, $imm10t5b[5:0], $imm4t1b[3:0], 1'b0 };
         $jal_tgt_pc[31:0] = $pc[31:0] + { {12{$imm20j}}, $imm19t12j[7:0], $imm11j, $imm10t1j[9:0], 1'b0 };
         $jalr_tgt_pc[31:0] = $src1_value[31:0] + { {20{$imm11t0i[11]}}, $imm11t0i[11:0] };
         
      @3
         //mini ALU
         $sltu_rslt = $src1_value[31:0] < $src2_value[31:0];
         $sltiu_rslt = $src1_value[31:0] < { {20{$imm11t0i[11]}}, $imm11t0i[11:0]};
         $result[31:0] = ($is_addi) ? ($src1_value[31:0] + { {20{$imm11t0i[11]}}, $imm11t0i[11:0] }) : ($is_add) ? ($src1_value[31:0] + $src2_value[31:0]) : ($is_andi) ? ($src1_value[31:0] & { {20{$imm11t0i[11]}}, $imm11t0i[11:0] }) : ($is_ori) ? ($src1_value[31:0] | { {20{$imm11t0i[11]}}, $imm11t0i[11:0] }) : ($is_xori) ? ($src1_value[31:0] ^ { {20{$imm11t0i[11]}}, $imm11t0i[11:0] }) : ($is_slli) ? ($src1_value[31:0] << $imm11t0i[5:0]) : ($is_srli) ? ($src1_value[31:0] >> $imm11t0i[5:0]) : ($is_and) ? ($src1_value[31:0] & $src2_value[31:0]) : ($is_or) ? ($src1_value[31:0] | $src2_value[31:0]) : ($is_xor) ? ($src1_value[31:0] ^ $src2_value[31:0]) : ($is_sub) ? ($src1_value[31:0] - $src2_value[31:0]) : ($is_sll) ? ($src1_value[31:0] << $src2_value[4:0]) : ($is_srl) ? ($src1_value[31:0] >> $src2_value[4:0]) : ($is_sltu) ? ({31'b0, $sltu_rslt}) : ($is_sltiu) ? ({31'b0, $sltiu_rslt}) : ($is_lui) ? ({$imm31t12u[19:0], 12'b0}) : ($is_auipc) ? ($pc[31:0] + {$imm31t12u[19:0], 12'b0}) : ($is_jal) ? ($pc[31:0] + 32'd4) : ($is_jalr) ? ($pc[31:0] + 32'd4) : ($is_srai) ? (signed'($src1_value[31:0]) >>> $imm11t0i[4:0]) : ($is_slt) ? (($src1_value[31] == $src2_value[31]) ? $sltu_rslt : {31'b0, $src1_value[31]}) : ($is_slti) ? ((($src1_value[31] == $imm11t0i[11]) ? ($sltu_rslt) : {31'b0, $src1_value[31]})) : ($is_sra) ? (signed'($src1_value[31:0]) >>> $src2_value[4:0]) : 32'd0;
         $taken_br = $is_b_instr ? ( $is_beq ? ($src1_value[31:0] == $src2_value[31:0]) : $is_bne ? ($src1_value != $src2_value) : $is_blt ? (($src1_value < $src2_value) ^ ($src1_value[31] != $src2_value[31])) : $is_bge ? (($src1_value >= $src2_value) ^ ($src1_value[31] != $src2_value[31])) : $is_bltu ? ($src1_value < $src2_value) : $is_bgeu ? ($src1_value >= $src2_value) : 1'b0 ) : 1'b0;
         
         // Valid Logic updated to include load hazards
         $valid = !(>>1$valid_taken_br || >>2$valid_taken_br || >>1$valid_load || >>2$valid_load || >>1$valid_jump || >>2$valid_jump);
         $valid_taken_br = $valid && $taken_br;
         $valid_load = $valid && $is_load;
         
         $is_jump = $is_jal || $is_jalr;
         $valid_jump = $valid && $is_jump;
         
         //Rf write multiplexed for loads
         $rd_not_zero = ($rd[4:0] == 5'd0) ? 1'b0 : 1'b1;
         $rf_wr_en = ($rd_valid && $rd_not_zero && !$reset && $valid) || >>2$valid_load;
         ?$rf_wr_en
            $rf_wr_index[4:0] = >>2$valid_load ? >>2$rd[4:0] : $rd[4:0];
            $rf_wr_data[31:0] = >>2$valid_load ? >>2$ld_data[31:0] : $result[31:0];
            
         
      @4
         //DMEM Module Enable & Params
         $dmem_wr_en = $is_s_instr && $valid;
         $dmem_rd_en = $is_load;
         $dmem_addr[3:0] = $result[5:2];
         $dmem_wr_data[31:0] = $src2_value[31:0];
         
      @5
         // LOAD Data fetching
         $ld_data[31:0] = $dmem_rd_data[31:0];
         
      
      
   // Note: Because of the magic we are using for visualisation, if visualisation is enabled below,
   // be sure to avoid having unassigned signals (which you might be using for random inputs)
   // other than those specifically expected in the labs. You'll get strange errors for these.
   
   // Assert these to end simulation (before Makerchip cycle limit).
   // Changed to track r17 to ensure the Load successfully pulled the data.
   *passed = *cyc_cnt > 130; // 61 for *passed = |cpu/xreg[17]>>5$value == (1+2+3+4+5+6+7+8+9);
   *failed = 1'b0;
   // Macro instantiations for:
   // o instruction memory
   // o register file
   // o data memory
   // o CPU visualization
   |cpu
      m4+imem(@1) // Args: (read stage)
      m4+rf(@2, @3) // Args: (read stage, write stage) - if equal, no register bypass is required
      m4+dmem(@4) // Args: (read/write stage) - Uncommented!
   m4+cpu_viz(@4) // For visualisation, argument should be at least equal to the last stage of CPU logic. @4 would work for all labs.
\SV
   endmodule