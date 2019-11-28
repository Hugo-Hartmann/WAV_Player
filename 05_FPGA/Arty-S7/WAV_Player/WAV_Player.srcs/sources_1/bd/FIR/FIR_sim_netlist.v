// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Nov 28 14:11:39 2019
// Host        : L-1V1ZTY1 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/bd/FIR/FIR_sim_netlist.v
// Design      : FIR
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* hw_handoff = "FIR.hwdef" *) 
(* NotValidForBitStream *)
module FIR
   (FIR_din,
    FIR_dout,
    FIR_start,
    clk,
    reset_n);
  input [7:0]FIR_din;
  output [47:0]FIR_dout;
  input FIR_start;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN FIR_clk, FREQ_HZ 108000000, INSERT_VIP 0, PHASE 0.000" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 RST.RESET_N RST" *) (* x_interface_parameter = "XIL_INTERFACENAME RST.RESET_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset_n;

  wire [7:0]FIR_din;
  wire [47:0]FIR_dout;
  wire FIR_start;
  wire clk;
  wire reset_n;

  (* CHECK_LICENSE_TYPE = "FIR_FIR_interface_0_0,FIR_interface,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* ip_definition_source = "module_ref" *) 
  (* x_core_info = "FIR_interface,Vivado 2018.3" *) 
  FIR_FIR_FIR_interface_0_0 FIR_interface_0
       (.FIR_din(FIR_din),
        .FIR_dout(FIR_dout),
        .FIR_start(FIR_start),
        .clk(clk),
        .reset_n(reset_n));
endmodule

(* CHECK_LICENSE_TYPE = "FIR_FIR_interface_0_0,FIR_interface,{}" *) (* ORIG_REF_NAME = "FIR_FIR_interface_0_0" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "FIR_interface,Vivado 2018.3" *) 
module FIR_FIR_FIR_interface_0_0
   (clk,
    reset_n,
    FIR_dout,
    FIR_start,
    FIR_din);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 108000000, PHASE 0.000, CLK_DOMAIN FIR_clk, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 reset_n RST" *) (* x_interface_parameter = "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset_n;
  output [47:0]FIR_dout;
  input FIR_start;
  input [7:0]FIR_din;

  wire [7:0]FIR_din;
  wire [47:0]FIR_dout;
  wire FIR_start;
  wire clk;
  wire reset_n;

  FIR_FIR_interface U0
       (.FIR_din(FIR_din),
        .FIR_dout(FIR_dout),
        .FIR_start(FIR_start),
        .clk(clk),
        .reset_n(reset_n));
endmodule

(* ORIG_REF_NAME = "FIR_filter" *) 
module FIR_FIR_filter
   (B,
    D,
    clk,
    Q,
    accu_reg_0,
    clear,
    accu_reg_1,
    accu_reg_2,
    douta);
  output [0:0]B;
  output [7:0]D;
  input clk;
  input [9:0]Q;
  input accu_reg_0;
  input clear;
  input [6:0]accu_reg_1;
  input [4:0]accu_reg_2;
  input [0:0]douta;

  wire [0:0]B;
  wire [7:0]D;
  wire [9:0]Q;
  wire [15:0]ROM_out;
  wire accu_reg_0;
  wire [6:0]accu_reg_1;
  wire [4:0]accu_reg_2;
  wire accu_reg_i_3_n_0;
  wire accu_reg_n_100;
  wire accu_reg_n_101;
  wire accu_reg_n_102;
  wire accu_reg_n_103;
  wire accu_reg_n_104;
  wire accu_reg_n_105;
  wire accu_reg_n_76;
  wire accu_reg_n_77;
  wire accu_reg_n_78;
  wire accu_reg_n_79;
  wire accu_reg_n_80;
  wire accu_reg_n_81;
  wire accu_reg_n_82;
  wire accu_reg_n_83;
  wire accu_reg_n_84;
  wire accu_reg_n_85;
  wire accu_reg_n_86;
  wire accu_reg_n_87;
  wire accu_reg_n_88;
  wire accu_reg_n_89;
  wire accu_reg_n_90;
  wire accu_reg_n_91;
  wire accu_reg_n_92;
  wire accu_reg_n_93;
  wire accu_reg_n_94;
  wire accu_reg_n_95;
  wire accu_reg_n_96;
  wire accu_reg_n_97;
  wire accu_reg_n_98;
  wire accu_reg_n_99;
  wire clear;
  wire clk;
  wire [0:0]douta;
  wire [4:0]p_0_in_0;
  wire NLW_accu_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_accu_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_accu_reg_OVERFLOW_UNCONNECTED;
  wire NLW_accu_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_accu_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_accu_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_accu_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_accu_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_accu_reg_CARRYOUT_UNCONNECTED;
  wire [47:35]NLW_accu_reg_P_UNCONNECTED;
  wire [47:0]NLW_accu_reg_PCOUT_UNCONNECTED;

  LUT6 #(
    .INIT(64'h8F0F0F0F0F0F0F0E)) 
    \FIR_dout[0]_i_1 
       (.I0(accu_reg_n_82),
        .I1(p_0_in_0[2]),
        .I2(p_0_in_0[4]),
        .I3(p_0_in_0[0]),
        .I4(p_0_in_0[1]),
        .I5(p_0_in_0[3]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h8F0F0F0F0F0F0F0E)) 
    \FIR_dout[1]_i_1 
       (.I0(accu_reg_n_81),
        .I1(p_0_in_0[2]),
        .I2(p_0_in_0[4]),
        .I3(p_0_in_0[0]),
        .I4(p_0_in_0[1]),
        .I5(p_0_in_0[3]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h8F0F0F0F0F0F0F0E)) 
    \FIR_dout[2]_i_1 
       (.I0(accu_reg_n_80),
        .I1(p_0_in_0[2]),
        .I2(p_0_in_0[4]),
        .I3(p_0_in_0[0]),
        .I4(p_0_in_0[1]),
        .I5(p_0_in_0[3]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'h8F0F0F0F0F0F0F0E)) 
    \FIR_dout[3]_i_1 
       (.I0(accu_reg_n_79),
        .I1(p_0_in_0[2]),
        .I2(p_0_in_0[4]),
        .I3(p_0_in_0[0]),
        .I4(p_0_in_0[1]),
        .I5(p_0_in_0[3]),
        .O(D[3]));
  LUT6 #(
    .INIT(64'h8F0F0F0F0F0F0F0E)) 
    \FIR_dout[4]_i_1 
       (.I0(accu_reg_n_78),
        .I1(p_0_in_0[2]),
        .I2(p_0_in_0[4]),
        .I3(p_0_in_0[0]),
        .I4(p_0_in_0[1]),
        .I5(p_0_in_0[3]),
        .O(D[4]));
  LUT6 #(
    .INIT(64'h8F0F0F0F0F0F0F0E)) 
    \FIR_dout[5]_i_1 
       (.I0(accu_reg_n_77),
        .I1(p_0_in_0[2]),
        .I2(p_0_in_0[4]),
        .I3(p_0_in_0[0]),
        .I4(p_0_in_0[1]),
        .I5(p_0_in_0[3]),
        .O(D[5]));
  LUT6 #(
    .INIT(64'h8F0F0F0F0F0F0F0E)) 
    \FIR_dout[6]_i_1 
       (.I0(accu_reg_n_76),
        .I1(p_0_in_0[2]),
        .I2(p_0_in_0[4]),
        .I3(p_0_in_0[0]),
        .I4(p_0_in_0[1]),
        .I5(p_0_in_0[3]),
        .O(D[6]));
  LUT1 #(
    .INIT(2'h1)) 
    \FIR_dout[7]_i_1 
       (.I0(p_0_in_0[4]),
        .O(D[7]));
  (* CHECK_LICENSE_TYPE = "ROM_1024_16bit_0,blk_mem_gen_v8_4_2,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
  FIR_ROM_1024_16bit_0 \ROM0.U_ROM 
       (.addra(Q),
        .clka(clk),
        .douta(ROM_out),
        .ena(1'b1));
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    accu_reg
       (.A({ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_accu_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({accu_reg_i_3_n_0,accu_reg_i_3_n_0,accu_reg_i_3_n_0,accu_reg_i_3_n_0,accu_reg_i_3_n_0,accu_reg_i_3_n_0,B,B,B,B,B,accu_reg_1}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_accu_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_accu_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_accu_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(accu_reg_0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(accu_reg_0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(accu_reg_0),
        .CEP(accu_reg_0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_accu_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_accu_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_accu_reg_P_UNCONNECTED[47:35],p_0_in_0,accu_reg_n_76,accu_reg_n_77,accu_reg_n_78,accu_reg_n_79,accu_reg_n_80,accu_reg_n_81,accu_reg_n_82,accu_reg_n_83,accu_reg_n_84,accu_reg_n_85,accu_reg_n_86,accu_reg_n_87,accu_reg_n_88,accu_reg_n_89,accu_reg_n_90,accu_reg_n_91,accu_reg_n_92,accu_reg_n_93,accu_reg_n_94,accu_reg_n_95,accu_reg_n_96,accu_reg_n_97,accu_reg_n_98,accu_reg_n_99,accu_reg_n_100,accu_reg_n_101,accu_reg_n_102,accu_reg_n_103,accu_reg_n_104,accu_reg_n_105}),
        .PATTERNBDETECT(NLW_accu_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_accu_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_accu_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(clear),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(clear),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(clear),
        .RSTP(clear),
        .UNDERFLOW(NLW_accu_reg_UNDERFLOW_UNCONNECTED));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    accu_reg_i_3
       (.I0(accu_reg_2[1]),
        .I1(accu_reg_2[0]),
        .I2(accu_reg_2[2]),
        .I3(accu_reg_2[4]),
        .I4(accu_reg_2[3]),
        .I5(douta),
        .O(accu_reg_i_3_n_0));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    accu_reg_i_4
       (.I0(accu_reg_2[1]),
        .I1(accu_reg_2[0]),
        .I2(accu_reg_2[2]),
        .I3(accu_reg_2[4]),
        .I4(accu_reg_2[3]),
        .I5(douta),
        .O(B));
endmodule

(* ORIG_REF_NAME = "FIR_filter" *) 
module FIR_FIR_filter__parameterized1
   (\FSM_onehot_current_state_reg[5] ,
    D,
    clk,
    Q,
    accu_reg_0,
    clear,
    B,
    accu_reg_1,
    douta);
  output [0:0]\FSM_onehot_current_state_reg[5] ;
  output [7:0]D;
  input clk;
  input [9:0]Q;
  input accu_reg_0;
  input clear;
  input [7:0]B;
  input [4:0]accu_reg_1;
  input [0:0]douta;

  wire [7:0]B;
  wire [7:0]D;
  wire \FIR_dout[14]_i_2_n_0 ;
  wire \FIR_dout[14]_i_3_n_0 ;
  wire [0:0]\FSM_onehot_current_state_reg[5] ;
  wire [9:0]Q;
  wire [15:0]ROM_out;
  wire accu_reg_0;
  wire [4:0]accu_reg_1;
  wire [34:20]accu_reg__0;
  wire accu_reg_n_100;
  wire accu_reg_n_101;
  wire accu_reg_n_102;
  wire accu_reg_n_103;
  wire accu_reg_n_104;
  wire accu_reg_n_105;
  wire accu_reg_n_86;
  wire accu_reg_n_87;
  wire accu_reg_n_88;
  wire accu_reg_n_89;
  wire accu_reg_n_90;
  wire accu_reg_n_91;
  wire accu_reg_n_92;
  wire accu_reg_n_93;
  wire accu_reg_n_94;
  wire accu_reg_n_95;
  wire accu_reg_n_96;
  wire accu_reg_n_97;
  wire accu_reg_n_98;
  wire accu_reg_n_99;
  wire clear;
  wire clk;
  wire [0:0]douta;
  wire NLW_accu_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_accu_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_accu_reg_OVERFLOW_UNCONNECTED;
  wire NLW_accu_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_accu_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_accu_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_accu_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_accu_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_accu_reg_CARRYOUT_UNCONNECTED;
  wire [47:35]NLW_accu_reg_P_UNCONNECTED;
  wire [47:0]NLW_accu_reg_PCOUT_UNCONNECTED;

  LUT5 #(
    .INIT(32'hC000FFEE)) 
    \FIR_dout[10]_i_1 
       (.I0(\FIR_dout[14]_i_2_n_0 ),
        .I1(accu_reg__0[33]),
        .I2(\FIR_dout[14]_i_3_n_0 ),
        .I3(accu_reg__0[22]),
        .I4(accu_reg__0[34]),
        .O(D[2]));
  LUT5 #(
    .INIT(32'hC000FFEE)) 
    \FIR_dout[11]_i_1 
       (.I0(\FIR_dout[14]_i_2_n_0 ),
        .I1(accu_reg__0[33]),
        .I2(\FIR_dout[14]_i_3_n_0 ),
        .I3(accu_reg__0[23]),
        .I4(accu_reg__0[34]),
        .O(D[3]));
  LUT5 #(
    .INIT(32'hC000FFEE)) 
    \FIR_dout[12]_i_1 
       (.I0(\FIR_dout[14]_i_2_n_0 ),
        .I1(accu_reg__0[33]),
        .I2(\FIR_dout[14]_i_3_n_0 ),
        .I3(accu_reg__0[24]),
        .I4(accu_reg__0[34]),
        .O(D[4]));
  LUT5 #(
    .INIT(32'hC0FF00EE)) 
    \FIR_dout[13]_i_1 
       (.I0(\FIR_dout[14]_i_2_n_0 ),
        .I1(accu_reg__0[33]),
        .I2(\FIR_dout[14]_i_3_n_0 ),
        .I3(accu_reg__0[34]),
        .I4(accu_reg__0[25]),
        .O(D[5]));
  LUT5 #(
    .INIT(32'hC0FF00EE)) 
    \FIR_dout[14]_i_1 
       (.I0(\FIR_dout[14]_i_2_n_0 ),
        .I1(accu_reg__0[33]),
        .I2(\FIR_dout[14]_i_3_n_0 ),
        .I3(accu_reg__0[34]),
        .I4(accu_reg__0[26]),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FIR_dout[14]_i_2 
       (.I0(accu_reg__0[31]),
        .I1(accu_reg__0[29]),
        .I2(accu_reg__0[27]),
        .I3(accu_reg__0[28]),
        .I4(accu_reg__0[30]),
        .I5(accu_reg__0[32]),
        .O(\FIR_dout[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \FIR_dout[14]_i_3 
       (.I0(accu_reg__0[31]),
        .I1(accu_reg__0[29]),
        .I2(accu_reg__0[27]),
        .I3(accu_reg__0[28]),
        .I4(accu_reg__0[30]),
        .I5(accu_reg__0[32]),
        .O(\FIR_dout[14]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \FIR_dout[15]_i_1 
       (.I0(accu_reg__0[34]),
        .O(D[7]));
  LUT5 #(
    .INIT(32'hC000FFEE)) 
    \FIR_dout[8]_i_1 
       (.I0(\FIR_dout[14]_i_2_n_0 ),
        .I1(accu_reg__0[33]),
        .I2(\FIR_dout[14]_i_3_n_0 ),
        .I3(accu_reg__0[20]),
        .I4(accu_reg__0[34]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hC000FFEE)) 
    \FIR_dout[9]_i_1 
       (.I0(\FIR_dout[14]_i_2_n_0 ),
        .I1(accu_reg__0[33]),
        .I2(\FIR_dout[14]_i_3_n_0 ),
        .I3(accu_reg__0[21]),
        .I4(accu_reg__0[34]),
        .O(D[1]));
  (* CHECK_LICENSE_TYPE = "ROM_1024_16bit_1,blk_mem_gen_v8_4_2,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
  FIR_ROM_1024_16bit_1 \ROM1.U_ROM 
       (.addra(Q),
        .clka(clk),
        .douta(ROM_out),
        .ena(1'b1));
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    accu_reg
       (.A({ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_accu_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({B[7],B[7],B[7],B[7],B[7],\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,B[6:0]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_accu_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_accu_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_accu_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(accu_reg_0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(accu_reg_0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(accu_reg_0),
        .CEP(accu_reg_0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_accu_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_accu_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_accu_reg_P_UNCONNECTED[47:35],accu_reg__0,accu_reg_n_86,accu_reg_n_87,accu_reg_n_88,accu_reg_n_89,accu_reg_n_90,accu_reg_n_91,accu_reg_n_92,accu_reg_n_93,accu_reg_n_94,accu_reg_n_95,accu_reg_n_96,accu_reg_n_97,accu_reg_n_98,accu_reg_n_99,accu_reg_n_100,accu_reg_n_101,accu_reg_n_102,accu_reg_n_103,accu_reg_n_104,accu_reg_n_105}),
        .PATTERNBDETECT(NLW_accu_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_accu_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_accu_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(clear),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(clear),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(clear),
        .RSTP(clear),
        .UNDERFLOW(NLW_accu_reg_UNDERFLOW_UNCONNECTED));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    accu_reg_i_1__4
       (.I0(accu_reg_1[1]),
        .I1(accu_reg_1[0]),
        .I2(accu_reg_1[2]),
        .I3(accu_reg_1[4]),
        .I4(accu_reg_1[3]),
        .I5(douta),
        .O(\FSM_onehot_current_state_reg[5] ));
endmodule

(* ORIG_REF_NAME = "FIR_filter" *) 
module FIR_FIR_filter__parameterized3
   (\FSM_onehot_current_state_reg[5] ,
    D,
    clk,
    Q,
    accu_reg_0,
    clear,
    B,
    accu_reg_1,
    douta);
  output [0:0]\FSM_onehot_current_state_reg[5] ;
  output [7:0]D;
  input clk;
  input [9:0]Q;
  input accu_reg_0;
  input clear;
  input [7:0]B;
  input [4:0]accu_reg_1;
  input [0:0]douta;

  wire [7:0]B;
  wire [7:0]D;
  wire \FIR_dout[23]_i_2_n_0 ;
  wire \FIR_dout[23]_i_3_n_0 ;
  wire \FIR_dout[23]_i_4_n_0 ;
  wire [0:0]\FSM_onehot_current_state_reg[5] ;
  wire [9:0]Q;
  wire [15:0]ROM_out;
  wire accu_reg_0;
  wire [4:0]accu_reg_1;
  wire [34:18]accu_reg__0;
  wire accu_reg_n_100;
  wire accu_reg_n_101;
  wire accu_reg_n_102;
  wire accu_reg_n_103;
  wire accu_reg_n_104;
  wire accu_reg_n_105;
  wire accu_reg_n_88;
  wire accu_reg_n_89;
  wire accu_reg_n_90;
  wire accu_reg_n_91;
  wire accu_reg_n_92;
  wire accu_reg_n_93;
  wire accu_reg_n_94;
  wire accu_reg_n_95;
  wire accu_reg_n_96;
  wire accu_reg_n_97;
  wire accu_reg_n_98;
  wire accu_reg_n_99;
  wire clear;
  wire clk;
  wire [0:0]douta;
  wire NLW_accu_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_accu_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_accu_reg_OVERFLOW_UNCONNECTED;
  wire NLW_accu_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_accu_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_accu_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_accu_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_accu_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_accu_reg_CARRYOUT_UNCONNECTED;
  wire [47:35]NLW_accu_reg_P_UNCONNECTED;
  wire [47:0]NLW_accu_reg_PCOUT_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hA3)) 
    \FIR_dout[16]_i_1 
       (.I0(accu_reg__0[18]),
        .I1(accu_reg__0[34]),
        .I2(\FIR_dout[23]_i_2_n_0 ),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hA3)) 
    \FIR_dout[17]_i_1 
       (.I0(accu_reg__0[19]),
        .I1(accu_reg__0[34]),
        .I2(\FIR_dout[23]_i_2_n_0 ),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hA3)) 
    \FIR_dout[18]_i_1 
       (.I0(accu_reg__0[20]),
        .I1(accu_reg__0[34]),
        .I2(\FIR_dout[23]_i_2_n_0 ),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hA3)) 
    \FIR_dout[19]_i_1 
       (.I0(accu_reg__0[21]),
        .I1(accu_reg__0[34]),
        .I2(\FIR_dout[23]_i_2_n_0 ),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hA3)) 
    \FIR_dout[20]_i_1 
       (.I0(accu_reg__0[22]),
        .I1(accu_reg__0[34]),
        .I2(\FIR_dout[23]_i_2_n_0 ),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hA3)) 
    \FIR_dout[21]_i_1 
       (.I0(accu_reg__0[23]),
        .I1(accu_reg__0[34]),
        .I2(\FIR_dout[23]_i_2_n_0 ),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hA3)) 
    \FIR_dout[22]_i_1 
       (.I0(accu_reg__0[24]),
        .I1(accu_reg__0[34]),
        .I2(\FIR_dout[23]_i_2_n_0 ),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h53)) 
    \FIR_dout[23]_i_1 
       (.I0(accu_reg__0[25]),
        .I1(accu_reg__0[34]),
        .I2(\FIR_dout[23]_i_2_n_0 ),
        .O(D[7]));
  LUT6 #(
    .INIT(64'h8000000380000000)) 
    \FIR_dout[23]_i_2 
       (.I0(\FIR_dout[23]_i_3_n_0 ),
        .I1(accu_reg__0[26]),
        .I2(accu_reg__0[25]),
        .I3(accu_reg__0[28]),
        .I4(accu_reg__0[27]),
        .I5(\FIR_dout[23]_i_4_n_0 ),
        .O(\FIR_dout[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \FIR_dout[23]_i_3 
       (.I0(accu_reg__0[29]),
        .I1(accu_reg__0[30]),
        .I2(accu_reg__0[31]),
        .I3(accu_reg__0[32]),
        .I4(accu_reg__0[34]),
        .I5(accu_reg__0[33]),
        .O(\FIR_dout[23]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \FIR_dout[23]_i_4 
       (.I0(accu_reg__0[29]),
        .I1(accu_reg__0[30]),
        .I2(accu_reg__0[31]),
        .I3(accu_reg__0[32]),
        .I4(accu_reg__0[34]),
        .I5(accu_reg__0[33]),
        .O(\FIR_dout[23]_i_4_n_0 ));
  (* CHECK_LICENSE_TYPE = "ROM_1024_16bit_2,blk_mem_gen_v8_4_2,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
  FIR_ROM_1024_16bit_2 \ROM2.U_ROM 
       (.addra(Q),
        .clka(clk),
        .douta(ROM_out),
        .ena(1'b1));
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    accu_reg
       (.A({ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_accu_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({B[7],B[7],B[7],B[7],\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,B[6:0]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_accu_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_accu_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_accu_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(accu_reg_0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(accu_reg_0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(accu_reg_0),
        .CEP(accu_reg_0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_accu_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_accu_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_accu_reg_P_UNCONNECTED[47:35],accu_reg__0,accu_reg_n_88,accu_reg_n_89,accu_reg_n_90,accu_reg_n_91,accu_reg_n_92,accu_reg_n_93,accu_reg_n_94,accu_reg_n_95,accu_reg_n_96,accu_reg_n_97,accu_reg_n_98,accu_reg_n_99,accu_reg_n_100,accu_reg_n_101,accu_reg_n_102,accu_reg_n_103,accu_reg_n_104,accu_reg_n_105}),
        .PATTERNBDETECT(NLW_accu_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_accu_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_accu_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(clear),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(clear),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(clear),
        .RSTP(clear),
        .UNDERFLOW(NLW_accu_reg_UNDERFLOW_UNCONNECTED));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    accu_reg_i_1__3
       (.I0(accu_reg_1[1]),
        .I1(accu_reg_1[0]),
        .I2(accu_reg_1[2]),
        .I3(accu_reg_1[4]),
        .I4(accu_reg_1[3]),
        .I5(douta),
        .O(\FSM_onehot_current_state_reg[5] ));
endmodule

(* ORIG_REF_NAME = "FIR_filter" *) 
module FIR_FIR_filter__parameterized5
   (\FSM_onehot_current_state_reg[5] ,
    D,
    clk,
    Q,
    accu_reg_0,
    clear,
    B,
    accu_reg_1,
    douta);
  output [0:0]\FSM_onehot_current_state_reg[5] ;
  output [7:0]D;
  input clk;
  input [9:0]Q;
  input accu_reg_0;
  input clear;
  input [7:0]B;
  input [4:0]accu_reg_1;
  input [0:0]douta;

  wire [7:0]B;
  wire [7:0]D;
  wire \FIR_dout[30]_i_2_n_0 ;
  wire \FIR_dout[30]_i_3_n_0 ;
  wire \FIR_dout[30]_i_4_n_0 ;
  wire \FIR_dout[30]_i_5_n_0 ;
  wire [0:0]\FSM_onehot_current_state_reg[5] ;
  wire [9:0]Q;
  wire [15:0]ROM_out;
  wire accu_reg_0;
  wire [4:0]accu_reg_1;
  wire [34:17]accu_reg__0;
  wire accu_reg_n_100;
  wire accu_reg_n_101;
  wire accu_reg_n_102;
  wire accu_reg_n_103;
  wire accu_reg_n_104;
  wire accu_reg_n_105;
  wire accu_reg_n_89;
  wire accu_reg_n_90;
  wire accu_reg_n_91;
  wire accu_reg_n_92;
  wire accu_reg_n_93;
  wire accu_reg_n_94;
  wire accu_reg_n_95;
  wire accu_reg_n_96;
  wire accu_reg_n_97;
  wire accu_reg_n_98;
  wire accu_reg_n_99;
  wire clear;
  wire clk;
  wire [0:0]douta;
  wire NLW_accu_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_accu_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_accu_reg_OVERFLOW_UNCONNECTED;
  wire NLW_accu_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_accu_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_accu_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_accu_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_accu_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_accu_reg_CARRYOUT_UNCONNECTED;
  wire [47:35]NLW_accu_reg_P_UNCONNECTED;
  wire [47:0]NLW_accu_reg_PCOUT_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FIR_dout[24]_i_1 
       (.I0(\FIR_dout[30]_i_2_n_0 ),
        .I1(accu_reg__0[17]),
        .I2(\FIR_dout[30]_i_3_n_0 ),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FIR_dout[25]_i_1 
       (.I0(\FIR_dout[30]_i_2_n_0 ),
        .I1(accu_reg__0[18]),
        .I2(\FIR_dout[30]_i_3_n_0 ),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FIR_dout[26]_i_1 
       (.I0(\FIR_dout[30]_i_2_n_0 ),
        .I1(accu_reg__0[19]),
        .I2(\FIR_dout[30]_i_3_n_0 ),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FIR_dout[27]_i_1 
       (.I0(\FIR_dout[30]_i_2_n_0 ),
        .I1(accu_reg__0[20]),
        .I2(\FIR_dout[30]_i_3_n_0 ),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FIR_dout[28]_i_1 
       (.I0(\FIR_dout[30]_i_2_n_0 ),
        .I1(accu_reg__0[21]),
        .I2(\FIR_dout[30]_i_3_n_0 ),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FIR_dout[29]_i_1 
       (.I0(\FIR_dout[30]_i_2_n_0 ),
        .I1(accu_reg__0[22]),
        .I2(\FIR_dout[30]_i_3_n_0 ),
        .O(D[5]));
  LUT3 #(
    .INIT(8'hB8)) 
    \FIR_dout[30]_i_1 
       (.I0(\FIR_dout[30]_i_2_n_0 ),
        .I1(accu_reg__0[23]),
        .I2(\FIR_dout[30]_i_3_n_0 ),
        .O(D[6]));
  LUT6 #(
    .INIT(64'h80000000FFFFFFFF)) 
    \FIR_dout[30]_i_2 
       (.I0(accu_reg__0[33]),
        .I1(accu_reg__0[30]),
        .I2(\FIR_dout[30]_i_4_n_0 ),
        .I3(accu_reg__0[31]),
        .I4(accu_reg__0[32]),
        .I5(accu_reg__0[34]),
        .O(\FIR_dout[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFFFFFE)) 
    \FIR_dout[30]_i_3 
       (.I0(accu_reg__0[32]),
        .I1(accu_reg__0[33]),
        .I2(accu_reg__0[30]),
        .I3(\FIR_dout[30]_i_5_n_0 ),
        .I4(accu_reg__0[31]),
        .I5(accu_reg__0[34]),
        .O(\FIR_dout[30]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \FIR_dout[30]_i_4 
       (.I0(accu_reg__0[28]),
        .I1(accu_reg__0[26]),
        .I2(accu_reg__0[25]),
        .I3(accu_reg__0[24]),
        .I4(accu_reg__0[27]),
        .I5(accu_reg__0[29]),
        .O(\FIR_dout[30]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FIR_dout[30]_i_5 
       (.I0(accu_reg__0[28]),
        .I1(accu_reg__0[26]),
        .I2(accu_reg__0[25]),
        .I3(accu_reg__0[24]),
        .I4(accu_reg__0[27]),
        .I5(accu_reg__0[29]),
        .O(\FIR_dout[30]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FIR_dout[31]_i_1 
       (.I0(accu_reg__0[34]),
        .O(D[7]));
  (* CHECK_LICENSE_TYPE = "ROM_1024_16bit_3,blk_mem_gen_v8_4_2,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
  FIR_ROM_1024_16bit_3 \ROM3.U_ROM 
       (.addra(Q),
        .clka(clk),
        .douta(ROM_out),
        .ena(1'b1));
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    accu_reg
       (.A({ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_accu_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({B[7],B[7],B[7],\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,B[6:0]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_accu_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_accu_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_accu_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(accu_reg_0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(accu_reg_0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(accu_reg_0),
        .CEP(accu_reg_0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_accu_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_accu_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_accu_reg_P_UNCONNECTED[47:35],accu_reg__0,accu_reg_n_89,accu_reg_n_90,accu_reg_n_91,accu_reg_n_92,accu_reg_n_93,accu_reg_n_94,accu_reg_n_95,accu_reg_n_96,accu_reg_n_97,accu_reg_n_98,accu_reg_n_99,accu_reg_n_100,accu_reg_n_101,accu_reg_n_102,accu_reg_n_103,accu_reg_n_104,accu_reg_n_105}),
        .PATTERNBDETECT(NLW_accu_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_accu_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_accu_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(clear),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(clear),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(clear),
        .RSTP(clear),
        .UNDERFLOW(NLW_accu_reg_UNDERFLOW_UNCONNECTED));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    accu_reg_i_1__2
       (.I0(accu_reg_1[1]),
        .I1(accu_reg_1[0]),
        .I2(accu_reg_1[2]),
        .I3(accu_reg_1[4]),
        .I4(accu_reg_1[3]),
        .I5(douta),
        .O(\FSM_onehot_current_state_reg[5] ));
endmodule

(* ORIG_REF_NAME = "FIR_filter" *) 
module FIR_FIR_filter__parameterized7
   (\FSM_onehot_current_state_reg[5] ,
    D,
    clk,
    Q,
    accu_reg_0,
    clear,
    B,
    accu_reg_1,
    douta);
  output [0:0]\FSM_onehot_current_state_reg[5] ;
  output [7:0]D;
  input clk;
  input [9:0]Q;
  input accu_reg_0;
  input clear;
  input [7:0]B;
  input [4:0]accu_reg_1;
  input [0:0]douta;

  wire [7:0]B;
  wire [7:0]D;
  wire \FIR_dout[38]_i_2_n_0 ;
  wire \FIR_dout[38]_i_3_n_0 ;
  wire \FIR_dout[38]_i_4_n_0 ;
  wire \FIR_dout[38]_i_5_n_0 ;
  wire [0:0]\FSM_onehot_current_state_reg[5] ;
  wire [9:0]Q;
  wire [15:0]ROM_out;
  wire accu_reg_0;
  wire [4:0]accu_reg_1;
  wire [34:16]accu_reg__0;
  wire accu_reg_n_100;
  wire accu_reg_n_101;
  wire accu_reg_n_102;
  wire accu_reg_n_103;
  wire accu_reg_n_104;
  wire accu_reg_n_105;
  wire accu_reg_n_90;
  wire accu_reg_n_91;
  wire accu_reg_n_92;
  wire accu_reg_n_93;
  wire accu_reg_n_94;
  wire accu_reg_n_95;
  wire accu_reg_n_96;
  wire accu_reg_n_97;
  wire accu_reg_n_98;
  wire accu_reg_n_99;
  wire clear;
  wire clk;
  wire [0:0]douta;
  wire NLW_accu_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_accu_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_accu_reg_OVERFLOW_UNCONNECTED;
  wire NLW_accu_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_accu_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_accu_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_accu_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_accu_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_accu_reg_CARRYOUT_UNCONNECTED;
  wire [47:35]NLW_accu_reg_P_UNCONNECTED;
  wire [47:0]NLW_accu_reg_PCOUT_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h88FC)) 
    \FIR_dout[32]_i_1 
       (.I0(\FIR_dout[38]_i_2_n_0 ),
        .I1(accu_reg__0[16]),
        .I2(\FIR_dout[38]_i_3_n_0 ),
        .I3(accu_reg__0[34]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h88FC)) 
    \FIR_dout[33]_i_1 
       (.I0(\FIR_dout[38]_i_2_n_0 ),
        .I1(accu_reg__0[17]),
        .I2(\FIR_dout[38]_i_3_n_0 ),
        .I3(accu_reg__0[34]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h88FC)) 
    \FIR_dout[34]_i_1 
       (.I0(\FIR_dout[38]_i_2_n_0 ),
        .I1(accu_reg__0[18]),
        .I2(\FIR_dout[38]_i_3_n_0 ),
        .I3(accu_reg__0[34]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h88FC)) 
    \FIR_dout[35]_i_1 
       (.I0(\FIR_dout[38]_i_2_n_0 ),
        .I1(accu_reg__0[19]),
        .I2(\FIR_dout[38]_i_3_n_0 ),
        .I3(accu_reg__0[34]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h88FC)) 
    \FIR_dout[36]_i_1 
       (.I0(\FIR_dout[38]_i_2_n_0 ),
        .I1(accu_reg__0[20]),
        .I2(\FIR_dout[38]_i_3_n_0 ),
        .I3(accu_reg__0[34]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h88FC)) 
    \FIR_dout[37]_i_1 
       (.I0(\FIR_dout[38]_i_2_n_0 ),
        .I1(accu_reg__0[21]),
        .I2(\FIR_dout[38]_i_3_n_0 ),
        .I3(accu_reg__0[34]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h88FC)) 
    \FIR_dout[38]_i_1 
       (.I0(\FIR_dout[38]_i_2_n_0 ),
        .I1(accu_reg__0[22]),
        .I2(\FIR_dout[38]_i_3_n_0 ),
        .I3(accu_reg__0[34]),
        .O(D[6]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \FIR_dout[38]_i_2 
       (.I0(accu_reg__0[32]),
        .I1(accu_reg__0[30]),
        .I2(\FIR_dout[38]_i_4_n_0 ),
        .I3(accu_reg__0[29]),
        .I4(accu_reg__0[31]),
        .I5(accu_reg__0[33]),
        .O(\FIR_dout[38]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FIR_dout[38]_i_3 
       (.I0(accu_reg__0[32]),
        .I1(accu_reg__0[30]),
        .I2(\FIR_dout[38]_i_5_n_0 ),
        .I3(accu_reg__0[29]),
        .I4(accu_reg__0[31]),
        .I5(accu_reg__0[33]),
        .O(\FIR_dout[38]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \FIR_dout[38]_i_4 
       (.I0(accu_reg__0[27]),
        .I1(accu_reg__0[25]),
        .I2(accu_reg__0[24]),
        .I3(accu_reg__0[23]),
        .I4(accu_reg__0[26]),
        .I5(accu_reg__0[28]),
        .O(\FIR_dout[38]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FIR_dout[38]_i_5 
       (.I0(accu_reg__0[27]),
        .I1(accu_reg__0[25]),
        .I2(accu_reg__0[24]),
        .I3(accu_reg__0[23]),
        .I4(accu_reg__0[26]),
        .I5(accu_reg__0[28]),
        .O(\FIR_dout[38]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \FIR_dout[39]_i_1 
       (.I0(accu_reg__0[34]),
        .O(D[7]));
  (* CHECK_LICENSE_TYPE = "ROM_1024_16bit_4,blk_mem_gen_v8_4_2,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
  FIR_ROM_1024_16bit_4 \ROM4.U_ROM 
       (.addra(Q),
        .clka(clk),
        .douta(ROM_out),
        .ena(1'b1));
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    accu_reg
       (.A({ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_accu_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({B[7],B[7],\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,\FSM_onehot_current_state_reg[5] ,B[6:0]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_accu_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_accu_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_accu_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(accu_reg_0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(accu_reg_0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(accu_reg_0),
        .CEP(accu_reg_0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_accu_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_accu_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_accu_reg_P_UNCONNECTED[47:35],accu_reg__0,accu_reg_n_90,accu_reg_n_91,accu_reg_n_92,accu_reg_n_93,accu_reg_n_94,accu_reg_n_95,accu_reg_n_96,accu_reg_n_97,accu_reg_n_98,accu_reg_n_99,accu_reg_n_100,accu_reg_n_101,accu_reg_n_102,accu_reg_n_103,accu_reg_n_104,accu_reg_n_105}),
        .PATTERNBDETECT(NLW_accu_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_accu_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_accu_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(clear),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(clear),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(clear),
        .RSTP(clear),
        .UNDERFLOW(NLW_accu_reg_UNDERFLOW_UNCONNECTED));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    accu_reg_i_1__1
       (.I0(accu_reg_1[1]),
        .I1(accu_reg_1[0]),
        .I2(accu_reg_1[2]),
        .I3(accu_reg_1[4]),
        .I4(accu_reg_1[3]),
        .I5(douta),
        .O(\FSM_onehot_current_state_reg[5] ));
endmodule

(* ORIG_REF_NAME = "FIR_filter" *) 
module FIR_FIR_filter__parameterized9
   (reset_n_0,
    clear,
    B,
    D,
    clk,
    Q,
    accu_reg_0,
    reset_n,
    accu_reg_1,
    douta);
  output reset_n_0;
  output clear;
  output [6:0]B;
  output [7:0]D;
  input clk;
  input [9:0]Q;
  input [0:0]accu_reg_0;
  input reset_n;
  input [5:0]accu_reg_1;
  input [7:0]douta;

  wire [6:0]B;
  wire [7:0]D;
  wire \FIR_dout[46]_i_2_n_0 ;
  wire \FIR_dout[46]_i_3_n_0 ;
  wire \FIR_dout[46]_i_4_n_0 ;
  wire \FIR_dout[46]_i_5_n_0 ;
  wire [9:0]Q;
  wire [15:0]ROM_out;
  wire [0:0]accu_reg_0;
  wire [5:0]accu_reg_1;
  wire [34:16]accu_reg__0;
  wire accu_reg_i_1__0_n_0;
  wire accu_reg_n_100;
  wire accu_reg_n_101;
  wire accu_reg_n_102;
  wire accu_reg_n_103;
  wire accu_reg_n_104;
  wire accu_reg_n_105;
  wire accu_reg_n_90;
  wire accu_reg_n_91;
  wire accu_reg_n_92;
  wire accu_reg_n_93;
  wire accu_reg_n_94;
  wire accu_reg_n_95;
  wire accu_reg_n_96;
  wire accu_reg_n_97;
  wire accu_reg_n_98;
  wire accu_reg_n_99;
  wire clear;
  wire clk;
  wire [7:0]douta;
  wire reset_n;
  wire reset_n_0;
  wire NLW_accu_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_accu_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_accu_reg_OVERFLOW_UNCONNECTED;
  wire NLW_accu_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_accu_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_accu_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_accu_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_accu_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_accu_reg_CARRYOUT_UNCONNECTED;
  wire [47:35]NLW_accu_reg_P_UNCONNECTED;
  wire [47:0]NLW_accu_reg_PCOUT_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h88FC)) 
    \FIR_dout[40]_i_1 
       (.I0(\FIR_dout[46]_i_2_n_0 ),
        .I1(accu_reg__0[16]),
        .I2(\FIR_dout[46]_i_3_n_0 ),
        .I3(accu_reg__0[34]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h88FC)) 
    \FIR_dout[41]_i_1 
       (.I0(\FIR_dout[46]_i_2_n_0 ),
        .I1(accu_reg__0[17]),
        .I2(\FIR_dout[46]_i_3_n_0 ),
        .I3(accu_reg__0[34]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h88FC)) 
    \FIR_dout[42]_i_1 
       (.I0(\FIR_dout[46]_i_2_n_0 ),
        .I1(accu_reg__0[18]),
        .I2(\FIR_dout[46]_i_3_n_0 ),
        .I3(accu_reg__0[34]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h88FC)) 
    \FIR_dout[43]_i_1 
       (.I0(\FIR_dout[46]_i_2_n_0 ),
        .I1(accu_reg__0[19]),
        .I2(\FIR_dout[46]_i_3_n_0 ),
        .I3(accu_reg__0[34]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h88FC)) 
    \FIR_dout[44]_i_1 
       (.I0(\FIR_dout[46]_i_2_n_0 ),
        .I1(accu_reg__0[20]),
        .I2(\FIR_dout[46]_i_3_n_0 ),
        .I3(accu_reg__0[34]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h88FC)) 
    \FIR_dout[45]_i_1 
       (.I0(\FIR_dout[46]_i_2_n_0 ),
        .I1(accu_reg__0[21]),
        .I2(\FIR_dout[46]_i_3_n_0 ),
        .I3(accu_reg__0[34]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h88FC)) 
    \FIR_dout[46]_i_1 
       (.I0(\FIR_dout[46]_i_2_n_0 ),
        .I1(accu_reg__0[22]),
        .I2(\FIR_dout[46]_i_3_n_0 ),
        .I3(accu_reg__0[34]),
        .O(D[6]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \FIR_dout[46]_i_2 
       (.I0(accu_reg__0[32]),
        .I1(accu_reg__0[30]),
        .I2(\FIR_dout[46]_i_4_n_0 ),
        .I3(accu_reg__0[29]),
        .I4(accu_reg__0[31]),
        .I5(accu_reg__0[33]),
        .O(\FIR_dout[46]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FIR_dout[46]_i_3 
       (.I0(accu_reg__0[32]),
        .I1(accu_reg__0[30]),
        .I2(\FIR_dout[46]_i_5_n_0 ),
        .I3(accu_reg__0[29]),
        .I4(accu_reg__0[31]),
        .I5(accu_reg__0[33]),
        .O(\FIR_dout[46]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \FIR_dout[46]_i_4 
       (.I0(accu_reg__0[27]),
        .I1(accu_reg__0[25]),
        .I2(accu_reg__0[24]),
        .I3(accu_reg__0[23]),
        .I4(accu_reg__0[26]),
        .I5(accu_reg__0[28]),
        .O(\FIR_dout[46]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FIR_dout[46]_i_5 
       (.I0(accu_reg__0[27]),
        .I1(accu_reg__0[25]),
        .I2(accu_reg__0[24]),
        .I3(accu_reg__0[23]),
        .I4(accu_reg__0[26]),
        .I5(accu_reg__0[28]),
        .O(\FIR_dout[46]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \FIR_dout[47]_i_1 
       (.I0(accu_reg__0[34]),
        .O(D[7]));
  (* CHECK_LICENSE_TYPE = "ROM_1024_16bit_5,blk_mem_gen_v8_4_2,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
  FIR_ROM_1024_16bit_5 \ROM5.U_ROM 
       (.addra(Q),
        .clka(clk),
        .douta(ROM_out),
        .ena(1'b1));
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    accu_reg
       (.A({ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out[15],ROM_out}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_accu_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({accu_reg_0,accu_reg_i_1__0_n_0,accu_reg_i_1__0_n_0,accu_reg_i_1__0_n_0,accu_reg_i_1__0_n_0,accu_reg_i_1__0_n_0,accu_reg_i_1__0_n_0,accu_reg_i_1__0_n_0,accu_reg_i_1__0_n_0,accu_reg_i_1__0_n_0,accu_reg_i_1__0_n_0,B}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_accu_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_accu_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_accu_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(reset_n_0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(reset_n_0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(reset_n_0),
        .CEP(reset_n_0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_accu_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_accu_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_accu_reg_P_UNCONNECTED[47:35],accu_reg__0,accu_reg_n_90,accu_reg_n_91,accu_reg_n_92,accu_reg_n_93,accu_reg_n_94,accu_reg_n_95,accu_reg_n_96,accu_reg_n_97,accu_reg_n_98,accu_reg_n_99,accu_reg_n_100,accu_reg_n_101,accu_reg_n_102,accu_reg_n_103,accu_reg_n_104,accu_reg_n_105}),
        .PATTERNBDETECT(NLW_accu_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_accu_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_accu_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(clear),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(clear),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(clear),
        .RSTP(clear),
        .UNDERFLOW(NLW_accu_reg_UNDERFLOW_UNCONNECTED));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    accu_reg_i_1
       (.I0(reset_n),
        .I1(accu_reg_1[2]),
        .I2(accu_reg_1[1]),
        .I3(accu_reg_1[3]),
        .I4(accu_reg_1[5]),
        .I5(accu_reg_1[4]),
        .O(reset_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    accu_reg_i_10
       (.I0(accu_reg_1[2]),
        .I1(accu_reg_1[1]),
        .I2(accu_reg_1[3]),
        .I3(accu_reg_1[5]),
        .I4(accu_reg_1[4]),
        .I5(douta[1]),
        .O(B[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    accu_reg_i_11
       (.I0(accu_reg_1[2]),
        .I1(accu_reg_1[1]),
        .I2(accu_reg_1[3]),
        .I3(accu_reg_1[5]),
        .I4(accu_reg_1[4]),
        .I5(douta[0]),
        .O(B[0]));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    accu_reg_i_1__0
       (.I0(accu_reg_1[2]),
        .I1(accu_reg_1[1]),
        .I2(accu_reg_1[3]),
        .I3(accu_reg_1[5]),
        .I4(accu_reg_1[4]),
        .I5(douta[7]),
        .O(accu_reg_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    accu_reg_i_2
       (.I0(reset_n),
        .I1(accu_reg_1[0]),
        .O(clear));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    accu_reg_i_5
       (.I0(accu_reg_1[2]),
        .I1(accu_reg_1[1]),
        .I2(accu_reg_1[3]),
        .I3(accu_reg_1[5]),
        .I4(accu_reg_1[4]),
        .I5(douta[6]),
        .O(B[6]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    accu_reg_i_6
       (.I0(accu_reg_1[2]),
        .I1(accu_reg_1[1]),
        .I2(accu_reg_1[3]),
        .I3(accu_reg_1[5]),
        .I4(accu_reg_1[4]),
        .I5(douta[5]),
        .O(B[5]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    accu_reg_i_7
       (.I0(accu_reg_1[2]),
        .I1(accu_reg_1[1]),
        .I2(accu_reg_1[3]),
        .I3(accu_reg_1[5]),
        .I4(accu_reg_1[4]),
        .I5(douta[4]),
        .O(B[4]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    accu_reg_i_8
       (.I0(accu_reg_1[2]),
        .I1(accu_reg_1[1]),
        .I2(accu_reg_1[3]),
        .I3(accu_reg_1[5]),
        .I4(accu_reg_1[4]),
        .I5(douta[3]),
        .O(B[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    accu_reg_i_9
       (.I0(accu_reg_1[2]),
        .I1(accu_reg_1[1]),
        .I2(accu_reg_1[3]),
        .I3(accu_reg_1[5]),
        .I4(accu_reg_1[4]),
        .I5(douta[2]),
        .O(B[2]));
endmodule

(* ORIG_REF_NAME = "FIR_interface" *) 
module FIR_FIR_interface
   (FIR_dout,
    clk,
    FIR_start,
    FIR_din,
    reset_n);
  output [47:0]FIR_dout;
  input clk;
  input FIR_start;
  input [7:0]FIR_din;
  input reset_n;

  wire FIR_clr;
  wire [7:0]FIR_din;
  wire [6:0]FIR_din_d;
  wire [47:0]FIR_dout;
  wire \FIR_dout[47]_i_2_n_0 ;
  wire FIR_start;
  wire \FSM_onehot_current_state[1]_i_1_n_0 ;
  wire \FSM_onehot_current_state[2]_i_1_n_0 ;
  wire \FSM_onehot_current_state[4]_i_1_n_0 ;
  wire \FSM_onehot_current_state[5]_i_1_n_0 ;
  wire \FSM_onehot_current_state[5]_i_2_n_0 ;
  wire \FSM_onehot_current_state[5]_i_3_n_0 ;
  wire \FSM_onehot_current_state[5]_i_4_n_0 ;
  wire \FSM_onehot_current_state[6]_i_1_n_0 ;
  wire \FSM_onehot_current_state[6]_i_2_n_0 ;
  wire \FSM_onehot_current_state_reg_n_0_[0] ;
  wire \FSM_onehot_current_state_reg_n_0_[1] ;
  wire \FSM_onehot_current_state_reg_n_0_[3] ;
  wire \FSM_onehot_current_state_reg_n_0_[4] ;
  wire \FSM_onehot_current_state_reg_n_0_[6] ;
  wire \FSM_onehot_current_state_reg_n_0_[7] ;
  wire \FSM_onehot_current_state_reg_n_0_[8] ;
  wire \GEN_FILTER[0].U_FIR_filter_n_0 ;
  wire \GEN_FILTER[0].U_FIR_filter_n_1 ;
  wire \GEN_FILTER[0].U_FIR_filter_n_2 ;
  wire \GEN_FILTER[0].U_FIR_filter_n_3 ;
  wire \GEN_FILTER[0].U_FIR_filter_n_4 ;
  wire \GEN_FILTER[0].U_FIR_filter_n_5 ;
  wire \GEN_FILTER[0].U_FIR_filter_n_6 ;
  wire \GEN_FILTER[0].U_FIR_filter_n_7 ;
  wire \GEN_FILTER[0].U_FIR_filter_n_8 ;
  wire \GEN_FILTER[1].U_FIR_filter_n_0 ;
  wire \GEN_FILTER[1].U_FIR_filter_n_1 ;
  wire \GEN_FILTER[1].U_FIR_filter_n_2 ;
  wire \GEN_FILTER[1].U_FIR_filter_n_3 ;
  wire \GEN_FILTER[1].U_FIR_filter_n_4 ;
  wire \GEN_FILTER[1].U_FIR_filter_n_5 ;
  wire \GEN_FILTER[1].U_FIR_filter_n_6 ;
  wire \GEN_FILTER[1].U_FIR_filter_n_7 ;
  wire \GEN_FILTER[1].U_FIR_filter_n_8 ;
  wire \GEN_FILTER[2].U_FIR_filter_n_0 ;
  wire \GEN_FILTER[2].U_FIR_filter_n_1 ;
  wire \GEN_FILTER[2].U_FIR_filter_n_2 ;
  wire \GEN_FILTER[2].U_FIR_filter_n_3 ;
  wire \GEN_FILTER[2].U_FIR_filter_n_4 ;
  wire \GEN_FILTER[2].U_FIR_filter_n_5 ;
  wire \GEN_FILTER[2].U_FIR_filter_n_6 ;
  wire \GEN_FILTER[2].U_FIR_filter_n_7 ;
  wire \GEN_FILTER[2].U_FIR_filter_n_8 ;
  wire \GEN_FILTER[3].U_FIR_filter_n_0 ;
  wire \GEN_FILTER[3].U_FIR_filter_n_1 ;
  wire \GEN_FILTER[3].U_FIR_filter_n_2 ;
  wire \GEN_FILTER[3].U_FIR_filter_n_3 ;
  wire \GEN_FILTER[3].U_FIR_filter_n_4 ;
  wire \GEN_FILTER[3].U_FIR_filter_n_5 ;
  wire \GEN_FILTER[3].U_FIR_filter_n_6 ;
  wire \GEN_FILTER[3].U_FIR_filter_n_7 ;
  wire \GEN_FILTER[3].U_FIR_filter_n_8 ;
  wire \GEN_FILTER[4].U_FIR_filter_n_0 ;
  wire \GEN_FILTER[4].U_FIR_filter_n_1 ;
  wire \GEN_FILTER[4].U_FIR_filter_n_2 ;
  wire \GEN_FILTER[4].U_FIR_filter_n_3 ;
  wire \GEN_FILTER[4].U_FIR_filter_n_4 ;
  wire \GEN_FILTER[4].U_FIR_filter_n_5 ;
  wire \GEN_FILTER[4].U_FIR_filter_n_6 ;
  wire \GEN_FILTER[4].U_FIR_filter_n_7 ;
  wire \GEN_FILTER[4].U_FIR_filter_n_8 ;
  wire \GEN_FILTER[5].U_FIR_filter_n_0 ;
  wire [10:0]RAM_counter_rd;
  wire \RAM_counter_rd[10]_i_4_n_0 ;
  wire \RAM_counter_rd[3]_i_2_n_0 ;
  wire \RAM_counter_rd[5]_i_2_n_0 ;
  wire \RAM_counter_rd[7]_i_2_n_0 ;
  wire [10:0]RAM_counter_rd_reg__0;
  wire \RAM_counter_wr[10]_i_2_n_0 ;
  wire [10:0]RAM_counter_wr_reg__0;
  wire [10:0]addra;
  wire clear;
  wire clk;
  wire cnt_coef_dec;
  wire coef_counter0;
  wire coef_counter0_carry__0_i_1_n_0;
  wire coef_counter0_carry__0_i_2_n_0;
  wire coef_counter0_carry__0_i_3_n_0;
  wire coef_counter0_carry__0_i_4_n_0;
  wire coef_counter0_carry__0_n_0;
  wire coef_counter0_carry__0_n_1;
  wire coef_counter0_carry__0_n_2;
  wire coef_counter0_carry__0_n_3;
  wire coef_counter0_carry__0_n_4;
  wire coef_counter0_carry__0_n_5;
  wire coef_counter0_carry__0_n_6;
  wire coef_counter0_carry__0_n_7;
  wire coef_counter0_carry__1_i_1_n_0;
  wire coef_counter0_carry__1_n_7;
  wire coef_counter0_carry_i_1_n_0;
  wire coef_counter0_carry_i_2_n_0;
  wire coef_counter0_carry_i_3_n_0;
  wire coef_counter0_carry_i_4_n_0;
  wire coef_counter0_carry_i_5_n_0;
  wire coef_counter0_carry_n_0;
  wire coef_counter0_carry_n_1;
  wire coef_counter0_carry_n_2;
  wire coef_counter0_carry_n_3;
  wire coef_counter0_carry_n_4;
  wire coef_counter0_carry_n_5;
  wire coef_counter0_carry_n_6;
  wire coef_counter0_carry_n_7;
  wire \coef_counter[0]_i_1_n_0 ;
  wire [9:0]coef_counter_reg__0;
  wire dout_store;
  wire [7:0]douta;
  wire ena;
  wire [9:1]p_0_in;
  wire [9:8]p_0_out;
  wire [7:7]plusOp;
  wire [10:0]plusOp__0;
  wire reset_n;
  wire [6:0]sat_out;
  wire sel;
  wire [3:0]NLW_coef_counter0_carry__1_CO_UNCONNECTED;
  wire [3:1]NLW_coef_counter0_carry__1_O_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    \FIR_dout[47]_i_2 
       (.I0(reset_n),
        .O(\FIR_dout[47]_i_2_n_0 ));
  FDCE \FIR_dout_reg[0] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[0].U_FIR_filter_n_8 ),
        .Q(FIR_dout[0]));
  FDCE \FIR_dout_reg[10] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[1].U_FIR_filter_n_6 ),
        .Q(FIR_dout[10]));
  FDCE \FIR_dout_reg[11] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[1].U_FIR_filter_n_5 ),
        .Q(FIR_dout[11]));
  FDCE \FIR_dout_reg[12] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[1].U_FIR_filter_n_4 ),
        .Q(FIR_dout[12]));
  FDCE \FIR_dout_reg[13] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[1].U_FIR_filter_n_3 ),
        .Q(FIR_dout[13]));
  FDCE \FIR_dout_reg[14] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[1].U_FIR_filter_n_2 ),
        .Q(FIR_dout[14]));
  FDCE \FIR_dout_reg[15] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[1].U_FIR_filter_n_1 ),
        .Q(FIR_dout[15]));
  FDCE \FIR_dout_reg[16] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[2].U_FIR_filter_n_8 ),
        .Q(FIR_dout[16]));
  FDCE \FIR_dout_reg[17] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[2].U_FIR_filter_n_7 ),
        .Q(FIR_dout[17]));
  FDCE \FIR_dout_reg[18] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[2].U_FIR_filter_n_6 ),
        .Q(FIR_dout[18]));
  FDCE \FIR_dout_reg[19] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[2].U_FIR_filter_n_5 ),
        .Q(FIR_dout[19]));
  FDCE \FIR_dout_reg[1] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[0].U_FIR_filter_n_7 ),
        .Q(FIR_dout[1]));
  FDCE \FIR_dout_reg[20] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[2].U_FIR_filter_n_4 ),
        .Q(FIR_dout[20]));
  FDCE \FIR_dout_reg[21] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[2].U_FIR_filter_n_3 ),
        .Q(FIR_dout[21]));
  FDCE \FIR_dout_reg[22] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[2].U_FIR_filter_n_2 ),
        .Q(FIR_dout[22]));
  FDCE \FIR_dout_reg[23] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[2].U_FIR_filter_n_1 ),
        .Q(FIR_dout[23]));
  FDCE \FIR_dout_reg[24] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[3].U_FIR_filter_n_8 ),
        .Q(FIR_dout[24]));
  FDCE \FIR_dout_reg[25] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[3].U_FIR_filter_n_7 ),
        .Q(FIR_dout[25]));
  FDCE \FIR_dout_reg[26] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[3].U_FIR_filter_n_6 ),
        .Q(FIR_dout[26]));
  FDCE \FIR_dout_reg[27] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[3].U_FIR_filter_n_5 ),
        .Q(FIR_dout[27]));
  FDCE \FIR_dout_reg[28] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[3].U_FIR_filter_n_4 ),
        .Q(FIR_dout[28]));
  FDCE \FIR_dout_reg[29] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[3].U_FIR_filter_n_3 ),
        .Q(FIR_dout[29]));
  FDCE \FIR_dout_reg[2] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[0].U_FIR_filter_n_6 ),
        .Q(FIR_dout[2]));
  FDCE \FIR_dout_reg[30] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[3].U_FIR_filter_n_2 ),
        .Q(FIR_dout[30]));
  FDCE \FIR_dout_reg[31] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[3].U_FIR_filter_n_1 ),
        .Q(FIR_dout[31]));
  FDCE \FIR_dout_reg[32] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[4].U_FIR_filter_n_8 ),
        .Q(FIR_dout[32]));
  FDCE \FIR_dout_reg[33] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[4].U_FIR_filter_n_7 ),
        .Q(FIR_dout[33]));
  FDCE \FIR_dout_reg[34] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[4].U_FIR_filter_n_6 ),
        .Q(FIR_dout[34]));
  FDCE \FIR_dout_reg[35] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[4].U_FIR_filter_n_5 ),
        .Q(FIR_dout[35]));
  FDCE \FIR_dout_reg[36] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[4].U_FIR_filter_n_4 ),
        .Q(FIR_dout[36]));
  FDCE \FIR_dout_reg[37] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[4].U_FIR_filter_n_3 ),
        .Q(FIR_dout[37]));
  FDCE \FIR_dout_reg[38] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[4].U_FIR_filter_n_2 ),
        .Q(FIR_dout[38]));
  FDCE \FIR_dout_reg[39] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[4].U_FIR_filter_n_1 ),
        .Q(FIR_dout[39]));
  FDCE \FIR_dout_reg[3] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[0].U_FIR_filter_n_5 ),
        .Q(FIR_dout[3]));
  FDCE \FIR_dout_reg[40] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(sat_out[0]),
        .Q(FIR_dout[40]));
  FDCE \FIR_dout_reg[41] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(sat_out[1]),
        .Q(FIR_dout[41]));
  FDCE \FIR_dout_reg[42] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(sat_out[2]),
        .Q(FIR_dout[42]));
  FDCE \FIR_dout_reg[43] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(sat_out[3]),
        .Q(FIR_dout[43]));
  FDCE \FIR_dout_reg[44] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(sat_out[4]),
        .Q(FIR_dout[44]));
  FDCE \FIR_dout_reg[45] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(sat_out[5]),
        .Q(FIR_dout[45]));
  FDCE \FIR_dout_reg[46] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(sat_out[6]),
        .Q(FIR_dout[46]));
  FDCE \FIR_dout_reg[47] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(plusOp),
        .Q(FIR_dout[47]));
  FDCE \FIR_dout_reg[4] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[0].U_FIR_filter_n_4 ),
        .Q(FIR_dout[4]));
  FDCE \FIR_dout_reg[5] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[0].U_FIR_filter_n_3 ),
        .Q(FIR_dout[5]));
  FDCE \FIR_dout_reg[6] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[0].U_FIR_filter_n_2 ),
        .Q(FIR_dout[6]));
  FDCE \FIR_dout_reg[7] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[0].U_FIR_filter_n_1 ),
        .Q(FIR_dout[7]));
  FDCE \FIR_dout_reg[8] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[1].U_FIR_filter_n_8 ),
        .Q(FIR_dout[8]));
  FDCE \FIR_dout_reg[9] 
       (.C(clk),
        .CE(dout_store),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\GEN_FILTER[1].U_FIR_filter_n_7 ),
        .Q(FIR_dout[9]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hEFEE)) 
    \FSM_onehot_current_state[1]_i_1 
       (.I0(dout_store),
        .I1(\FSM_onehot_current_state_reg_n_0_[0] ),
        .I2(FIR_start),
        .I3(\FSM_onehot_current_state_reg_n_0_[1] ),
        .O(\FSM_onehot_current_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_current_state[2]_i_1 
       (.I0(\FSM_onehot_current_state_reg_n_0_[1] ),
        .I1(FIR_start),
        .O(\FSM_onehot_current_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    \FSM_onehot_current_state[4]_i_1 
       (.I0(\FSM_onehot_current_state[5]_i_3_n_0 ),
        .I1(\FSM_onehot_current_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_current_state_reg_n_0_[3] ),
        .O(\FSM_onehot_current_state[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hF444)) 
    \FSM_onehot_current_state[5]_i_1 
       (.I0(\FSM_onehot_current_state[5]_i_2_n_0 ),
        .I1(cnt_coef_dec),
        .I2(\FSM_onehot_current_state[5]_i_3_n_0 ),
        .I3(\FSM_onehot_current_state_reg_n_0_[4] ),
        .O(\FSM_onehot_current_state[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000002)) 
    \FSM_onehot_current_state[5]_i_2 
       (.I0(\FSM_onehot_current_state[6]_i_2_n_0 ),
        .I1(coef_counter_reg__0[2]),
        .I2(coef_counter_reg__0[3]),
        .I3(coef_counter_reg__0[0]),
        .I4(coef_counter_reg__0[1]),
        .O(\FSM_onehot_current_state[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00008000)) 
    \FSM_onehot_current_state[5]_i_3 
       (.I0(\FSM_onehot_current_state[5]_i_4_n_0 ),
        .I1(coef_counter_reg__0[2]),
        .I2(coef_counter_reg__0[3]),
        .I3(coef_counter_reg__0[1]),
        .I4(coef_counter_reg__0[0]),
        .O(\FSM_onehot_current_state[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \FSM_onehot_current_state[5]_i_4 
       (.I0(coef_counter_reg__0[4]),
        .I1(coef_counter_reg__0[5]),
        .I2(coef_counter_reg__0[6]),
        .I3(coef_counter_reg__0[7]),
        .I4(coef_counter_reg__0[9]),
        .I5(coef_counter_reg__0[8]),
        .O(\FSM_onehot_current_state[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \FSM_onehot_current_state[6]_i_1 
       (.I0(cnt_coef_dec),
        .I1(coef_counter_reg__0[1]),
        .I2(coef_counter_reg__0[0]),
        .I3(coef_counter_reg__0[3]),
        .I4(coef_counter_reg__0[2]),
        .I5(\FSM_onehot_current_state[6]_i_2_n_0 ),
        .O(\FSM_onehot_current_state[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \FSM_onehot_current_state[6]_i_2 
       (.I0(coef_counter_reg__0[4]),
        .I1(coef_counter_reg__0[5]),
        .I2(coef_counter_reg__0[6]),
        .I3(coef_counter_reg__0[7]),
        .I4(coef_counter_reg__0[9]),
        .I5(coef_counter_reg__0[8]),
        .O(\FSM_onehot_current_state[6]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "fir_acc1:0000010000,fir_load:0000001000,fir_begin:0000000100,fir_idle:0000000010,fir_reset:0000000001,fir_store:1000000000,fir_end2:0010000000,fir_end1:0001000000,fir_end3:0100000000,fir_acc2:0000100000" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_current_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\FIR_dout[47]_i_2_n_0 ),
        .Q(\FSM_onehot_current_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "fir_acc1:0000010000,fir_load:0000001000,fir_begin:0000000100,fir_idle:0000000010,fir_reset:0000000001,fir_store:1000000000,fir_end2:0010000000,fir_end1:0001000000,fir_end3:0100000000,fir_acc2:0000100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\FSM_onehot_current_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_current_state_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "fir_acc1:0000010000,fir_load:0000001000,fir_begin:0000000100,fir_idle:0000000010,fir_reset:0000000001,fir_store:1000000000,fir_end2:0010000000,fir_end1:0001000000,fir_end3:0100000000,fir_acc2:0000100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\FSM_onehot_current_state[2]_i_1_n_0 ),
        .Q(FIR_clr));
  (* FSM_ENCODED_STATES = "fir_acc1:0000010000,fir_load:0000001000,fir_begin:0000000100,fir_idle:0000000010,fir_reset:0000000001,fir_store:1000000000,fir_end2:0010000000,fir_end1:0001000000,fir_end3:0100000000,fir_acc2:0000100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(FIR_clr),
        .Q(\FSM_onehot_current_state_reg_n_0_[3] ));
  (* FSM_ENCODED_STATES = "fir_acc1:0000010000,fir_load:0000001000,fir_begin:0000000100,fir_idle:0000000010,fir_reset:0000000001,fir_store:1000000000,fir_end2:0010000000,fir_end1:0001000000,fir_end3:0100000000,fir_acc2:0000100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\FSM_onehot_current_state[4]_i_1_n_0 ),
        .Q(\FSM_onehot_current_state_reg_n_0_[4] ));
  (* FSM_ENCODED_STATES = "fir_acc1:0000010000,fir_load:0000001000,fir_begin:0000000100,fir_idle:0000000010,fir_reset:0000000001,fir_store:1000000000,fir_end2:0010000000,fir_end1:0001000000,fir_end3:0100000000,fir_acc2:0000100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\FSM_onehot_current_state[5]_i_1_n_0 ),
        .Q(cnt_coef_dec));
  (* FSM_ENCODED_STATES = "fir_acc1:0000010000,fir_load:0000001000,fir_begin:0000000100,fir_idle:0000000010,fir_reset:0000000001,fir_store:1000000000,fir_end2:0010000000,fir_end1:0001000000,fir_end3:0100000000,fir_acc2:0000100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\FSM_onehot_current_state[6]_i_1_n_0 ),
        .Q(\FSM_onehot_current_state_reg_n_0_[6] ));
  (* FSM_ENCODED_STATES = "fir_acc1:0000010000,fir_load:0000001000,fir_begin:0000000100,fir_idle:0000000010,fir_reset:0000000001,fir_store:1000000000,fir_end2:0010000000,fir_end1:0001000000,fir_end3:0100000000,fir_acc2:0000100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\FSM_onehot_current_state_reg_n_0_[6] ),
        .Q(\FSM_onehot_current_state_reg_n_0_[7] ));
  (* FSM_ENCODED_STATES = "fir_acc1:0000010000,fir_load:0000001000,fir_begin:0000000100,fir_idle:0000000010,fir_reset:0000000001,fir_store:1000000000,fir_end2:0010000000,fir_end1:0001000000,fir_end3:0100000000,fir_acc2:0000100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\FSM_onehot_current_state_reg_n_0_[7] ),
        .Q(\FSM_onehot_current_state_reg_n_0_[8] ));
  (* FSM_ENCODED_STATES = "fir_acc1:0000010000,fir_load:0000001000,fir_begin:0000000100,fir_idle:0000000010,fir_reset:0000000001,fir_store:1000000000,fir_end2:0010000000,fir_end1:0001000000,fir_end3:0100000000,fir_acc2:0000100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\FSM_onehot_current_state_reg_n_0_[8] ),
        .Q(dout_store));
  FIR_FIR_filter \GEN_FILTER[0].U_FIR_filter 
       (.B(\GEN_FILTER[0].U_FIR_filter_n_0 ),
        .D({\GEN_FILTER[0].U_FIR_filter_n_1 ,\GEN_FILTER[0].U_FIR_filter_n_2 ,\GEN_FILTER[0].U_FIR_filter_n_3 ,\GEN_FILTER[0].U_FIR_filter_n_4 ,\GEN_FILTER[0].U_FIR_filter_n_5 ,\GEN_FILTER[0].U_FIR_filter_n_6 ,\GEN_FILTER[0].U_FIR_filter_n_7 ,\GEN_FILTER[0].U_FIR_filter_n_8 }),
        .Q(coef_counter_reg__0),
        .accu_reg_0(\GEN_FILTER[5].U_FIR_filter_n_0 ),
        .accu_reg_1(FIR_din_d),
        .accu_reg_2({\FSM_onehot_current_state_reg_n_0_[8] ,\FSM_onehot_current_state_reg_n_0_[7] ,\FSM_onehot_current_state_reg_n_0_[6] ,cnt_coef_dec,\FSM_onehot_current_state_reg_n_0_[4] }),
        .clear(clear),
        .clk(clk),
        .douta(douta[7]));
  FIR_FIR_filter__parameterized1 \GEN_FILTER[1].U_FIR_filter 
       (.B({\GEN_FILTER[0].U_FIR_filter_n_0 ,FIR_din_d}),
        .D({\GEN_FILTER[1].U_FIR_filter_n_1 ,\GEN_FILTER[1].U_FIR_filter_n_2 ,\GEN_FILTER[1].U_FIR_filter_n_3 ,\GEN_FILTER[1].U_FIR_filter_n_4 ,\GEN_FILTER[1].U_FIR_filter_n_5 ,\GEN_FILTER[1].U_FIR_filter_n_6 ,\GEN_FILTER[1].U_FIR_filter_n_7 ,\GEN_FILTER[1].U_FIR_filter_n_8 }),
        .\FSM_onehot_current_state_reg[5] (\GEN_FILTER[1].U_FIR_filter_n_0 ),
        .Q(coef_counter_reg__0),
        .accu_reg_0(\GEN_FILTER[5].U_FIR_filter_n_0 ),
        .accu_reg_1({\FSM_onehot_current_state_reg_n_0_[8] ,\FSM_onehot_current_state_reg_n_0_[7] ,\FSM_onehot_current_state_reg_n_0_[6] ,cnt_coef_dec,\FSM_onehot_current_state_reg_n_0_[4] }),
        .clear(clear),
        .clk(clk),
        .douta(douta[7]));
  FIR_FIR_filter__parameterized3 \GEN_FILTER[2].U_FIR_filter 
       (.B({\GEN_FILTER[1].U_FIR_filter_n_0 ,FIR_din_d}),
        .D({\GEN_FILTER[2].U_FIR_filter_n_1 ,\GEN_FILTER[2].U_FIR_filter_n_2 ,\GEN_FILTER[2].U_FIR_filter_n_3 ,\GEN_FILTER[2].U_FIR_filter_n_4 ,\GEN_FILTER[2].U_FIR_filter_n_5 ,\GEN_FILTER[2].U_FIR_filter_n_6 ,\GEN_FILTER[2].U_FIR_filter_n_7 ,\GEN_FILTER[2].U_FIR_filter_n_8 }),
        .\FSM_onehot_current_state_reg[5] (\GEN_FILTER[2].U_FIR_filter_n_0 ),
        .Q(coef_counter_reg__0),
        .accu_reg_0(\GEN_FILTER[5].U_FIR_filter_n_0 ),
        .accu_reg_1({\FSM_onehot_current_state_reg_n_0_[8] ,\FSM_onehot_current_state_reg_n_0_[7] ,\FSM_onehot_current_state_reg_n_0_[6] ,cnt_coef_dec,\FSM_onehot_current_state_reg_n_0_[4] }),
        .clear(clear),
        .clk(clk),
        .douta(douta[7]));
  FIR_FIR_filter__parameterized5 \GEN_FILTER[3].U_FIR_filter 
       (.B({\GEN_FILTER[2].U_FIR_filter_n_0 ,FIR_din_d}),
        .D({\GEN_FILTER[3].U_FIR_filter_n_1 ,\GEN_FILTER[3].U_FIR_filter_n_2 ,\GEN_FILTER[3].U_FIR_filter_n_3 ,\GEN_FILTER[3].U_FIR_filter_n_4 ,\GEN_FILTER[3].U_FIR_filter_n_5 ,\GEN_FILTER[3].U_FIR_filter_n_6 ,\GEN_FILTER[3].U_FIR_filter_n_7 ,\GEN_FILTER[3].U_FIR_filter_n_8 }),
        .\FSM_onehot_current_state_reg[5] (\GEN_FILTER[3].U_FIR_filter_n_0 ),
        .Q(coef_counter_reg__0),
        .accu_reg_0(\GEN_FILTER[5].U_FIR_filter_n_0 ),
        .accu_reg_1({\FSM_onehot_current_state_reg_n_0_[8] ,\FSM_onehot_current_state_reg_n_0_[7] ,\FSM_onehot_current_state_reg_n_0_[6] ,cnt_coef_dec,\FSM_onehot_current_state_reg_n_0_[4] }),
        .clear(clear),
        .clk(clk),
        .douta(douta[7]));
  FIR_FIR_filter__parameterized7 \GEN_FILTER[4].U_FIR_filter 
       (.B({\GEN_FILTER[3].U_FIR_filter_n_0 ,FIR_din_d}),
        .D({\GEN_FILTER[4].U_FIR_filter_n_1 ,\GEN_FILTER[4].U_FIR_filter_n_2 ,\GEN_FILTER[4].U_FIR_filter_n_3 ,\GEN_FILTER[4].U_FIR_filter_n_4 ,\GEN_FILTER[4].U_FIR_filter_n_5 ,\GEN_FILTER[4].U_FIR_filter_n_6 ,\GEN_FILTER[4].U_FIR_filter_n_7 ,\GEN_FILTER[4].U_FIR_filter_n_8 }),
        .\FSM_onehot_current_state_reg[5] (\GEN_FILTER[4].U_FIR_filter_n_0 ),
        .Q(coef_counter_reg__0),
        .accu_reg_0(\GEN_FILTER[5].U_FIR_filter_n_0 ),
        .accu_reg_1({\FSM_onehot_current_state_reg_n_0_[8] ,\FSM_onehot_current_state_reg_n_0_[7] ,\FSM_onehot_current_state_reg_n_0_[6] ,cnt_coef_dec,\FSM_onehot_current_state_reg_n_0_[4] }),
        .clear(clear),
        .clk(clk),
        .douta(douta[7]));
  FIR_FIR_filter__parameterized9 \GEN_FILTER[5].U_FIR_filter 
       (.B(FIR_din_d),
        .D({plusOp,sat_out}),
        .Q(coef_counter_reg__0),
        .accu_reg_0(\GEN_FILTER[4].U_FIR_filter_n_0 ),
        .accu_reg_1({\FSM_onehot_current_state_reg_n_0_[8] ,\FSM_onehot_current_state_reg_n_0_[7] ,\FSM_onehot_current_state_reg_n_0_[6] ,cnt_coef_dec,\FSM_onehot_current_state_reg_n_0_[4] ,FIR_clr}),
        .clear(clear),
        .clk(clk),
        .douta(douta),
        .reset_n(reset_n),
        .reset_n_0(\GEN_FILTER[5].U_FIR_filter_n_0 ));
  (* CHECK_LICENSE_TYPE = "RAM_2048_8bit,blk_mem_gen_v8_4_2,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
  FIR_RAM_2048_8bit \RAM.U_RAM 
       (.addra(addra),
        .clka(clk),
        .dina(FIR_din),
        .douta(douta),
        .ena(ena),
        .wea(FIR_start));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \RAM.U_RAM_i_1 
       (.I0(cnt_coef_dec),
        .I1(\FSM_onehot_current_state_reg_n_0_[3] ),
        .I2(\FSM_onehot_current_state_reg_n_0_[4] ),
        .I3(FIR_start),
        .O(ena));
  LUT5 #(
    .INIT(32'hAAABAAA8)) 
    \RAM.U_RAM_i_10 
       (.I0(RAM_counter_rd_reg__0[2]),
        .I1(\FSM_onehot_current_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_current_state_reg_n_0_[3] ),
        .I3(cnt_coef_dec),
        .I4(RAM_counter_wr_reg__0[2]),
        .O(addra[2]));
  LUT5 #(
    .INIT(32'hAAABAAA8)) 
    \RAM.U_RAM_i_11 
       (.I0(RAM_counter_rd_reg__0[1]),
        .I1(\FSM_onehot_current_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_current_state_reg_n_0_[3] ),
        .I3(cnt_coef_dec),
        .I4(RAM_counter_wr_reg__0[1]),
        .O(addra[1]));
  LUT5 #(
    .INIT(32'hAAABAAA8)) 
    \RAM.U_RAM_i_12 
       (.I0(RAM_counter_rd_reg__0[0]),
        .I1(\FSM_onehot_current_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_current_state_reg_n_0_[3] ),
        .I3(cnt_coef_dec),
        .I4(RAM_counter_wr_reg__0[0]),
        .O(addra[0]));
  LUT5 #(
    .INIT(32'hAAABAAA8)) 
    \RAM.U_RAM_i_2 
       (.I0(RAM_counter_rd_reg__0[10]),
        .I1(\FSM_onehot_current_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_current_state_reg_n_0_[3] ),
        .I3(cnt_coef_dec),
        .I4(RAM_counter_wr_reg__0[10]),
        .O(addra[10]));
  LUT5 #(
    .INIT(32'hAAABAAA8)) 
    \RAM.U_RAM_i_3 
       (.I0(RAM_counter_rd_reg__0[9]),
        .I1(\FSM_onehot_current_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_current_state_reg_n_0_[3] ),
        .I3(cnt_coef_dec),
        .I4(RAM_counter_wr_reg__0[9]),
        .O(addra[9]));
  LUT5 #(
    .INIT(32'hAAABAAA8)) 
    \RAM.U_RAM_i_4 
       (.I0(RAM_counter_rd_reg__0[8]),
        .I1(\FSM_onehot_current_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_current_state_reg_n_0_[3] ),
        .I3(cnt_coef_dec),
        .I4(RAM_counter_wr_reg__0[8]),
        .O(addra[8]));
  LUT5 #(
    .INIT(32'hAAABAAA8)) 
    \RAM.U_RAM_i_5 
       (.I0(RAM_counter_rd_reg__0[7]),
        .I1(\FSM_onehot_current_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_current_state_reg_n_0_[3] ),
        .I3(cnt_coef_dec),
        .I4(RAM_counter_wr_reg__0[7]),
        .O(addra[7]));
  LUT5 #(
    .INIT(32'hAAABAAA8)) 
    \RAM.U_RAM_i_6 
       (.I0(RAM_counter_rd_reg__0[6]),
        .I1(\FSM_onehot_current_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_current_state_reg_n_0_[3] ),
        .I3(cnt_coef_dec),
        .I4(RAM_counter_wr_reg__0[6]),
        .O(addra[6]));
  LUT5 #(
    .INIT(32'hAAABAAA8)) 
    \RAM.U_RAM_i_7 
       (.I0(RAM_counter_rd_reg__0[5]),
        .I1(\FSM_onehot_current_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_current_state_reg_n_0_[3] ),
        .I3(cnt_coef_dec),
        .I4(RAM_counter_wr_reg__0[5]),
        .O(addra[5]));
  LUT5 #(
    .INIT(32'hAAABAAA8)) 
    \RAM.U_RAM_i_8 
       (.I0(RAM_counter_rd_reg__0[4]),
        .I1(\FSM_onehot_current_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_current_state_reg_n_0_[3] ),
        .I3(cnt_coef_dec),
        .I4(RAM_counter_wr_reg__0[4]),
        .O(addra[4]));
  LUT5 #(
    .INIT(32'hAAABAAA8)) 
    \RAM.U_RAM_i_9 
       (.I0(RAM_counter_rd_reg__0[3]),
        .I1(\FSM_onehot_current_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_current_state_reg_n_0_[3] ),
        .I3(cnt_coef_dec),
        .I4(RAM_counter_wr_reg__0[3]),
        .O(addra[3]));
  LUT3 #(
    .INIT(8'h1D)) 
    \RAM_counter_rd[0]_i_1 
       (.I0(RAM_counter_rd_reg__0[0]),
        .I1(FIR_clr),
        .I2(RAM_counter_wr_reg__0[0]),
        .O(RAM_counter_rd[0]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \RAM_counter_rd[10]_i_1 
       (.I0(cnt_coef_dec),
        .I1(\FSM_onehot_current_state_reg_n_0_[3] ),
        .I2(\FSM_onehot_current_state_reg_n_0_[4] ),
        .I3(FIR_clr),
        .O(sel));
  LUT6 #(
    .INIT(64'hFEFEFE010101FE01)) 
    \RAM_counter_rd[10]_i_2 
       (.I0(p_0_out[9]),
        .I1(\RAM_counter_rd[10]_i_4_n_0 ),
        .I2(p_0_out[8]),
        .I3(RAM_counter_rd_reg__0[10]),
        .I4(FIR_clr),
        .I5(RAM_counter_wr_reg__0[10]),
        .O(RAM_counter_rd[10]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \RAM_counter_rd[10]_i_3 
       (.I0(RAM_counter_wr_reg__0[9]),
        .I1(FIR_clr),
        .I2(RAM_counter_rd_reg__0[9]),
        .O(p_0_out[9]));
  LUT6 #(
    .INIT(64'hFFFFFFFCFAFAFFFC)) 
    \RAM_counter_rd[10]_i_4 
       (.I0(RAM_counter_wr_reg__0[6]),
        .I1(RAM_counter_rd_reg__0[6]),
        .I2(\RAM_counter_rd[7]_i_2_n_0 ),
        .I3(RAM_counter_rd_reg__0[7]),
        .I4(FIR_clr),
        .I5(RAM_counter_wr_reg__0[7]),
        .O(\RAM_counter_rd[10]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \RAM_counter_rd[10]_i_5 
       (.I0(RAM_counter_wr_reg__0[8]),
        .I1(FIR_clr),
        .I2(RAM_counter_rd_reg__0[8]),
        .O(p_0_out[8]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'hB8748B47)) 
    \RAM_counter_rd[1]_i_1 
       (.I0(RAM_counter_wr_reg__0[1]),
        .I1(FIR_clr),
        .I2(RAM_counter_rd_reg__0[1]),
        .I3(RAM_counter_wr_reg__0[0]),
        .I4(RAM_counter_rd_reg__0[0]),
        .O(RAM_counter_rd[1]));
  LUT4 #(
    .INIT(16'hA959)) 
    \RAM_counter_rd[2]_i_1 
       (.I0(\RAM_counter_rd[3]_i_2_n_0 ),
        .I1(RAM_counter_rd_reg__0[2]),
        .I2(FIR_clr),
        .I3(RAM_counter_wr_reg__0[2]),
        .O(RAM_counter_rd[2]));
  LUT6 #(
    .INIT(64'hB8B8B88BB874B847)) 
    \RAM_counter_rd[3]_i_1 
       (.I0(RAM_counter_wr_reg__0[3]),
        .I1(FIR_clr),
        .I2(RAM_counter_rd_reg__0[3]),
        .I3(\RAM_counter_rd[3]_i_2_n_0 ),
        .I4(RAM_counter_rd_reg__0[2]),
        .I5(RAM_counter_wr_reg__0[2]),
        .O(RAM_counter_rd[3]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    \RAM_counter_rd[3]_i_2 
       (.I0(RAM_counter_rd_reg__0[0]),
        .I1(RAM_counter_wr_reg__0[0]),
        .I2(RAM_counter_rd_reg__0[1]),
        .I3(FIR_clr),
        .I4(RAM_counter_wr_reg__0[1]),
        .O(\RAM_counter_rd[3]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hA959)) 
    \RAM_counter_rd[4]_i_1 
       (.I0(\RAM_counter_rd[5]_i_2_n_0 ),
        .I1(RAM_counter_rd_reg__0[4]),
        .I2(FIR_clr),
        .I3(RAM_counter_wr_reg__0[4]),
        .O(RAM_counter_rd[4]));
  LUT6 #(
    .INIT(64'hB8B8B88BB874B847)) 
    \RAM_counter_rd[5]_i_1 
       (.I0(RAM_counter_wr_reg__0[5]),
        .I1(FIR_clr),
        .I2(RAM_counter_rd_reg__0[5]),
        .I3(\RAM_counter_rd[5]_i_2_n_0 ),
        .I4(RAM_counter_rd_reg__0[4]),
        .I5(RAM_counter_wr_reg__0[4]),
        .O(RAM_counter_rd[5]));
  LUT6 #(
    .INIT(64'hFFFFFFFCFAFAFFFC)) 
    \RAM_counter_rd[5]_i_2 
       (.I0(RAM_counter_wr_reg__0[2]),
        .I1(RAM_counter_rd_reg__0[2]),
        .I2(\RAM_counter_rd[3]_i_2_n_0 ),
        .I3(RAM_counter_rd_reg__0[3]),
        .I4(FIR_clr),
        .I5(RAM_counter_wr_reg__0[3]),
        .O(\RAM_counter_rd[5]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hA959)) 
    \RAM_counter_rd[6]_i_1 
       (.I0(\RAM_counter_rd[7]_i_2_n_0 ),
        .I1(RAM_counter_rd_reg__0[6]),
        .I2(FIR_clr),
        .I3(RAM_counter_wr_reg__0[6]),
        .O(RAM_counter_rd[6]));
  LUT6 #(
    .INIT(64'hB8B8B88BB874B847)) 
    \RAM_counter_rd[7]_i_1 
       (.I0(RAM_counter_wr_reg__0[7]),
        .I1(FIR_clr),
        .I2(RAM_counter_rd_reg__0[7]),
        .I3(\RAM_counter_rd[7]_i_2_n_0 ),
        .I4(RAM_counter_rd_reg__0[6]),
        .I5(RAM_counter_wr_reg__0[6]),
        .O(RAM_counter_rd[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFCFAFAFFFC)) 
    \RAM_counter_rd[7]_i_2 
       (.I0(RAM_counter_wr_reg__0[4]),
        .I1(RAM_counter_rd_reg__0[4]),
        .I2(\RAM_counter_rd[5]_i_2_n_0 ),
        .I3(RAM_counter_rd_reg__0[5]),
        .I4(FIR_clr),
        .I5(RAM_counter_wr_reg__0[5]),
        .O(\RAM_counter_rd[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hA959)) 
    \RAM_counter_rd[8]_i_1 
       (.I0(\RAM_counter_rd[10]_i_4_n_0 ),
        .I1(RAM_counter_rd_reg__0[8]),
        .I2(FIR_clr),
        .I3(RAM_counter_wr_reg__0[8]),
        .O(RAM_counter_rd[8]));
  LUT6 #(
    .INIT(64'hB8B8B88BB874B847)) 
    \RAM_counter_rd[9]_i_1 
       (.I0(RAM_counter_wr_reg__0[9]),
        .I1(FIR_clr),
        .I2(RAM_counter_rd_reg__0[9]),
        .I3(\RAM_counter_rd[10]_i_4_n_0 ),
        .I4(RAM_counter_rd_reg__0[8]),
        .I5(RAM_counter_wr_reg__0[8]),
        .O(RAM_counter_rd[9]));
  FDCE \RAM_counter_rd_reg[0] 
       (.C(clk),
        .CE(sel),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(RAM_counter_rd[0]),
        .Q(RAM_counter_rd_reg__0[0]));
  FDCE \RAM_counter_rd_reg[10] 
       (.C(clk),
        .CE(sel),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(RAM_counter_rd[10]),
        .Q(RAM_counter_rd_reg__0[10]));
  FDCE \RAM_counter_rd_reg[1] 
       (.C(clk),
        .CE(sel),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(RAM_counter_rd[1]),
        .Q(RAM_counter_rd_reg__0[1]));
  FDCE \RAM_counter_rd_reg[2] 
       (.C(clk),
        .CE(sel),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(RAM_counter_rd[2]),
        .Q(RAM_counter_rd_reg__0[2]));
  FDCE \RAM_counter_rd_reg[3] 
       (.C(clk),
        .CE(sel),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(RAM_counter_rd[3]),
        .Q(RAM_counter_rd_reg__0[3]));
  FDCE \RAM_counter_rd_reg[4] 
       (.C(clk),
        .CE(sel),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(RAM_counter_rd[4]),
        .Q(RAM_counter_rd_reg__0[4]));
  FDCE \RAM_counter_rd_reg[5] 
       (.C(clk),
        .CE(sel),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(RAM_counter_rd[5]),
        .Q(RAM_counter_rd_reg__0[5]));
  FDCE \RAM_counter_rd_reg[6] 
       (.C(clk),
        .CE(sel),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(RAM_counter_rd[6]),
        .Q(RAM_counter_rd_reg__0[6]));
  FDCE \RAM_counter_rd_reg[7] 
       (.C(clk),
        .CE(sel),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(RAM_counter_rd[7]),
        .Q(RAM_counter_rd_reg__0[7]));
  FDCE \RAM_counter_rd_reg[8] 
       (.C(clk),
        .CE(sel),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(RAM_counter_rd[8]),
        .Q(RAM_counter_rd_reg__0[8]));
  FDCE \RAM_counter_rd_reg[9] 
       (.C(clk),
        .CE(sel),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(RAM_counter_rd[9]),
        .Q(RAM_counter_rd_reg__0[9]));
  LUT1 #(
    .INIT(2'h1)) 
    \RAM_counter_wr[0]_i_1 
       (.I0(RAM_counter_wr_reg__0[0]),
        .O(plusOp__0[0]));
  LUT6 #(
    .INIT(64'hF7FFFFFF08000000)) 
    \RAM_counter_wr[10]_i_1 
       (.I0(RAM_counter_wr_reg__0[8]),
        .I1(RAM_counter_wr_reg__0[6]),
        .I2(\RAM_counter_wr[10]_i_2_n_0 ),
        .I3(RAM_counter_wr_reg__0[7]),
        .I4(RAM_counter_wr_reg__0[9]),
        .I5(RAM_counter_wr_reg__0[10]),
        .O(plusOp__0[10]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \RAM_counter_wr[10]_i_2 
       (.I0(RAM_counter_wr_reg__0[5]),
        .I1(RAM_counter_wr_reg__0[3]),
        .I2(RAM_counter_wr_reg__0[1]),
        .I3(RAM_counter_wr_reg__0[0]),
        .I4(RAM_counter_wr_reg__0[2]),
        .I5(RAM_counter_wr_reg__0[4]),
        .O(\RAM_counter_wr[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \RAM_counter_wr[1]_i_1 
       (.I0(RAM_counter_wr_reg__0[0]),
        .I1(RAM_counter_wr_reg__0[1]),
        .O(plusOp__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \RAM_counter_wr[2]_i_1 
       (.I0(RAM_counter_wr_reg__0[0]),
        .I1(RAM_counter_wr_reg__0[1]),
        .I2(RAM_counter_wr_reg__0[2]),
        .O(plusOp__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \RAM_counter_wr[3]_i_1 
       (.I0(RAM_counter_wr_reg__0[1]),
        .I1(RAM_counter_wr_reg__0[0]),
        .I2(RAM_counter_wr_reg__0[2]),
        .I3(RAM_counter_wr_reg__0[3]),
        .O(plusOp__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \RAM_counter_wr[4]_i_1 
       (.I0(RAM_counter_wr_reg__0[2]),
        .I1(RAM_counter_wr_reg__0[0]),
        .I2(RAM_counter_wr_reg__0[1]),
        .I3(RAM_counter_wr_reg__0[3]),
        .I4(RAM_counter_wr_reg__0[4]),
        .O(plusOp__0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \RAM_counter_wr[5]_i_1 
       (.I0(RAM_counter_wr_reg__0[3]),
        .I1(RAM_counter_wr_reg__0[1]),
        .I2(RAM_counter_wr_reg__0[0]),
        .I3(RAM_counter_wr_reg__0[2]),
        .I4(RAM_counter_wr_reg__0[4]),
        .I5(RAM_counter_wr_reg__0[5]),
        .O(plusOp__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \RAM_counter_wr[6]_i_1 
       (.I0(\RAM_counter_wr[10]_i_2_n_0 ),
        .I1(RAM_counter_wr_reg__0[6]),
        .O(plusOp__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB4)) 
    \RAM_counter_wr[7]_i_1 
       (.I0(\RAM_counter_wr[10]_i_2_n_0 ),
        .I1(RAM_counter_wr_reg__0[6]),
        .I2(RAM_counter_wr_reg__0[7]),
        .O(plusOp__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hDF20)) 
    \RAM_counter_wr[8]_i_1 
       (.I0(RAM_counter_wr_reg__0[6]),
        .I1(\RAM_counter_wr[10]_i_2_n_0 ),
        .I2(RAM_counter_wr_reg__0[7]),
        .I3(RAM_counter_wr_reg__0[8]),
        .O(plusOp__0[8]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'hDFFF2000)) 
    \RAM_counter_wr[9]_i_1 
       (.I0(RAM_counter_wr_reg__0[7]),
        .I1(\RAM_counter_wr[10]_i_2_n_0 ),
        .I2(RAM_counter_wr_reg__0[6]),
        .I3(RAM_counter_wr_reg__0[8]),
        .I4(RAM_counter_wr_reg__0[9]),
        .O(plusOp__0[9]));
  FDCE \RAM_counter_wr_reg[0] 
       (.C(clk),
        .CE(FIR_start),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(plusOp__0[0]),
        .Q(RAM_counter_wr_reg__0[0]));
  FDCE \RAM_counter_wr_reg[10] 
       (.C(clk),
        .CE(FIR_start),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(plusOp__0[10]),
        .Q(RAM_counter_wr_reg__0[10]));
  FDCE \RAM_counter_wr_reg[1] 
       (.C(clk),
        .CE(FIR_start),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(plusOp__0[1]),
        .Q(RAM_counter_wr_reg__0[1]));
  FDCE \RAM_counter_wr_reg[2] 
       (.C(clk),
        .CE(FIR_start),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(plusOp__0[2]),
        .Q(RAM_counter_wr_reg__0[2]));
  FDCE \RAM_counter_wr_reg[3] 
       (.C(clk),
        .CE(FIR_start),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(plusOp__0[3]),
        .Q(RAM_counter_wr_reg__0[3]));
  FDCE \RAM_counter_wr_reg[4] 
       (.C(clk),
        .CE(FIR_start),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(plusOp__0[4]),
        .Q(RAM_counter_wr_reg__0[4]));
  FDCE \RAM_counter_wr_reg[5] 
       (.C(clk),
        .CE(FIR_start),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(plusOp__0[5]),
        .Q(RAM_counter_wr_reg__0[5]));
  FDCE \RAM_counter_wr_reg[6] 
       (.C(clk),
        .CE(FIR_start),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(plusOp__0[6]),
        .Q(RAM_counter_wr_reg__0[6]));
  FDCE \RAM_counter_wr_reg[7] 
       (.C(clk),
        .CE(FIR_start),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(plusOp__0[7]),
        .Q(RAM_counter_wr_reg__0[7]));
  FDCE \RAM_counter_wr_reg[8] 
       (.C(clk),
        .CE(FIR_start),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(plusOp__0[8]),
        .Q(RAM_counter_wr_reg__0[8]));
  FDCE \RAM_counter_wr_reg[9] 
       (.C(clk),
        .CE(FIR_start),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(plusOp__0[9]),
        .Q(RAM_counter_wr_reg__0[9]));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 coef_counter0_carry
       (.CI(1'b0),
        .CO({coef_counter0_carry_n_0,coef_counter0_carry_n_1,coef_counter0_carry_n_2,coef_counter0_carry_n_3}),
        .CYINIT(coef_counter_reg__0[0]),
        .DI({coef_counter_reg__0[3:1],coef_counter0_carry_i_1_n_0}),
        .O({coef_counter0_carry_n_4,coef_counter0_carry_n_5,coef_counter0_carry_n_6,coef_counter0_carry_n_7}),
        .S({coef_counter0_carry_i_2_n_0,coef_counter0_carry_i_3_n_0,coef_counter0_carry_i_4_n_0,coef_counter0_carry_i_5_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 coef_counter0_carry__0
       (.CI(coef_counter0_carry_n_0),
        .CO({coef_counter0_carry__0_n_0,coef_counter0_carry__0_n_1,coef_counter0_carry__0_n_2,coef_counter0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(coef_counter_reg__0[7:4]),
        .O({coef_counter0_carry__0_n_4,coef_counter0_carry__0_n_5,coef_counter0_carry__0_n_6,coef_counter0_carry__0_n_7}),
        .S({coef_counter0_carry__0_i_1_n_0,coef_counter0_carry__0_i_2_n_0,coef_counter0_carry__0_i_3_n_0,coef_counter0_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    coef_counter0_carry__0_i_1
       (.I0(coef_counter_reg__0[7]),
        .I1(coef_counter_reg__0[8]),
        .O(coef_counter0_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    coef_counter0_carry__0_i_2
       (.I0(coef_counter_reg__0[6]),
        .I1(coef_counter_reg__0[7]),
        .O(coef_counter0_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    coef_counter0_carry__0_i_3
       (.I0(coef_counter_reg__0[5]),
        .I1(coef_counter_reg__0[6]),
        .O(coef_counter0_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    coef_counter0_carry__0_i_4
       (.I0(coef_counter_reg__0[4]),
        .I1(coef_counter_reg__0[5]),
        .O(coef_counter0_carry__0_i_4_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 coef_counter0_carry__1
       (.CI(coef_counter0_carry__0_n_0),
        .CO(NLW_coef_counter0_carry__1_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_coef_counter0_carry__1_O_UNCONNECTED[3:1],coef_counter0_carry__1_n_7}),
        .S({1'b0,1'b0,1'b0,coef_counter0_carry__1_i_1_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    coef_counter0_carry__1_i_1
       (.I0(coef_counter_reg__0[8]),
        .I1(coef_counter_reg__0[9]),
        .O(coef_counter0_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    coef_counter0_carry_i_1
       (.I0(coef_counter_reg__0[1]),
        .O(coef_counter0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    coef_counter0_carry_i_2
       (.I0(coef_counter_reg__0[3]),
        .I1(coef_counter_reg__0[4]),
        .O(coef_counter0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    coef_counter0_carry_i_3
       (.I0(coef_counter_reg__0[2]),
        .I1(coef_counter_reg__0[3]),
        .O(coef_counter0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    coef_counter0_carry_i_4
       (.I0(coef_counter_reg__0[1]),
        .I1(coef_counter_reg__0[2]),
        .O(coef_counter0_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    coef_counter0_carry_i_5
       (.I0(coef_counter_reg__0[1]),
        .I1(cnt_coef_dec),
        .O(coef_counter0_carry_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \coef_counter[0]_i_1 
       (.I0(coef_counter_reg__0[0]),
        .I1(FIR_clr),
        .O(\coef_counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \coef_counter[1]_i_1 
       (.I0(coef_counter0_carry_n_7),
        .I1(FIR_clr),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \coef_counter[2]_i_1 
       (.I0(coef_counter0_carry_n_6),
        .I1(FIR_clr),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \coef_counter[3]_i_1 
       (.I0(coef_counter0_carry_n_5),
        .I1(FIR_clr),
        .O(p_0_in[3]));
  LUT2 #(
    .INIT(4'h2)) 
    \coef_counter[4]_i_1 
       (.I0(coef_counter0_carry_n_4),
        .I1(FIR_clr),
        .O(p_0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \coef_counter[5]_i_1 
       (.I0(coef_counter0_carry__0_n_7),
        .I1(FIR_clr),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \coef_counter[6]_i_1 
       (.I0(coef_counter0_carry__0_n_6),
        .I1(FIR_clr),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \coef_counter[7]_i_1 
       (.I0(coef_counter0_carry__0_n_5),
        .I1(FIR_clr),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \coef_counter[8]_i_1 
       (.I0(coef_counter0_carry__0_n_4),
        .I1(FIR_clr),
        .O(p_0_in[8]));
  LUT6 #(
    .INIT(64'hEEEEEEEEEEEEFFFE)) 
    \coef_counter[9]_i_1 
       (.I0(cnt_coef_dec),
        .I1(FIR_clr),
        .I2(\FSM_onehot_current_state_reg_n_0_[3] ),
        .I3(\FSM_onehot_current_state_reg_n_0_[4] ),
        .I4(\FSM_onehot_current_state_reg_n_0_[0] ),
        .I5(\FSM_onehot_current_state_reg_n_0_[1] ),
        .O(coef_counter0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \coef_counter[9]_i_2 
       (.I0(coef_counter0_carry__1_n_7),
        .I1(FIR_clr),
        .O(p_0_in[9]));
  FDCE \coef_counter_reg[0] 
       (.C(clk),
        .CE(coef_counter0),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(\coef_counter[0]_i_1_n_0 ),
        .Q(coef_counter_reg__0[0]));
  FDCE \coef_counter_reg[1] 
       (.C(clk),
        .CE(coef_counter0),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(p_0_in[1]),
        .Q(coef_counter_reg__0[1]));
  FDCE \coef_counter_reg[2] 
       (.C(clk),
        .CE(coef_counter0),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(p_0_in[2]),
        .Q(coef_counter_reg__0[2]));
  FDCE \coef_counter_reg[3] 
       (.C(clk),
        .CE(coef_counter0),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(p_0_in[3]),
        .Q(coef_counter_reg__0[3]));
  FDCE \coef_counter_reg[4] 
       (.C(clk),
        .CE(coef_counter0),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(p_0_in[4]),
        .Q(coef_counter_reg__0[4]));
  FDCE \coef_counter_reg[5] 
       (.C(clk),
        .CE(coef_counter0),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(p_0_in[5]),
        .Q(coef_counter_reg__0[5]));
  FDCE \coef_counter_reg[6] 
       (.C(clk),
        .CE(coef_counter0),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(p_0_in[6]),
        .Q(coef_counter_reg__0[6]));
  FDCE \coef_counter_reg[7] 
       (.C(clk),
        .CE(coef_counter0),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(p_0_in[7]),
        .Q(coef_counter_reg__0[7]));
  FDCE \coef_counter_reg[8] 
       (.C(clk),
        .CE(coef_counter0),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(p_0_in[8]),
        .Q(coef_counter_reg__0[8]));
  FDCE \coef_counter_reg[9] 
       (.C(clk),
        .CE(coef_counter0),
        .CLR(\FIR_dout[47]_i_2_n_0 ),
        .D(p_0_in[9]),
        .Q(coef_counter_reg__0[9]));
endmodule

(* CHECK_LICENSE_TYPE = "RAM_2048_8bit,blk_mem_gen_v8_4_2,{}" *) (* ORIG_REF_NAME = "RAM_2048_8bit" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
module FIR_RAM_2048_8bit
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [10:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.3396 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "RAM_2048_8bit.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  FIR_blk_mem_gen_v8_4_2 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "ROM_1024_16bit_0,blk_mem_gen_v8_4_2,{}" *) (* ORIG_REF_NAME = "ROM_1024_16bit_0" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
module FIR_ROM_1024_16bit_0
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.3548 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "ROM_1024_16bit_0.mem" *) 
  (* C_INIT_FILE_NAME = "ROM_1024_16bit_0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  FIR_blk_mem_gen_v8_4_2__parameterized1 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "ROM_1024_16bit_1,blk_mem_gen_v8_4_2,{}" *) (* ORIG_REF_NAME = "ROM_1024_16bit_1" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
module FIR_ROM_1024_16bit_1
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.3548 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "ROM_1024_16bit_1.mem" *) 
  (* C_INIT_FILE_NAME = "ROM_1024_16bit_1.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  FIR_blk_mem_gen_v8_4_2__parameterized3 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "ROM_1024_16bit_2,blk_mem_gen_v8_4_2,{}" *) (* ORIG_REF_NAME = "ROM_1024_16bit_2" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
module FIR_ROM_1024_16bit_2
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.3548 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "ROM_1024_16bit_2.mem" *) 
  (* C_INIT_FILE_NAME = "ROM_1024_16bit_2.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  FIR_blk_mem_gen_v8_4_2__parameterized5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "ROM_1024_16bit_3,blk_mem_gen_v8_4_2,{}" *) (* ORIG_REF_NAME = "ROM_1024_16bit_3" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
module FIR_ROM_1024_16bit_3
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.3548 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "ROM_1024_16bit_3.mem" *) 
  (* C_INIT_FILE_NAME = "ROM_1024_16bit_3.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  FIR_blk_mem_gen_v8_4_2__parameterized7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "ROM_1024_16bit_4,blk_mem_gen_v8_4_2,{}" *) (* ORIG_REF_NAME = "ROM_1024_16bit_4" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
module FIR_ROM_1024_16bit_4
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.3548 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "ROM_1024_16bit_4.mem" *) 
  (* C_INIT_FILE_NAME = "ROM_1024_16bit_4.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  FIR_blk_mem_gen_v8_4_2__parameterized9 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "ROM_1024_16bit_5,blk_mem_gen_v8_4_2,{}" *) (* ORIG_REF_NAME = "ROM_1024_16bit_5" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
module FIR_ROM_1024_16bit_5
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.3548 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "ROM_1024_16bit_5.mem" *) 
  (* C_INIT_FILE_NAME = "ROM_1024_16bit_5.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  FIR_blk_mem_gen_v8_4_2__parameterized11 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module FIR_blk_mem_gen_generic_cstr
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [7:0]douta;
  input clka;
  input ena;
  input [10:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [10:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire [0:0]wea;

  FIR_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module FIR_blk_mem_gen_generic_cstr__parameterized0
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_prim_width__parameterized0 \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module FIR_blk_mem_gen_generic_cstr__parameterized1
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_prim_width__parameterized1 \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module FIR_blk_mem_gen_generic_cstr__parameterized2
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_prim_width__parameterized2 \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module FIR_blk_mem_gen_generic_cstr__parameterized3
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_prim_width__parameterized3 \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module FIR_blk_mem_gen_generic_cstr__parameterized4
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_prim_width__parameterized4 \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module FIR_blk_mem_gen_generic_cstr__parameterized5
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_prim_width__parameterized5 \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module FIR_blk_mem_gen_prim_width
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [7:0]douta;
  input clka;
  input ena;
  input [10:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [10:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire [0:0]wea;

  FIR_blk_mem_gen_prim_wrapper \prim_noinit.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module FIR_blk_mem_gen_prim_width__parameterized0
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module FIR_blk_mem_gen_prim_width__parameterized1
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_prim_wrapper_init__parameterized0 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module FIR_blk_mem_gen_prim_width__parameterized2
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_prim_wrapper_init__parameterized1 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module FIR_blk_mem_gen_prim_width__parameterized3
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_prim_wrapper_init__parameterized2 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module FIR_blk_mem_gen_prim_width__parameterized4
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_prim_wrapper_init__parameterized3 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module FIR_blk_mem_gen_prim_width__parameterized5
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_prim_wrapper_init__parameterized4 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module FIR_blk_mem_gen_prim_wrapper
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [7:0]douta;
  input clka;
  input ena;
  input [10:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_33 ;
  wire [10:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire [0:0]wea;
  wire [15:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED ;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({addra,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED [15:8],douta}),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED [1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_33 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(ena),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module FIR_blk_mem_gen_prim_wrapper_init
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_32 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_33 ;
  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hFF99FF98FF97FF96FF95FF94FF94FF93FF92FF92FF91FF91FF91FF90FF90FF90),
    .INIT_01(256'hFFB1FFAFFFADFFABFFA9FFA7FFA6FFA4FFA3FFA1FFA0FF9FFF9DFF9CFF9BFF9A),
    .INIT_02(256'hFFD9FFD6FFD3FFD0FFCDFFCAFFC8FFC5FFC3FFC0FFBEFFBBFFB9FFB7FFB5FFB3),
    .INIT_03(256'h0013000F000B00070003FFFFFFFBFFF7FFF4FFF0FFECFFE9FFE6FFE2FFDFFFDC),
    .INIT_04(256'h0061005B00560051004B00460041003C00370033002E002900250020001C0017),
    .INIT_05(256'h00C200BB00B500AE00A800A2009B0095008F00890083007D00770071006C0066),
    .INIT_06(256'h0137012F0127011F011801100109010100FA00F300EC00E500DE00D700D000C9),
    .INIT_07(256'h01BB01B201AA01A1019901900188017F0177016F0167015E0156014E0146013E),
    .INIT_08(256'h024B02420238022F0226021D0214020B020201F901F001E701DE01D501CD01C4),
    .INIT_09(256'h02DE02D502CC02C302BA02B002A7029E0295028B0282027902700266025D0254),
    .INIT_0A(256'h036C0364035B0353034A0341033803300327031E0315030C030302FA02F102E7),
    .INIT_0B(256'h03E903E203DB03D403CC03C503BD03B503AE03A6039E0396038E0385037D0375),
    .INIT_0C(256'h04490444043F043A0434042F04290423041E04170411040B040403FE03F703F0),
    .INIT_0D(256'h047F047D047B0479047604740471046D046A04670463045F045B04570452044E),
    .INIT_0E(256'h0482048304850486048704870488048804880487048704860485048404830481),
    .INIT_0F(256'h0448044E04530458045D046104650469046D0470047404770479047C047E0480),
    .INIT_10(256'h03CF03D903E203EB03F403FC0404040C0414041B0422042904300437043D0443),
    .INIT_11(256'h031803250332033F034C035803640370037B03870392039D03A703B203BC03C6),
    .INIT_12(256'h022B023B024B025B026B027A028A029902A802B702C502D302E202F002FD030B),
    .INIT_13(256'h01160128013A014C015E01700181019301A401B601C701D801E901FA020A021B),
    .INIT_14(256'hFFECFFFF001200240037004A005D006F0082009500A700BA00CC00DF00F10104),
    .INIT_15(256'hFEC7FED8FEEAFEFCFF0EFF20FF33FF45FF57FF6AFF7CFF8FFFA1FFB4FFC7FFD9),
    .INIT_16(256'hFDC1FDD0FDDFFDEFFDFEFE0EFE1EFE2EFE3EFE4FFE5FFE70FE81FE92FEA4FEB5),
    .INIT_17(256'hFCF8FD02FD0DFD18FD23FD2FFD3BFD47FD53FD60FD6DFD7BFD88FD96FDA4FDB3),
    .INIT_18(256'hFC85FC89FC8DFC93FC98FC9EFCA4FCABFCB2FCB9FCC1FCCAFCD2FCDBFCE4FCEE),
    .INIT_19(256'hFC7CFC79FC76FC74FC73FC72FC71FC71FC72FC73FC74FC76FC78FC7AFC7DFC81),
    .INIT_1A(256'hFCE9FCDFFCD5FCCCFCC3FCBAFCB2FCAAFCA3FC9DFC97FC91FC8CFC87FC83FC7F),
    .INIT_1B(256'hFDCFFDBEFDACFD9BFD8BFD7BFD6BFD5CFD4EFD40FD32FD25FD18FD0CFD00FCF4),
    .INIT_1C(256'hFF22FF0AFEF2FEDBFEC4FEAEFE97FE82FE6CFE57FE43FE2EFE1BFE07FDF4FDE1),
    .INIT_1D(256'h00C700AB008F00730058003D00210007FFECFFD2FFB8FF9EFF85FF6BFF52FF3A),
    .INIT_1E(256'h0298027B025D02400222020501E701CA01AD0190017301560139011C010000E3),
    .INIT_1F(256'h04610446042A040F03F303D703BA039E038103640347032A030D02F002D302B5),
    .INIT_20(256'h05E505D005BA05A4058E0577056005480530051704FE04E504CB04B10497047C),
    .INIT_21(256'h06E106D606CB06BF06B206A506960687067806680657064506330620060D05F9),
    .INIT_22(256'h071107150718071A071B071C071B071907160713070E0709070206FB06F306EA),
    .INIT_23(256'h0638064E06640677068A069C06AC06BB06C906D606E206EC06F606FE0706070C),
    .INIT_24(256'h0423044E047804A104C804EE0512053605570578059705B505D205ED06080620),
    .INIT_25(256'h00AF00F10131017001AE01EA0225025E029602CC030203350367039803C803F6),
    .INIT_26(256'hFBD2FC2AFC81FCD7FD2BFD7EFDCFFE1FFE6EFEBBFF06FF51FF9AFFE10027006C),
    .INIT_27(256'hF59AF607F673F6DEF747F7AFF816F87BF8E0F942F9A4FA04FA63FAC1FB1DFB78),
    .INIT_28(256'hEE34EEB2EF2FEFABF026F0A0F11AF192F209F27FF2F4F368F3DBF44CF4BDF52C),
    .INIT_29(256'hE5E6E670E6FAE782E80AE892E919E99FEA24EAA9EB2DEBB0EC32ECB4ED35EDB5),
    .INIT_2A(256'hDD17DDA6DE34DEC2DF51DFDFE06DE0FAE188E215E2A2E32EE3BAE446E4D1E55C),
    .INIT_2B(256'hD441D4CCD557D5E3D670D6FCD789D817D8A4D932D9C0DA4EDADDDB6BDBFADC88),
    .INIT_2C(256'hCBF0CC6FCCEECD6ECDF0CE72CEF5CF7ACFFFD084D10BD192D21AD2A3D32CD3B6),
    .INIT_2D(256'hC4BBC524C58DC5F9C666C6D4C744C7B6C829C89DC913C98ACA03CA7CCAF7CB73),
    .INIT_2E(256'hBF38BF81BFCCC019C068C0BAC10DC163C1BAC214C270C2CDC32CC38DC3F0C455),
    .INIT_2F(256'hBBF2BC13BC37BC5DBC87BCB2BCE1BD12BD45BD7BBDB4BDEEBE2CBE6BBEADBEF2),
    .INIT_30(256'hBB60BB53BB49BB42BB3EBB3DBB3FBB44BB4CBB57BB64BB75BB88BB9FBBB7BBD3),
    .INIT_31(256'hBDDCBD9CBD5FBD26BCF0BCBDBC8EBC61BC38BC12BBEFBBCFBBB3BB99BB83BB70),
    .INIT_32(256'hC399C324C2B3C245C1DAC173C10FC0AEC051BFF7BFA0BF4CBEFCBEAFBE65BE1F),
    .INIT_33(256'hCC9FCBF6CB51CAAFCA10C974C8DCC846C7B4C725C69AC611C58CC50BC48CC411),
    .INIT_34(256'hD8C5D7EDD717D644D574D4A7D3DDD316D252D191D0D3D018CF60CEABCDF9CD4A),
    .INIT_35(256'hE7B3E6B2E5B3E4B6E3BBE2C3E1CEE0DBDFEADEFCDE11DD28DC42DB5FDA7ED9A0),
    .INIT_36(256'hF8E3F7C2F6A3F586F46AF350F238F121F00DEEFAEDEAECDCEBCFEAC5E9BDE8B7),
    .INIT_37(256'h0BA80A730940080D06DC05AB047B034D021F00F3FFC8FE9EFD76FC4FFB2AFA06),
    .INIT_38(256'h1F341DF91CBF1B841A4A191017D6169C1563142912F111B810810F490E130CDD),
    .INIT_39(256'h32A5317330402F0D2DD82CA32B6C2A3628FE27C6268E2555241B22E221A8206E),
    .INIT_3A(256'h451343F842DC41BD409D3F7B3E573D323C0B3AE339B9388E37623635350633D6),
    .INIT_3B(256'h559A54A453AB52B051B250B14FAE4EA94DA14C974B8B4A7C496B48584743462C),
    .INIT_3C(256'h636962A461DC611060415F6F5E995DC05CE55C065B245A3F5957586C577E568D),
    .INIT_3D(256'h6DCF6D456CB76C256B8F6AF66A5869B76913686A67BE670E665A65A364E9642B),
    .INIT_3E(256'h744473FC73B07360730B72B2725571F3718E712470B770456FCF6F556ED76E55),
    .INIT_3F(256'h76757673766C76617652763E7626760975E875C37599756B7539750274C77488),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({addra,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(douta),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:0]),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_32 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_33 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(ena),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module FIR_blk_mem_gen_prim_wrapper_init__parameterized0
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_32 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_33 ;
  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0026002400230021001F001D001B00190017001500130011000F000E000C000A),
    .INIT_01(256'h0036003600360035003500340033003300320031002F002E002D002B002A0028),
    .INIT_02(256'h0024002600280029002B002D002E003000310032003300340034003500350036),
    .INIT_03(256'h00000002000400060008000B000D000F0012001400160019001B001D001F0022),
    .INIT_04(256'hFFEEFFEEFFEEFFEFFFEFFFF0FFF1FFF1FFF3FFF4FFF5FFF7FFF8FFFAFFFCFFFE),
    .INIT_05(256'h0001FFFFFFFDFFFBFFFAFFF8FFF6FFF5FFF4FFF3FFF2FFF1FFF0FFEFFFEFFFEE),
    .INIT_06(256'h001C001B001A001900170016001400120010000F000D000B0009000700050003),
    .INIT_07(256'h0014001600180019001B001C001D001E001F001F001F001F001F001F001E001D),
    .INIT_08(256'hFFDDFFE1FFE5FFE9FFEDFFF1FFF5FFF8FFFC0000000300060009000C000F0011),
    .INIT_09(256'hFFA5FFA7FFAAFFACFFAFFFB2FFB6FFB9FFBDFFC0FFC4FFC8FFCCFFD0FFD4FFD8),
    .INIT_0A(256'hFFA5FFA3FFA1FFA0FF9FFF9EFF9DFF9DFF9CFF9CFF9DFF9EFF9FFFA0FFA1FFA3),
    .INIT_0B(256'hFFDBFFD7FFD3FFD0FFCCFFC8FFC4FFC0FFBDFFB9FFB6FFB3FFB0FFADFFAAFFA8),
    .INIT_0C(256'h000100010000FFFFFFFEFFFCFFFAFFF8FFF5FFF3FFF0FFEDFFE9FFE6FFE2FFDF),
    .INIT_0D(256'hFFDCFFE1FFE5FFE9FFEDFFF0FFF3FFF6FFF9FFFBFFFDFFFE0000000100010001),
    .INIT_0E(256'hFF8BFF90FF94FF99FF9EFFA3FFA9FFAEFFB3FFB9FFBEFFC3FFC9FFCEFFD3FFD7),
    .INIT_0F(256'hFF75FF73FF71FF70FF70FF70FF70FF71FF72FF74FF76FF79FF7CFF7FFF83FF87),
    .INIT_10(256'hFFD2FFCAFFC1FFB9FFB2FFAAFFA3FF9DFF96FF91FF8BFF86FF82FF7EFF7AFF77),
    .INIT_11(256'h005B0054004C0044003C0034002B0023001A00110008FFFFFFF6FFEDFFE4FFDB),
    .INIT_12(256'h0088008A008A008B008A00890088008600830080007C00780073006E00680062),
    .INIT_13(256'h0035003C0043004A00510057005E0064006A006F00740079007D008000830086),
    .INIT_14(256'hFFDEFFE0FFE3FFE6FFEAFFEEFFF3FFF8FFFE0004000B00110018001F0026002D),
    .INIT_15(256'h00200017000E0005FFFEFFF7FFF1FFECFFE7FFE4FFE1FFDEFFDDFFDCFFDCFFDD),
    .INIT_16(256'h00EC00DF00D100C300B500A8009A008C007F007100650058004C00400035002A),
    .INIT_17(256'h017A01770173016E01690162015B0153014A01400135012A011F0113010600F9),
    .INIT_18(256'h011F012C01370142014C0155015E0165016B017101750178017B017C017C017C),
    .INIT_19(256'h002D003C004B005A006A007A008A009A00AA00BA00C900D900E800F601050112),
    .INIT_1A(256'hFFB1FFB1FFB2FFB4FFB8FFBCFFC2FFC9FFD1FFD9FFE3FFEDFFF900050012001F),
    .INIT_1B(256'h0039002B001D00100003FFF7FFECFFE2FFD8FFD0FFC8FFC1FFBCFFB7FFB4FFB2),
    .INIT_1C(256'h010E010500FB00F100E500D900CC00BE00B000A1009300840075006500560048),
    .INIT_1D(256'h00E200F000FC010701110118011F0124012701290129012801250121011C0115),
    .INIT_1E(256'hFF66FF83FFA0FFBCFFD8FFF3000E00280041005A00710087009C00AF00C100D2),
    .INIT_1F(256'hFDDCFDECFDFEFE11FE26FE3CFE54FE6CFE86FEA0FEBBFED6FEF3FF0FFF2CFF49),
    .INIT_20(256'hFDC6FDBAFDAFFDA7FDA0FD9AFD97FD96FD96FD98FD9CFDA3FDAAFDB4FDC0FDCD),
    .INIT_21(256'hFF13FEFCFEE4FECCFEB4FE9CFE84FE6DFE56FE40FE2BFE17FE05FDF3FDE2FDD3),
    .INIT_22(256'h0000FFFEFFF9FFF3FFEAFFE0FFD4FFC6FFB7FFA6FF94FF81FF6DFF58FF42FF2B),
    .INIT_23(256'hFF15FF31FF4CFF65FF7CFF92FFA6FFB9FFC9FFD7FFE3FFEEFFF6FFFBFFFF0001),
    .INIT_24(256'hFD13FD30FD4EFD6DFD8DFDAEFDCFFDF1FE13FE35FE57FE78FE99FEB9FED9FEF7),
    .INIT_25(256'hFC63FC5BFC55FC52FC52FC55FC5AFC62FC6DFC7AFC8AFC9CFCB0FCC6FCDEFCF8),
    .INIT_26(256'hFE50FE22FDF5FDCAFDA1FD79FD53FD30FD0FFCF0FCD4FCBAFCA3FC8FFC7DFC6F),
    .INIT_27(256'h0141011900F000C50098006A003A000AFFD9FFA8FF76FF44FF12FEE1FEB0FE7F),
    .INIT_28(256'h0247024E02510252024F0249024002330224021101FC01E301C801AA01890166),
    .INIT_29(256'h009300B900DF01040128014B016D018D01AB01C801E201F9020E02210231023D),
    .INIT_2A(256'hFEBEFECAFED9FEECFF01FF19FF33FF50FF6FFF90FFB2FFD5FFFA00200046006C),
    .INIT_2B(256'h0004FFD3FFA6FF7CFF56FF33FF15FEFBFEE4FED2FEC3FEB9FEB2FEB0FEB1FEB6),
    .INIT_2C(256'h043A03F103A8035E031402CB0281023901F201AD0169012700E700AA00700038),
    .INIT_2D(256'h076A0755073A071B06F706CF06A30673063F060705CD058F054F050C04C80482),
    .INIT_2E(256'h06190650068406B406DF070607290746075F07720781078A078E078D0786077B),
    .INIT_2F(256'h01A001E7022F027A02C50311035E03AA03F60441048B04D3051A055E059F05DD),
    .INIT_30(256'hFF38FF38FF3EFF4AFF5CFF73FF8FFFB0FFD7000200320066009E00DA0119015B),
    .INIT_31(256'h020501B90170012A00E700A8006D00370005FFD8FFB1FF8EFF72FF5BFF49FF3E),
    .INIT_32(256'h06B706800644060405C00578052D04DF0490043F03ED039A034702F502A40253),
    .INIT_33(256'h067C06BB06F2072107480766077C0789078F078D078307720759073A071506E9),
    .INIT_34(256'hFEE4FF81001B00B3014701D7026202E9036A03E5045904C7052D058D05E40634),
    .INIT_35(256'hF5E2F64EF6C2F73CF7BDF844F8D0F961F9F6FA8EFB29FBC7FC66FD06FDA6FE45),
    .INIT_36(256'hF42DF3FCF3D5F3B9F3A6F39EF3A0F3ADF3C4F3E6F412F448F488F4D1F523F57F),
    .INIT_37(256'hFAF6FA6EF9E7F961F8DCF859F7DAF75FF6E8F677F60DF5A9F54CF4F7F4ABF467),
    .INIT_38(256'h009300820064003A0003FFC2FF76FF20FEC2FE5BFDEEFD7AFD00FC82FC00FB7C),
    .INIT_39(256'hF9C1FA9EFB6DFC2EFCE0FD84FE18FE9DFF12FF78FFCD0014004B0073008C0097),
    .INIT_3A(256'hE770E8A9E9E5EB23EC62EDA0EEDCF014F148F276F39EF4BDF5D3F6E0F7E1F8D7),
    .INIT_3B(256'hDA2BDA71DAD0DB46DBD3DC75DD2BDDF3DECEDFB8E0B1E1B8E2CAE3E8E50EE63C),
    .INIT_3C(256'hE4DDE353E1E7E098DF67DE54DD5FDC89DBD1DB37DABBDA5CDA1BD9F6D9EDD9FF),
    .INIT_3D(256'h09B206EE04320180FEDAFC42F9B8F740F4DAF287F04AEE24EC15EA1FE843E682),
    .INIT_3E(256'h33E731B02F622CFE2A8727FD256422BC20091D4C1A8617BB14EC121B0F4B0C7C),
    .INIT_3F(256'h46774664462845C5453B448B43B442B8419740523EEA3D613BB739EE38083605),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({addra,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(douta),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:0]),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_32 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_33 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(ena),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module FIR_blk_mem_gen_prim_wrapper_init__parameterized1
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_32 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_33 ;
  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hFFFAFFF8FFF8FFF8FFF9FFFCFFFF000200050007000800080007000500020000),
    .INIT_01(256'hFFFAFFF7FFF5FFF3FFF3FFF3FFF5FFF8FFFBFFFE0001000200020001FFFFFFFD),
    .INIT_02(256'h0002FFFEFFFBFFF8FFF5FFF4FFF4FFF5FFF7FFFAFFFDFFFF00000000FFFFFFFD),
    .INIT_03(256'h000C000A000700030000FFFDFFFBFFFAFFFBFFFDFFFF00020004000500050004),
    .INIT_04(256'h00100010000F000C000900050002000000000001000200050008000B000D000D),
    .INIT_05(256'h0008000A000B000B0009000600030000FFFEFFFDFFFE000100040008000C000E),
    .INIT_06(256'hFFFAFFFE0001000300030001FFFEFFFAFFF7FFF5FFF4FFF5FFF7FFFB00000004),
    .INIT_07(256'hFFF4FFF8FFFCFFFF00000000FFFEFFFAFFF6FFF2FFEFFFEDFFEDFFEEFFF1FFF6),
    .INIT_08(256'hFFF9FFFC0000000400070008000800060001FFFCFFF7FFF2FFEFFFEDFFEEFFF0),
    .INIT_09(256'h0000000100050009000E0012001500150013000F000A0004FFFEFFFAFFF8FFF7),
    .INIT_0A(256'hFFFCFFFCFFFE00020008000F00140018001B001A00170013000D000700030000),
    .INIT_0B(256'hFFF0FFEDFFECFFEEFFF3FFF900010008000E001200130011000E00090003FFFF),
    .INIT_0C(256'hFFEEFFE7FFE1FFDFFFDFFFE3FFE9FFF0FFF8FFFE0003000500040000FFFBFFF5),
    .INIT_0D(256'h0001FFF8FFEFFFE7FFE2FFE0FFE2FFE6FFEDFFF4FFFAFFFF0001FFFFFFFBFFF5),
    .INIT_0E(256'h00200019000F0005FFFCFFF5FFF1FFF1FFF5FFFA00010008000D000F000D0008),
    .INIT_0F(256'h002E002C0026001E0014000B0004000000000003000A0012001A002100240024),
    .INIT_10(256'h0019001F0020001D0016000D0004FFFDFFF9FFF9FFFE00060010001B0024002B),
    .INIT_11(256'hFFF4FFFF000600080006FFFFFFF6FFECFFE4FFDFFFDFFFE3FFEBFFF700040010),
    .INIT_12(256'hFFE2FFEEFFF8FFFF0001FFFEFFF6FFEBFFDEFFD3FFCBFFC7FFC9FFD0FFDBFFE8),
    .INIT_13(256'hFFEFFFF90005000F001700190015000CFFFFFFEFFFE0FFD4FFCCFFCAFFCEFFD6),
    .INIT_14(256'h0000000700130021002E0038003D003B0033002600160005FFF6FFEBFFE7FFE8),
    .INIT_15(256'hFFF4FFF6FFFF000D001E0030003F0048004B0047003D002E001E000F0004FFFF),
    .INIT_16(256'hFFD0FFCAFFCAFFD3FFE2FFF5000A001E002C00340034002D002100120004FFF9),
    .INIT_17(256'hFFC6FFB4FFA8FFA4FFA9FFB5FFC8FFDDFFF10001000B000D0008FFFCFFECFFDD),
    .INIT_18(256'hFFF9FFE0FFC9FFB7FFACFFABFFB2FFC1FFD3FFE6FFF600000001FFFAFFECFFDA),
    .INIT_19(256'h004D0037001D0002FFECFFDDFFD7FFDBFFE7FFF8000B001B00250027001F000F),
    .INIT_1A(256'h0076006E005C0044002B00140004FFFE0002000F00220038004C005B0060005C),
    .INIT_1B(256'h0048005200500043002F00180002FFF3FFEDFFF20002001A0035005000660074),
    .INIT_1C(256'hFFEF0006001300140009FFF5FFDDFFC5FFB3FFABFFAEFFBEFFD7FFF600170033),
    .INIT_1D(256'hFFC1FFDEFFF500010001FFF4FFDCFFBEFFA0FF86FF76FF73FF7CFF92FFAFFFD0),
    .INIT_1E(256'hFFDFFFFA0017002E003B003A002C0011FFEEFFC8FFA5FF8BFF7DFF7EFF8CFFA4),
    .INIT_1F(256'h0006001C003A005C0079008D009300880070004D0024FFFCFFDCFFC8FFC2FFCB),
    .INIT_20(256'hFFE4FFEF0009002F0059008100A000B100B200A200850060003A00190004FFFD),
    .INIT_21(256'hFF89FF7FFF88FFA3FFCBFFFB002B00550071007C007500600040001DFFFEFFE9),
    .INIT_22(256'hFF68FF44FF2FFF2EFF40FF63FF90FFC2FFEE000E001E001B0008FFE8FFC3FFA1),
    .INIT_23(256'hFFD9FFA1FF6FFF4CFF3CFF41FF59FF7FFFABFFD5FFF40003FFFFFFE8FFC2FF95),
    .INIT_24(256'h009D00660029FFF0FFC3FFA9FFA5FFB5FFD600000029004900590054003B000F),
    .INIT_25(256'h010500E900BA0082004B001D0002FFFC000E00310061009200BB00D500D900C5),
    .INIT_26(256'h00AC00B700A9008500540021FFF5FFDBFFD8FFED00180051009000CA00F40109),
    .INIT_27(256'hFFF1001C002E00250003FFD2FF9CFF6BFF4BFF42FF55FF80FFBF0007004E0087),
    .INIT_28(256'hFF90FFCBFFF50006FFF9FFD2FF97FF54FF13FEE2FEC9FECCFEECFF24FF6AFFB2),
    .INIT_29(256'hFFCE000D0048007300850077004C0008FFB6FF64FF1EFEEEFEDDFEEAFF13FF4E),
    .INIT_2A(256'h001D0056009E00E6011F013F013D011A00D90085002BFFD9FF9BFF7BFF7BFF9A),
    .INIT_2B(256'hFFC8FFEE0033008B00E8013A0173018A017D014D010400B000600021FFFEFFFD),
    .INIT_2C(256'hFEECFEE8FF0BFF53FFB40021008700D70107010F00F200B8006D0022FFE6FFC5),
    .INIT_2D(256'hFE8DFE49FE2CFE3AFE72FECBFF35FFA0FFF900320045002FFFF8FFACFF5BFF16),
    .INIT_2E(256'hFF77FEFEFE9AFE5BFE4BFE68FEACFF09FF6BFFC0FFF80008FFEDFFACFF50FEEA),
    .INIT_2F(256'h013200AF0027FFAFFF5AFF33FF3DFF73FFC70026007C00B700C800AA0060FFF4),
    .INIT_30(256'h023D01EA017500F4007C0023FFF80001003B00980107017201C201E801DB019C),
    .INIT_31(256'h019F01A00169010700910020FFCAFFA1FFB0FFF6006800F3018001F80245025D),
    .INIT_32(256'h000B005A006A003DFFDDFF62FEE5FE81FE4BFE51FE95FF0EFFAC005400EE0161),
    .INIT_33(256'hFF2FFFB0FFFE000AFFD2FF5FFEC7FE26FD99FD39FD19FD3EFDA4FE38FEE3FF87),
    .INIT_34(256'hFFC1005D00E3013601420102007CFFC6FEFAFE3AFDA4FD4EFD43FD81FDFAFE93),
    .INIT_35(256'h007E012401DE0289030203300308028D01D200F30015FF59FEDBFEACFECCFF31),
    .INIT_36(256'hFF87001100E201D502C2038203F4040803BB031F024F017200AF0027FFEF0010),
    .INIT_37(256'hFCE3FD07FD98FE83FFA500D001D6029102E702D2025D01A600D50014FF8CFF59),
    .INIT_38(256'hFB43FAA8FA8AFAEFFBC6FCEAFE2CFF57003B00B600BB0052FF96FEB2FDD5FD2F),
    .INIT_39(256'hFD9CFC28FB16FA8CFA9BFB36FC3AFD71FEA0FF8C000C0008FF82FE95FD6CFC3E),
    .INIT_3A(256'h03A501B1FFD3FE53FD66FD28FD92FE81FFBE010102050294028B01E600BAFF37),
    .INIT_3B(256'h0901074D0535031901550031FFD7004B016B02F7049D060A06F30729069D0560),
    .INIT_3C(256'h089507FF066A043701E0FFDCFE92FE3FFEF4009002CB05420787093B0A190A01),
    .INIT_3D(256'h016502D8028600B6FDEBFACEF80BF634F5ACF694F8CDFBFDFFA2032B061307F2),
    .INIT_3E(256'hF83DFE030084FFCCFC66F743F183EC48E885E6DCE789EA60EEDBF437F999FE33),
    .INIT_3F(256'h74216FF263D8512339CF2049071EF0ABDED6D2DCCD2DCD74D2ACDB4EE596EFBC),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({addra,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(douta),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:0]),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_32 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_33 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(ena),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module FIR_blk_mem_gen_prim_wrapper_init__parameterized2
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_32 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_33 ;
  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hFFFF0003000600050001FFFEFFFF00010001FFFDFFFAFFFAFFFF000200020000),
    .INIT_01(256'hFFFF00040005000300000000000300040001FFFCFFFAFFFCFFFF0001FFFFFFFD),
    .INIT_02(256'hFFFF00030003000000000003000600060001FFFDFFFCFFFE0000FFFEFFFBFFFB),
    .INIT_03(256'hFFFF0001FFFEFFFDFFFF0004000700050001FFFEFFFF00020001FFFCFFF9FFFA),
    .INIT_04(256'h0000FFFEFFFAFFFAFFFF00050006000300000001000400050001FFFBFFF9FFFB),
    .INIT_05(256'h0000FFFBFFF7FFF9FFFF00040003000000000004000800070001FFFCFFFBFFFE),
    .INIT_06(256'h0000FFFAFFF7FFFB00000001FFFEFFFCFFFF0006000900060000FFFE00000002),
    .INIT_07(256'h0000FFFAFFFAFFFE0000FFFDFFF8FFF900000006000800040000000100050006),
    .INIT_08(256'h0000FFFD000000030000FFF9FFF5FFF8000000050003FFFF00000005000A0008),
    .INIT_09(256'h00000002000700070000FFF7FFF5FFFA00000001FFFCFFFB00000008000C0007),
    .INIT_0A(256'h00000008000D0009FFFFFFF8FFF9FFFE0000FFFBFFF6FFF700010009000A0004),
    .INIT_0B(256'h0001000C000F0009FFFFFFFC00010004FFFFFFF6FFF1FFF7000100060004FFFF),
    .INIT_0C(256'h0002000C000C000500000003000A0009FFFEFFF3FFF2FFF900010000FFFBFFFA),
    .INIT_0D(256'h000200080004FFFE0001000B0011000BFFFEFFF5FFF7FFFE0000FFF9FFF2FFF6),
    .INIT_0E(256'h00010000FFF9FFF8000300110014000AFFFEFFFB00010005FFFEFFF2FFEDFFF5),
    .INIT_0F(256'hFFFFFFF5FFEEFFF400040011000F000500000005000D000AFFFCFFEFFFEEFFF8),
    .INIT_10(256'hFFFCFFECFFE7FFF30004000B0004FFFE000300100016000DFFFBFFF1FFF5FFFE),
    .INIT_11(256'hFFF9FFE8FFE9FFF70002FFFFFFF6FFF7000600170019000BFFFCFFFB00030006),
    .INIT_12(256'hFFF8FFEDFFF4FFFFFFFEFFF1FFE8FFF20008001700130005000000080011000C),
    .INIT_13(256'hFFFAFFFA00040007FFF8FFE5FFE1FFF20007000E0005FFFD00050016001C000F),
    .INIT_14(256'h0000000C0017000EFFF4FFE1FFE4FFF70003FFFEFFF2FFF5000A001F001F000C),
    .INIT_15(256'h0008001E00240010FFF3FFE7FFF2FFFFFFFCFFEBFFE2FFF1000D001D00160005),
    .INIT_16(256'h001000280026000DFFF8FFF900070008FFF4FFDCFFDAFFF1000B00110004FFFC),
    .INIT_17(256'h00130026001A000500010011001D000FFFEEFFD7FFDEFFF70004FFFBFFEEFFF4),
    .INIT_18(256'h001000140004FFFB000D0028002C0010FFEDFFE1FFF00000FFF9FFE3FFDAFFF0),
    .INIT_19(256'h0005FFF8FFE8FFF400180034002D000CFFF4FFF9000A0009FFEDFFD1FFD2FFF1),
    .INIT_1A(256'hFFF5FFD9FFD2FFF0001C002F001E0004000200180024000FFFE5FFCCFFD9FFF7),
    .INIT_1B(256'hFFE4FFC3FFC9FFF2001600180002FFFB0014003400350010FFE5FFDAFFEF0000),
    .INIT_1C(256'hFFDAFFBFFFD3FFF80006FFF4FFE2FFF4002200420035000BFFF0FFF9000E0009),
    .INIT_1D(256'hFFDCFFD3FFEE0001FFEFFFCDFFC9FFF20027003A0022000300050020002C000E),
    .INIT_1E(256'hFFECFFFA00120008FFD9FFB3FFC0FFF4001E001B0000FFFB001D0042003E000D),
    .INIT_1F(256'h0008002B0035000BFFCCFFB1FFCDFFFA0007FFEEFFDBFFF600300052003C0009),
    .INIT_20(256'h0028005300480009FFD0FFCBFFED0001FFE7FFBFFFBFFFF50035004600250002),
    .INIT_21(256'h0041006400440005FFE7FFFC00180005FFCAFFA0FFB7FFF90027001FFFFEFFFD),
    .INIT_22(256'h0046005300280001000E0038003E0005FFBAFFA0FFC7FFFD0007FFE6FFD4FFFA),
    .INIT_23(256'h00310022FFFBFFFF0038006800520003FFC1FFC2FFEE0000FFDDFFAEFFB5FFFC),
    .INIT_24(256'h0006FFDCFFCB00010056007A004C0000FFE20000001E0000FFB6FF8BFFAEFFFF),
    .INIT_25(256'hFFCEFF99FFAA0005005B0062002AFFFF001500480048FFFDFFA4FF8DFFC20001),
    .INIT_26(256'hFF9EFF71FFA50008003E0024FFF70004004C0080005CFFF9FFB0FFB9FFEEFFFF),
    .INIT_27(256'hFF88FF77FFBE00060003FFCFFFC3000C007100920052FFF8FFDD00050024FFF9),
    .INIT_28(256'hFF9BFFAFFFF0FFFCFFBCFF80FFA0001300740073002BFFFE0020005B0052FFF0),
    .INIT_29(256'hFFD7000D002BFFEDFF7FFF53FF9C0014004C0025FFF2000B0066009C0066FFEB),
    .INIT_2A(256'h002F0073005CFFDEFF66FF5EFFBA000BFFFFFFBFFFBA001B009300AF0059FFEF),
    .INIT_2B(256'h008700BF006FFFD8FF82FFA5FFF3FFF7FFA3FF62FF96002600930085002CFFFE),
    .INIT_2C(256'h00BE00D1005EFFE2FFD200170033FFDCFF57FF30FF950025005C0026FFED0017),
    .INIT_2D(256'h00BA009B002BFFFF004300910065FFC5FF3BFF41FFB80012FFF8FFABFFB10031),
    .INIT_2E(256'h00700025FFE7002800B300E90078FFBFFF63FF9AFFF6FFEEFF82FF3CFF8D0041),
    .INIT_2F(256'hFFECFF90FFA8005100F700FA0062FFD2FFCD0024003BFFC3FF23FF04FF8E003B),
    .INIT_30(256'hFF55FF0DFF84006700ED00B4002A0001006000B7006FFFA1FF03FF1EFFB60019),
    .INIT_31(256'hFEDDFECDFF88005A00880022FFE1004200EF011E007FFF9BFF3BFF8DFFFAFFDF),
    .INIT_32(256'hFEB7FEF1FFB60022FFDAFF6CFFA0007F0143012F0065FFBDFFC800380042FF9D),
    .INIT_33(256'hFF05FF7EFFFEFFC8FF14FECDFF7C009E013100D500280008008A00EA0077FF6C),
    .INIT_34(256'hFFC40053004AFF64FE77FE81FF84008600A8001DFFDB006B014401670086FF67),
    .INIT_35(256'h00CA0134007FFF1BFE48FEB2FFB6002DFFBDFF39FF9800C701B201780067FF9F),
    .INIT_36(256'h01CA01D3008AFF15FEB5FF680003FFA0FEAFFE70FF7600F20196010200250014),
    .INIT_37(256'h026401E90068FF70FFC1007F0051FF03FDD6FE0EFF8100CA00D70015FFD500AF),
    .INIT_38(256'h0241014E0021002F013A01AE0085FE8FFD91FE4DFFB8003CFF8BFEE7FF910140),
    .INIT_39(256'h012A0005FFCE013202BE0291008EFE84FE2AFF430008FF55FDFEFDD1FF710187),
    .INIT_3A(256'hFF21FE44FF8B023603C502C30067FF19FFBE00D20057FE46FCA6FD3AFF800148),
    .INIT_3B(256'hFC62FC6DFF6D02D803BA01F2001D006F022E02AC008AFD65FC15FD81FFBB0055),
    .INIT_3C(256'hF961FB02FF81029201FFFFDEFFC90286051F045F008FFD25FCE3FEEC000EFE9D),
    .INIT_3D(256'hF6AAFAA7FFBF009DFDB7FC33FF86054E080D055B0065FE20FFBD01BB005DFC2C),
    .INIT_3E(256'hF4C6FCD90013FA8CF3E0F56BFF6C090C0A6A04C60018018D060E068D008DF902),
    .INIT_3F(256'h741E50860061BD03AF60D284FF8313A20BBBFE55FFC30E6418961212008FF3EE),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({addra,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(douta),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:0]),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_32 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_33 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(ena),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module FIR_blk_mem_gen_prim_wrapper_init__parameterized3
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_32 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_33 ;
  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h00010001FFFDFFFF0002000100000000FFFEFFFF00030001FFFE00000000FFFF),
    .INIT_01(256'h00000000FFFEFFFF00030001FFFE0000FFFFFFFF00030001FFFDFFFF00010000),
    .INIT_02(256'hFFFE0000FFFFFFFF00030001FFFDFFFF0001000000010001FFFDFFFF00030001),
    .INIT_03(256'hFFFDFFFF0001000000020001FFFCFFFF0003000100000000FFFEFFFF00030001),
    .INIT_04(256'hFFFCFFFF0003000000000000FFFDFFFF00040001FFFE0000FFFFFFFF00030001),
    .INIT_05(256'hFFFDFFFF00040001FFFD0000FFFF000000040001FFFCFFFF0001000000020001),
    .INIT_06(256'hFFFF000000040001FFFC00000001000000020001FFFCFFFF0004000000000000),
    .INIT_07(256'h0002000000030000FFFB00000004000000000000FFFC000000050000FFFD0000),
    .INIT_08(256'h0004000000000000FFFC000000060000FFFD0000FFFE000000050000FFFB0000),
    .INIT_09(256'h00060000FFFD0000FFFE000000060000FFFA00000002000000030000FFFA0000),
    .INIT_0A(256'h0007FFFFFFFA0000000200000004FFFFFFF900010005000000000000FFFB0000),
    .INIT_0B(256'h0004FFFFFFF80001000500000000FFFFFFFA00010007FFFFFFFC0000FFFE0001),
    .INIT_0C(256'h0001FFFFFFF900020008FFFFFFFC0000FFFD00010007FFFEFFF9000100020000),
    .INIT_0D(256'hFFFC0000FFFD00020008FFFDFFF80001000200000005FFFEFFF700020006FFFF),
    .INIT_0E(256'hFFF70002000200010006FFFDFFF600030007FFFF0001FFFFFFF800030009FFFE),
    .INIT_0F(256'hFFF500040007FFFF0001FFFEFFF70004000AFFFDFFFB0000FFFC00030009FFFC),
    .INIT_10(256'hFFF60006000BFFFCFFFB0000FFFC0004000BFFFBFFF70003000200010007FFFC),
    .INIT_11(256'hFFFB0005000CFFF9FFF60004000200020008FFFAFFF400060008FFFE0001FFFD),
    .INIT_12(256'h000200020008FFF9FFF300070008FFFE0002FFFCFFF60007000CFFFBFFFB0000),
    .INIT_13(256'h0009FFFE0002FFFBFFF50009000DFFF9FFFB0000FFFA0007000DFFF7FFF50004),
    .INIT_14(256'h000DFFF8FFFB0000FFFA0009000EFFF5FFF50005000100030009FFF7FFF20009),
    .INIT_15(256'h000EFFF3FFF4000600010004000AFFF4FFF2000B0009FFFD0003FFF9FFF4000C),
    .INIT_16(256'h000BFFF1FFF1000D0009FFFD0003FFF7FFF3000E000EFFF6FFFBFFFFFFF9000B),
    .INIT_17(256'h0004FFF5FFF20012000EFFF4FFFBFFFFFFF9000D000FFFF0FFF4000800010006),
    .INIT_18(256'hFFFBFFFEFFF80010000FFFEDFFF4000900010007000BFFEEFFF100100009FFFD),
    .INIT_19(256'hFFF4000A00000009000CFFEBFFF000130009FFFC0004FFF3FFF20015000EFFF2),
    .INIT_1A(256'hFFF100160008FFFC0004FFF0FFF20019000EFFF0FFFBFFFDFFF80014000FFFEA),
    .INIT_1B(256'hFFF2001D000EFFEEFFFCFFFCFFF80017000FFFE6FFF4000B0000000B000CFFE7),
    .INIT_1C(256'hFFF8001B000EFFE2FFF5000C0000000D000BFFE3FFF100190008FFFC0004FFED),
    .INIT_1D(256'hFFFF0010000BFFDEFFF2001C0007FFFC0004FFE9FFF30021000DFFEBFFFCFFFB),
    .INIT_1E(256'h0006FFFD0004FFE5FFF40026000BFFE9FFFDFFF9FFF80020000DFFDEFFF6000D),
    .INIT_1F(256'h000AFFE7FFFEFFF7FFF90024000CFFDAFFF8000EFFFF0013000AFFD9FFF40020),
    .INIT_20(256'h0009FFD5FFF9000FFFFF00160008FFD4FFF600230005FFFD0004FFE1FFF6002B),
    .INIT_21(256'h0006FFCFFFF900270003FFFE0003FFDDFFF800300007FFE4FFFEFFF5FFFA0029),
    .INIT_22(256'h0002FFD8FFFB00350004FFE2FFFFFFF3FFFC002F0006FFD0FFFC0010FFFF001A),
    .INIT_23(256'h0000FFF0FFFF00340002FFCCFFFE00110000001E0003FFC9FFFC002A0002FFFF),
    .INIT_24(256'h0001001100000022FFFFFFC30001002E000000000000FFD3FFFF003B0001FFE0),
    .INIT_25(256'h00060032FFFE0001FFFEFFCD00040040FFFDFFDE0000FFED0002003AFFFEFFC7),
    .INIT_26(256'h000A0046FFF8FFDC0001FFEA00060040FFF8FFC20005001100010026FFFAFFBD),
    .INIT_27(256'h000B0047FFF1FFBD000900110003002BFFF5FFB7000C0035FFFC0003FFFBFFC8),
    .INIT_28(256'h00050030FFEEFFB000130038FFF90005FFF7FFC20011004CFFF2FFDA0001FFE6),
    .INIT_29(256'hFFF70007FFF3FFBC001A0052FFECFFD90002FFE30011004DFFE9FFB9000D0011),
    .INIT_2A(256'hFFE4FFD70001FFDF00180053FFE0FFB40012001100070035FFE6FFAA001B003B),
    .INIT_2B(256'hFFD5FFB000180010000A003BFFDCFFA40024003EFFF4000AFFEDFFB600240057),
    .INIT_2C(256'hFFD1FF9E002F0041FFF1000CFFE6FFB0002F005DFFDCFFD70001FFDA0021005A),
    .INIT_2D(256'hFFDEFFA9003D0062FFD3FFD60000FFD6002B0060FFC9FFAC001E000F000F0040),
    .INIT_2E(256'hFFFEFFD200370067FFBAFFA80025000D00140046FFC3FF98003B0043FFEF000F),
    .INIT_2F(256'h002C000C001B004BFFB3FF9200490045FFEC0013FFD4FFA3004C0067FFC8FFD6),
    .INIT_30(256'h00590047FFE90016FFC8FF9D005F006CFFBCFFD6FFFCFFCD0046006DFFA9FFA4),
    .INIT_31(256'h00740070FFAFFFD6FFF9FFC800580073FF96FFA10034000A00230051FFA1FF8C),
    .INIT_32(256'h006D0078FF7FFF9F003D0008002D0056FF8AFF87006C0048FFE60019FFB9FF97),
    .INIT_33(256'h003A005CFF70FF8300820049FFE4001DFFA7FF91008E0074FF9FFFD6FFF4FFC3),
    .INIT_34(256'hFFE10021FF91FF8C00AD0077FF8CFFD8FFEEFFBF0086007EFF64FF9D00480005),
    .INIT_35(256'hFF76FFD9FFE6FFBA00A70082FF43FF9B00540003004B0061FF4FFF7E009C0049),
    .INIT_36(256'hFF19FF9A0062000000600066FF26FF7B00BD0049FFDF0025FF74FF8700D3007A),
    .INIT_37(256'hFEF0FF7700E60049FFDD0029FF4FFF820105007CFF5AFFDBFFDBFFB600D00087),
    .INIT_38(256'hFF1DFF7E0147007EFF36FFDCFFCBFFB10106008BFEE2FF990074FFFD007D006B),
    .INIT_39(256'hFFB3FFAD0153008EFE96FF99008CFFFA00A5006FFEA6FF75011E0048FFDC002C),
    .INIT_3A(256'h00AFFFF700E30073FE38FF7301700047FFDA0030FED3FF7B01A5007FFF03FFDF),
    .INIT_3B(256'h01F40045FFD90034FE5DFF77023A007FFEB5FFE1FF8EFFA901CA0090FE24FF99),
    .INIT_3C(256'h0350007FFE26FFE4FF49FFA6029C0092FD5DFF9A00EAFFF4014B0076FD82FF72),
    .INIT_3D(256'h04860094FB9FFF9B0169FFF002280079FC0CFF7102FD0043FFD80037FD7AFF75),
    .INIT_3E(256'h055C007CF716FF71063D0040FFD8003BFB00FF730630007FFCBEFFE7FEA2FFA3),
    .INIT_3F(256'h45A7003EC287FF722858007DF130FFEAFA6BFFA00EBF0095F399FF9D036DFFED),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({addra,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(douta),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:0]),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_32 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_33 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(ena),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module FIR_blk_mem_gen_prim_wrapper_init__parameterized4
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_32 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_33 ;
  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000FFFF00010001FFFE00010000FFFF00000002FFFE00000001FFFFFFFF0002),
    .INIT_01(256'h0000FFFF00000002FFFE00010001FFFFFFFF0002FFFF000000010000FFFE0002),
    .INIT_02(256'h0001FFFFFFFF0002FFFE000000010000FFFE0002FFFFFFFF00010001FFFE0002),
    .INIT_03(256'h00010000FFFE0002FFFFFFFF00010001FFFE00020000FFFF00000002FFFE0001),
    .INIT_04(256'h00010001FFFE00020000FFFF00010002FFFE00010001FFFFFFFF0002FFFE0000),
    .INIT_05(256'h00010002FFFD00010001FFFF00000002FFFE00000002FFFFFFFE0003FFFFFFFF),
    .INIT_06(256'h00000003FFFD00000002FFFFFFFE0003FFFEFFFF00020000FFFD00020000FFFE),
    .INIT_07(256'hFFFE0003FFFEFFFF00020000FFFD00030000FFFE00010002FFFD00020001FFFE),
    .INIT_08(256'hFFFD0003FFFFFFFE00010002FFFC00020001FFFE00000003FFFD00010002FFFF),
    .INIT_09(256'hFFFC00030001FFFE00000003FFFC00010002FFFEFFFF0004FFFEFFFF00020000),
    .INIT_0A(256'hFFFC00010002FFFEFFFF0004FFFDFFFF00030000FFFD0004FFFFFFFE00020001),
    .INIT_0B(256'hFFFC00000003FFFFFFFD0005FFFEFFFE00020001FFFC00030001FFFD00010003),
    .INIT_0C(256'hFFFEFFFE00030001FFFB00040000FFFD00010003FFFB00020002FFFDFFFF0005),
    .INIT_0D(256'h0000FFFC00020003FFFA00030002FFFDFFFF0005FFFB00000003FFFFFFFD0005),
    .INIT_0E(256'h0002FFFC00000006FFFB00000004FFFEFFFD0006FFFDFFFE00040001FFFB0005),
    .INIT_0F(256'h0004FFFDFFFD0007FFFCFFFE00040000FFFA0006FFFFFFFC00020003FFF90003),
    .INIT_10(256'h0005FFFFFFFA0007FFFFFFFC00030003FFF900040002FFFB00000006FFF90001),
    .INIT_11(256'h00040003FFF800060002FFFB00010006FFF800020004FFFCFFFD0008FFFBFFFE),
    .INIT_12(256'h00020006FFF700030005FFFBFFFD0009FFFAFFFE0006FFFFFFFA0008FFFEFFFB),
    .INIT_13(256'hFFFE0009FFF8FFFF0007FFFEFFF9000AFFFDFFFB00050002FFF700070001FFFA),
    .INIT_14(256'hFFF9000BFFFCFFFB00060002FFF600080001FFF900030007FFF600040005FFFA),
    .INIT_15(256'hFFF5000A0000FFF800040007FFF400050005FFF9FFFF000AFFF700000007FFFD),
    .INIT_16(256'hFFF300070005FFF80000000BFFF500000008FFFBFFFA000CFFFAFFFB00080001),
    .INIT_17(256'hFFF300020009FFFAFFFA000EFFF8FFFB00090000FFF5000CFFFFFFF800050006),
    .INIT_18(256'hFFF6FFFC000AFFFFFFF4000EFFFEFFF700070006FFF200090005FFF60001000B),
    .INIT_19(256'hFFFCFFF600090005FFF0000B0004FFF50002000CFFF100030009FFF8FFFB000F),
    .INIT_1A(256'h0003FFF40004000CFFEF0005000AFFF6FFFB0010FFF4FFFC000CFFFDFFF40010),
    .INIT_1B(256'h000AFFF4FFFD0012FFF2FFFD000DFFFBFFF40012FFFAFFF6000B0004FFEF000D),
    .INIT_1C(256'h000FFFF9FFF40014FFF8FFF6000D0003FFEE000F0002FFF20006000CFFED0007),
    .INIT_1D(256'h000F0001FFED00120001FFF10008000CFFEB0009000AFFF2FFFE0013FFEFFFFE),
    .INIT_1E(256'h000B000BFFE9000C000AFFF000000014FFEC00000010FFF6FFF50016FFF6FFF6),
    .INIT_1F(256'h00020014FFE900020011FFF4FFF60018FFF3FFF60011FFFFFFEC0015FFFFFFF0),
    .INIT_20(256'hFFF7001AFFEFFFF70014FFFCFFEB0018FFFDFFEF000E000AFFE7000F0009FFED),
    .INIT_21(256'hFFEB001BFFFAFFEE00110008FFE400120008FFEB00050015FFE600050012FFF1),
    .INIT_22(256'hFFE300160007FFE900080015FFE300070013FFEEFFF9001DFFECFFF80016FFFA),
    .INIT_23(256'hFFDF000B0013FFEAFFFB001EFFE8FFFA0019FFF6FFEB001FFFF7FFED00140006),
    .INIT_24(256'hFFE4FFFC001BFFF2FFEC0022FFF3FFED00180004FFE1001A0005FFE6000C0014),
    .INIT_25(256'hFFEFFFED001C0001FFDF001F0003FFE400100013FFDC000F0013FFE6FFFE0020),
    .INIT_26(256'hFFFFFFE200140012FFD800130013FFE200010021FFDFFFFF001DFFEEFFED0026),
    .INIT_27(256'h0012FFDE00050022FFDA0002001FFFE9FFEF0029FFEAFFEE0020FFFDFFDE0024),
    .INIT_28(256'h0021FFE4FFF1002DFFE5FFEF0024FFF8FFDD0029FFFCFFE000190010FFD50019),
    .INIT_29(256'h0028FFF3FFDD002EFFF7FFDE001F000DFFD1001E0010FFDA000A0023FFD40006),
    .INIT_2A(256'h00250009FFCE0025000EFFD500100023FFCF000B0022FFDEFFF50030FFDEFFF1),
    .INIT_2B(256'h00160022FFC900110023FFD8FFF90033FFD8FFF4002DFFEDFFDE0034FFF2FFDD),
    .INIT_2C(256'hFFFE0036FFD0FFF70031FFE6FFDF003AFFEBFFDD002C0005FFCB002C000BFFD1),
    .INIT_2D(256'hFFE10041FFE4FFDD0033FFFFFFC800340007FFCD001E0020FFC200180024FFD1),
    .INIT_2E(256'hFFC6003D0001FFC80026001EFFBC00200023FFC900040039FFC7FFFC0036FFDE),
    .INIT_2F(256'hFFB5002A0022FFC1000C003BFFBE0002003AFFD5FFE40048FFDBFFDD003BFFF8),
    .INIT_30(256'hFFB40009003EFFCAFFE8004FFFD1FFDF0044FFF0FFC40047FFFBFFC40030001A),
    .INIT_31(256'hFFC5FFE1004DFFE5FFC30052FFF3FFC0003C0015FFAE00350020FFB80015003C),
    .INIT_32(256'hFFE9FFBC0049000EFFA60042001DFFAE0020003DFFA800120042FFBEFFEE0056),
    .INIT_33(256'h0018FFA3002E003DFF9A001D0046FFB0FFF6005EFFB7FFE50058FFD9FFC3005F),
    .INIT_34(256'h004AFF9F00000066FFA6FFEB0063FFCAFFC4006DFFDCFFB800580005FF9E0051),
    .INIT_35(256'h0071FFB7FFC6007EFFCCFFB5006BFFFAFF9500640011FF96003F003CFF8B002C),
    .INIT_36(256'h0081FFEAFF8C007B0008FF8700540039FF78003E004DFF8B000D006FFF91FFF3),
    .INIT_37(256'h00700034FF6100560050FF71001F007AFF77FFFE0081FF9FFFC90093FFB7FFB1),
    .INIT_38(256'h00380086FF55000F0096FF7EFFD000ADFF9BFFAF009EFFD5FF800099FFFAFF75),
    .INIT_39(256'hFFDA00D1FF74FFAC00C6FFB7FF7200C1FFE7FF5E0096002BFF4300760053FF4F),
    .INIT_3A(256'hFF5F00FDFFC8FF3D00CE001EFF1800A60055FF20005D0097FF24002700B1FF51),
    .INIT_3B(256'hFED400F40056FED4009800AEFED8004E00DAFF0BFFEC0106FF38FFAA0101FF89),
    .INIT_3C(256'hFE4B00970123FE8B000E0162FECEFFA90166FF39FF400162FF94FF08012A0006),
    .INIT_3D(256'hFDD8FFA80247FE88FEFF0238FF26FE9B01E7FFD3FE4E018E0058FE44010B00D9),
    .INIT_3E(256'hFD8BFD210463FF2DFCAC03610058FCAB0249014AFCD9015501D8FD530062023A),
    .INIT_3F(256'h5D6FB5C01E860807EBC4088507A0F48F027D071AF8BAFFA7064CFB8AFDFD0570),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({addra,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(douta),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:0]),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_32 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_33 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(ena),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module FIR_blk_mem_gen_top
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [7:0]douta;
  input clka;
  input ena;
  input [10:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [10:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire [0:0]wea;

  FIR_blk_mem_gen_generic_cstr \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module FIR_blk_mem_gen_top__parameterized0
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_generic_cstr__parameterized0 \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module FIR_blk_mem_gen_top__parameterized1
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_generic_cstr__parameterized1 \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module FIR_blk_mem_gen_top__parameterized2
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_generic_cstr__parameterized2 \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module FIR_blk_mem_gen_top__parameterized3
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_generic_cstr__parameterized3 \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module FIR_blk_mem_gen_top__parameterized4
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_generic_cstr__parameterized4 \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module FIR_blk_mem_gen_top__parameterized5
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_generic_cstr__parameterized5 \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* C_ADDRA_WIDTH = "11" *) (* C_ADDRB_WIDTH = "11" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "1" *) 
(* C_COUNT_36K_BRAM = "0" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.3396 mW" *) 
(* C_FAMILY = "spartan7" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "RAM_2048_8bit.mem" *) 
(* C_INIT_FILE_NAME = "no_coe_file_loaded" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "0" *) 
(* C_MEM_TYPE = "0" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "2048" *) (* C_READ_DEPTH_B = "2048" *) (* C_READ_LATENCY_A = "1" *) 
(* C_READ_LATENCY_B = "1" *) (* C_READ_WIDTH_A = "8" *) (* C_READ_WIDTH_B = "8" *) 
(* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) (* C_RST_PRIORITY_A = "CE" *) 
(* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) (* C_USE_BRAM_BLOCK = "0" *) 
(* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) (* C_USE_DEFAULT_DATA = "0" *) 
(* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) (* C_USE_URAM = "0" *) 
(* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) (* C_WRITE_DEPTH_A = "2048" *) 
(* C_WRITE_DEPTH_B = "2048" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
(* C_WRITE_WIDTH_A = "8" *) (* C_WRITE_WIDTH_B = "8" *) (* C_XDEVICEFAMILY = "spartan7" *) 
(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2" *) (* downgradeipidentifiedwarnings = "yes" *) 
module FIR_blk_mem_gen_v8_4_2
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [10:0]addra;
  input [7:0]dina;
  output [7:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [10:0]addrb;
  input [7:0]dinb;
  output [7:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [10:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [7:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [7:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [10:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [10:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire [0:0]wea;

  assign dbiterr = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[10] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[10] = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  FIR_blk_mem_gen_v8_4_2_synth inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* C_ADDRA_WIDTH = "10" *) (* C_ADDRB_WIDTH = "10" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "1" *) 
(* C_COUNT_36K_BRAM = "0" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.3548 mW" *) 
(* C_FAMILY = "spartan7" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "ROM_1024_16bit_0.mem" *) 
(* C_INIT_FILE_NAME = "ROM_1024_16bit_0.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "3" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "1024" *) (* C_READ_DEPTH_B = "1024" *) (* C_READ_LATENCY_A = "1" *) 
(* C_READ_LATENCY_B = "1" *) (* C_READ_WIDTH_A = "16" *) (* C_READ_WIDTH_B = "16" *) 
(* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) (* C_RST_PRIORITY_A = "CE" *) 
(* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) (* C_USE_BRAM_BLOCK = "0" *) 
(* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) (* C_USE_DEFAULT_DATA = "0" *) 
(* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) (* C_USE_URAM = "0" *) 
(* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) (* C_WRITE_DEPTH_A = "1024" *) 
(* C_WRITE_DEPTH_B = "1024" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
(* C_WRITE_WIDTH_A = "16" *) (* C_WRITE_WIDTH_B = "16" *) (* C_XDEVICEFAMILY = "spartan7" *) 
(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2" *) (* downgradeipidentifiedwarnings = "yes" *) 
module FIR_blk_mem_gen_v8_4_2__parameterized1
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [9:0]addra;
  input [15:0]dina;
  output [15:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [9:0]addrb;
  input [15:0]dinb;
  output [15:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [9:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [15:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [15:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [9:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  assign dbiterr = \<const0> ;
  assign doutb[15] = \<const0> ;
  assign doutb[14] = \<const0> ;
  assign doutb[13] = \<const0> ;
  assign doutb[12] = \<const0> ;
  assign doutb[11] = \<const0> ;
  assign doutb[10] = \<const0> ;
  assign doutb[9] = \<const0> ;
  assign doutb[8] = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  FIR_blk_mem_gen_v8_4_2_synth__parameterized0 inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* C_ADDRA_WIDTH = "10" *) (* C_ADDRB_WIDTH = "10" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "1" *) 
(* C_COUNT_36K_BRAM = "0" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.3548 mW" *) 
(* C_FAMILY = "spartan7" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "ROM_1024_16bit_5.mem" *) 
(* C_INIT_FILE_NAME = "ROM_1024_16bit_5.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "3" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "1024" *) (* C_READ_DEPTH_B = "1024" *) (* C_READ_LATENCY_A = "1" *) 
(* C_READ_LATENCY_B = "1" *) (* C_READ_WIDTH_A = "16" *) (* C_READ_WIDTH_B = "16" *) 
(* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) (* C_RST_PRIORITY_A = "CE" *) 
(* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) (* C_USE_BRAM_BLOCK = "0" *) 
(* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) (* C_USE_DEFAULT_DATA = "0" *) 
(* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) (* C_USE_URAM = "0" *) 
(* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) (* C_WRITE_DEPTH_A = "1024" *) 
(* C_WRITE_DEPTH_B = "1024" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
(* C_WRITE_WIDTH_A = "16" *) (* C_WRITE_WIDTH_B = "16" *) (* C_XDEVICEFAMILY = "spartan7" *) 
(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2" *) (* downgradeipidentifiedwarnings = "yes" *) 
module FIR_blk_mem_gen_v8_4_2__parameterized11
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [9:0]addra;
  input [15:0]dina;
  output [15:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [9:0]addrb;
  input [15:0]dinb;
  output [15:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [9:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [15:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [15:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [9:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  assign dbiterr = \<const0> ;
  assign doutb[15] = \<const0> ;
  assign doutb[14] = \<const0> ;
  assign doutb[13] = \<const0> ;
  assign doutb[12] = \<const0> ;
  assign doutb[11] = \<const0> ;
  assign doutb[10] = \<const0> ;
  assign doutb[9] = \<const0> ;
  assign doutb[8] = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  FIR_blk_mem_gen_v8_4_2_synth__parameterized5 inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* C_ADDRA_WIDTH = "10" *) (* C_ADDRB_WIDTH = "10" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "1" *) 
(* C_COUNT_36K_BRAM = "0" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.3548 mW" *) 
(* C_FAMILY = "spartan7" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "ROM_1024_16bit_1.mem" *) 
(* C_INIT_FILE_NAME = "ROM_1024_16bit_1.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "3" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "1024" *) (* C_READ_DEPTH_B = "1024" *) (* C_READ_LATENCY_A = "1" *) 
(* C_READ_LATENCY_B = "1" *) (* C_READ_WIDTH_A = "16" *) (* C_READ_WIDTH_B = "16" *) 
(* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) (* C_RST_PRIORITY_A = "CE" *) 
(* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) (* C_USE_BRAM_BLOCK = "0" *) 
(* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) (* C_USE_DEFAULT_DATA = "0" *) 
(* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) (* C_USE_URAM = "0" *) 
(* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) (* C_WRITE_DEPTH_A = "1024" *) 
(* C_WRITE_DEPTH_B = "1024" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
(* C_WRITE_WIDTH_A = "16" *) (* C_WRITE_WIDTH_B = "16" *) (* C_XDEVICEFAMILY = "spartan7" *) 
(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2" *) (* downgradeipidentifiedwarnings = "yes" *) 
module FIR_blk_mem_gen_v8_4_2__parameterized3
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [9:0]addra;
  input [15:0]dina;
  output [15:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [9:0]addrb;
  input [15:0]dinb;
  output [15:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [9:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [15:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [15:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [9:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  assign dbiterr = \<const0> ;
  assign doutb[15] = \<const0> ;
  assign doutb[14] = \<const0> ;
  assign doutb[13] = \<const0> ;
  assign doutb[12] = \<const0> ;
  assign doutb[11] = \<const0> ;
  assign doutb[10] = \<const0> ;
  assign doutb[9] = \<const0> ;
  assign doutb[8] = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  FIR_blk_mem_gen_v8_4_2_synth__parameterized1 inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* C_ADDRA_WIDTH = "10" *) (* C_ADDRB_WIDTH = "10" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "1" *) 
(* C_COUNT_36K_BRAM = "0" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.3548 mW" *) 
(* C_FAMILY = "spartan7" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "ROM_1024_16bit_2.mem" *) 
(* C_INIT_FILE_NAME = "ROM_1024_16bit_2.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "3" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "1024" *) (* C_READ_DEPTH_B = "1024" *) (* C_READ_LATENCY_A = "1" *) 
(* C_READ_LATENCY_B = "1" *) (* C_READ_WIDTH_A = "16" *) (* C_READ_WIDTH_B = "16" *) 
(* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) (* C_RST_PRIORITY_A = "CE" *) 
(* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) (* C_USE_BRAM_BLOCK = "0" *) 
(* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) (* C_USE_DEFAULT_DATA = "0" *) 
(* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) (* C_USE_URAM = "0" *) 
(* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) (* C_WRITE_DEPTH_A = "1024" *) 
(* C_WRITE_DEPTH_B = "1024" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
(* C_WRITE_WIDTH_A = "16" *) (* C_WRITE_WIDTH_B = "16" *) (* C_XDEVICEFAMILY = "spartan7" *) 
(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2" *) (* downgradeipidentifiedwarnings = "yes" *) 
module FIR_blk_mem_gen_v8_4_2__parameterized5
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [9:0]addra;
  input [15:0]dina;
  output [15:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [9:0]addrb;
  input [15:0]dinb;
  output [15:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [9:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [15:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [15:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [9:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  assign dbiterr = \<const0> ;
  assign doutb[15] = \<const0> ;
  assign doutb[14] = \<const0> ;
  assign doutb[13] = \<const0> ;
  assign doutb[12] = \<const0> ;
  assign doutb[11] = \<const0> ;
  assign doutb[10] = \<const0> ;
  assign doutb[9] = \<const0> ;
  assign doutb[8] = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  FIR_blk_mem_gen_v8_4_2_synth__parameterized2 inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* C_ADDRA_WIDTH = "10" *) (* C_ADDRB_WIDTH = "10" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "1" *) 
(* C_COUNT_36K_BRAM = "0" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.3548 mW" *) 
(* C_FAMILY = "spartan7" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "ROM_1024_16bit_3.mem" *) 
(* C_INIT_FILE_NAME = "ROM_1024_16bit_3.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "3" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "1024" *) (* C_READ_DEPTH_B = "1024" *) (* C_READ_LATENCY_A = "1" *) 
(* C_READ_LATENCY_B = "1" *) (* C_READ_WIDTH_A = "16" *) (* C_READ_WIDTH_B = "16" *) 
(* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) (* C_RST_PRIORITY_A = "CE" *) 
(* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) (* C_USE_BRAM_BLOCK = "0" *) 
(* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) (* C_USE_DEFAULT_DATA = "0" *) 
(* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) (* C_USE_URAM = "0" *) 
(* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) (* C_WRITE_DEPTH_A = "1024" *) 
(* C_WRITE_DEPTH_B = "1024" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
(* C_WRITE_WIDTH_A = "16" *) (* C_WRITE_WIDTH_B = "16" *) (* C_XDEVICEFAMILY = "spartan7" *) 
(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2" *) (* downgradeipidentifiedwarnings = "yes" *) 
module FIR_blk_mem_gen_v8_4_2__parameterized7
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [9:0]addra;
  input [15:0]dina;
  output [15:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [9:0]addrb;
  input [15:0]dinb;
  output [15:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [9:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [15:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [15:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [9:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  assign dbiterr = \<const0> ;
  assign doutb[15] = \<const0> ;
  assign doutb[14] = \<const0> ;
  assign doutb[13] = \<const0> ;
  assign doutb[12] = \<const0> ;
  assign doutb[11] = \<const0> ;
  assign doutb[10] = \<const0> ;
  assign doutb[9] = \<const0> ;
  assign doutb[8] = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  FIR_blk_mem_gen_v8_4_2_synth__parameterized3 inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* C_ADDRA_WIDTH = "10" *) (* C_ADDRB_WIDTH = "10" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "1" *) 
(* C_COUNT_36K_BRAM = "0" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.3548 mW" *) 
(* C_FAMILY = "spartan7" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "ROM_1024_16bit_4.mem" *) 
(* C_INIT_FILE_NAME = "ROM_1024_16bit_4.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "3" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "1024" *) (* C_READ_DEPTH_B = "1024" *) (* C_READ_LATENCY_A = "1" *) 
(* C_READ_LATENCY_B = "1" *) (* C_READ_WIDTH_A = "16" *) (* C_READ_WIDTH_B = "16" *) 
(* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) (* C_RST_PRIORITY_A = "CE" *) 
(* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) (* C_USE_BRAM_BLOCK = "0" *) 
(* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) (* C_USE_DEFAULT_DATA = "0" *) 
(* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) (* C_USE_URAM = "0" *) 
(* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) (* C_WRITE_DEPTH_A = "1024" *) 
(* C_WRITE_DEPTH_B = "1024" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
(* C_WRITE_WIDTH_A = "16" *) (* C_WRITE_WIDTH_B = "16" *) (* C_XDEVICEFAMILY = "spartan7" *) 
(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2" *) (* downgradeipidentifiedwarnings = "yes" *) 
module FIR_blk_mem_gen_v8_4_2__parameterized9
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [9:0]addra;
  input [15:0]dina;
  output [15:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [9:0]addrb;
  input [15:0]dinb;
  output [15:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [9:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [15:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [15:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [9:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  assign dbiterr = \<const0> ;
  assign doutb[15] = \<const0> ;
  assign doutb[14] = \<const0> ;
  assign doutb[13] = \<const0> ;
  assign doutb[12] = \<const0> ;
  assign doutb[11] = \<const0> ;
  assign doutb[10] = \<const0> ;
  assign doutb[9] = \<const0> ;
  assign doutb[8] = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  FIR_blk_mem_gen_v8_4_2_synth__parameterized4 inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2_synth" *) 
module FIR_blk_mem_gen_v8_4_2_synth
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [7:0]douta;
  input clka;
  input ena;
  input [10:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [10:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire [0:0]wea;

  FIR_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2_synth" *) 
module FIR_blk_mem_gen_v8_4_2_synth__parameterized0
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_top__parameterized0 \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2_synth" *) 
module FIR_blk_mem_gen_v8_4_2_synth__parameterized1
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_top__parameterized1 \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2_synth" *) 
module FIR_blk_mem_gen_v8_4_2_synth__parameterized2
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_top__parameterized2 \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2_synth" *) 
module FIR_blk_mem_gen_v8_4_2_synth__parameterized3
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_top__parameterized3 \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2_synth" *) 
module FIR_blk_mem_gen_v8_4_2_synth__parameterized4
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_top__parameterized4 \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2_synth" *) 
module FIR_blk_mem_gen_v8_4_2_synth__parameterized5
   (douta,
    clka,
    ena,
    addra);
  output [15:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  FIR_blk_mem_gen_top__parameterized5 \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
