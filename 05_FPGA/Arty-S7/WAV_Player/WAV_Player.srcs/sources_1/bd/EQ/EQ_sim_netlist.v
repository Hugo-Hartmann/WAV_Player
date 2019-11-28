// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Nov  6 15:29:36 2019
// Host        : L-1V1ZTY1 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/bd/EQ/EQ_sim_netlist.v
// Design      : EQ
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* hw_handoff = "EQ.hwdef" *) 
(* NotValidForBitStream *)
module EQ
   (EQ_din,
    EQ_din_band,
    EQ_dout,
    EQ_en,
    EQ_level_dout,
    EQ_select,
    EQ_vol_down,
    EQ_vol_up,
    clk,
    reset_n);
  input [7:0]EQ_din;
  input [47:0]EQ_din_band;
  output [63:0]EQ_dout;
  input EQ_en;
  output [39:0]EQ_level_dout;
  input [3:0]EQ_select;
  input EQ_vol_down;
  input EQ_vol_up;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN EQ_clk, FREQ_HZ 108000000, INSERT_VIP 0, PHASE 0.000" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 RST.RESET_N RST" *) (* x_interface_parameter = "XIL_INTERFACENAME RST.RESET_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset_n;

  wire [7:0]EQ_din;
  wire [47:0]EQ_din_band;
  wire [63:0]EQ_dout;
  wire EQ_en;
  wire [39:0]EQ_level_dout;
  wire [3:0]EQ_select;
  wire EQ_vol_down;
  wire EQ_vol_up;
  wire clk;
  wire reset_n;

  (* CHECK_LICENSE_TYPE = "EQ_EQ_stage_0_0,EQ_stage,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* ip_definition_source = "module_ref" *) 
  (* x_core_info = "EQ_stage,Vivado 2018.3" *) 
  EQ_EQ_EQ_stage_0_0 EQ_stage_0
       (.EQ_din(EQ_din),
        .EQ_din_band(EQ_din_band),
        .EQ_dout(EQ_dout),
        .EQ_en(EQ_en),
        .EQ_level_dout(EQ_level_dout),
        .EQ_select(EQ_select),
        .EQ_vol_down(EQ_vol_down),
        .EQ_vol_up(EQ_vol_up),
        .clk(clk),
        .reset_n(reset_n));
endmodule

(* CHECK_LICENSE_TYPE = "EQ_EQ_stage_0_0,EQ_stage,{}" *) (* ORIG_REF_NAME = "EQ_EQ_stage_0_0" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "EQ_stage,Vivado 2018.3" *) 
module EQ_EQ_EQ_stage_0_0
   (clk,
    reset_n,
    EQ_en,
    EQ_select,
    EQ_vol_up,
    EQ_vol_down,
    EQ_din_band,
    EQ_din,
    EQ_dout,
    EQ_level_dout);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 108000000, PHASE 0.000, CLK_DOMAIN EQ_clk, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 reset_n RST" *) (* x_interface_parameter = "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset_n;
  input EQ_en;
  input [3:0]EQ_select;
  input EQ_vol_up;
  input EQ_vol_down;
  input [47:0]EQ_din_band;
  input [7:0]EQ_din;
  output [63:0]EQ_dout;
  output [39:0]EQ_level_dout;

  wire [7:0]EQ_din;
  wire [47:0]EQ_din_band;
  wire [63:0]EQ_dout;
  wire \EQ_dout_reg[63]_i_5_n_0 ;
  wire EQ_en;
  wire [39:0]EQ_level_dout;
  wire [3:0]EQ_select;
  wire EQ_vol_down;
  wire EQ_vol_up;
  wire U0_n_0;
  wire clk;
  wire reset_n;

  FDCE \EQ_dout_reg[63]_i_5 
       (.C(clk),
        .CE(1'b1),
        .CLR(U0_n_0),
        .D(1'b1),
        .Q(\EQ_dout_reg[63]_i_5_n_0 ));
  EQ_EQ_stage U0
       (.D({EQ_din_band,EQ_din}),
        .EQ_dout(EQ_dout),
        .\EQ_dout_reg[23]_0 (\EQ_dout_reg[63]_i_5_n_0 ),
        .EQ_en(EQ_en),
        .EQ_select(EQ_select[2:0]),
        .EQ_vol_down(EQ_vol_down),
        .EQ_vol_up(EQ_vol_up),
        .Q(EQ_level_dout[4:0]),
        .clk(clk),
        .reset_n(reset_n),
        .reset_n_0(U0_n_0),
        .\vol_data_reg[1][4] (EQ_level_dout[9:5]),
        .\vol_data_reg[2][4] (EQ_level_dout[14:10]),
        .\vol_data_reg[3][4] (EQ_level_dout[19:15]),
        .\vol_data_reg[4][4] (EQ_level_dout[24:20]),
        .\vol_data_reg[5][4] (EQ_level_dout[29:25]),
        .\vol_data_reg[6][4] (EQ_level_dout[34:30]),
        .\vol_data_reg[7][4] (EQ_level_dout[39:35]));
endmodule

(* ORIG_REF_NAME = "EQ_stage" *) 
module EQ_EQ_stage
   (reset_n_0,
    Q,
    \vol_data_reg[1][4] ,
    \vol_data_reg[2][4] ,
    \vol_data_reg[3][4] ,
    \vol_data_reg[4][4] ,
    \vol_data_reg[5][4] ,
    \vol_data_reg[6][4] ,
    \vol_data_reg[7][4] ,
    EQ_dout,
    \EQ_dout_reg[23]_0 ,
    EQ_select,
    clk,
    EQ_en,
    D,
    reset_n,
    EQ_vol_down,
    EQ_vol_up);
  output reset_n_0;
  output [4:0]Q;
  output [4:0]\vol_data_reg[1][4] ;
  output [4:0]\vol_data_reg[2][4] ;
  output [4:0]\vol_data_reg[3][4] ;
  output [4:0]\vol_data_reg[4][4] ;
  output [4:0]\vol_data_reg[5][4] ;
  output [4:0]\vol_data_reg[6][4] ;
  output [4:0]\vol_data_reg[7][4] ;
  output [63:0]EQ_dout;
  input \EQ_dout_reg[23]_0 ;
  input [2:0]EQ_select;
  input clk;
  input EQ_en;
  input [55:0]D;
  input reset_n;
  input EQ_vol_down;
  input EQ_vol_up;

  wire [55:0]D;
  wire [63:0]EQ_dout;
  wire [63:32]EQ_dout0;
  wire \EQ_dout[15]_i_1_n_0 ;
  wire \EQ_dout[23]_i_1_n_0 ;
  wire \EQ_dout[31]_i_1_n_0 ;
  wire \EQ_dout[38]_i_2_n_0 ;
  wire \EQ_dout[39]_i_1_n_0 ;
  wire \EQ_dout[47]_i_1_n_0 ;
  wire \EQ_dout[54]_i_2_n_0 ;
  wire \EQ_dout[55]_i_1_n_0 ;
  wire \EQ_dout[63]_i_1_n_0 ;
  wire \EQ_dout[63]_i_3_n_0 ;
  wire \EQ_dout[7]_i_1_n_0 ;
  wire \EQ_dout_reg[23]_0 ;
  wire EQ_en;
  wire [2:0]EQ_select;
  wire EQ_vol_down;
  wire EQ_vol_up;
  wire \FSM_onehot_current_state[1]_i_1_n_0 ;
  wire \FSM_onehot_current_state[2]_i_1_n_0 ;
  wire \FSM_onehot_current_state_reg_n_0_[0] ;
  wire \FSM_onehot_current_state_reg_n_0_[2] ;
  wire \FSM_onehot_current_state_reg_n_0_[3] ;
  wire \FSM_onehot_current_state_reg_n_0_[4] ;
  wire [4:0]Q;
  wire \ROM0.U_ROM_i_7_n_3 ;
  wire [15:0]ROM_out;
  wire U_Mult_n_32;
  wire U_Mult_n_33;
  wire U_Mult_n_34;
  wire U_Mult_n_35;
  wire U_Mult_n_36;
  wire U_Mult_n_37;
  wire U_Mult_n_38;
  wire U_Mult_n_39;
  wire U_Mult_n_40;
  wire U_Mult_n_41;
  wire U_Mult_n_42;
  wire U_Mult_n_43;
  wire U_Mult_n_44;
  wire U_Mult_n_45;
  wire U_Mult_n_46;
  wire U_Mult_n_47;
  wire U_Mult_n_48;
  wire U_Mult_n_49;
  wire U_Mult_n_50;
  wire U_Mult_n_51;
  wire U_Mult_n_52;
  wire U_Mult_n_53;
  wire U_Mult_n_54;
  wire U_Mult_n_55;
  wire U_Mult_n_58;
  wire U_Mult_n_59;
  wire U_Mult_n_60;
  wire U_Mult_n_61;
  wire U_Mult_n_62;
  wire U_Mult_n_63;
  wire U_Mult_n_64;
  wire U_Mult_n_65;
  wire U_Mult_n_66;
  wire U_Mult_n_67;
  wire U_Mult_n_68;
  wire U_Mult_n_69;
  wire U_Mult_n_70;
  wire U_Mult_n_71;
  wire U_Mult_n_72;
  wire U_Mult_n_73;
  wire U_Mult_n_74;
  wire U_Mult_n_75;
  wire U_Mult_n_76;
  wire U_Mult_n_77;
  wire U_Mult_n_78;
  wire U_Mult_n_79;
  wire U_Mult_n_80;
  wire U_Mult_n_81;
  wire U_Mult_n_82;
  wire U_Mult_n_83;
  wire U_Mult_n_84;
  wire U_Mult_n_85;
  wire U_Mult_n_86;
  wire U_Mult_n_87;
  wire U_Mult_n_88;
  wire [15:0]Volume_coef;
  wire [5:4]Volume_data1;
  wire [4:0]a;
  wire a1_carry_i_2_n_0;
  wire a1_carry_i_3_n_0;
  wire a1_carry_i_4_n_0;
  wire a1_carry_i_5_n_0;
  wire a1_carry_n_0;
  wire a1_carry_n_1;
  wire a1_carry_n_2;
  wire a1_carry_n_3;
  wire a1_carry_n_4;
  wire a1_carry_n_5;
  wire a1_carry_n_6;
  wire a1_carry_n_7;
  wire \accu[0]_i_1_n_0 ;
  wire accu_clr;
  wire [27:12]accu_reg;
  wire \accu_reg_n_0_[0] ;
  wire \accu_reg_n_0_[10] ;
  wire \accu_reg_n_0_[11] ;
  wire \accu_reg_n_0_[1] ;
  wire \accu_reg_n_0_[2] ;
  wire \accu_reg_n_0_[3] ;
  wire \accu_reg_n_0_[4] ;
  wire \accu_reg_n_0_[5] ;
  wire \accu_reg_n_0_[6] ;
  wire \accu_reg_n_0_[7] ;
  wire \accu_reg_n_0_[8] ;
  wire \accu_reg_n_0_[9] ;
  wire clk;
  wire cnt_channel_inc;
  wire \counter_channel[2]_i_1_n_0 ;
  wire \counter_channel[3]_i_1_n_0 ;
  wire \counter_channel[4]_i_1_n_0 ;
  wire \counter_channel[5]_i_1_n_0 ;
  wire \counter_channel[5]_i_2_n_0 ;
  wire \counter_channel[6]_i_2_n_0 ;
  wire \counter_channel[7]_i_1_n_0 ;
  wire \counter_channel[7]_i_2_n_0 ;
  wire \counter_channel[7]_i_3_n_0 ;
  wire [7:0]counter_channel_reg__0;
  wire \data_in_reg_n_0_[0] ;
  wire \data_in_reg_n_0_[10] ;
  wire \data_in_reg_n_0_[11] ;
  wire \data_in_reg_n_0_[12] ;
  wire \data_in_reg_n_0_[13] ;
  wire \data_in_reg_n_0_[14] ;
  wire \data_in_reg_n_0_[15] ;
  wire \data_in_reg_n_0_[16] ;
  wire \data_in_reg_n_0_[17] ;
  wire \data_in_reg_n_0_[18] ;
  wire \data_in_reg_n_0_[19] ;
  wire \data_in_reg_n_0_[1] ;
  wire \data_in_reg_n_0_[20] ;
  wire \data_in_reg_n_0_[21] ;
  wire \data_in_reg_n_0_[22] ;
  wire \data_in_reg_n_0_[23] ;
  wire \data_in_reg_n_0_[24] ;
  wire \data_in_reg_n_0_[25] ;
  wire \data_in_reg_n_0_[26] ;
  wire \data_in_reg_n_0_[27] ;
  wire \data_in_reg_n_0_[28] ;
  wire \data_in_reg_n_0_[29] ;
  wire \data_in_reg_n_0_[2] ;
  wire \data_in_reg_n_0_[30] ;
  wire \data_in_reg_n_0_[31] ;
  wire \data_in_reg_n_0_[32] ;
  wire \data_in_reg_n_0_[33] ;
  wire \data_in_reg_n_0_[34] ;
  wire \data_in_reg_n_0_[35] ;
  wire \data_in_reg_n_0_[36] ;
  wire \data_in_reg_n_0_[37] ;
  wire \data_in_reg_n_0_[38] ;
  wire \data_in_reg_n_0_[39] ;
  wire \data_in_reg_n_0_[3] ;
  wire \data_in_reg_n_0_[40] ;
  wire \data_in_reg_n_0_[41] ;
  wire \data_in_reg_n_0_[42] ;
  wire \data_in_reg_n_0_[43] ;
  wire \data_in_reg_n_0_[44] ;
  wire \data_in_reg_n_0_[45] ;
  wire \data_in_reg_n_0_[46] ;
  wire \data_in_reg_n_0_[47] ;
  wire \data_in_reg_n_0_[48] ;
  wire \data_in_reg_n_0_[49] ;
  wire \data_in_reg_n_0_[4] ;
  wire \data_in_reg_n_0_[50] ;
  wire \data_in_reg_n_0_[51] ;
  wire \data_in_reg_n_0_[52] ;
  wire \data_in_reg_n_0_[53] ;
  wire \data_in_reg_n_0_[54] ;
  wire \data_in_reg_n_0_[55] ;
  wire \data_in_reg_n_0_[5] ;
  wire \data_in_reg_n_0_[6] ;
  wire \data_in_reg_n_0_[7] ;
  wire \data_in_reg_n_0_[8] ;
  wire \data_in_reg_n_0_[9] ;
  wire [6:0]p_0_in;
  wire reset_n;
  wire reset_n_0;
  wire [4:0]\vol_data_reg[1][4] ;
  wire [4:0]\vol_data_reg[2][4] ;
  wire [4:0]\vol_data_reg[3][4] ;
  wire [4:0]\vol_data_reg[4][4] ;
  wire [4:0]\vol_data_reg[5][4] ;
  wire [4:0]\vol_data_reg[6][4] ;
  wire [4:0]\vol_data_reg[7][4] ;
  wire [3:1]\NLW_ROM0.U_ROM_i_7_CO_UNCONNECTED ;
  wire [3:0]\NLW_ROM0.U_ROM_i_7_O_UNCONNECTED ;

  LUT4 #(
    .INIT(16'h0010)) 
    \EQ_dout[15]_i_1 
       (.I0(U_Mult_n_59),
        .I1(counter_channel_reg__0[1]),
        .I2(cnt_channel_inc),
        .I3(Volume_data1[5]),
        .O(\EQ_dout[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0020)) 
    \EQ_dout[23]_i_1 
       (.I0(Volume_data1[4]),
        .I1(counter_channel_reg__0[0]),
        .I2(cnt_channel_inc),
        .I3(Volume_data1[5]),
        .O(\EQ_dout[23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000080)) 
    \EQ_dout[31]_i_1 
       (.I0(counter_channel_reg__0[1]),
        .I1(counter_channel_reg__0[0]),
        .I2(cnt_channel_inc),
        .I3(counter_channel_reg__0[2]),
        .I4(U_Mult_n_58),
        .O(\EQ_dout[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h54)) 
    \EQ_dout[38]_i_2 
       (.I0(U_Mult_n_58),
        .I1(counter_channel_reg__0[0]),
        .I2(counter_channel_reg__0[1]),
        .O(\EQ_dout[38]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h1000)) 
    \EQ_dout[39]_i_1 
       (.I0(counter_channel_reg__0[0]),
        .I1(counter_channel_reg__0[1]),
        .I2(Volume_data1[5]),
        .I3(cnt_channel_inc),
        .O(\EQ_dout[39]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h1000)) 
    \EQ_dout[47]_i_1 
       (.I0(U_Mult_n_59),
        .I1(counter_channel_reg__0[1]),
        .I2(Volume_data1[5]),
        .I3(cnt_channel_inc),
        .O(\EQ_dout[47]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \EQ_dout[54]_i_2 
       (.I0(counter_channel_reg__0[0]),
        .I1(Volume_data1[4]),
        .O(\EQ_dout[54]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \EQ_dout[55]_i_1 
       (.I0(Volume_data1[4]),
        .I1(counter_channel_reg__0[0]),
        .I2(Volume_data1[5]),
        .I3(cnt_channel_inc),
        .O(\EQ_dout[55]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \EQ_dout[63]_i_1 
       (.I0(counter_channel_reg__0[0]),
        .I1(counter_channel_reg__0[1]),
        .I2(Volume_data1[5]),
        .I3(cnt_channel_inc),
        .O(\EQ_dout[63]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \EQ_dout[63]_i_3 
       (.I0(reset_n),
        .O(\EQ_dout[63]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hF0F00010)) 
    \EQ_dout[7]_i_1 
       (.I0(counter_channel_reg__0[1]),
        .I1(counter_channel_reg__0[0]),
        .I2(cnt_channel_inc),
        .I3(counter_channel_reg__0[2]),
        .I4(U_Mult_n_58),
        .O(\EQ_dout[7]_i_1_n_0 ));
  FDCE \EQ_dout_reg[0] 
       (.C(clk),
        .CE(\EQ_dout[7]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_55),
        .Q(EQ_dout[0]));
  FDCE \EQ_dout_reg[10] 
       (.C(clk),
        .CE(\EQ_dout[15]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[42]),
        .Q(EQ_dout[10]));
  FDCE \EQ_dout_reg[11] 
       (.C(clk),
        .CE(\EQ_dout[15]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[43]),
        .Q(EQ_dout[11]));
  FDCE \EQ_dout_reg[12] 
       (.C(clk),
        .CE(\EQ_dout[15]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[44]),
        .Q(EQ_dout[12]));
  FDCE \EQ_dout_reg[13] 
       (.C(clk),
        .CE(\EQ_dout[15]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[45]),
        .Q(EQ_dout[13]));
  FDCE \EQ_dout_reg[14] 
       (.C(clk),
        .CE(\EQ_dout[15]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[46]),
        .Q(EQ_dout[14]));
  FDCE \EQ_dout_reg[15] 
       (.C(clk),
        .CE(\EQ_dout[15]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[47]),
        .Q(EQ_dout[15]));
  FDCE \EQ_dout_reg[16] 
       (.C(clk),
        .CE(\EQ_dout[23]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_47),
        .Q(EQ_dout[16]));
  FDCE \EQ_dout_reg[17] 
       (.C(clk),
        .CE(\EQ_dout[23]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_46),
        .Q(EQ_dout[17]));
  FDCE \EQ_dout_reg[18] 
       (.C(clk),
        .CE(\EQ_dout[23]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_45),
        .Q(EQ_dout[18]));
  FDCE \EQ_dout_reg[19] 
       (.C(clk),
        .CE(\EQ_dout[23]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_44),
        .Q(EQ_dout[19]));
  FDCE \EQ_dout_reg[1] 
       (.C(clk),
        .CE(\EQ_dout[7]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_54),
        .Q(EQ_dout[1]));
  FDCE \EQ_dout_reg[20] 
       (.C(clk),
        .CE(\EQ_dout[23]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_43),
        .Q(EQ_dout[20]));
  FDCE \EQ_dout_reg[21] 
       (.C(clk),
        .CE(\EQ_dout[23]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_42),
        .Q(EQ_dout[21]));
  FDCE \EQ_dout_reg[22] 
       (.C(clk),
        .CE(\EQ_dout[23]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_41),
        .Q(EQ_dout[22]));
  FDCE \EQ_dout_reg[23] 
       (.C(clk),
        .CE(\EQ_dout[23]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_40),
        .Q(EQ_dout[23]));
  FDCE \EQ_dout_reg[24] 
       (.C(clk),
        .CE(\EQ_dout[31]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_39),
        .Q(EQ_dout[24]));
  FDCE \EQ_dout_reg[25] 
       (.C(clk),
        .CE(\EQ_dout[31]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_38),
        .Q(EQ_dout[25]));
  FDCE \EQ_dout_reg[26] 
       (.C(clk),
        .CE(\EQ_dout[31]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_37),
        .Q(EQ_dout[26]));
  FDCE \EQ_dout_reg[27] 
       (.C(clk),
        .CE(\EQ_dout[31]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_36),
        .Q(EQ_dout[27]));
  FDCE \EQ_dout_reg[28] 
       (.C(clk),
        .CE(\EQ_dout[31]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_35),
        .Q(EQ_dout[28]));
  FDCE \EQ_dout_reg[29] 
       (.C(clk),
        .CE(\EQ_dout[31]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_34),
        .Q(EQ_dout[29]));
  FDCE \EQ_dout_reg[2] 
       (.C(clk),
        .CE(\EQ_dout[7]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_53),
        .Q(EQ_dout[2]));
  FDCE \EQ_dout_reg[30] 
       (.C(clk),
        .CE(\EQ_dout[31]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_33),
        .Q(EQ_dout[30]));
  FDCE \EQ_dout_reg[31] 
       (.C(clk),
        .CE(\EQ_dout[31]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_32),
        .Q(EQ_dout[31]));
  FDCE \EQ_dout_reg[32] 
       (.C(clk),
        .CE(\EQ_dout[39]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[32]),
        .Q(EQ_dout[32]));
  FDCE \EQ_dout_reg[33] 
       (.C(clk),
        .CE(\EQ_dout[39]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[33]),
        .Q(EQ_dout[33]));
  FDCE \EQ_dout_reg[34] 
       (.C(clk),
        .CE(\EQ_dout[39]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[34]),
        .Q(EQ_dout[34]));
  FDCE \EQ_dout_reg[35] 
       (.C(clk),
        .CE(\EQ_dout[39]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[35]),
        .Q(EQ_dout[35]));
  FDCE \EQ_dout_reg[36] 
       (.C(clk),
        .CE(\EQ_dout[39]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[36]),
        .Q(EQ_dout[36]));
  FDCE \EQ_dout_reg[37] 
       (.C(clk),
        .CE(\EQ_dout[39]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[37]),
        .Q(EQ_dout[37]));
  FDCE \EQ_dout_reg[38] 
       (.C(clk),
        .CE(\EQ_dout[39]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[38]),
        .Q(EQ_dout[38]));
  FDCE \EQ_dout_reg[39] 
       (.C(clk),
        .CE(\EQ_dout[39]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[39]),
        .Q(EQ_dout[39]));
  FDCE \EQ_dout_reg[3] 
       (.C(clk),
        .CE(\EQ_dout[7]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_52),
        .Q(EQ_dout[3]));
  FDCE \EQ_dout_reg[40] 
       (.C(clk),
        .CE(\EQ_dout[47]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[40]),
        .Q(EQ_dout[40]));
  FDCE \EQ_dout_reg[41] 
       (.C(clk),
        .CE(\EQ_dout[47]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[41]),
        .Q(EQ_dout[41]));
  FDCE \EQ_dout_reg[42] 
       (.C(clk),
        .CE(\EQ_dout[47]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[42]),
        .Q(EQ_dout[42]));
  FDCE \EQ_dout_reg[43] 
       (.C(clk),
        .CE(\EQ_dout[47]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[43]),
        .Q(EQ_dout[43]));
  FDCE \EQ_dout_reg[44] 
       (.C(clk),
        .CE(\EQ_dout[47]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[44]),
        .Q(EQ_dout[44]));
  FDCE \EQ_dout_reg[45] 
       (.C(clk),
        .CE(\EQ_dout[47]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[45]),
        .Q(EQ_dout[45]));
  FDCE \EQ_dout_reg[46] 
       (.C(clk),
        .CE(\EQ_dout[47]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[46]),
        .Q(EQ_dout[46]));
  FDCE \EQ_dout_reg[47] 
       (.C(clk),
        .CE(\EQ_dout[47]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[47]),
        .Q(EQ_dout[47]));
  FDCE \EQ_dout_reg[48] 
       (.C(clk),
        .CE(\EQ_dout[55]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[48]),
        .Q(EQ_dout[48]));
  FDCE \EQ_dout_reg[49] 
       (.C(clk),
        .CE(\EQ_dout[55]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[49]),
        .Q(EQ_dout[49]));
  FDCE \EQ_dout_reg[4] 
       (.C(clk),
        .CE(\EQ_dout[7]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_51),
        .Q(EQ_dout[4]));
  FDCE \EQ_dout_reg[50] 
       (.C(clk),
        .CE(\EQ_dout[55]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[50]),
        .Q(EQ_dout[50]));
  FDCE \EQ_dout_reg[51] 
       (.C(clk),
        .CE(\EQ_dout[55]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[51]),
        .Q(EQ_dout[51]));
  FDCE \EQ_dout_reg[52] 
       (.C(clk),
        .CE(\EQ_dout[55]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[52]),
        .Q(EQ_dout[52]));
  FDCE \EQ_dout_reg[53] 
       (.C(clk),
        .CE(\EQ_dout[55]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[53]),
        .Q(EQ_dout[53]));
  FDCE \EQ_dout_reg[54] 
       (.C(clk),
        .CE(\EQ_dout[55]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[54]),
        .Q(EQ_dout[54]));
  FDCE \EQ_dout_reg[55] 
       (.C(clk),
        .CE(\EQ_dout[55]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[55]),
        .Q(EQ_dout[55]));
  FDCE \EQ_dout_reg[56] 
       (.C(clk),
        .CE(\EQ_dout[63]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[56]),
        .Q(EQ_dout[56]));
  FDCE \EQ_dout_reg[57] 
       (.C(clk),
        .CE(\EQ_dout[63]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[57]),
        .Q(EQ_dout[57]));
  FDCE \EQ_dout_reg[58] 
       (.C(clk),
        .CE(\EQ_dout[63]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[58]),
        .Q(EQ_dout[58]));
  FDCE \EQ_dout_reg[59] 
       (.C(clk),
        .CE(\EQ_dout[63]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[59]),
        .Q(EQ_dout[59]));
  FDCE \EQ_dout_reg[5] 
       (.C(clk),
        .CE(\EQ_dout[7]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_50),
        .Q(EQ_dout[5]));
  FDCE \EQ_dout_reg[60] 
       (.C(clk),
        .CE(\EQ_dout[63]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[60]),
        .Q(EQ_dout[60]));
  FDCE \EQ_dout_reg[61] 
       (.C(clk),
        .CE(\EQ_dout[63]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[61]),
        .Q(EQ_dout[61]));
  FDCE \EQ_dout_reg[62] 
       (.C(clk),
        .CE(\EQ_dout[63]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[62]),
        .Q(EQ_dout[62]));
  FDCE \EQ_dout_reg[63] 
       (.C(clk),
        .CE(\EQ_dout[63]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[63]),
        .Q(EQ_dout[63]));
  FDCE \EQ_dout_reg[6] 
       (.C(clk),
        .CE(\EQ_dout[7]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_49),
        .Q(EQ_dout[6]));
  FDCE \EQ_dout_reg[7] 
       (.C(clk),
        .CE(\EQ_dout[7]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(U_Mult_n_48),
        .Q(EQ_dout[7]));
  FDCE \EQ_dout_reg[8] 
       (.C(clk),
        .CE(\EQ_dout[15]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[40]),
        .Q(EQ_dout[8]));
  FDCE \EQ_dout_reg[9] 
       (.C(clk),
        .CE(\EQ_dout[15]_i_1_n_0 ),
        .CLR(\EQ_dout[63]_i_3_n_0 ),
        .D(EQ_dout0[41]),
        .Q(EQ_dout[9]));
  LUT4 #(
    .INIT(16'hFFAE)) 
    \FSM_onehot_current_state[1]_i_1 
       (.I0(\EQ_dout[63]_i_1_n_0 ),
        .I1(accu_clr),
        .I2(EQ_en),
        .I3(\FSM_onehot_current_state_reg_n_0_[0] ),
        .O(\FSM_onehot_current_state[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF444)) 
    \FSM_onehot_current_state[2]_i_1 
       (.I0(U_Mult_n_60),
        .I1(cnt_channel_inc),
        .I2(EQ_en),
        .I3(accu_clr),
        .O(\FSM_onehot_current_state[2]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_current_state[5]_i_1 
       (.I0(reset_n),
        .O(reset_n_0));
  (* FSM_ENCODED_STATES = "eq_reset:000001,eq_pipe2:001000,eq_pipe3:010000,eq_store:100000,eq_pipe1:000100,eq_idle:000010" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_current_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(reset_n_0),
        .Q(\FSM_onehot_current_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "eq_reset:000001,eq_pipe2:001000,eq_pipe3:010000,eq_store:100000,eq_pipe1:000100,eq_idle:000010" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(\FSM_onehot_current_state[1]_i_1_n_0 ),
        .Q(accu_clr));
  (* FSM_ENCODED_STATES = "eq_reset:000001,eq_pipe2:001000,eq_pipe3:010000,eq_store:100000,eq_pipe1:000100,eq_idle:000010" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(\FSM_onehot_current_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_current_state_reg_n_0_[2] ));
  (* FSM_ENCODED_STATES = "eq_reset:000001,eq_pipe2:001000,eq_pipe3:010000,eq_store:100000,eq_pipe1:000100,eq_idle:000010" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(\FSM_onehot_current_state_reg_n_0_[2] ),
        .Q(\FSM_onehot_current_state_reg_n_0_[3] ));
  (* FSM_ENCODED_STATES = "eq_reset:000001,eq_pipe2:001000,eq_pipe3:010000,eq_store:100000,eq_pipe1:000100,eq_idle:000010" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(\FSM_onehot_current_state_reg_n_0_[3] ),
        .Q(\FSM_onehot_current_state_reg_n_0_[4] ));
  (* FSM_ENCODED_STATES = "eq_reset:000001,eq_pipe2:001000,eq_pipe3:010000,eq_store:100000,eq_pipe1:000100,eq_idle:000010" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(\FSM_onehot_current_state_reg_n_0_[4] ),
        .Q(cnt_channel_inc));
  (* CHECK_LICENSE_TYPE = "ROM_32_16bit,dist_mem_gen_v8_0_12,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "dist_mem_gen_v8_0_12,Vivado 2018.3" *) 
  EQ_ROM_32_16bit \ROM0.U_ROM 
       (.a(a),
        .spo(ROM_out));
  CARRY4 \ROM0.U_ROM_i_7 
       (.CI(a1_carry_n_0),
        .CO({\NLW_ROM0.U_ROM_i_7_CO_UNCONNECTED [3:1],\ROM0.U_ROM_i_7_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_ROM0.U_ROM_i_7_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  EQ_EQ_volume_ctrl U_EQ_volume_ctrl
       (.CO(\ROM0.U_ROM_i_7_n_3 ),
        .EQ_select(EQ_select),
        .EQ_vol_down(EQ_vol_down),
        .EQ_vol_up(EQ_vol_up),
        .O({a1_carry_n_4,a1_carry_n_5,a1_carry_n_6,a1_carry_n_7}),
        .Q(Q),
        .\ROM0.U_ROM_i_1_0 (U_Mult_n_59),
        .a(a),
        .clk(clk),
        .reset_n(reset_n),
        .\vol_data_reg[1][4]_0 (\vol_data_reg[1][4] ),
        .\vol_data_reg[2][4]_0 (\vol_data_reg[2][4] ),
        .\vol_data_reg[3][4]_0 (\vol_data_reg[3][4] ),
        .\vol_data_reg[4][4]_0 (\vol_data_reg[4][4] ),
        .\vol_data_reg[5][4]_0 (\vol_data_reg[5][4] ),
        .\vol_data_reg[6][4]_0 (\vol_data_reg[6][4] ),
        .\vol_data_reg[7][4]_0 (\vol_data_reg[7][4] ));
  EQ_Multiplier U_Mult
       (.D({EQ_dout0,U_Mult_n_32,U_Mult_n_33,U_Mult_n_34,U_Mult_n_35,U_Mult_n_36,U_Mult_n_37,U_Mult_n_38,U_Mult_n_39,U_Mult_n_40,U_Mult_n_41,U_Mult_n_42,U_Mult_n_43,U_Mult_n_44,U_Mult_n_45,U_Mult_n_46,U_Mult_n_47,U_Mult_n_48,U_Mult_n_49,U_Mult_n_50,U_Mult_n_51,U_Mult_n_52,U_Mult_n_53,U_Mult_n_54,U_Mult_n_55}),
        .\EQ_dout_reg[0] (\EQ_dout[38]_i_2_n_0 ),
        .\EQ_dout_reg[16] (\EQ_dout[54]_i_2_n_0 ),
        .\EQ_dout_reg[23] (\EQ_dout_reg[23]_0 ),
        .\EQ_dout_reg[56] (counter_channel_reg__0),
        .\EQ_dout_reg[63]_i_5 ({U_Mult_n_65,U_Mult_n_66,U_Mult_n_67,U_Mult_n_68}),
        .\EQ_dout_reg[63]_i_5_0 ({U_Mult_n_69,U_Mult_n_70,U_Mult_n_71,U_Mult_n_72}),
        .\EQ_dout_reg[63]_i_5_1 ({U_Mult_n_73,U_Mult_n_74,U_Mult_n_75,U_Mult_n_76}),
        .\EQ_dout_reg[63]_i_5_2 ({U_Mult_n_77,U_Mult_n_78,U_Mult_n_79,U_Mult_n_80}),
        .\EQ_dout_reg[63]_i_5_3 ({U_Mult_n_81,U_Mult_n_82,U_Mult_n_83,U_Mult_n_84}),
        .\EQ_dout_reg[63]_i_5_4 ({U_Mult_n_85,U_Mult_n_86,U_Mult_n_87,U_Mult_n_88}),
        .O({U_Mult_n_61,U_Mult_n_62,U_Mult_n_63,U_Mult_n_64}),
        .Q(Volume_coef),
        .Volume_data1(Volume_data1),
        .accu_reg(accu_reg),
        .\accu_reg[11]_0 (\accu_reg_n_0_[9] ),
        .\accu_reg[11]_1 (\accu_reg_n_0_[10] ),
        .\accu_reg[11]_2 (\accu_reg_n_0_[11] ),
        .\accu_reg[3] (accu_clr),
        .\accu_reg[3]_0 (\accu_reg_n_0_[0] ),
        .\accu_reg[3]_1 (\accu_reg_n_0_[1] ),
        .\accu_reg[3]_2 (\accu_reg_n_0_[2] ),
        .\accu_reg[3]_3 (\accu_reg_n_0_[3] ),
        .\accu_reg[7]_0 (\accu_reg_n_0_[5] ),
        .\accu_reg[7]_1 (\accu_reg_n_0_[6] ),
        .\accu_reg[7]_2 (\accu_reg_n_0_[7] ),
        .accu_reg_11_sp_1(\accu_reg_n_0_[8] ),
        .accu_reg_7_sp_1(\accu_reg_n_0_[4] ),
        .clk(clk),
        .\counter_channel_reg[2] (U_Mult_n_60),
        .\counter_channel_reg[3] (U_Mult_n_58),
        .\counter_channel_reg[7] (U_Mult_n_59),
        .mult_out_0({\data_in_reg_n_0_[55] ,\data_in_reg_n_0_[54] ,\data_in_reg_n_0_[53] ,\data_in_reg_n_0_[52] ,\data_in_reg_n_0_[51] ,\data_in_reg_n_0_[50] ,\data_in_reg_n_0_[49] ,\data_in_reg_n_0_[48] ,\data_in_reg_n_0_[47] ,\data_in_reg_n_0_[46] ,\data_in_reg_n_0_[45] ,\data_in_reg_n_0_[44] ,\data_in_reg_n_0_[43] ,\data_in_reg_n_0_[42] ,\data_in_reg_n_0_[41] ,\data_in_reg_n_0_[40] ,\data_in_reg_n_0_[39] ,\data_in_reg_n_0_[38] ,\data_in_reg_n_0_[37] ,\data_in_reg_n_0_[36] ,\data_in_reg_n_0_[35] ,\data_in_reg_n_0_[34] ,\data_in_reg_n_0_[33] ,\data_in_reg_n_0_[32] ,\data_in_reg_n_0_[31] ,\data_in_reg_n_0_[30] ,\data_in_reg_n_0_[29] ,\data_in_reg_n_0_[28] ,\data_in_reg_n_0_[27] ,\data_in_reg_n_0_[26] ,\data_in_reg_n_0_[25] ,\data_in_reg_n_0_[24] ,\data_in_reg_n_0_[23] ,\data_in_reg_n_0_[22] ,\data_in_reg_n_0_[21] ,\data_in_reg_n_0_[20] ,\data_in_reg_n_0_[19] ,\data_in_reg_n_0_[18] ,\data_in_reg_n_0_[17] ,\data_in_reg_n_0_[16] ,\data_in_reg_n_0_[15] ,\data_in_reg_n_0_[14] ,\data_in_reg_n_0_[13] ,\data_in_reg_n_0_[12] ,\data_in_reg_n_0_[11] ,\data_in_reg_n_0_[10] ,\data_in_reg_n_0_[9] ,\data_in_reg_n_0_[8] ,\data_in_reg_n_0_[7] ,\data_in_reg_n_0_[6] ,\data_in_reg_n_0_[5] ,\data_in_reg_n_0_[4] ,\data_in_reg_n_0_[3] ,\data_in_reg_n_0_[2] ,\data_in_reg_n_0_[1] ,\data_in_reg_n_0_[0] }),
        .reset_n(reset_n));
  FDCE \Volume_coef_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(ROM_out[0]),
        .Q(Volume_coef[0]));
  FDCE \Volume_coef_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(ROM_out[10]),
        .Q(Volume_coef[10]));
  FDCE \Volume_coef_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(ROM_out[11]),
        .Q(Volume_coef[11]));
  FDCE \Volume_coef_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(ROM_out[12]),
        .Q(Volume_coef[12]));
  FDCE \Volume_coef_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(ROM_out[13]),
        .Q(Volume_coef[13]));
  FDCE \Volume_coef_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(ROM_out[14]),
        .Q(Volume_coef[14]));
  FDCE \Volume_coef_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(ROM_out[15]),
        .Q(Volume_coef[15]));
  FDCE \Volume_coef_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(ROM_out[1]),
        .Q(Volume_coef[1]));
  FDCE \Volume_coef_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(ROM_out[2]),
        .Q(Volume_coef[2]));
  FDCE \Volume_coef_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(ROM_out[3]),
        .Q(Volume_coef[3]));
  FDCE \Volume_coef_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(ROM_out[4]),
        .Q(Volume_coef[4]));
  FDCE \Volume_coef_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(ROM_out[5]),
        .Q(Volume_coef[5]));
  FDCE \Volume_coef_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(ROM_out[6]),
        .Q(Volume_coef[6]));
  FDCE \Volume_coef_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(ROM_out[7]),
        .Q(Volume_coef[7]));
  FDCE \Volume_coef_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(ROM_out[8]),
        .Q(Volume_coef[8]));
  FDCE \Volume_coef_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_n_0),
        .D(ROM_out[9]),
        .Q(Volume_coef[9]));
  CARRY4 a1_carry
       (.CI(1'b0),
        .CO({a1_carry_n_0,a1_carry_n_1,a1_carry_n_2,a1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,Volume_data1[5],1'b0}),
        .O({a1_carry_n_4,a1_carry_n_5,a1_carry_n_6,a1_carry_n_7}),
        .S({a1_carry_i_2_n_0,a1_carry_i_3_n_0,a1_carry_i_4_n_0,a1_carry_i_5_n_0}));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    a1_carry_i_2
       (.I0(counter_channel_reg__0[2]),
        .I1(counter_channel_reg__0[7]),
        .I2(counter_channel_reg__0[6]),
        .I3(counter_channel_reg__0[5]),
        .I4(counter_channel_reg__0[4]),
        .I5(counter_channel_reg__0[3]),
        .O(a1_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    a1_carry_i_3
       (.I0(counter_channel_reg__0[1]),
        .I1(counter_channel_reg__0[7]),
        .I2(counter_channel_reg__0[6]),
        .I3(counter_channel_reg__0[5]),
        .I4(counter_channel_reg__0[4]),
        .I5(counter_channel_reg__0[3]),
        .O(a1_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    a1_carry_i_4
       (.I0(Volume_data1[5]),
        .I1(U_Mult_n_59),
        .O(a1_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    a1_carry_i_5
       (.I0(counter_channel_reg__0[1]),
        .I1(counter_channel_reg__0[7]),
        .I2(counter_channel_reg__0[6]),
        .I3(counter_channel_reg__0[5]),
        .I4(counter_channel_reg__0[4]),
        .I5(counter_channel_reg__0[3]),
        .O(a1_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFFFAAAAFFFFAAA8)) 
    \accu[0]_i_1 
       (.I0(cnt_channel_inc),
        .I1(counter_channel_reg__0[0]),
        .I2(counter_channel_reg__0[1]),
        .I3(counter_channel_reg__0[2]),
        .I4(accu_clr),
        .I5(U_Mult_n_58),
        .O(\accu[0]_i_1_n_0 ));
  FDCE \accu_reg[0] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_64),
        .Q(\accu_reg_n_0_[0] ));
  FDCE \accu_reg[10] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_70),
        .Q(\accu_reg_n_0_[10] ));
  FDCE \accu_reg[11] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_69),
        .Q(\accu_reg_n_0_[11] ));
  FDCE \accu_reg[12] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_76),
        .Q(accu_reg[12]));
  FDCE \accu_reg[13] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_75),
        .Q(accu_reg[13]));
  FDCE \accu_reg[14] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_74),
        .Q(accu_reg[14]));
  FDCE \accu_reg[15] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_73),
        .Q(accu_reg[15]));
  FDCE \accu_reg[16] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_80),
        .Q(accu_reg[16]));
  FDCE \accu_reg[17] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_79),
        .Q(accu_reg[17]));
  FDCE \accu_reg[18] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_78),
        .Q(accu_reg[18]));
  FDCE \accu_reg[19] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_77),
        .Q(accu_reg[19]));
  FDCE \accu_reg[1] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_63),
        .Q(\accu_reg_n_0_[1] ));
  FDCE \accu_reg[20] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_84),
        .Q(accu_reg[20]));
  FDCE \accu_reg[21] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_83),
        .Q(accu_reg[21]));
  FDCE \accu_reg[22] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_82),
        .Q(accu_reg[22]));
  FDCE \accu_reg[23] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_81),
        .Q(accu_reg[23]));
  FDCE \accu_reg[24] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_88),
        .Q(accu_reg[24]));
  FDCE \accu_reg[25] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_87),
        .Q(accu_reg[25]));
  FDCE \accu_reg[26] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_86),
        .Q(accu_reg[26]));
  FDCE \accu_reg[27] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_85),
        .Q(accu_reg[27]));
  FDCE \accu_reg[2] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_62),
        .Q(\accu_reg_n_0_[2] ));
  FDCE \accu_reg[3] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_61),
        .Q(\accu_reg_n_0_[3] ));
  FDCE \accu_reg[4] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_68),
        .Q(\accu_reg_n_0_[4] ));
  FDCE \accu_reg[5] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_67),
        .Q(\accu_reg_n_0_[5] ));
  FDCE \accu_reg[6] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_66),
        .Q(\accu_reg_n_0_[6] ));
  FDCE \accu_reg[7] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_65),
        .Q(\accu_reg_n_0_[7] ));
  FDCE \accu_reg[8] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_72),
        .Q(\accu_reg_n_0_[8] ));
  FDCE \accu_reg[9] 
       (.C(clk),
        .CE(\accu[0]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(U_Mult_n_71),
        .Q(\accu_reg_n_0_[9] ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \counter_channel[0]_i_1 
       (.I0(accu_clr),
        .I1(counter_channel_reg__0[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \counter_channel[1]_i_1 
       (.I0(counter_channel_reg__0[0]),
        .I1(counter_channel_reg__0[1]),
        .I2(accu_clr),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h1540)) 
    \counter_channel[2]_i_1 
       (.I0(accu_clr),
        .I1(counter_channel_reg__0[1]),
        .I2(counter_channel_reg__0[0]),
        .I3(counter_channel_reg__0[2]),
        .O(\counter_channel[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT5 #(
    .INIT(32'h15554000)) 
    \counter_channel[3]_i_1 
       (.I0(accu_clr),
        .I1(counter_channel_reg__0[0]),
        .I2(counter_channel_reg__0[1]),
        .I3(counter_channel_reg__0[2]),
        .I4(counter_channel_reg__0[3]),
        .O(\counter_channel[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1555555540000000)) 
    \counter_channel[4]_i_1 
       (.I0(accu_clr),
        .I1(counter_channel_reg__0[2]),
        .I2(counter_channel_reg__0[1]),
        .I3(counter_channel_reg__0[0]),
        .I4(counter_channel_reg__0[3]),
        .I5(counter_channel_reg__0[4]),
        .O(\counter_channel[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1555555540000000)) 
    \counter_channel[5]_i_1 
       (.I0(accu_clr),
        .I1(counter_channel_reg__0[3]),
        .I2(\counter_channel[5]_i_2_n_0 ),
        .I3(counter_channel_reg__0[2]),
        .I4(counter_channel_reg__0[4]),
        .I5(counter_channel_reg__0[5]),
        .O(\counter_channel[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \counter_channel[5]_i_2 
       (.I0(counter_channel_reg__0[1]),
        .I1(counter_channel_reg__0[0]),
        .O(\counter_channel[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000007FFF8000)) 
    \counter_channel[6]_i_1 
       (.I0(counter_channel_reg__0[4]),
        .I1(\counter_channel[6]_i_2_n_0 ),
        .I2(counter_channel_reg__0[3]),
        .I3(counter_channel_reg__0[5]),
        .I4(counter_channel_reg__0[6]),
        .I5(accu_clr),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \counter_channel[6]_i_2 
       (.I0(counter_channel_reg__0[0]),
        .I1(counter_channel_reg__0[1]),
        .I2(counter_channel_reg__0[2]),
        .O(\counter_channel[6]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \counter_channel[7]_i_1 
       (.I0(cnt_channel_inc),
        .I1(accu_clr),
        .O(\counter_channel[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h1540)) 
    \counter_channel[7]_i_2 
       (.I0(accu_clr),
        .I1(counter_channel_reg__0[6]),
        .I2(\counter_channel[7]_i_3_n_0 ),
        .I3(counter_channel_reg__0[7]),
        .O(\counter_channel[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \counter_channel[7]_i_3 
       (.I0(counter_channel_reg__0[4]),
        .I1(counter_channel_reg__0[2]),
        .I2(counter_channel_reg__0[1]),
        .I3(counter_channel_reg__0[0]),
        .I4(counter_channel_reg__0[3]),
        .I5(counter_channel_reg__0[5]),
        .O(\counter_channel[7]_i_3_n_0 ));
  FDCE \counter_channel_reg[0] 
       (.C(clk),
        .CE(\counter_channel[7]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(p_0_in[0]),
        .Q(counter_channel_reg__0[0]));
  FDCE \counter_channel_reg[1] 
       (.C(clk),
        .CE(\counter_channel[7]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(p_0_in[1]),
        .Q(counter_channel_reg__0[1]));
  FDCE \counter_channel_reg[2] 
       (.C(clk),
        .CE(\counter_channel[7]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(\counter_channel[2]_i_1_n_0 ),
        .Q(counter_channel_reg__0[2]));
  FDCE \counter_channel_reg[3] 
       (.C(clk),
        .CE(\counter_channel[7]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(\counter_channel[3]_i_1_n_0 ),
        .Q(counter_channel_reg__0[3]));
  FDCE \counter_channel_reg[4] 
       (.C(clk),
        .CE(\counter_channel[7]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(\counter_channel[4]_i_1_n_0 ),
        .Q(counter_channel_reg__0[4]));
  FDCE \counter_channel_reg[5] 
       (.C(clk),
        .CE(\counter_channel[7]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(\counter_channel[5]_i_1_n_0 ),
        .Q(counter_channel_reg__0[5]));
  FDCE \counter_channel_reg[6] 
       (.C(clk),
        .CE(\counter_channel[7]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(p_0_in[6]),
        .Q(counter_channel_reg__0[6]));
  FDCE \counter_channel_reg[7] 
       (.C(clk),
        .CE(\counter_channel[7]_i_1_n_0 ),
        .CLR(reset_n_0),
        .D(\counter_channel[7]_i_2_n_0 ),
        .Q(counter_channel_reg__0[7]));
  FDCE \data_in_reg[0] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[0]),
        .Q(\data_in_reg_n_0_[0] ));
  FDCE \data_in_reg[10] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[10]),
        .Q(\data_in_reg_n_0_[10] ));
  FDCE \data_in_reg[11] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[11]),
        .Q(\data_in_reg_n_0_[11] ));
  FDCE \data_in_reg[12] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[12]),
        .Q(\data_in_reg_n_0_[12] ));
  FDCE \data_in_reg[13] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[13]),
        .Q(\data_in_reg_n_0_[13] ));
  FDCE \data_in_reg[14] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[14]),
        .Q(\data_in_reg_n_0_[14] ));
  FDCE \data_in_reg[15] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[15]),
        .Q(\data_in_reg_n_0_[15] ));
  FDCE \data_in_reg[16] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[16]),
        .Q(\data_in_reg_n_0_[16] ));
  FDCE \data_in_reg[17] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[17]),
        .Q(\data_in_reg_n_0_[17] ));
  FDCE \data_in_reg[18] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[18]),
        .Q(\data_in_reg_n_0_[18] ));
  FDCE \data_in_reg[19] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[19]),
        .Q(\data_in_reg_n_0_[19] ));
  FDCE \data_in_reg[1] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[1]),
        .Q(\data_in_reg_n_0_[1] ));
  FDCE \data_in_reg[20] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[20]),
        .Q(\data_in_reg_n_0_[20] ));
  FDCE \data_in_reg[21] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[21]),
        .Q(\data_in_reg_n_0_[21] ));
  FDCE \data_in_reg[22] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[22]),
        .Q(\data_in_reg_n_0_[22] ));
  FDCE \data_in_reg[23] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[23]),
        .Q(\data_in_reg_n_0_[23] ));
  FDCE \data_in_reg[24] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[24]),
        .Q(\data_in_reg_n_0_[24] ));
  FDCE \data_in_reg[25] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[25]),
        .Q(\data_in_reg_n_0_[25] ));
  FDCE \data_in_reg[26] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[26]),
        .Q(\data_in_reg_n_0_[26] ));
  FDCE \data_in_reg[27] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[27]),
        .Q(\data_in_reg_n_0_[27] ));
  FDCE \data_in_reg[28] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[28]),
        .Q(\data_in_reg_n_0_[28] ));
  FDCE \data_in_reg[29] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[29]),
        .Q(\data_in_reg_n_0_[29] ));
  FDCE \data_in_reg[2] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[2]),
        .Q(\data_in_reg_n_0_[2] ));
  FDCE \data_in_reg[30] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[30]),
        .Q(\data_in_reg_n_0_[30] ));
  FDCE \data_in_reg[31] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[31]),
        .Q(\data_in_reg_n_0_[31] ));
  FDCE \data_in_reg[32] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[32]),
        .Q(\data_in_reg_n_0_[32] ));
  FDCE \data_in_reg[33] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[33]),
        .Q(\data_in_reg_n_0_[33] ));
  FDCE \data_in_reg[34] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[34]),
        .Q(\data_in_reg_n_0_[34] ));
  FDCE \data_in_reg[35] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[35]),
        .Q(\data_in_reg_n_0_[35] ));
  FDCE \data_in_reg[36] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[36]),
        .Q(\data_in_reg_n_0_[36] ));
  FDCE \data_in_reg[37] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[37]),
        .Q(\data_in_reg_n_0_[37] ));
  FDCE \data_in_reg[38] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[38]),
        .Q(\data_in_reg_n_0_[38] ));
  FDCE \data_in_reg[39] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[39]),
        .Q(\data_in_reg_n_0_[39] ));
  FDCE \data_in_reg[3] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[3]),
        .Q(\data_in_reg_n_0_[3] ));
  FDCE \data_in_reg[40] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[40]),
        .Q(\data_in_reg_n_0_[40] ));
  FDCE \data_in_reg[41] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[41]),
        .Q(\data_in_reg_n_0_[41] ));
  FDCE \data_in_reg[42] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[42]),
        .Q(\data_in_reg_n_0_[42] ));
  FDCE \data_in_reg[43] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[43]),
        .Q(\data_in_reg_n_0_[43] ));
  FDCE \data_in_reg[44] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[44]),
        .Q(\data_in_reg_n_0_[44] ));
  FDCE \data_in_reg[45] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[45]),
        .Q(\data_in_reg_n_0_[45] ));
  FDCE \data_in_reg[46] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[46]),
        .Q(\data_in_reg_n_0_[46] ));
  FDCE \data_in_reg[47] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[47]),
        .Q(\data_in_reg_n_0_[47] ));
  FDCE \data_in_reg[48] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[48]),
        .Q(\data_in_reg_n_0_[48] ));
  FDCE \data_in_reg[49] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[49]),
        .Q(\data_in_reg_n_0_[49] ));
  FDCE \data_in_reg[4] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[4]),
        .Q(\data_in_reg_n_0_[4] ));
  FDCE \data_in_reg[50] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[50]),
        .Q(\data_in_reg_n_0_[50] ));
  FDCE \data_in_reg[51] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[51]),
        .Q(\data_in_reg_n_0_[51] ));
  FDCE \data_in_reg[52] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[52]),
        .Q(\data_in_reg_n_0_[52] ));
  FDCE \data_in_reg[53] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[53]),
        .Q(\data_in_reg_n_0_[53] ));
  FDCE \data_in_reg[54] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[54]),
        .Q(\data_in_reg_n_0_[54] ));
  FDCE \data_in_reg[55] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[55]),
        .Q(\data_in_reg_n_0_[55] ));
  FDCE \data_in_reg[5] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[5]),
        .Q(\data_in_reg_n_0_[5] ));
  FDCE \data_in_reg[6] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[6]),
        .Q(\data_in_reg_n_0_[6] ));
  FDCE \data_in_reg[7] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[7]),
        .Q(\data_in_reg_n_0_[7] ));
  FDCE \data_in_reg[8] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[8]),
        .Q(\data_in_reg_n_0_[8] ));
  FDCE \data_in_reg[9] 
       (.C(clk),
        .CE(EQ_en),
        .CLR(reset_n_0),
        .D(D[9]),
        .Q(\data_in_reg_n_0_[9] ));
endmodule

(* ORIG_REF_NAME = "EQ_volume_ctrl" *) 
module EQ_EQ_volume_ctrl
   (a,
    Q,
    \vol_data_reg[1][4]_0 ,
    \vol_data_reg[7][4]_0 ,
    \vol_data_reg[6][4]_0 ,
    \vol_data_reg[5][4]_0 ,
    \vol_data_reg[4][4]_0 ,
    \vol_data_reg[3][4]_0 ,
    \vol_data_reg[2][4]_0 ,
    clk,
    EQ_select,
    CO,
    O,
    \ROM0.U_ROM_i_1_0 ,
    EQ_vol_down,
    EQ_vol_up,
    reset_n);
  output [4:0]a;
  output [4:0]Q;
  output [4:0]\vol_data_reg[1][4]_0 ;
  output [4:0]\vol_data_reg[7][4]_0 ;
  output [4:0]\vol_data_reg[6][4]_0 ;
  output [4:0]\vol_data_reg[5][4]_0 ;
  output [4:0]\vol_data_reg[4][4]_0 ;
  output [4:0]\vol_data_reg[3][4]_0 ;
  output [4:0]\vol_data_reg[2][4]_0 ;
  input clk;
  input [2:0]EQ_select;
  input [0:0]CO;
  input [3:0]O;
  input \ROM0.U_ROM_i_1_0 ;
  input EQ_vol_down;
  input EQ_vol_up;
  input reset_n;

  wire [0:0]CO;
  wire [2:0]EQ_select;
  wire EQ_vol_down;
  wire EQ_vol_up;
  wire [3:0]O;
  wire [4:0]Q;
  wire \ROM0.U_ROM_i_10_n_0 ;
  wire \ROM0.U_ROM_i_11_n_0 ;
  wire \ROM0.U_ROM_i_12_n_0 ;
  wire \ROM0.U_ROM_i_13_n_0 ;
  wire \ROM0.U_ROM_i_14_n_0 ;
  wire \ROM0.U_ROM_i_15_n_0 ;
  wire \ROM0.U_ROM_i_16_n_0 ;
  wire \ROM0.U_ROM_i_17_n_0 ;
  wire \ROM0.U_ROM_i_18_n_0 ;
  wire \ROM0.U_ROM_i_19_n_0 ;
  wire \ROM0.U_ROM_i_1_0 ;
  wire \ROM0.U_ROM_i_20_n_0 ;
  wire \ROM0.U_ROM_i_21_n_0 ;
  wire \ROM0.U_ROM_i_22_n_0 ;
  wire \ROM0.U_ROM_i_23_n_0 ;
  wire \ROM0.U_ROM_i_24_n_0 ;
  wire \ROM0.U_ROM_i_25_n_0 ;
  wire \ROM0.U_ROM_i_26_n_0 ;
  wire \ROM0.U_ROM_i_27_n_0 ;
  wire \ROM0.U_ROM_i_28_n_0 ;
  wire \ROM0.U_ROM_i_29_n_0 ;
  wire \ROM0.U_ROM_i_30_n_0 ;
  wire \ROM0.U_ROM_i_31_n_0 ;
  wire \ROM0.U_ROM_i_32_n_0 ;
  wire \ROM0.U_ROM_i_33_n_0 ;
  wire \ROM0.U_ROM_i_34_n_0 ;
  wire \ROM0.U_ROM_i_35_n_0 ;
  wire \ROM0.U_ROM_i_36_n_0 ;
  wire \ROM0.U_ROM_i_37_n_0 ;
  wire \ROM0.U_ROM_i_38_n_0 ;
  wire \ROM0.U_ROM_i_39_n_0 ;
  wire \ROM0.U_ROM_i_40_n_0 ;
  wire \ROM0.U_ROM_i_41_n_0 ;
  wire \ROM0.U_ROM_i_42_n_0 ;
  wire \ROM0.U_ROM_i_43_n_0 ;
  wire \ROM0.U_ROM_i_44_n_0 ;
  wire \ROM0.U_ROM_i_45_n_0 ;
  wire \ROM0.U_ROM_i_46_n_0 ;
  wire \ROM0.U_ROM_i_47_n_0 ;
  wire \ROM0.U_ROM_i_48_n_0 ;
  wire \ROM0.U_ROM_i_49_n_0 ;
  wire \ROM0.U_ROM_i_50_n_0 ;
  wire \ROM0.U_ROM_i_51_n_0 ;
  wire \ROM0.U_ROM_i_52_n_0 ;
  wire \ROM0.U_ROM_i_53_n_0 ;
  wire \ROM0.U_ROM_i_54_n_0 ;
  wire \ROM0.U_ROM_i_55_n_0 ;
  wire \ROM0.U_ROM_i_56_n_0 ;
  wire \ROM0.U_ROM_i_57_n_0 ;
  wire \ROM0.U_ROM_i_58_n_0 ;
  wire \ROM0.U_ROM_i_59_n_0 ;
  wire \ROM0.U_ROM_i_6_n_0 ;
  wire \ROM0.U_ROM_i_8_n_0 ;
  wire \ROM0.U_ROM_i_9_n_0 ;
  wire [4:0]a;
  wire clk;
  wire \counter_hold[0]_i_2_n_0 ;
  wire \counter_hold[0]_i_3_n_0 ;
  wire \counter_hold[0]_i_4_n_0 ;
  wire \counter_hold[0]_i_5_n_0 ;
  wire \counter_hold[0]_i_6_n_0 ;
  wire \counter_hold[12]_i_2_n_0 ;
  wire \counter_hold[12]_i_3_n_0 ;
  wire \counter_hold[12]_i_4_n_0 ;
  wire \counter_hold[12]_i_5_n_0 ;
  wire \counter_hold[16]_i_2_n_0 ;
  wire \counter_hold[16]_i_3_n_0 ;
  wire \counter_hold[16]_i_4_n_0 ;
  wire \counter_hold[16]_i_5_n_0 ;
  wire \counter_hold[20]_i_2_n_0 ;
  wire \counter_hold[20]_i_3_n_0 ;
  wire \counter_hold[20]_i_4_n_0 ;
  wire \counter_hold[20]_i_5_n_0 ;
  wire \counter_hold[24]_i_2_n_0 ;
  wire \counter_hold[24]_i_3_n_0 ;
  wire \counter_hold[24]_i_4_n_0 ;
  wire \counter_hold[24]_i_5_n_0 ;
  wire \counter_hold[28]_i_2_n_0 ;
  wire \counter_hold[28]_i_3_n_0 ;
  wire \counter_hold[28]_i_4_n_0 ;
  wire \counter_hold[28]_i_5_n_0 ;
  wire \counter_hold[4]_i_2_n_0 ;
  wire \counter_hold[4]_i_3_n_0 ;
  wire \counter_hold[4]_i_4_n_0 ;
  wire \counter_hold[4]_i_5_n_0 ;
  wire \counter_hold[8]_i_2_n_0 ;
  wire \counter_hold[8]_i_3_n_0 ;
  wire \counter_hold[8]_i_4_n_0 ;
  wire \counter_hold[8]_i_5_n_0 ;
  wire [31:0]counter_hold_reg;
  wire \counter_hold_reg[0]_i_1_n_0 ;
  wire \counter_hold_reg[0]_i_1_n_1 ;
  wire \counter_hold_reg[0]_i_1_n_2 ;
  wire \counter_hold_reg[0]_i_1_n_3 ;
  wire \counter_hold_reg[0]_i_1_n_4 ;
  wire \counter_hold_reg[0]_i_1_n_5 ;
  wire \counter_hold_reg[0]_i_1_n_6 ;
  wire \counter_hold_reg[0]_i_1_n_7 ;
  wire \counter_hold_reg[12]_i_1_n_0 ;
  wire \counter_hold_reg[12]_i_1_n_1 ;
  wire \counter_hold_reg[12]_i_1_n_2 ;
  wire \counter_hold_reg[12]_i_1_n_3 ;
  wire \counter_hold_reg[12]_i_1_n_4 ;
  wire \counter_hold_reg[12]_i_1_n_5 ;
  wire \counter_hold_reg[12]_i_1_n_6 ;
  wire \counter_hold_reg[12]_i_1_n_7 ;
  wire \counter_hold_reg[16]_i_1_n_0 ;
  wire \counter_hold_reg[16]_i_1_n_1 ;
  wire \counter_hold_reg[16]_i_1_n_2 ;
  wire \counter_hold_reg[16]_i_1_n_3 ;
  wire \counter_hold_reg[16]_i_1_n_4 ;
  wire \counter_hold_reg[16]_i_1_n_5 ;
  wire \counter_hold_reg[16]_i_1_n_6 ;
  wire \counter_hold_reg[16]_i_1_n_7 ;
  wire \counter_hold_reg[20]_i_1_n_0 ;
  wire \counter_hold_reg[20]_i_1_n_1 ;
  wire \counter_hold_reg[20]_i_1_n_2 ;
  wire \counter_hold_reg[20]_i_1_n_3 ;
  wire \counter_hold_reg[20]_i_1_n_4 ;
  wire \counter_hold_reg[20]_i_1_n_5 ;
  wire \counter_hold_reg[20]_i_1_n_6 ;
  wire \counter_hold_reg[20]_i_1_n_7 ;
  wire \counter_hold_reg[24]_i_1_n_0 ;
  wire \counter_hold_reg[24]_i_1_n_1 ;
  wire \counter_hold_reg[24]_i_1_n_2 ;
  wire \counter_hold_reg[24]_i_1_n_3 ;
  wire \counter_hold_reg[24]_i_1_n_4 ;
  wire \counter_hold_reg[24]_i_1_n_5 ;
  wire \counter_hold_reg[24]_i_1_n_6 ;
  wire \counter_hold_reg[24]_i_1_n_7 ;
  wire \counter_hold_reg[28]_i_1_n_1 ;
  wire \counter_hold_reg[28]_i_1_n_2 ;
  wire \counter_hold_reg[28]_i_1_n_3 ;
  wire \counter_hold_reg[28]_i_1_n_4 ;
  wire \counter_hold_reg[28]_i_1_n_5 ;
  wire \counter_hold_reg[28]_i_1_n_6 ;
  wire \counter_hold_reg[28]_i_1_n_7 ;
  wire \counter_hold_reg[4]_i_1_n_0 ;
  wire \counter_hold_reg[4]_i_1_n_1 ;
  wire \counter_hold_reg[4]_i_1_n_2 ;
  wire \counter_hold_reg[4]_i_1_n_3 ;
  wire \counter_hold_reg[4]_i_1_n_4 ;
  wire \counter_hold_reg[4]_i_1_n_5 ;
  wire \counter_hold_reg[4]_i_1_n_6 ;
  wire \counter_hold_reg[4]_i_1_n_7 ;
  wire \counter_hold_reg[8]_i_1_n_0 ;
  wire \counter_hold_reg[8]_i_1_n_1 ;
  wire \counter_hold_reg[8]_i_1_n_2 ;
  wire \counter_hold_reg[8]_i_1_n_3 ;
  wire \counter_hold_reg[8]_i_1_n_4 ;
  wire \counter_hold_reg[8]_i_1_n_5 ;
  wire \counter_hold_reg[8]_i_1_n_6 ;
  wire \counter_hold_reg[8]_i_1_n_7 ;
  wire \counter_wait[0]_i_2_n_0 ;
  wire \counter_wait[0]_i_3_n_0 ;
  wire \counter_wait[0]_i_4_n_0 ;
  wire \counter_wait[0]_i_5_n_0 ;
  wire \counter_wait[0]_i_6_n_0 ;
  wire \counter_wait[12]_i_2_n_0 ;
  wire \counter_wait[12]_i_3_n_0 ;
  wire \counter_wait[12]_i_4_n_0 ;
  wire \counter_wait[12]_i_5_n_0 ;
  wire \counter_wait[16]_i_2_n_0 ;
  wire \counter_wait[16]_i_3_n_0 ;
  wire \counter_wait[16]_i_4_n_0 ;
  wire \counter_wait[16]_i_5_n_0 ;
  wire \counter_wait[20]_i_2_n_0 ;
  wire \counter_wait[20]_i_3_n_0 ;
  wire \counter_wait[20]_i_4_n_0 ;
  wire \counter_wait[20]_i_5_n_0 ;
  wire \counter_wait[24]_i_2_n_0 ;
  wire \counter_wait[24]_i_3_n_0 ;
  wire \counter_wait[24]_i_4_n_0 ;
  wire \counter_wait[24]_i_5_n_0 ;
  wire \counter_wait[28]_i_2_n_0 ;
  wire \counter_wait[28]_i_3_n_0 ;
  wire \counter_wait[28]_i_4_n_0 ;
  wire \counter_wait[28]_i_5_n_0 ;
  wire \counter_wait[4]_i_2_n_0 ;
  wire \counter_wait[4]_i_3_n_0 ;
  wire \counter_wait[4]_i_4_n_0 ;
  wire \counter_wait[4]_i_5_n_0 ;
  wire \counter_wait[8]_i_2_n_0 ;
  wire \counter_wait[8]_i_3_n_0 ;
  wire \counter_wait[8]_i_4_n_0 ;
  wire \counter_wait[8]_i_5_n_0 ;
  wire [31:0]counter_wait_reg;
  wire \counter_wait_reg[0]_i_1_n_0 ;
  wire \counter_wait_reg[0]_i_1_n_1 ;
  wire \counter_wait_reg[0]_i_1_n_2 ;
  wire \counter_wait_reg[0]_i_1_n_3 ;
  wire \counter_wait_reg[0]_i_1_n_4 ;
  wire \counter_wait_reg[0]_i_1_n_5 ;
  wire \counter_wait_reg[0]_i_1_n_6 ;
  wire \counter_wait_reg[0]_i_1_n_7 ;
  wire \counter_wait_reg[12]_i_1_n_0 ;
  wire \counter_wait_reg[12]_i_1_n_1 ;
  wire \counter_wait_reg[12]_i_1_n_2 ;
  wire \counter_wait_reg[12]_i_1_n_3 ;
  wire \counter_wait_reg[12]_i_1_n_4 ;
  wire \counter_wait_reg[12]_i_1_n_5 ;
  wire \counter_wait_reg[12]_i_1_n_6 ;
  wire \counter_wait_reg[12]_i_1_n_7 ;
  wire \counter_wait_reg[16]_i_1_n_0 ;
  wire \counter_wait_reg[16]_i_1_n_1 ;
  wire \counter_wait_reg[16]_i_1_n_2 ;
  wire \counter_wait_reg[16]_i_1_n_3 ;
  wire \counter_wait_reg[16]_i_1_n_4 ;
  wire \counter_wait_reg[16]_i_1_n_5 ;
  wire \counter_wait_reg[16]_i_1_n_6 ;
  wire \counter_wait_reg[16]_i_1_n_7 ;
  wire \counter_wait_reg[20]_i_1_n_0 ;
  wire \counter_wait_reg[20]_i_1_n_1 ;
  wire \counter_wait_reg[20]_i_1_n_2 ;
  wire \counter_wait_reg[20]_i_1_n_3 ;
  wire \counter_wait_reg[20]_i_1_n_4 ;
  wire \counter_wait_reg[20]_i_1_n_5 ;
  wire \counter_wait_reg[20]_i_1_n_6 ;
  wire \counter_wait_reg[20]_i_1_n_7 ;
  wire \counter_wait_reg[24]_i_1_n_0 ;
  wire \counter_wait_reg[24]_i_1_n_1 ;
  wire \counter_wait_reg[24]_i_1_n_2 ;
  wire \counter_wait_reg[24]_i_1_n_3 ;
  wire \counter_wait_reg[24]_i_1_n_4 ;
  wire \counter_wait_reg[24]_i_1_n_5 ;
  wire \counter_wait_reg[24]_i_1_n_6 ;
  wire \counter_wait_reg[24]_i_1_n_7 ;
  wire \counter_wait_reg[28]_i_1_n_1 ;
  wire \counter_wait_reg[28]_i_1_n_2 ;
  wire \counter_wait_reg[28]_i_1_n_3 ;
  wire \counter_wait_reg[28]_i_1_n_4 ;
  wire \counter_wait_reg[28]_i_1_n_5 ;
  wire \counter_wait_reg[28]_i_1_n_6 ;
  wire \counter_wait_reg[28]_i_1_n_7 ;
  wire \counter_wait_reg[4]_i_1_n_0 ;
  wire \counter_wait_reg[4]_i_1_n_1 ;
  wire \counter_wait_reg[4]_i_1_n_2 ;
  wire \counter_wait_reg[4]_i_1_n_3 ;
  wire \counter_wait_reg[4]_i_1_n_4 ;
  wire \counter_wait_reg[4]_i_1_n_5 ;
  wire \counter_wait_reg[4]_i_1_n_6 ;
  wire \counter_wait_reg[4]_i_1_n_7 ;
  wire \counter_wait_reg[8]_i_1_n_0 ;
  wire \counter_wait_reg[8]_i_1_n_1 ;
  wire \counter_wait_reg[8]_i_1_n_2 ;
  wire \counter_wait_reg[8]_i_1_n_3 ;
  wire \counter_wait_reg[8]_i_1_n_4 ;
  wire \counter_wait_reg[8]_i_1_n_5 ;
  wire \counter_wait_reg[8]_i_1_n_6 ;
  wire \counter_wait_reg[8]_i_1_n_7 ;
  wire [2:0]current_state;
  wire \current_state[1]_i_2_n_0 ;
  wire \current_state[2]_i_2_n_0 ;
  wire [2:0]mem_state;
  wire \mem_state[0]_i_1_n_0 ;
  wire \mem_state[0]_i_2_n_0 ;
  wire \mem_state[1]_i_1_n_0 ;
  wire \mem_state[2]_i_10_n_0 ;
  wire \mem_state[2]_i_11_n_0 ;
  wire \mem_state[2]_i_12_n_0 ;
  wire \mem_state[2]_i_13_n_0 ;
  wire \mem_state[2]_i_14_n_0 ;
  wire \mem_state[2]_i_15_n_0 ;
  wire \mem_state[2]_i_16_n_0 ;
  wire \mem_state[2]_i_17_n_0 ;
  wire \mem_state[2]_i_18_n_0 ;
  wire \mem_state[2]_i_19_n_0 ;
  wire \mem_state[2]_i_1_n_0 ;
  wire \mem_state[2]_i_20_n_0 ;
  wire \mem_state[2]_i_21_n_0 ;
  wire \mem_state[2]_i_2_n_0 ;
  wire \mem_state[2]_i_3_n_0 ;
  wire \mem_state[2]_i_4_n_0 ;
  wire \mem_state[2]_i_5_n_0 ;
  wire \mem_state[2]_i_6_n_0 ;
  wire \mem_state[2]_i_7_n_0 ;
  wire \mem_state[2]_i_8_n_0 ;
  wire \mem_state[2]_i_9_n_0 ;
  wire [2:0]next_state;
  wire reset_n;
  wire \vol_data[0][4]_i_1_n_0 ;
  wire \vol_data[1][4]_i_1_n_0 ;
  wire \vol_data[2][4]_i_1_n_0 ;
  wire \vol_data[3][4]_i_1_n_0 ;
  wire \vol_data[4][4]_i_1_n_0 ;
  wire \vol_data[5][4]_i_1_n_0 ;
  wire \vol_data[6][4]_i_1_n_0 ;
  wire \vol_data[7][0]_i_1_n_0 ;
  wire \vol_data[7][1]_i_1_n_0 ;
  wire \vol_data[7][2]_i_1_n_0 ;
  wire \vol_data[7][3]_i_1_n_0 ;
  wire \vol_data[7][4]_i_11_n_0 ;
  wire \vol_data[7][4]_i_12_n_0 ;
  wire \vol_data[7][4]_i_13_n_0 ;
  wire \vol_data[7][4]_i_14_n_0 ;
  wire \vol_data[7][4]_i_15_n_0 ;
  wire \vol_data[7][4]_i_16_n_0 ;
  wire \vol_data[7][4]_i_17_n_0 ;
  wire \vol_data[7][4]_i_18_n_0 ;
  wire \vol_data[7][4]_i_19_n_0 ;
  wire \vol_data[7][4]_i_1_n_0 ;
  wire \vol_data[7][4]_i_20_n_0 ;
  wire \vol_data[7][4]_i_21_n_0 ;
  wire \vol_data[7][4]_i_2_n_0 ;
  wire \vol_data[7][4]_i_3_n_0 ;
  wire \vol_data[7][4]_i_4_n_0 ;
  wire \vol_data[7][4]_i_6_n_0 ;
  wire \vol_data[7][4]_i_7_n_0 ;
  wire \vol_data[7][4]_i_8_n_0 ;
  wire \vol_data[7][4]_i_9_n_0 ;
  wire [4:0]\vol_data_reg[1][4]_0 ;
  wire [4:0]\vol_data_reg[2][4]_0 ;
  wire [4:0]\vol_data_reg[3][4]_0 ;
  wire [4:0]\vol_data_reg[4][4]_0 ;
  wire [4:0]\vol_data_reg[5][4]_0 ;
  wire [4:0]\vol_data_reg[6][4]_0 ;
  wire [4:0]\vol_data_reg[7][4]_0 ;
  wire \vol_data_reg[7][4]_i_10_n_0 ;
  wire \vol_data_reg[7][4]_i_5_n_0 ;
  wire [3:3]\NLW_counter_hold_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_counter_wait_reg[28]_i_1_CO_UNCONNECTED ;

  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \ROM0.U_ROM_i_1 
       (.I0(\ROM0.U_ROM_i_6_n_0 ),
        .I1(CO),
        .I2(\ROM0.U_ROM_i_8_n_0 ),
        .I3(O[3]),
        .I4(\ROM0.U_ROM_i_9_n_0 ),
        .O(a[4]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \ROM0.U_ROM_i_10 
       (.I0(\vol_data_reg[7][4]_0 [4]),
        .I1(O[1]),
        .I2(\ROM0.U_ROM_i_30_n_0 ),
        .I3(O[0]),
        .I4(\ROM0.U_ROM_i_31_n_0 ),
        .O(\ROM0.U_ROM_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_11 
       (.I0(\ROM0.U_ROM_i_32_n_0 ),
        .I1(\ROM0.U_ROM_i_33_n_0 ),
        .I2(O[2]),
        .I3(\ROM0.U_ROM_i_34_n_0 ),
        .I4(O[1]),
        .I5(\ROM0.U_ROM_i_35_n_0 ),
        .O(\ROM0.U_ROM_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_12 
       (.I0(\ROM0.U_ROM_i_36_n_0 ),
        .I1(\ROM0.U_ROM_i_37_n_0 ),
        .I2(O[2]),
        .I3(\ROM0.U_ROM_i_38_n_0 ),
        .I4(O[1]),
        .I5(\ROM0.U_ROM_i_39_n_0 ),
        .O(\ROM0.U_ROM_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \ROM0.U_ROM_i_13 
       (.I0(\vol_data_reg[7][4]_0 [3]),
        .I1(\ROM0.U_ROM_i_1_0 ),
        .I2(\vol_data_reg[7][4]_0 [4]),
        .I3(O[1]),
        .I4(\ROM0.U_ROM_i_40_n_0 ),
        .O(\ROM0.U_ROM_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_14 
       (.I0(\ROM0.U_ROM_i_41_n_0 ),
        .I1(\ROM0.U_ROM_i_42_n_0 ),
        .I2(O[2]),
        .I3(\ROM0.U_ROM_i_43_n_0 ),
        .I4(O[1]),
        .I5(\ROM0.U_ROM_i_44_n_0 ),
        .O(\ROM0.U_ROM_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_15 
       (.I0(\ROM0.U_ROM_i_45_n_0 ),
        .I1(\ROM0.U_ROM_i_46_n_0 ),
        .I2(O[2]),
        .I3(\ROM0.U_ROM_i_47_n_0 ),
        .I4(O[1]),
        .I5(\ROM0.U_ROM_i_48_n_0 ),
        .O(\ROM0.U_ROM_i_15_n_0 ));
  MUXF7 \ROM0.U_ROM_i_16 
       (.I0(\ROM0.U_ROM_i_49_n_0 ),
        .I1(\ROM0.U_ROM_i_50_n_0 ),
        .O(\ROM0.U_ROM_i_16_n_0 ),
        .S(O[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_17 
       (.I0(\ROM0.U_ROM_i_51_n_0 ),
        .I1(\ROM0.U_ROM_i_52_n_0 ),
        .I2(O[2]),
        .I3(\ROM0.U_ROM_i_53_n_0 ),
        .I4(O[1]),
        .I5(\ROM0.U_ROM_i_54_n_0 ),
        .O(\ROM0.U_ROM_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_18 
       (.I0(\ROM0.U_ROM_i_55_n_0 ),
        .I1(\ROM0.U_ROM_i_56_n_0 ),
        .I2(O[2]),
        .I3(\ROM0.U_ROM_i_57_n_0 ),
        .I4(O[1]),
        .I5(\ROM0.U_ROM_i_58_n_0 ),
        .O(\ROM0.U_ROM_i_18_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \ROM0.U_ROM_i_19 
       (.I0(\ROM0.U_ROM_i_6_n_0 ),
        .I1(O[1]),
        .I2(\ROM0.U_ROM_i_22_n_0 ),
        .O(\ROM0.U_ROM_i_19_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \ROM0.U_ROM_i_2 
       (.I0(\ROM0.U_ROM_i_10_n_0 ),
        .I1(CO),
        .I2(\ROM0.U_ROM_i_11_n_0 ),
        .I3(O[3]),
        .I4(\ROM0.U_ROM_i_12_n_0 ),
        .O(a[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_20 
       (.I0(\ROM0.U_ROM_i_23_n_0 ),
        .I1(\ROM0.U_ROM_i_24_n_0 ),
        .I2(O[2]),
        .I3(\ROM0.U_ROM_i_25_n_0 ),
        .I4(O[1]),
        .I5(\ROM0.U_ROM_i_26_n_0 ),
        .O(\ROM0.U_ROM_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_21 
       (.I0(\ROM0.U_ROM_i_27_n_0 ),
        .I1(\ROM0.U_ROM_i_28_n_0 ),
        .I2(O[2]),
        .I3(\ROM0.U_ROM_i_29_n_0 ),
        .I4(O[1]),
        .I5(\ROM0.U_ROM_i_59_n_0 ),
        .O(\ROM0.U_ROM_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_22 
       (.I0(\vol_data_reg[6][4]_0 [4]),
        .I1(\vol_data_reg[7][4]_0 [0]),
        .I2(O[0]),
        .I3(\vol_data_reg[6][4]_0 [2]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[6][4]_0 [3]),
        .O(\ROM0.U_ROM_i_22_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_23 
       (.I0(\vol_data_reg[6][4]_0 [0]),
        .I1(\vol_data_reg[6][4]_0 [1]),
        .I2(O[0]),
        .I3(\vol_data_reg[5][4]_0 [3]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[5][4]_0 [4]),
        .O(\ROM0.U_ROM_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_24 
       (.I0(\vol_data_reg[5][4]_0 [1]),
        .I1(\vol_data_reg[5][4]_0 [2]),
        .I2(O[0]),
        .I3(\vol_data_reg[4][4]_0 [4]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[5][4]_0 [0]),
        .O(\ROM0.U_ROM_i_24_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_25 
       (.I0(\vol_data_reg[4][4]_0 [2]),
        .I1(\vol_data_reg[4][4]_0 [3]),
        .I2(O[0]),
        .I3(\vol_data_reg[4][4]_0 [0]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[4][4]_0 [1]),
        .O(\ROM0.U_ROM_i_25_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_26 
       (.I0(\vol_data_reg[3][4]_0 [3]),
        .I1(\vol_data_reg[3][4]_0 [4]),
        .I2(O[0]),
        .I3(\vol_data_reg[3][4]_0 [1]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[3][4]_0 [2]),
        .O(\ROM0.U_ROM_i_26_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_27 
       (.I0(\vol_data_reg[2][4]_0 [4]),
        .I1(\vol_data_reg[3][4]_0 [0]),
        .I2(O[0]),
        .I3(\vol_data_reg[2][4]_0 [2]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[2][4]_0 [3]),
        .O(\ROM0.U_ROM_i_27_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_28 
       (.I0(\vol_data_reg[2][4]_0 [0]),
        .I1(\vol_data_reg[2][4]_0 [1]),
        .I2(O[0]),
        .I3(\vol_data_reg[1][4]_0 [3]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[1][4]_0 [4]),
        .O(\ROM0.U_ROM_i_28_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_29 
       (.I0(\vol_data_reg[1][4]_0 [1]),
        .I1(\vol_data_reg[1][4]_0 [2]),
        .I2(O[0]),
        .I3(Q[4]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[1][4]_0 [0]),
        .O(\ROM0.U_ROM_i_29_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \ROM0.U_ROM_i_3 
       (.I0(\ROM0.U_ROM_i_13_n_0 ),
        .I1(CO),
        .I2(\ROM0.U_ROM_i_14_n_0 ),
        .I3(O[3]),
        .I4(\ROM0.U_ROM_i_15_n_0 ),
        .O(a[2]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \ROM0.U_ROM_i_30 
       (.I0(\vol_data_reg[7][4]_0 [2]),
        .I1(\ROM0.U_ROM_i_1_0 ),
        .I2(\vol_data_reg[7][4]_0 [3]),
        .O(\ROM0.U_ROM_i_30_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \ROM0.U_ROM_i_31 
       (.I0(\vol_data_reg[7][4]_0 [0]),
        .I1(\ROM0.U_ROM_i_1_0 ),
        .I2(\vol_data_reg[7][4]_0 [1]),
        .O(\ROM0.U_ROM_i_31_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_32 
       (.I0(\vol_data_reg[6][4]_0 [3]),
        .I1(\vol_data_reg[6][4]_0 [4]),
        .I2(O[0]),
        .I3(\vol_data_reg[6][4]_0 [1]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[6][4]_0 [2]),
        .O(\ROM0.U_ROM_i_32_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_33 
       (.I0(\vol_data_reg[5][4]_0 [4]),
        .I1(\vol_data_reg[6][4]_0 [0]),
        .I2(O[0]),
        .I3(\vol_data_reg[5][4]_0 [2]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[5][4]_0 [3]),
        .O(\ROM0.U_ROM_i_33_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_34 
       (.I0(\vol_data_reg[5][4]_0 [0]),
        .I1(\vol_data_reg[5][4]_0 [1]),
        .I2(O[0]),
        .I3(\vol_data_reg[4][4]_0 [3]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[4][4]_0 [4]),
        .O(\ROM0.U_ROM_i_34_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_35 
       (.I0(\vol_data_reg[4][4]_0 [1]),
        .I1(\vol_data_reg[4][4]_0 [2]),
        .I2(O[0]),
        .I3(\vol_data_reg[3][4]_0 [4]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[4][4]_0 [0]),
        .O(\ROM0.U_ROM_i_35_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_36 
       (.I0(\vol_data_reg[3][4]_0 [2]),
        .I1(\vol_data_reg[3][4]_0 [3]),
        .I2(O[0]),
        .I3(\vol_data_reg[3][4]_0 [0]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[3][4]_0 [1]),
        .O(\ROM0.U_ROM_i_36_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_37 
       (.I0(\vol_data_reg[2][4]_0 [3]),
        .I1(\vol_data_reg[2][4]_0 [4]),
        .I2(O[0]),
        .I3(\vol_data_reg[2][4]_0 [1]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[2][4]_0 [2]),
        .O(\ROM0.U_ROM_i_37_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_38 
       (.I0(\vol_data_reg[1][4]_0 [4]),
        .I1(\vol_data_reg[2][4]_0 [0]),
        .I2(O[0]),
        .I3(\vol_data_reg[1][4]_0 [2]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[1][4]_0 [3]),
        .O(\ROM0.U_ROM_i_38_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_39 
       (.I0(\vol_data_reg[1][4]_0 [0]),
        .I1(\vol_data_reg[1][4]_0 [1]),
        .I2(O[0]),
        .I3(Q[3]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(Q[4]),
        .O(\ROM0.U_ROM_i_39_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \ROM0.U_ROM_i_4 
       (.I0(\ROM0.U_ROM_i_16_n_0 ),
        .I1(CO),
        .I2(\ROM0.U_ROM_i_17_n_0 ),
        .I3(O[3]),
        .I4(\ROM0.U_ROM_i_18_n_0 ),
        .O(a[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_40 
       (.I0(\vol_data_reg[7][4]_0 [1]),
        .I1(\vol_data_reg[7][4]_0 [2]),
        .I2(O[0]),
        .I3(\vol_data_reg[6][4]_0 [4]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[7][4]_0 [0]),
        .O(\ROM0.U_ROM_i_40_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_41 
       (.I0(\vol_data_reg[6][4]_0 [2]),
        .I1(\vol_data_reg[6][4]_0 [3]),
        .I2(O[0]),
        .I3(\vol_data_reg[6][4]_0 [0]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[6][4]_0 [1]),
        .O(\ROM0.U_ROM_i_41_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_42 
       (.I0(\vol_data_reg[5][4]_0 [3]),
        .I1(\vol_data_reg[5][4]_0 [4]),
        .I2(O[0]),
        .I3(\vol_data_reg[5][4]_0 [1]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[5][4]_0 [2]),
        .O(\ROM0.U_ROM_i_42_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_43 
       (.I0(\vol_data_reg[4][4]_0 [4]),
        .I1(\vol_data_reg[5][4]_0 [0]),
        .I2(O[0]),
        .I3(\vol_data_reg[4][4]_0 [2]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[4][4]_0 [3]),
        .O(\ROM0.U_ROM_i_43_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_44 
       (.I0(\vol_data_reg[4][4]_0 [0]),
        .I1(\vol_data_reg[4][4]_0 [1]),
        .I2(O[0]),
        .I3(\vol_data_reg[3][4]_0 [3]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[3][4]_0 [4]),
        .O(\ROM0.U_ROM_i_44_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_45 
       (.I0(\vol_data_reg[3][4]_0 [1]),
        .I1(\vol_data_reg[3][4]_0 [2]),
        .I2(O[0]),
        .I3(\vol_data_reg[2][4]_0 [4]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[3][4]_0 [0]),
        .O(\ROM0.U_ROM_i_45_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_46 
       (.I0(\vol_data_reg[2][4]_0 [2]),
        .I1(\vol_data_reg[2][4]_0 [3]),
        .I2(O[0]),
        .I3(\vol_data_reg[2][4]_0 [0]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[2][4]_0 [1]),
        .O(\ROM0.U_ROM_i_46_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_47 
       (.I0(\vol_data_reg[1][4]_0 [3]),
        .I1(\vol_data_reg[1][4]_0 [4]),
        .I2(O[0]),
        .I3(\vol_data_reg[1][4]_0 [1]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[1][4]_0 [2]),
        .O(\ROM0.U_ROM_i_47_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_48 
       (.I0(Q[4]),
        .I1(\vol_data_reg[1][4]_0 [0]),
        .I2(O[0]),
        .I3(Q[2]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(Q[3]),
        .O(\ROM0.U_ROM_i_48_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_49 
       (.I0(\vol_data_reg[7][4]_0 [0]),
        .I1(\vol_data_reg[7][4]_0 [1]),
        .I2(O[0]),
        .I3(\vol_data_reg[6][4]_0 [3]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[6][4]_0 [4]),
        .O(\ROM0.U_ROM_i_49_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \ROM0.U_ROM_i_5 
       (.I0(\ROM0.U_ROM_i_19_n_0 ),
        .I1(CO),
        .I2(\ROM0.U_ROM_i_20_n_0 ),
        .I3(O[3]),
        .I4(\ROM0.U_ROM_i_21_n_0 ),
        .O(a[0]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \ROM0.U_ROM_i_50 
       (.I0(\vol_data_reg[7][4]_0 [4]),
        .I1(O[0]),
        .I2(\vol_data_reg[7][4]_0 [2]),
        .I3(\ROM0.U_ROM_i_1_0 ),
        .I4(\vol_data_reg[7][4]_0 [3]),
        .O(\ROM0.U_ROM_i_50_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_51 
       (.I0(\vol_data_reg[6][4]_0 [1]),
        .I1(\vol_data_reg[6][4]_0 [2]),
        .I2(O[0]),
        .I3(\vol_data_reg[5][4]_0 [4]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[6][4]_0 [0]),
        .O(\ROM0.U_ROM_i_51_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_52 
       (.I0(\vol_data_reg[5][4]_0 [2]),
        .I1(\vol_data_reg[5][4]_0 [3]),
        .I2(O[0]),
        .I3(\vol_data_reg[5][4]_0 [0]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[5][4]_0 [1]),
        .O(\ROM0.U_ROM_i_52_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_53 
       (.I0(\vol_data_reg[4][4]_0 [3]),
        .I1(\vol_data_reg[4][4]_0 [4]),
        .I2(O[0]),
        .I3(\vol_data_reg[4][4]_0 [1]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[4][4]_0 [2]),
        .O(\ROM0.U_ROM_i_53_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_54 
       (.I0(\vol_data_reg[3][4]_0 [4]),
        .I1(\vol_data_reg[4][4]_0 [0]),
        .I2(O[0]),
        .I3(\vol_data_reg[3][4]_0 [2]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[3][4]_0 [3]),
        .O(\ROM0.U_ROM_i_54_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_55 
       (.I0(\vol_data_reg[3][4]_0 [0]),
        .I1(\vol_data_reg[3][4]_0 [1]),
        .I2(O[0]),
        .I3(\vol_data_reg[2][4]_0 [3]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[2][4]_0 [4]),
        .O(\ROM0.U_ROM_i_55_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_56 
       (.I0(\vol_data_reg[2][4]_0 [1]),
        .I1(\vol_data_reg[2][4]_0 [2]),
        .I2(O[0]),
        .I3(\vol_data_reg[1][4]_0 [4]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[2][4]_0 [0]),
        .O(\ROM0.U_ROM_i_56_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_57 
       (.I0(\vol_data_reg[1][4]_0 [2]),
        .I1(\vol_data_reg[1][4]_0 [3]),
        .I2(O[0]),
        .I3(\vol_data_reg[1][4]_0 [0]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[1][4]_0 [1]),
        .O(\ROM0.U_ROM_i_57_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_58 
       (.I0(Q[3]),
        .I1(Q[4]),
        .I2(O[0]),
        .I3(Q[1]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(Q[2]),
        .O(\ROM0.U_ROM_i_58_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_59 
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(O[0]),
        .I3(Q[0]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(Q[1]),
        .O(\ROM0.U_ROM_i_59_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_6 
       (.I0(\vol_data_reg[7][4]_0 [3]),
        .I1(\vol_data_reg[7][4]_0 [4]),
        .I2(O[0]),
        .I3(\vol_data_reg[7][4]_0 [1]),
        .I4(\ROM0.U_ROM_i_1_0 ),
        .I5(\vol_data_reg[7][4]_0 [2]),
        .O(\ROM0.U_ROM_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_8 
       (.I0(\ROM0.U_ROM_i_22_n_0 ),
        .I1(\ROM0.U_ROM_i_23_n_0 ),
        .I2(O[2]),
        .I3(\ROM0.U_ROM_i_24_n_0 ),
        .I4(O[1]),
        .I5(\ROM0.U_ROM_i_25_n_0 ),
        .O(\ROM0.U_ROM_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ROM0.U_ROM_i_9 
       (.I0(\ROM0.U_ROM_i_26_n_0 ),
        .I1(\ROM0.U_ROM_i_27_n_0 ),
        .I2(O[2]),
        .I3(\ROM0.U_ROM_i_28_n_0 ),
        .I4(O[1]),
        .I5(\ROM0.U_ROM_i_29_n_0 ),
        .O(\ROM0.U_ROM_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \counter_hold[0]_i_2 
       (.I0(current_state[2]),
        .I1(current_state[1]),
        .O(\counter_hold[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[0]_i_3 
       (.I0(counter_hold_reg[3]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[0]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[0]_i_4 
       (.I0(counter_hold_reg[2]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[0]_i_5 
       (.I0(counter_hold_reg[1]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[0]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h10)) 
    \counter_hold[0]_i_6 
       (.I0(counter_hold_reg[0]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[0]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[12]_i_2 
       (.I0(counter_hold_reg[15]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[12]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[12]_i_3 
       (.I0(counter_hold_reg[14]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[12]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[12]_i_4 
       (.I0(counter_hold_reg[13]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[12]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[12]_i_5 
       (.I0(counter_hold_reg[12]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[12]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[16]_i_2 
       (.I0(counter_hold_reg[19]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[16]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[16]_i_3 
       (.I0(counter_hold_reg[18]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[16]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[16]_i_4 
       (.I0(counter_hold_reg[17]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[16]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[16]_i_5 
       (.I0(counter_hold_reg[16]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[16]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[20]_i_2 
       (.I0(counter_hold_reg[23]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[20]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[20]_i_3 
       (.I0(counter_hold_reg[22]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[20]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[20]_i_4 
       (.I0(counter_hold_reg[21]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[20]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[20]_i_5 
       (.I0(counter_hold_reg[20]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[20]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[24]_i_2 
       (.I0(counter_hold_reg[27]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[24]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[24]_i_3 
       (.I0(counter_hold_reg[26]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[24]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[24]_i_4 
       (.I0(counter_hold_reg[25]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[24]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[24]_i_5 
       (.I0(counter_hold_reg[24]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[24]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[28]_i_2 
       (.I0(counter_hold_reg[31]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[28]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[28]_i_3 
       (.I0(counter_hold_reg[30]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[28]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[28]_i_4 
       (.I0(counter_hold_reg[29]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[28]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[28]_i_5 
       (.I0(counter_hold_reg[28]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[28]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[4]_i_2 
       (.I0(counter_hold_reg[7]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[4]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[4]_i_3 
       (.I0(counter_hold_reg[6]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[4]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[4]_i_4 
       (.I0(counter_hold_reg[5]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[4]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[4]_i_5 
       (.I0(counter_hold_reg[4]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[4]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[8]_i_2 
       (.I0(counter_hold_reg[11]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[8]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[8]_i_3 
       (.I0(counter_hold_reg[10]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[8]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[8]_i_4 
       (.I0(counter_hold_reg[9]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[8]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \counter_hold[8]_i_5 
       (.I0(counter_hold_reg[8]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_hold[8]_i_5_n_0 ));
  FDCE \counter_hold_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[0]_i_1_n_7 ),
        .Q(counter_hold_reg[0]));
  CARRY4 \counter_hold_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\counter_hold_reg[0]_i_1_n_0 ,\counter_hold_reg[0]_i_1_n_1 ,\counter_hold_reg[0]_i_1_n_2 ,\counter_hold_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\counter_hold[0]_i_2_n_0 }),
        .O({\counter_hold_reg[0]_i_1_n_4 ,\counter_hold_reg[0]_i_1_n_5 ,\counter_hold_reg[0]_i_1_n_6 ,\counter_hold_reg[0]_i_1_n_7 }),
        .S({\counter_hold[0]_i_3_n_0 ,\counter_hold[0]_i_4_n_0 ,\counter_hold[0]_i_5_n_0 ,\counter_hold[0]_i_6_n_0 }));
  FDCE \counter_hold_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[8]_i_1_n_5 ),
        .Q(counter_hold_reg[10]));
  FDCE \counter_hold_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[8]_i_1_n_4 ),
        .Q(counter_hold_reg[11]));
  FDCE \counter_hold_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[12]_i_1_n_7 ),
        .Q(counter_hold_reg[12]));
  CARRY4 \counter_hold_reg[12]_i_1 
       (.CI(\counter_hold_reg[8]_i_1_n_0 ),
        .CO({\counter_hold_reg[12]_i_1_n_0 ,\counter_hold_reg[12]_i_1_n_1 ,\counter_hold_reg[12]_i_1_n_2 ,\counter_hold_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_hold_reg[12]_i_1_n_4 ,\counter_hold_reg[12]_i_1_n_5 ,\counter_hold_reg[12]_i_1_n_6 ,\counter_hold_reg[12]_i_1_n_7 }),
        .S({\counter_hold[12]_i_2_n_0 ,\counter_hold[12]_i_3_n_0 ,\counter_hold[12]_i_4_n_0 ,\counter_hold[12]_i_5_n_0 }));
  FDCE \counter_hold_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[12]_i_1_n_6 ),
        .Q(counter_hold_reg[13]));
  FDCE \counter_hold_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[12]_i_1_n_5 ),
        .Q(counter_hold_reg[14]));
  FDCE \counter_hold_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[12]_i_1_n_4 ),
        .Q(counter_hold_reg[15]));
  FDCE \counter_hold_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[16]_i_1_n_7 ),
        .Q(counter_hold_reg[16]));
  CARRY4 \counter_hold_reg[16]_i_1 
       (.CI(\counter_hold_reg[12]_i_1_n_0 ),
        .CO({\counter_hold_reg[16]_i_1_n_0 ,\counter_hold_reg[16]_i_1_n_1 ,\counter_hold_reg[16]_i_1_n_2 ,\counter_hold_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_hold_reg[16]_i_1_n_4 ,\counter_hold_reg[16]_i_1_n_5 ,\counter_hold_reg[16]_i_1_n_6 ,\counter_hold_reg[16]_i_1_n_7 }),
        .S({\counter_hold[16]_i_2_n_0 ,\counter_hold[16]_i_3_n_0 ,\counter_hold[16]_i_4_n_0 ,\counter_hold[16]_i_5_n_0 }));
  FDCE \counter_hold_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[16]_i_1_n_6 ),
        .Q(counter_hold_reg[17]));
  FDCE \counter_hold_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[16]_i_1_n_5 ),
        .Q(counter_hold_reg[18]));
  FDCE \counter_hold_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[16]_i_1_n_4 ),
        .Q(counter_hold_reg[19]));
  FDCE \counter_hold_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[0]_i_1_n_6 ),
        .Q(counter_hold_reg[1]));
  FDCE \counter_hold_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[20]_i_1_n_7 ),
        .Q(counter_hold_reg[20]));
  CARRY4 \counter_hold_reg[20]_i_1 
       (.CI(\counter_hold_reg[16]_i_1_n_0 ),
        .CO({\counter_hold_reg[20]_i_1_n_0 ,\counter_hold_reg[20]_i_1_n_1 ,\counter_hold_reg[20]_i_1_n_2 ,\counter_hold_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_hold_reg[20]_i_1_n_4 ,\counter_hold_reg[20]_i_1_n_5 ,\counter_hold_reg[20]_i_1_n_6 ,\counter_hold_reg[20]_i_1_n_7 }),
        .S({\counter_hold[20]_i_2_n_0 ,\counter_hold[20]_i_3_n_0 ,\counter_hold[20]_i_4_n_0 ,\counter_hold[20]_i_5_n_0 }));
  FDCE \counter_hold_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[20]_i_1_n_6 ),
        .Q(counter_hold_reg[21]));
  FDCE \counter_hold_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[20]_i_1_n_5 ),
        .Q(counter_hold_reg[22]));
  FDCE \counter_hold_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[20]_i_1_n_4 ),
        .Q(counter_hold_reg[23]));
  FDCE \counter_hold_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[24]_i_1_n_7 ),
        .Q(counter_hold_reg[24]));
  CARRY4 \counter_hold_reg[24]_i_1 
       (.CI(\counter_hold_reg[20]_i_1_n_0 ),
        .CO({\counter_hold_reg[24]_i_1_n_0 ,\counter_hold_reg[24]_i_1_n_1 ,\counter_hold_reg[24]_i_1_n_2 ,\counter_hold_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_hold_reg[24]_i_1_n_4 ,\counter_hold_reg[24]_i_1_n_5 ,\counter_hold_reg[24]_i_1_n_6 ,\counter_hold_reg[24]_i_1_n_7 }),
        .S({\counter_hold[24]_i_2_n_0 ,\counter_hold[24]_i_3_n_0 ,\counter_hold[24]_i_4_n_0 ,\counter_hold[24]_i_5_n_0 }));
  FDCE \counter_hold_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[24]_i_1_n_6 ),
        .Q(counter_hold_reg[25]));
  FDCE \counter_hold_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[24]_i_1_n_5 ),
        .Q(counter_hold_reg[26]));
  FDCE \counter_hold_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[24]_i_1_n_4 ),
        .Q(counter_hold_reg[27]));
  FDCE \counter_hold_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[28]_i_1_n_7 ),
        .Q(counter_hold_reg[28]));
  CARRY4 \counter_hold_reg[28]_i_1 
       (.CI(\counter_hold_reg[24]_i_1_n_0 ),
        .CO({\NLW_counter_hold_reg[28]_i_1_CO_UNCONNECTED [3],\counter_hold_reg[28]_i_1_n_1 ,\counter_hold_reg[28]_i_1_n_2 ,\counter_hold_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_hold_reg[28]_i_1_n_4 ,\counter_hold_reg[28]_i_1_n_5 ,\counter_hold_reg[28]_i_1_n_6 ,\counter_hold_reg[28]_i_1_n_7 }),
        .S({\counter_hold[28]_i_2_n_0 ,\counter_hold[28]_i_3_n_0 ,\counter_hold[28]_i_4_n_0 ,\counter_hold[28]_i_5_n_0 }));
  FDCE \counter_hold_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[28]_i_1_n_6 ),
        .Q(counter_hold_reg[29]));
  FDCE \counter_hold_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[0]_i_1_n_5 ),
        .Q(counter_hold_reg[2]));
  FDCE \counter_hold_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[28]_i_1_n_5 ),
        .Q(counter_hold_reg[30]));
  FDCE \counter_hold_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[28]_i_1_n_4 ),
        .Q(counter_hold_reg[31]));
  FDCE \counter_hold_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[0]_i_1_n_4 ),
        .Q(counter_hold_reg[3]));
  FDCE \counter_hold_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[4]_i_1_n_7 ),
        .Q(counter_hold_reg[4]));
  CARRY4 \counter_hold_reg[4]_i_1 
       (.CI(\counter_hold_reg[0]_i_1_n_0 ),
        .CO({\counter_hold_reg[4]_i_1_n_0 ,\counter_hold_reg[4]_i_1_n_1 ,\counter_hold_reg[4]_i_1_n_2 ,\counter_hold_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_hold_reg[4]_i_1_n_4 ,\counter_hold_reg[4]_i_1_n_5 ,\counter_hold_reg[4]_i_1_n_6 ,\counter_hold_reg[4]_i_1_n_7 }),
        .S({\counter_hold[4]_i_2_n_0 ,\counter_hold[4]_i_3_n_0 ,\counter_hold[4]_i_4_n_0 ,\counter_hold[4]_i_5_n_0 }));
  FDCE \counter_hold_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[4]_i_1_n_6 ),
        .Q(counter_hold_reg[5]));
  FDCE \counter_hold_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[4]_i_1_n_5 ),
        .Q(counter_hold_reg[6]));
  FDCE \counter_hold_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[4]_i_1_n_4 ),
        .Q(counter_hold_reg[7]));
  FDCE \counter_hold_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[8]_i_1_n_7 ),
        .Q(counter_hold_reg[8]));
  CARRY4 \counter_hold_reg[8]_i_1 
       (.CI(\counter_hold_reg[4]_i_1_n_0 ),
        .CO({\counter_hold_reg[8]_i_1_n_0 ,\counter_hold_reg[8]_i_1_n_1 ,\counter_hold_reg[8]_i_1_n_2 ,\counter_hold_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_hold_reg[8]_i_1_n_4 ,\counter_hold_reg[8]_i_1_n_5 ,\counter_hold_reg[8]_i_1_n_6 ,\counter_hold_reg[8]_i_1_n_7 }),
        .S({\counter_hold[8]_i_2_n_0 ,\counter_hold[8]_i_3_n_0 ,\counter_hold[8]_i_4_n_0 ,\counter_hold[8]_i_5_n_0 }));
  FDCE \counter_hold_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_hold_reg[8]_i_1_n_6 ),
        .Q(counter_hold_reg[9]));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_wait[0]_i_2 
       (.I0(current_state[2]),
        .I1(current_state[1]),
        .O(\counter_wait[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[0]_i_3 
       (.I0(counter_wait_reg[3]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[0]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[0]_i_4 
       (.I0(counter_wait_reg[2]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[0]_i_5 
       (.I0(counter_wait_reg[1]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[0]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \counter_wait[0]_i_6 
       (.I0(counter_wait_reg[0]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[0]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[12]_i_2 
       (.I0(counter_wait_reg[15]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[12]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[12]_i_3 
       (.I0(counter_wait_reg[14]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[12]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[12]_i_4 
       (.I0(counter_wait_reg[13]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[12]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[12]_i_5 
       (.I0(counter_wait_reg[12]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[12]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[16]_i_2 
       (.I0(counter_wait_reg[19]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[16]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[16]_i_3 
       (.I0(counter_wait_reg[18]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[16]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[16]_i_4 
       (.I0(counter_wait_reg[17]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[16]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[16]_i_5 
       (.I0(counter_wait_reg[16]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[16]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[20]_i_2 
       (.I0(counter_wait_reg[23]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[20]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[20]_i_3 
       (.I0(counter_wait_reg[22]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[20]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[20]_i_4 
       (.I0(counter_wait_reg[21]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[20]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[20]_i_5 
       (.I0(counter_wait_reg[20]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[20]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[24]_i_2 
       (.I0(counter_wait_reg[27]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[24]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[24]_i_3 
       (.I0(counter_wait_reg[26]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[24]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[24]_i_4 
       (.I0(counter_wait_reg[25]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[24]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[24]_i_5 
       (.I0(counter_wait_reg[24]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[24]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[28]_i_2 
       (.I0(counter_wait_reg[31]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[28]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[28]_i_3 
       (.I0(counter_wait_reg[30]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[28]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[28]_i_4 
       (.I0(counter_wait_reg[29]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[28]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[28]_i_5 
       (.I0(counter_wait_reg[28]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[28]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[4]_i_2 
       (.I0(counter_wait_reg[7]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[4]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[4]_i_3 
       (.I0(counter_wait_reg[6]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[4]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[4]_i_4 
       (.I0(counter_wait_reg[5]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[4]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[4]_i_5 
       (.I0(current_state[1]),
        .I1(current_state[2]),
        .I2(counter_wait_reg[4]),
        .O(\counter_wait[4]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[8]_i_2 
       (.I0(counter_wait_reg[11]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[8]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[8]_i_3 
       (.I0(counter_wait_reg[10]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[8]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[8]_i_4 
       (.I0(counter_wait_reg[9]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[8]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \counter_wait[8]_i_5 
       (.I0(counter_wait_reg[8]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(\counter_wait[8]_i_5_n_0 ));
  FDCE \counter_wait_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[0]_i_1_n_7 ),
        .Q(counter_wait_reg[0]));
  CARRY4 \counter_wait_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\counter_wait_reg[0]_i_1_n_0 ,\counter_wait_reg[0]_i_1_n_1 ,\counter_wait_reg[0]_i_1_n_2 ,\counter_wait_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\counter_wait[0]_i_2_n_0 }),
        .O({\counter_wait_reg[0]_i_1_n_4 ,\counter_wait_reg[0]_i_1_n_5 ,\counter_wait_reg[0]_i_1_n_6 ,\counter_wait_reg[0]_i_1_n_7 }),
        .S({\counter_wait[0]_i_3_n_0 ,\counter_wait[0]_i_4_n_0 ,\counter_wait[0]_i_5_n_0 ,\counter_wait[0]_i_6_n_0 }));
  FDCE \counter_wait_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[8]_i_1_n_5 ),
        .Q(counter_wait_reg[10]));
  FDCE \counter_wait_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[8]_i_1_n_4 ),
        .Q(counter_wait_reg[11]));
  FDCE \counter_wait_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[12]_i_1_n_7 ),
        .Q(counter_wait_reg[12]));
  CARRY4 \counter_wait_reg[12]_i_1 
       (.CI(\counter_wait_reg[8]_i_1_n_0 ),
        .CO({\counter_wait_reg[12]_i_1_n_0 ,\counter_wait_reg[12]_i_1_n_1 ,\counter_wait_reg[12]_i_1_n_2 ,\counter_wait_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_wait_reg[12]_i_1_n_4 ,\counter_wait_reg[12]_i_1_n_5 ,\counter_wait_reg[12]_i_1_n_6 ,\counter_wait_reg[12]_i_1_n_7 }),
        .S({\counter_wait[12]_i_2_n_0 ,\counter_wait[12]_i_3_n_0 ,\counter_wait[12]_i_4_n_0 ,\counter_wait[12]_i_5_n_0 }));
  FDCE \counter_wait_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[12]_i_1_n_6 ),
        .Q(counter_wait_reg[13]));
  FDCE \counter_wait_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[12]_i_1_n_5 ),
        .Q(counter_wait_reg[14]));
  FDCE \counter_wait_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[12]_i_1_n_4 ),
        .Q(counter_wait_reg[15]));
  FDCE \counter_wait_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[16]_i_1_n_7 ),
        .Q(counter_wait_reg[16]));
  CARRY4 \counter_wait_reg[16]_i_1 
       (.CI(\counter_wait_reg[12]_i_1_n_0 ),
        .CO({\counter_wait_reg[16]_i_1_n_0 ,\counter_wait_reg[16]_i_1_n_1 ,\counter_wait_reg[16]_i_1_n_2 ,\counter_wait_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_wait_reg[16]_i_1_n_4 ,\counter_wait_reg[16]_i_1_n_5 ,\counter_wait_reg[16]_i_1_n_6 ,\counter_wait_reg[16]_i_1_n_7 }),
        .S({\counter_wait[16]_i_2_n_0 ,\counter_wait[16]_i_3_n_0 ,\counter_wait[16]_i_4_n_0 ,\counter_wait[16]_i_5_n_0 }));
  FDCE \counter_wait_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[16]_i_1_n_6 ),
        .Q(counter_wait_reg[17]));
  FDCE \counter_wait_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[16]_i_1_n_5 ),
        .Q(counter_wait_reg[18]));
  FDCE \counter_wait_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[16]_i_1_n_4 ),
        .Q(counter_wait_reg[19]));
  FDCE \counter_wait_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[0]_i_1_n_6 ),
        .Q(counter_wait_reg[1]));
  FDCE \counter_wait_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[20]_i_1_n_7 ),
        .Q(counter_wait_reg[20]));
  CARRY4 \counter_wait_reg[20]_i_1 
       (.CI(\counter_wait_reg[16]_i_1_n_0 ),
        .CO({\counter_wait_reg[20]_i_1_n_0 ,\counter_wait_reg[20]_i_1_n_1 ,\counter_wait_reg[20]_i_1_n_2 ,\counter_wait_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_wait_reg[20]_i_1_n_4 ,\counter_wait_reg[20]_i_1_n_5 ,\counter_wait_reg[20]_i_1_n_6 ,\counter_wait_reg[20]_i_1_n_7 }),
        .S({\counter_wait[20]_i_2_n_0 ,\counter_wait[20]_i_3_n_0 ,\counter_wait[20]_i_4_n_0 ,\counter_wait[20]_i_5_n_0 }));
  FDCE \counter_wait_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[20]_i_1_n_6 ),
        .Q(counter_wait_reg[21]));
  FDCE \counter_wait_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[20]_i_1_n_5 ),
        .Q(counter_wait_reg[22]));
  FDCE \counter_wait_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[20]_i_1_n_4 ),
        .Q(counter_wait_reg[23]));
  FDCE \counter_wait_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[24]_i_1_n_7 ),
        .Q(counter_wait_reg[24]));
  CARRY4 \counter_wait_reg[24]_i_1 
       (.CI(\counter_wait_reg[20]_i_1_n_0 ),
        .CO({\counter_wait_reg[24]_i_1_n_0 ,\counter_wait_reg[24]_i_1_n_1 ,\counter_wait_reg[24]_i_1_n_2 ,\counter_wait_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_wait_reg[24]_i_1_n_4 ,\counter_wait_reg[24]_i_1_n_5 ,\counter_wait_reg[24]_i_1_n_6 ,\counter_wait_reg[24]_i_1_n_7 }),
        .S({\counter_wait[24]_i_2_n_0 ,\counter_wait[24]_i_3_n_0 ,\counter_wait[24]_i_4_n_0 ,\counter_wait[24]_i_5_n_0 }));
  FDCE \counter_wait_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[24]_i_1_n_6 ),
        .Q(counter_wait_reg[25]));
  FDCE \counter_wait_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[24]_i_1_n_5 ),
        .Q(counter_wait_reg[26]));
  FDCE \counter_wait_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[24]_i_1_n_4 ),
        .Q(counter_wait_reg[27]));
  FDCE \counter_wait_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[28]_i_1_n_7 ),
        .Q(counter_wait_reg[28]));
  CARRY4 \counter_wait_reg[28]_i_1 
       (.CI(\counter_wait_reg[24]_i_1_n_0 ),
        .CO({\NLW_counter_wait_reg[28]_i_1_CO_UNCONNECTED [3],\counter_wait_reg[28]_i_1_n_1 ,\counter_wait_reg[28]_i_1_n_2 ,\counter_wait_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_wait_reg[28]_i_1_n_4 ,\counter_wait_reg[28]_i_1_n_5 ,\counter_wait_reg[28]_i_1_n_6 ,\counter_wait_reg[28]_i_1_n_7 }),
        .S({\counter_wait[28]_i_2_n_0 ,\counter_wait[28]_i_3_n_0 ,\counter_wait[28]_i_4_n_0 ,\counter_wait[28]_i_5_n_0 }));
  FDCE \counter_wait_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[28]_i_1_n_6 ),
        .Q(counter_wait_reg[29]));
  FDCE \counter_wait_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[0]_i_1_n_5 ),
        .Q(counter_wait_reg[2]));
  FDCE \counter_wait_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[28]_i_1_n_5 ),
        .Q(counter_wait_reg[30]));
  FDCE \counter_wait_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[28]_i_1_n_4 ),
        .Q(counter_wait_reg[31]));
  FDCE \counter_wait_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[0]_i_1_n_4 ),
        .Q(counter_wait_reg[3]));
  FDCE \counter_wait_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[4]_i_1_n_7 ),
        .Q(counter_wait_reg[4]));
  CARRY4 \counter_wait_reg[4]_i_1 
       (.CI(\counter_wait_reg[0]_i_1_n_0 ),
        .CO({\counter_wait_reg[4]_i_1_n_0 ,\counter_wait_reg[4]_i_1_n_1 ,\counter_wait_reg[4]_i_1_n_2 ,\counter_wait_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_wait_reg[4]_i_1_n_4 ,\counter_wait_reg[4]_i_1_n_5 ,\counter_wait_reg[4]_i_1_n_6 ,\counter_wait_reg[4]_i_1_n_7 }),
        .S({\counter_wait[4]_i_2_n_0 ,\counter_wait[4]_i_3_n_0 ,\counter_wait[4]_i_4_n_0 ,\counter_wait[4]_i_5_n_0 }));
  FDCE \counter_wait_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[4]_i_1_n_6 ),
        .Q(counter_wait_reg[5]));
  FDCE \counter_wait_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[4]_i_1_n_5 ),
        .Q(counter_wait_reg[6]));
  FDCE \counter_wait_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[4]_i_1_n_4 ),
        .Q(counter_wait_reg[7]));
  FDCE \counter_wait_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[8]_i_1_n_7 ),
        .Q(counter_wait_reg[8]));
  CARRY4 \counter_wait_reg[8]_i_1 
       (.CI(\counter_wait_reg[4]_i_1_n_0 ),
        .CO({\counter_wait_reg[8]_i_1_n_0 ,\counter_wait_reg[8]_i_1_n_1 ,\counter_wait_reg[8]_i_1_n_2 ,\counter_wait_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_wait_reg[8]_i_1_n_4 ,\counter_wait_reg[8]_i_1_n_5 ,\counter_wait_reg[8]_i_1_n_6 ,\counter_wait_reg[8]_i_1_n_7 }),
        .S({\counter_wait[8]_i_2_n_0 ,\counter_wait[8]_i_3_n_0 ,\counter_wait[8]_i_4_n_0 ,\counter_wait[8]_i_5_n_0 }));
  FDCE \counter_wait_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\counter_wait_reg[8]_i_1_n_6 ),
        .Q(counter_wait_reg[9]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'hEC23EFEF)) 
    \current_state[0]_i_1 
       (.I0(mem_state[0]),
        .I1(current_state[2]),
        .I2(current_state[1]),
        .I3(current_state[0]),
        .I4(EQ_vol_up),
        .O(next_state[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFF000000C8)) 
    \current_state[1]_i_1 
       (.I0(EQ_vol_down),
        .I1(current_state[0]),
        .I2(EQ_vol_up),
        .I3(current_state[2]),
        .I4(current_state[1]),
        .I5(\current_state[1]_i_2_n_0 ),
        .O(next_state[1]));
  LUT5 #(
    .INIT(32'hAA22FA00)) 
    \current_state[1]_i_2 
       (.I0(\current_state[2]_i_2_n_0 ),
        .I1(\mem_state[2]_i_8_n_0 ),
        .I2(mem_state[1]),
        .I3(current_state[1]),
        .I4(current_state[2]),
        .O(\current_state[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0C0CAE00)) 
    \current_state[2]_i_1 
       (.I0(mem_state[2]),
        .I1(\current_state[2]_i_2_n_0 ),
        .I2(\mem_state[2]_i_4_n_0 ),
        .I3(current_state[1]),
        .I4(current_state[2]),
        .O(next_state[2]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hBBA000A0)) 
    \current_state[2]_i_2 
       (.I0(current_state[2]),
        .I1(current_state[1]),
        .I2(EQ_vol_up),
        .I3(current_state[0]),
        .I4(EQ_vol_down),
        .O(\current_state[2]_i_2_n_0 ));
  FDCE \current_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(next_state[0]),
        .Q(current_state[0]));
  FDCE \current_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(next_state[1]),
        .Q(current_state[1]));
  FDCE \current_state_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(next_state[2]),
        .Q(current_state[2]));
  LUT6 #(
    .INIT(64'h7577337745440044)) 
    \mem_state[0]_i_1 
       (.I0(\mem_state[0]_i_2_n_0 ),
        .I1(\mem_state[2]_i_2_n_0 ),
        .I2(\mem_state[2]_i_3_n_0 ),
        .I3(current_state[2]),
        .I4(\mem_state[2]_i_4_n_0 ),
        .I5(mem_state[0]),
        .O(\mem_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h5D)) 
    \mem_state[0]_i_2 
       (.I0(current_state[0]),
        .I1(EQ_vol_up),
        .I2(current_state[2]),
        .O(\mem_state[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF337733CF004400)) 
    \mem_state[1]_i_1 
       (.I0(current_state[0]),
        .I1(\mem_state[2]_i_2_n_0 ),
        .I2(\mem_state[2]_i_3_n_0 ),
        .I3(current_state[2]),
        .I4(\mem_state[2]_i_4_n_0 ),
        .I5(mem_state[1]),
        .O(\mem_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF77FFCFCC44CC)) 
    \mem_state[2]_i_1 
       (.I0(current_state[0]),
        .I1(\mem_state[2]_i_2_n_0 ),
        .I2(\mem_state[2]_i_3_n_0 ),
        .I3(current_state[2]),
        .I4(\mem_state[2]_i_4_n_0 ),
        .I5(mem_state[2]),
        .O(\mem_state[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \mem_state[2]_i_10 
       (.I0(counter_wait_reg[17]),
        .I1(counter_wait_reg[26]),
        .I2(counter_wait_reg[30]),
        .I3(counter_wait_reg[8]),
        .I4(\mem_state[2]_i_17_n_0 ),
        .O(\mem_state[2]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \mem_state[2]_i_11 
       (.I0(counter_wait_reg[29]),
        .I1(counter_wait_reg[22]),
        .I2(counter_wait_reg[24]),
        .I3(counter_wait_reg[16]),
        .O(\mem_state[2]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \mem_state[2]_i_12 
       (.I0(counter_wait_reg[31]),
        .I1(counter_wait_reg[20]),
        .I2(counter_wait_reg[27]),
        .I3(counter_wait_reg[10]),
        .O(\mem_state[2]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFBFF)) 
    \mem_state[2]_i_13 
       (.I0(counter_hold_reg[7]),
        .I1(counter_hold_reg[22]),
        .I2(counter_hold_reg[10]),
        .I3(counter_hold_reg[12]),
        .I4(\mem_state[2]_i_18_n_0 ),
        .O(\mem_state[2]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    \mem_state[2]_i_14 
       (.I0(counter_hold_reg[11]),
        .I1(counter_hold_reg[16]),
        .I2(counter_hold_reg[0]),
        .I3(counter_hold_reg[28]),
        .I4(\mem_state[2]_i_19_n_0 ),
        .O(\mem_state[2]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFBFF)) 
    \mem_state[2]_i_15 
       (.I0(counter_hold_reg[5]),
        .I1(counter_hold_reg[13]),
        .I2(counter_hold_reg[4]),
        .I3(counter_hold_reg[17]),
        .I4(\mem_state[2]_i_20_n_0 ),
        .O(\mem_state[2]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \mem_state[2]_i_16 
       (.I0(counter_hold_reg[2]),
        .I1(counter_hold_reg[1]),
        .I2(counter_hold_reg[29]),
        .I3(counter_hold_reg[31]),
        .I4(\mem_state[2]_i_21_n_0 ),
        .O(\mem_state[2]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'hFFF7)) 
    \mem_state[2]_i_17 
       (.I0(counter_wait_reg[9]),
        .I1(counter_wait_reg[11]),
        .I2(counter_wait_reg[5]),
        .I3(counter_wait_reg[6]),
        .O(\mem_state[2]_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \mem_state[2]_i_18 
       (.I0(counter_hold_reg[18]),
        .I1(counter_hold_reg[19]),
        .I2(counter_hold_reg[26]),
        .I3(counter_hold_reg[25]),
        .O(\mem_state[2]_i_18_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \mem_state[2]_i_19 
       (.I0(counter_hold_reg[14]),
        .I1(counter_hold_reg[27]),
        .I2(counter_hold_reg[30]),
        .I3(counter_hold_reg[3]),
        .O(\mem_state[2]_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h11001000)) 
    \mem_state[2]_i_2 
       (.I0(current_state[1]),
        .I1(current_state[2]),
        .I2(EQ_vol_up),
        .I3(current_state[0]),
        .I4(EQ_vol_down),
        .O(\mem_state[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \mem_state[2]_i_20 
       (.I0(counter_hold_reg[8]),
        .I1(counter_hold_reg[23]),
        .I2(counter_hold_reg[15]),
        .I3(counter_hold_reg[24]),
        .O(\mem_state[2]_i_20_n_0 ));
  LUT4 #(
    .INIT(16'hEFFF)) 
    \mem_state[2]_i_21 
       (.I0(counter_hold_reg[6]),
        .I1(counter_hold_reg[20]),
        .I2(counter_hold_reg[9]),
        .I3(counter_hold_reg[21]),
        .O(\mem_state[2]_i_21_n_0 ));
  LUT3 #(
    .INIT(8'h47)) 
    \mem_state[2]_i_3 
       (.I0(EQ_vol_down),
        .I1(current_state[0]),
        .I2(EQ_vol_up),
        .O(\mem_state[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h101010FF)) 
    \mem_state[2]_i_4 
       (.I0(\mem_state[2]_i_5_n_0 ),
        .I1(\mem_state[2]_i_6_n_0 ),
        .I2(\mem_state[2]_i_7_n_0 ),
        .I3(\mem_state[2]_i_8_n_0 ),
        .I4(current_state[1]),
        .O(\mem_state[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFDFF)) 
    \mem_state[2]_i_5 
       (.I0(counter_wait_reg[14]),
        .I1(counter_wait_reg[25]),
        .I2(counter_wait_reg[1]),
        .I3(counter_wait_reg[15]),
        .I4(counter_wait_reg[3]),
        .I5(counter_wait_reg[0]),
        .O(\mem_state[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFBF)) 
    \mem_state[2]_i_6 
       (.I0(\mem_state[2]_i_9_n_0 ),
        .I1(counter_wait_reg[23]),
        .I2(counter_wait_reg[7]),
        .I3(counter_wait_reg[28]),
        .I4(counter_wait_reg[19]),
        .I5(\mem_state[2]_i_10_n_0 ),
        .O(\mem_state[2]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \mem_state[2]_i_7 
       (.I0(counter_wait_reg[12]),
        .I1(counter_wait_reg[2]),
        .I2(counter_wait_reg[4]),
        .I3(\mem_state[2]_i_11_n_0 ),
        .I4(\mem_state[2]_i_12_n_0 ),
        .O(\mem_state[2]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \mem_state[2]_i_8 
       (.I0(\mem_state[2]_i_13_n_0 ),
        .I1(\mem_state[2]_i_14_n_0 ),
        .I2(\mem_state[2]_i_15_n_0 ),
        .I3(\mem_state[2]_i_16_n_0 ),
        .O(\mem_state[2]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \mem_state[2]_i_9 
       (.I0(counter_wait_reg[18]),
        .I1(current_state[1]),
        .I2(counter_wait_reg[21]),
        .I3(counter_wait_reg[13]),
        .O(\mem_state[2]_i_9_n_0 ));
  FDCE \mem_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\mem_state[0]_i_1_n_0 ),
        .Q(mem_state[0]));
  FDCE \mem_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\mem_state[1]_i_1_n_0 ),
        .Q(mem_state[1]));
  FDCE \mem_state_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\mem_state[2]_i_1_n_0 ),
        .Q(mem_state[2]));
  LUT4 #(
    .INIT(16'h0001)) 
    \vol_data[0][4]_i_1 
       (.I0(EQ_select[2]),
        .I1(EQ_select[0]),
        .I2(EQ_select[1]),
        .I3(\vol_data[7][4]_i_4_n_0 ),
        .O(\vol_data[0][4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0100)) 
    \vol_data[1][4]_i_1 
       (.I0(EQ_select[2]),
        .I1(\vol_data[7][4]_i_4_n_0 ),
        .I2(EQ_select[1]),
        .I3(EQ_select[0]),
        .O(\vol_data[1][4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0010)) 
    \vol_data[2][4]_i_1 
       (.I0(EQ_select[2]),
        .I1(EQ_select[0]),
        .I2(EQ_select[1]),
        .I3(\vol_data[7][4]_i_4_n_0 ),
        .O(\vol_data[2][4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h1000)) 
    \vol_data[3][4]_i_1 
       (.I0(EQ_select[2]),
        .I1(\vol_data[7][4]_i_4_n_0 ),
        .I2(EQ_select[1]),
        .I3(EQ_select[0]),
        .O(\vol_data[3][4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0010)) 
    \vol_data[4][4]_i_1 
       (.I0(EQ_select[0]),
        .I1(EQ_select[1]),
        .I2(EQ_select[2]),
        .I3(\vol_data[7][4]_i_4_n_0 ),
        .O(\vol_data[4][4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \vol_data[5][4]_i_1 
       (.I0(EQ_select[2]),
        .I1(\vol_data[7][4]_i_4_n_0 ),
        .I2(EQ_select[1]),
        .I3(EQ_select[0]),
        .O(\vol_data[5][4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0040)) 
    \vol_data[6][4]_i_1 
       (.I0(EQ_select[0]),
        .I1(EQ_select[1]),
        .I2(EQ_select[2]),
        .I3(\vol_data[7][4]_i_4_n_0 ),
        .O(\vol_data[6][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \vol_data[7][0]_i_1 
       (.I0(\vol_data[7][4]_i_6_n_0 ),
        .O(\vol_data[7][0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \vol_data[7][1]_i_1 
       (.I0(\vol_data[7][4]_i_6_n_0 ),
        .I1(\vol_data[7][4]_i_7_n_0 ),
        .I2(\vol_data[7][4]_i_8_n_0 ),
        .O(\vol_data[7][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hDB24)) 
    \vol_data[7][2]_i_1 
       (.I0(\vol_data[7][4]_i_8_n_0 ),
        .I1(\vol_data[7][4]_i_7_n_0 ),
        .I2(\vol_data[7][4]_i_6_n_0 ),
        .I3(\vol_data[7][4]_i_9_n_0 ),
        .O(\vol_data[7][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hDFFB2004)) 
    \vol_data[7][3]_i_1 
       (.I0(\vol_data[7][4]_i_6_n_0 ),
        .I1(\vol_data[7][4]_i_7_n_0 ),
        .I2(\vol_data[7][4]_i_8_n_0 ),
        .I3(\vol_data[7][4]_i_9_n_0 ),
        .I4(\vol_data_reg[7][4]_i_10_n_0 ),
        .O(\vol_data[7][3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \vol_data[7][4]_i_1 
       (.I0(EQ_select[2]),
        .I1(\vol_data[7][4]_i_4_n_0 ),
        .I2(EQ_select[1]),
        .I3(EQ_select[0]),
        .O(\vol_data[7][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \vol_data[7][4]_i_11 
       (.I0(\vol_data[7][4]_i_8_n_0 ),
        .I1(\vol_data_reg[7][4]_i_10_n_0 ),
        .I2(\vol_data[7][4]_i_9_n_0 ),
        .I3(\vol_data_reg[7][4]_i_5_n_0 ),
        .I4(\vol_data[7][4]_i_6_n_0 ),
        .O(\vol_data[7][4]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \vol_data[7][4]_i_12 
       (.I0(\vol_data_reg[3][4]_0 [4]),
        .I1(\vol_data_reg[2][4]_0 [4]),
        .I2(EQ_select[1]),
        .I3(\vol_data_reg[1][4]_0 [4]),
        .I4(EQ_select[0]),
        .I5(Q[4]),
        .O(\vol_data[7][4]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \vol_data[7][4]_i_13 
       (.I0(\vol_data_reg[7][4]_0 [4]),
        .I1(\vol_data_reg[6][4]_0 [4]),
        .I2(EQ_select[1]),
        .I3(\vol_data_reg[5][4]_0 [4]),
        .I4(EQ_select[0]),
        .I5(\vol_data_reg[4][4]_0 [4]),
        .O(\vol_data[7][4]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \vol_data[7][4]_i_14 
       (.I0(\vol_data_reg[3][4]_0 [0]),
        .I1(\vol_data_reg[2][4]_0 [0]),
        .I2(EQ_select[1]),
        .I3(\vol_data_reg[1][4]_0 [0]),
        .I4(EQ_select[0]),
        .I5(Q[0]),
        .O(\vol_data[7][4]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \vol_data[7][4]_i_15 
       (.I0(\vol_data_reg[7][4]_0 [0]),
        .I1(\vol_data_reg[6][4]_0 [0]),
        .I2(EQ_select[1]),
        .I3(\vol_data_reg[5][4]_0 [0]),
        .I4(EQ_select[0]),
        .I5(\vol_data_reg[4][4]_0 [0]),
        .O(\vol_data[7][4]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \vol_data[7][4]_i_16 
       (.I0(\vol_data_reg[3][4]_0 [1]),
        .I1(\vol_data_reg[2][4]_0 [1]),
        .I2(EQ_select[1]),
        .I3(\vol_data_reg[1][4]_0 [1]),
        .I4(EQ_select[0]),
        .I5(Q[1]),
        .O(\vol_data[7][4]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \vol_data[7][4]_i_17 
       (.I0(\vol_data_reg[7][4]_0 [1]),
        .I1(\vol_data_reg[6][4]_0 [1]),
        .I2(EQ_select[1]),
        .I3(\vol_data_reg[5][4]_0 [1]),
        .I4(EQ_select[0]),
        .I5(\vol_data_reg[4][4]_0 [1]),
        .O(\vol_data[7][4]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \vol_data[7][4]_i_18 
       (.I0(\vol_data_reg[3][4]_0 [2]),
        .I1(\vol_data_reg[2][4]_0 [2]),
        .I2(EQ_select[1]),
        .I3(\vol_data_reg[1][4]_0 [2]),
        .I4(EQ_select[0]),
        .I5(Q[2]),
        .O(\vol_data[7][4]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \vol_data[7][4]_i_19 
       (.I0(\vol_data_reg[7][4]_0 [2]),
        .I1(\vol_data_reg[6][4]_0 [2]),
        .I2(EQ_select[1]),
        .I3(\vol_data_reg[5][4]_0 [2]),
        .I4(EQ_select[0]),
        .I5(\vol_data_reg[4][4]_0 [2]),
        .O(\vol_data[7][4]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hA6AAAAAAAAAAAA9A)) 
    \vol_data[7][4]_i_2 
       (.I0(\vol_data_reg[7][4]_i_5_n_0 ),
        .I1(\vol_data[7][4]_i_6_n_0 ),
        .I2(\vol_data[7][4]_i_7_n_0 ),
        .I3(\vol_data[7][4]_i_8_n_0 ),
        .I4(\vol_data[7][4]_i_9_n_0 ),
        .I5(\vol_data_reg[7][4]_i_10_n_0 ),
        .O(\vol_data[7][4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \vol_data[7][4]_i_20 
       (.I0(\vol_data_reg[3][4]_0 [3]),
        .I1(\vol_data_reg[2][4]_0 [3]),
        .I2(EQ_select[1]),
        .I3(\vol_data_reg[1][4]_0 [3]),
        .I4(EQ_select[0]),
        .I5(Q[3]),
        .O(\vol_data[7][4]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \vol_data[7][4]_i_21 
       (.I0(\vol_data_reg[7][4]_0 [3]),
        .I1(\vol_data_reg[6][4]_0 [3]),
        .I2(EQ_select[1]),
        .I3(\vol_data_reg[5][4]_0 [3]),
        .I4(EQ_select[0]),
        .I5(\vol_data_reg[4][4]_0 [3]),
        .O(\vol_data[7][4]_i_21_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \vol_data[7][4]_i_3 
       (.I0(reset_n),
        .O(\vol_data[7][4]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hF7FF0000)) 
    \vol_data[7][4]_i_4 
       (.I0(\vol_data[7][4]_i_11_n_0 ),
        .I1(current_state[0]),
        .I2(current_state[2]),
        .I3(current_state[1]),
        .I4(\vol_data[7][4]_i_7_n_0 ),
        .O(\vol_data[7][4]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hCA)) 
    \vol_data[7][4]_i_6 
       (.I0(\vol_data[7][4]_i_14_n_0 ),
        .I1(\vol_data[7][4]_i_15_n_0 ),
        .I2(EQ_select[2]),
        .O(\vol_data[7][4]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFDFDFD)) 
    \vol_data[7][4]_i_7 
       (.I0(current_state[1]),
        .I1(current_state[2]),
        .I2(current_state[0]),
        .I3(\vol_data_reg[7][4]_i_5_n_0 ),
        .I4(\vol_data_reg[7][4]_i_10_n_0 ),
        .O(\vol_data[7][4]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \vol_data[7][4]_i_8 
       (.I0(\vol_data[7][4]_i_16_n_0 ),
        .I1(\vol_data[7][4]_i_17_n_0 ),
        .I2(EQ_select[2]),
        .O(\vol_data[7][4]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \vol_data[7][4]_i_9 
       (.I0(\vol_data[7][4]_i_18_n_0 ),
        .I1(\vol_data[7][4]_i_19_n_0 ),
        .I2(EQ_select[2]),
        .O(\vol_data[7][4]_i_9_n_0 ));
  FDCE \vol_data_reg[0][0] 
       (.C(clk),
        .CE(\vol_data[0][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][0]_i_1_n_0 ),
        .Q(Q[0]));
  FDCE \vol_data_reg[0][1] 
       (.C(clk),
        .CE(\vol_data[0][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][1]_i_1_n_0 ),
        .Q(Q[1]));
  FDPE \vol_data_reg[0][2] 
       (.C(clk),
        .CE(\vol_data[0][4]_i_1_n_0 ),
        .D(\vol_data[7][2]_i_1_n_0 ),
        .PRE(\vol_data[7][4]_i_3_n_0 ),
        .Q(Q[2]));
  FDPE \vol_data_reg[0][3] 
       (.C(clk),
        .CE(\vol_data[0][4]_i_1_n_0 ),
        .D(\vol_data[7][3]_i_1_n_0 ),
        .PRE(\vol_data[7][4]_i_3_n_0 ),
        .Q(Q[3]));
  FDCE \vol_data_reg[0][4] 
       (.C(clk),
        .CE(\vol_data[0][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][4]_i_2_n_0 ),
        .Q(Q[4]));
  FDCE \vol_data_reg[1][0] 
       (.C(clk),
        .CE(\vol_data[1][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][0]_i_1_n_0 ),
        .Q(\vol_data_reg[1][4]_0 [0]));
  FDCE \vol_data_reg[1][1] 
       (.C(clk),
        .CE(\vol_data[1][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][1]_i_1_n_0 ),
        .Q(\vol_data_reg[1][4]_0 [1]));
  FDPE \vol_data_reg[1][2] 
       (.C(clk),
        .CE(\vol_data[1][4]_i_1_n_0 ),
        .D(\vol_data[7][2]_i_1_n_0 ),
        .PRE(\vol_data[7][4]_i_3_n_0 ),
        .Q(\vol_data_reg[1][4]_0 [2]));
  FDPE \vol_data_reg[1][3] 
       (.C(clk),
        .CE(\vol_data[1][4]_i_1_n_0 ),
        .D(\vol_data[7][3]_i_1_n_0 ),
        .PRE(\vol_data[7][4]_i_3_n_0 ),
        .Q(\vol_data_reg[1][4]_0 [3]));
  FDCE \vol_data_reg[1][4] 
       (.C(clk),
        .CE(\vol_data[1][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][4]_i_2_n_0 ),
        .Q(\vol_data_reg[1][4]_0 [4]));
  FDCE \vol_data_reg[2][0] 
       (.C(clk),
        .CE(\vol_data[2][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][0]_i_1_n_0 ),
        .Q(\vol_data_reg[2][4]_0 [0]));
  FDCE \vol_data_reg[2][1] 
       (.C(clk),
        .CE(\vol_data[2][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][1]_i_1_n_0 ),
        .Q(\vol_data_reg[2][4]_0 [1]));
  FDPE \vol_data_reg[2][2] 
       (.C(clk),
        .CE(\vol_data[2][4]_i_1_n_0 ),
        .D(\vol_data[7][2]_i_1_n_0 ),
        .PRE(\vol_data[7][4]_i_3_n_0 ),
        .Q(\vol_data_reg[2][4]_0 [2]));
  FDPE \vol_data_reg[2][3] 
       (.C(clk),
        .CE(\vol_data[2][4]_i_1_n_0 ),
        .D(\vol_data[7][3]_i_1_n_0 ),
        .PRE(\vol_data[7][4]_i_3_n_0 ),
        .Q(\vol_data_reg[2][4]_0 [3]));
  FDCE \vol_data_reg[2][4] 
       (.C(clk),
        .CE(\vol_data[2][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][4]_i_2_n_0 ),
        .Q(\vol_data_reg[2][4]_0 [4]));
  FDCE \vol_data_reg[3][0] 
       (.C(clk),
        .CE(\vol_data[3][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][0]_i_1_n_0 ),
        .Q(\vol_data_reg[3][4]_0 [0]));
  FDCE \vol_data_reg[3][1] 
       (.C(clk),
        .CE(\vol_data[3][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][1]_i_1_n_0 ),
        .Q(\vol_data_reg[3][4]_0 [1]));
  FDPE \vol_data_reg[3][2] 
       (.C(clk),
        .CE(\vol_data[3][4]_i_1_n_0 ),
        .D(\vol_data[7][2]_i_1_n_0 ),
        .PRE(\vol_data[7][4]_i_3_n_0 ),
        .Q(\vol_data_reg[3][4]_0 [2]));
  FDPE \vol_data_reg[3][3] 
       (.C(clk),
        .CE(\vol_data[3][4]_i_1_n_0 ),
        .D(\vol_data[7][3]_i_1_n_0 ),
        .PRE(\vol_data[7][4]_i_3_n_0 ),
        .Q(\vol_data_reg[3][4]_0 [3]));
  FDCE \vol_data_reg[3][4] 
       (.C(clk),
        .CE(\vol_data[3][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][4]_i_2_n_0 ),
        .Q(\vol_data_reg[3][4]_0 [4]));
  FDCE \vol_data_reg[4][0] 
       (.C(clk),
        .CE(\vol_data[4][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][0]_i_1_n_0 ),
        .Q(\vol_data_reg[4][4]_0 [0]));
  FDCE \vol_data_reg[4][1] 
       (.C(clk),
        .CE(\vol_data[4][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][1]_i_1_n_0 ),
        .Q(\vol_data_reg[4][4]_0 [1]));
  FDPE \vol_data_reg[4][2] 
       (.C(clk),
        .CE(\vol_data[4][4]_i_1_n_0 ),
        .D(\vol_data[7][2]_i_1_n_0 ),
        .PRE(\vol_data[7][4]_i_3_n_0 ),
        .Q(\vol_data_reg[4][4]_0 [2]));
  FDPE \vol_data_reg[4][3] 
       (.C(clk),
        .CE(\vol_data[4][4]_i_1_n_0 ),
        .D(\vol_data[7][3]_i_1_n_0 ),
        .PRE(\vol_data[7][4]_i_3_n_0 ),
        .Q(\vol_data_reg[4][4]_0 [3]));
  FDCE \vol_data_reg[4][4] 
       (.C(clk),
        .CE(\vol_data[4][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][4]_i_2_n_0 ),
        .Q(\vol_data_reg[4][4]_0 [4]));
  FDCE \vol_data_reg[5][0] 
       (.C(clk),
        .CE(\vol_data[5][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][0]_i_1_n_0 ),
        .Q(\vol_data_reg[5][4]_0 [0]));
  FDCE \vol_data_reg[5][1] 
       (.C(clk),
        .CE(\vol_data[5][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][1]_i_1_n_0 ),
        .Q(\vol_data_reg[5][4]_0 [1]));
  FDPE \vol_data_reg[5][2] 
       (.C(clk),
        .CE(\vol_data[5][4]_i_1_n_0 ),
        .D(\vol_data[7][2]_i_1_n_0 ),
        .PRE(\vol_data[7][4]_i_3_n_0 ),
        .Q(\vol_data_reg[5][4]_0 [2]));
  FDPE \vol_data_reg[5][3] 
       (.C(clk),
        .CE(\vol_data[5][4]_i_1_n_0 ),
        .D(\vol_data[7][3]_i_1_n_0 ),
        .PRE(\vol_data[7][4]_i_3_n_0 ),
        .Q(\vol_data_reg[5][4]_0 [3]));
  FDCE \vol_data_reg[5][4] 
       (.C(clk),
        .CE(\vol_data[5][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][4]_i_2_n_0 ),
        .Q(\vol_data_reg[5][4]_0 [4]));
  FDCE \vol_data_reg[6][0] 
       (.C(clk),
        .CE(\vol_data[6][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][0]_i_1_n_0 ),
        .Q(\vol_data_reg[6][4]_0 [0]));
  FDCE \vol_data_reg[6][1] 
       (.C(clk),
        .CE(\vol_data[6][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][1]_i_1_n_0 ),
        .Q(\vol_data_reg[6][4]_0 [1]));
  FDPE \vol_data_reg[6][2] 
       (.C(clk),
        .CE(\vol_data[6][4]_i_1_n_0 ),
        .D(\vol_data[7][2]_i_1_n_0 ),
        .PRE(\vol_data[7][4]_i_3_n_0 ),
        .Q(\vol_data_reg[6][4]_0 [2]));
  FDPE \vol_data_reg[6][3] 
       (.C(clk),
        .CE(\vol_data[6][4]_i_1_n_0 ),
        .D(\vol_data[7][3]_i_1_n_0 ),
        .PRE(\vol_data[7][4]_i_3_n_0 ),
        .Q(\vol_data_reg[6][4]_0 [3]));
  FDCE \vol_data_reg[6][4] 
       (.C(clk),
        .CE(\vol_data[6][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][4]_i_2_n_0 ),
        .Q(\vol_data_reg[6][4]_0 [4]));
  FDCE \vol_data_reg[7][0] 
       (.C(clk),
        .CE(\vol_data[7][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][0]_i_1_n_0 ),
        .Q(\vol_data_reg[7][4]_0 [0]));
  FDCE \vol_data_reg[7][1] 
       (.C(clk),
        .CE(\vol_data[7][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][1]_i_1_n_0 ),
        .Q(\vol_data_reg[7][4]_0 [1]));
  FDPE \vol_data_reg[7][2] 
       (.C(clk),
        .CE(\vol_data[7][4]_i_1_n_0 ),
        .D(\vol_data[7][2]_i_1_n_0 ),
        .PRE(\vol_data[7][4]_i_3_n_0 ),
        .Q(\vol_data_reg[7][4]_0 [2]));
  FDPE \vol_data_reg[7][3] 
       (.C(clk),
        .CE(\vol_data[7][4]_i_1_n_0 ),
        .D(\vol_data[7][3]_i_1_n_0 ),
        .PRE(\vol_data[7][4]_i_3_n_0 ),
        .Q(\vol_data_reg[7][4]_0 [3]));
  FDCE \vol_data_reg[7][4] 
       (.C(clk),
        .CE(\vol_data[7][4]_i_1_n_0 ),
        .CLR(\vol_data[7][4]_i_3_n_0 ),
        .D(\vol_data[7][4]_i_2_n_0 ),
        .Q(\vol_data_reg[7][4]_0 [4]));
  MUXF7 \vol_data_reg[7][4]_i_10 
       (.I0(\vol_data[7][4]_i_20_n_0 ),
        .I1(\vol_data[7][4]_i_21_n_0 ),
        .O(\vol_data_reg[7][4]_i_10_n_0 ),
        .S(EQ_select[2]));
  MUXF7 \vol_data_reg[7][4]_i_5 
       (.I0(\vol_data[7][4]_i_12_n_0 ),
        .I1(\vol_data[7][4]_i_13_n_0 ),
        .O(\vol_data_reg[7][4]_i_5_n_0 ),
        .S(EQ_select[2]));
endmodule

(* ORIG_REF_NAME = "Multiplier" *) 
module EQ_Multiplier
   (D,
    Volume_data1,
    \counter_channel_reg[3] ,
    \counter_channel_reg[7] ,
    \counter_channel_reg[2] ,
    O,
    \EQ_dout_reg[63]_i_5 ,
    \EQ_dout_reg[63]_i_5_0 ,
    \EQ_dout_reg[63]_i_5_1 ,
    \EQ_dout_reg[63]_i_5_2 ,
    \EQ_dout_reg[63]_i_5_3 ,
    \EQ_dout_reg[63]_i_5_4 ,
    reset_n,
    clk,
    Q,
    \EQ_dout_reg[23] ,
    \EQ_dout_reg[0] ,
    \EQ_dout_reg[56] ,
    \EQ_dout_reg[16] ,
    accu_reg,
    mult_out_0,
    \accu_reg[3] ,
    \accu_reg[3]_0 ,
    \accu_reg[3]_1 ,
    \accu_reg[3]_2 ,
    \accu_reg[3]_3 ,
    accu_reg_7_sp_1,
    \accu_reg[7]_0 ,
    \accu_reg[7]_1 ,
    \accu_reg[7]_2 ,
    accu_reg_11_sp_1,
    \accu_reg[11]_0 ,
    \accu_reg[11]_1 ,
    \accu_reg[11]_2 );
  output [55:0]D;
  output [1:0]Volume_data1;
  output \counter_channel_reg[3] ;
  output \counter_channel_reg[7] ;
  output \counter_channel_reg[2] ;
  output [3:0]O;
  output [3:0]\EQ_dout_reg[63]_i_5 ;
  output [3:0]\EQ_dout_reg[63]_i_5_0 ;
  output [3:0]\EQ_dout_reg[63]_i_5_1 ;
  output [3:0]\EQ_dout_reg[63]_i_5_2 ;
  output [3:0]\EQ_dout_reg[63]_i_5_3 ;
  output [3:0]\EQ_dout_reg[63]_i_5_4 ;
  input reset_n;
  input clk;
  input [15:0]Q;
  input \EQ_dout_reg[23] ;
  input \EQ_dout_reg[0] ;
  input [7:0]\EQ_dout_reg[56] ;
  input \EQ_dout_reg[16] ;
  input [15:0]accu_reg;
  input [55:0]mult_out_0;
  input [0:0]\accu_reg[3] ;
  input \accu_reg[3]_0 ;
  input \accu_reg[3]_1 ;
  input \accu_reg[3]_2 ;
  input \accu_reg[3]_3 ;
  input accu_reg_7_sp_1;
  input \accu_reg[7]_0 ;
  input \accu_reg[7]_1 ;
  input \accu_reg[7]_2 ;
  input accu_reg_11_sp_1;
  input \accu_reg[11]_0 ;
  input \accu_reg[11]_1 ;
  input \accu_reg[11]_2 ;

  wire [55:0]D;
  wire \EQ_dout[56]_i_2_n_0 ;
  wire \EQ_dout[57]_i_2_n_0 ;
  wire \EQ_dout[58]_i_2_n_0 ;
  wire \EQ_dout[59]_i_2_n_0 ;
  wire \EQ_dout[60]_i_2_n_0 ;
  wire \EQ_dout[61]_i_2_n_0 ;
  wire \EQ_dout[62]_i_5_n_0 ;
  wire \EQ_dout[62]_i_6_n_0 ;
  wire \EQ_dout_reg[0] ;
  wire \EQ_dout_reg[16] ;
  wire \EQ_dout_reg[23] ;
  wire [7:0]\EQ_dout_reg[56] ;
  wire [3:0]\EQ_dout_reg[63]_i_5 ;
  wire [3:0]\EQ_dout_reg[63]_i_5_0 ;
  wire [3:0]\EQ_dout_reg[63]_i_5_1 ;
  wire [3:0]\EQ_dout_reg[63]_i_5_2 ;
  wire [3:0]\EQ_dout_reg[63]_i_5_3 ;
  wire [3:0]\EQ_dout_reg[63]_i_5_4 ;
  wire [3:0]O;
  wire [15:0]Q;
  wire [6:0]Volume_data;
  wire [1:0]Volume_data1;
  wire \accu[0]_i_10_n_0 ;
  wire \accu[0]_i_3_n_0 ;
  wire \accu[0]_i_4_n_0 ;
  wire \accu[0]_i_5_n_0 ;
  wire \accu[0]_i_6_n_0 ;
  wire \accu[0]_i_7_n_0 ;
  wire \accu[0]_i_8_n_0 ;
  wire \accu[0]_i_9_n_0 ;
  wire \accu[12]_i_2_n_0 ;
  wire \accu[12]_i_3_n_0 ;
  wire \accu[12]_i_4_n_0 ;
  wire \accu[12]_i_5_n_0 ;
  wire \accu[12]_i_6_n_0 ;
  wire \accu[12]_i_7_n_0 ;
  wire \accu[12]_i_8_n_0 ;
  wire \accu[12]_i_9_n_0 ;
  wire \accu[16]_i_2_n_0 ;
  wire \accu[16]_i_3_n_0 ;
  wire \accu[16]_i_4_n_0 ;
  wire \accu[16]_i_5_n_0 ;
  wire \accu[16]_i_6_n_0 ;
  wire \accu[16]_i_7_n_0 ;
  wire \accu[16]_i_8_n_0 ;
  wire \accu[16]_i_9_n_0 ;
  wire \accu[20]_i_2_n_0 ;
  wire \accu[20]_i_3_n_0 ;
  wire \accu[20]_i_4_n_0 ;
  wire \accu[20]_i_5_n_0 ;
  wire \accu[20]_i_6_n_0 ;
  wire \accu[20]_i_7_n_0 ;
  wire \accu[20]_i_8_n_0 ;
  wire \accu[20]_i_9_n_0 ;
  wire \accu[24]_i_2_n_0 ;
  wire \accu[24]_i_3_n_0 ;
  wire \accu[24]_i_4_n_0 ;
  wire \accu[24]_i_5_n_0 ;
  wire \accu[24]_i_6_n_0 ;
  wire \accu[24]_i_7_n_0 ;
  wire \accu[24]_i_8_n_0 ;
  wire \accu[4]_i_2_n_0 ;
  wire \accu[4]_i_3_n_0 ;
  wire \accu[4]_i_4_n_0 ;
  wire \accu[4]_i_5_n_0 ;
  wire \accu[4]_i_6_n_0 ;
  wire \accu[4]_i_7_n_0 ;
  wire \accu[4]_i_8_n_0 ;
  wire \accu[4]_i_9_n_0 ;
  wire \accu[8]_i_2_n_0 ;
  wire \accu[8]_i_3_n_0 ;
  wire \accu[8]_i_4_n_0 ;
  wire \accu[8]_i_5_n_0 ;
  wire \accu[8]_i_6_n_0 ;
  wire \accu[8]_i_7_n_0 ;
  wire \accu[8]_i_8_n_0 ;
  wire \accu[8]_i_9_n_0 ;
  wire [15:0]accu_reg;
  wire \accu_reg[0]_i_2_n_0 ;
  wire \accu_reg[0]_i_2_n_1 ;
  wire \accu_reg[0]_i_2_n_2 ;
  wire \accu_reg[0]_i_2_n_3 ;
  wire \accu_reg[11]_0 ;
  wire \accu_reg[11]_1 ;
  wire \accu_reg[11]_2 ;
  wire \accu_reg[12]_i_1_n_0 ;
  wire \accu_reg[12]_i_1_n_1 ;
  wire \accu_reg[12]_i_1_n_2 ;
  wire \accu_reg[12]_i_1_n_3 ;
  wire \accu_reg[16]_i_1_n_0 ;
  wire \accu_reg[16]_i_1_n_1 ;
  wire \accu_reg[16]_i_1_n_2 ;
  wire \accu_reg[16]_i_1_n_3 ;
  wire \accu_reg[20]_i_1_n_0 ;
  wire \accu_reg[20]_i_1_n_1 ;
  wire \accu_reg[20]_i_1_n_2 ;
  wire \accu_reg[20]_i_1_n_3 ;
  wire \accu_reg[24]_i_1_n_1 ;
  wire \accu_reg[24]_i_1_n_2 ;
  wire \accu_reg[24]_i_1_n_3 ;
  wire [0:0]\accu_reg[3] ;
  wire \accu_reg[3]_0 ;
  wire \accu_reg[3]_1 ;
  wire \accu_reg[3]_2 ;
  wire \accu_reg[3]_3 ;
  wire \accu_reg[4]_i_1_n_0 ;
  wire \accu_reg[4]_i_1_n_1 ;
  wire \accu_reg[4]_i_1_n_2 ;
  wire \accu_reg[4]_i_1_n_3 ;
  wire \accu_reg[7]_0 ;
  wire \accu_reg[7]_1 ;
  wire \accu_reg[7]_2 ;
  wire \accu_reg[8]_i_1_n_0 ;
  wire \accu_reg[8]_i_1_n_1 ;
  wire \accu_reg[8]_i_1_n_2 ;
  wire \accu_reg[8]_i_1_n_3 ;
  wire accu_reg_11_sn_1;
  wire accu_reg_7_sn_1;
  wire clk;
  wire \counter_channel_reg[2] ;
  wire \counter_channel_reg[3] ;
  wire \counter_channel_reg[7] ;
  wire [7:7]mult_opA;
  wire [55:0]mult_out_0;
  wire mult_out_i_10_n_0;
  wire mult_out_i_11_n_0;
  wire mult_out_i_12_n_0;
  wire mult_out_i_13_n_0;
  wire mult_out_i_14_n_0;
  wire mult_out_i_15_n_0;
  wire mult_out_i_16_n_0;
  wire mult_out_i_17_n_0;
  wire mult_out_i_18_n_0;
  wire mult_out_i_19_n_0;
  wire mult_out_i_20_n_0;
  wire mult_out_i_21_n_0;
  wire mult_out_i_22_n_0;
  wire mult_out_i_23_n_0;
  wire mult_out_i_24_n_0;
  wire mult_out_i_25_n_0;
  wire mult_out_i_26_n_0;
  wire mult_out_i_27_n_0;
  wire mult_out_i_28_n_0;
  wire mult_out_i_29_n_0;
  wire mult_out_i_30_n_0;
  wire mult_out_i_31_n_0;
  wire mult_out_i_32_n_0;
  wire mult_out_i_33_n_0;
  wire mult_out_i_34_n_0;
  wire mult_out_i_35_n_0;
  wire mult_out_i_36_n_0;
  wire mult_out_i_9_n_0;
  wire mult_out_n_100;
  wire mult_out_n_101;
  wire mult_out_n_102;
  wire mult_out_n_103;
  wire mult_out_n_104;
  wire mult_out_n_105;
  wire mult_out_n_81;
  wire mult_out_n_82;
  wire mult_out_n_83;
  wire mult_out_n_84;
  wire mult_out_n_85;
  wire mult_out_n_86;
  wire mult_out_n_87;
  wire mult_out_n_88;
  wire mult_out_n_89;
  wire mult_out_n_90;
  wire mult_out_n_91;
  wire mult_out_n_92;
  wire mult_out_n_93;
  wire mult_out_n_94;
  wire mult_out_n_95;
  wire mult_out_n_96;
  wire mult_out_n_97;
  wire mult_out_n_98;
  wire mult_out_n_99;
  wire [5:0]p_0_in_0;
  wire reset_n;
  wire [3:3]\NLW_accu_reg[24]_i_1_CO_UNCONNECTED ;
  wire NLW_mult_out_CARRYCASCOUT_UNCONNECTED;
  wire NLW_mult_out_MULTSIGNOUT_UNCONNECTED;
  wire NLW_mult_out_OVERFLOW_UNCONNECTED;
  wire NLW_mult_out_PATTERNBDETECT_UNCONNECTED;
  wire NLW_mult_out_PATTERNDETECT_UNCONNECTED;
  wire NLW_mult_out_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_mult_out_ACOUT_UNCONNECTED;
  wire [17:0]NLW_mult_out_BCOUT_UNCONNECTED;
  wire [3:0]NLW_mult_out_CARRYOUT_UNCONNECTED;
  wire [47:25]NLW_mult_out_P_UNCONNECTED;
  wire [47:0]NLW_mult_out_PCOUT_UNCONNECTED;

  assign accu_reg_11_sn_1 = accu_reg_11_sp_1;
  assign accu_reg_7_sn_1 = accu_reg_7_sp_1;
  LUT6 #(
    .INIT(64'h0000000040450505)) 
    \EQ_dout[0]_i_1 
       (.I0(Volume_data1[1]),
        .I1(mult_out_n_93),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[0] ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h0000000040450505)) 
    \EQ_dout[16]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(mult_out_n_93),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[16] ),
        .O(D[8]));
  LUT6 #(
    .INIT(64'h0000000040450505)) 
    \EQ_dout[17]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(mult_out_n_92),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[16] ),
        .O(D[9]));
  LUT6 #(
    .INIT(64'h0000000040450505)) 
    \EQ_dout[18]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(mult_out_n_91),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[16] ),
        .O(D[10]));
  LUT6 #(
    .INIT(64'h0000000040450505)) 
    \EQ_dout[19]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(mult_out_n_90),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[16] ),
        .O(D[11]));
  LUT6 #(
    .INIT(64'h0000000040450505)) 
    \EQ_dout[1]_i_1 
       (.I0(Volume_data1[1]),
        .I1(mult_out_n_92),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[0] ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h0000000040450505)) 
    \EQ_dout[20]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(mult_out_n_89),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[16] ),
        .O(D[12]));
  LUT6 #(
    .INIT(64'h0000000040450505)) 
    \EQ_dout[21]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(mult_out_n_88),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[16] ),
        .O(D[13]));
  LUT6 #(
    .INIT(64'h0000000040450505)) 
    \EQ_dout[22]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(mult_out_n_87),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[16] ),
        .O(D[14]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'h15)) 
    \EQ_dout[23]_i_2 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(mult_out_n_81),
        .I2(\EQ_dout_reg[23] ),
        .O(D[15]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h22020002)) 
    \EQ_dout[24]_i_1 
       (.I0(Volume_data1[0]),
        .I1(\counter_channel_reg[7] ),
        .I2(p_0_in_0[5]),
        .I3(\EQ_dout[62]_i_5_n_0 ),
        .I4(\EQ_dout[56]_i_2_n_0 ),
        .O(D[16]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h22020002)) 
    \EQ_dout[25]_i_1 
       (.I0(Volume_data1[0]),
        .I1(\counter_channel_reg[7] ),
        .I2(p_0_in_0[5]),
        .I3(\EQ_dout[62]_i_5_n_0 ),
        .I4(\EQ_dout[57]_i_2_n_0 ),
        .O(D[17]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h22020002)) 
    \EQ_dout[26]_i_1 
       (.I0(Volume_data1[0]),
        .I1(\counter_channel_reg[7] ),
        .I2(p_0_in_0[5]),
        .I3(\EQ_dout[62]_i_5_n_0 ),
        .I4(\EQ_dout[58]_i_2_n_0 ),
        .O(D[18]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h22020002)) 
    \EQ_dout[27]_i_1 
       (.I0(Volume_data1[0]),
        .I1(\counter_channel_reg[7] ),
        .I2(p_0_in_0[5]),
        .I3(\EQ_dout[62]_i_5_n_0 ),
        .I4(\EQ_dout[59]_i_2_n_0 ),
        .O(D[19]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h22020002)) 
    \EQ_dout[28]_i_1 
       (.I0(Volume_data1[0]),
        .I1(\counter_channel_reg[7] ),
        .I2(p_0_in_0[5]),
        .I3(\EQ_dout[62]_i_5_n_0 ),
        .I4(\EQ_dout[60]_i_2_n_0 ),
        .O(D[20]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h22020002)) 
    \EQ_dout[29]_i_1 
       (.I0(Volume_data1[0]),
        .I1(\counter_channel_reg[7] ),
        .I2(p_0_in_0[5]),
        .I3(\EQ_dout[62]_i_5_n_0 ),
        .I4(\EQ_dout[61]_i_2_n_0 ),
        .O(D[21]));
  LUT6 #(
    .INIT(64'h0000000040450505)) 
    \EQ_dout[2]_i_1 
       (.I0(Volume_data1[1]),
        .I1(mult_out_n_91),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[0] ),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h22020002)) 
    \EQ_dout[30]_i_1 
       (.I0(Volume_data1[0]),
        .I1(\counter_channel_reg[7] ),
        .I2(p_0_in_0[5]),
        .I3(\EQ_dout[62]_i_5_n_0 ),
        .I4(\EQ_dout[62]_i_6_n_0 ),
        .O(D[22]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \EQ_dout[31]_i_2 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_81),
        .O(D[23]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h00008B33)) 
    \EQ_dout[32]_i_1 
       (.I0(mult_out_n_93),
        .I1(\EQ_dout[62]_i_5_n_0 ),
        .I2(mult_out_n_81),
        .I3(\EQ_dout_reg[23] ),
        .I4(\EQ_dout_reg[0] ),
        .O(D[24]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h00008B33)) 
    \EQ_dout[33]_i_1 
       (.I0(mult_out_n_92),
        .I1(\EQ_dout[62]_i_5_n_0 ),
        .I2(mult_out_n_81),
        .I3(\EQ_dout_reg[23] ),
        .I4(\EQ_dout_reg[0] ),
        .O(D[25]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h00008B33)) 
    \EQ_dout[34]_i_1 
       (.I0(mult_out_n_91),
        .I1(\EQ_dout[62]_i_5_n_0 ),
        .I2(mult_out_n_81),
        .I3(\EQ_dout_reg[23] ),
        .I4(\EQ_dout_reg[0] ),
        .O(D[26]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'h00008B33)) 
    \EQ_dout[35]_i_1 
       (.I0(mult_out_n_90),
        .I1(\EQ_dout[62]_i_5_n_0 ),
        .I2(mult_out_n_81),
        .I3(\EQ_dout_reg[23] ),
        .I4(\EQ_dout_reg[0] ),
        .O(D[27]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h00008B33)) 
    \EQ_dout[36]_i_1 
       (.I0(mult_out_n_89),
        .I1(\EQ_dout[62]_i_5_n_0 ),
        .I2(mult_out_n_81),
        .I3(\EQ_dout_reg[23] ),
        .I4(\EQ_dout_reg[0] ),
        .O(D[28]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h00008B33)) 
    \EQ_dout[37]_i_1 
       (.I0(mult_out_n_88),
        .I1(\EQ_dout[62]_i_5_n_0 ),
        .I2(mult_out_n_81),
        .I3(\EQ_dout_reg[23] ),
        .I4(\EQ_dout_reg[0] ),
        .O(D[29]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h00008B33)) 
    \EQ_dout[38]_i_1 
       (.I0(mult_out_n_87),
        .I1(\EQ_dout[62]_i_5_n_0 ),
        .I2(mult_out_n_81),
        .I3(\EQ_dout_reg[23] ),
        .I4(\EQ_dout_reg[0] ),
        .O(D[30]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h0222)) 
    \EQ_dout[39]_i_2 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(\counter_channel_reg[3] ),
        .I2(mult_out_n_81),
        .I3(\EQ_dout_reg[23] ),
        .O(D[31]));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \EQ_dout[39]_i_3 
       (.I0(\EQ_dout_reg[56] [3]),
        .I1(\EQ_dout_reg[56] [4]),
        .I2(\EQ_dout_reg[56] [5]),
        .I3(\EQ_dout_reg[56] [6]),
        .I4(\EQ_dout_reg[56] [7]),
        .O(\counter_channel_reg[3] ));
  LUT6 #(
    .INIT(64'h0000000040450505)) 
    \EQ_dout[3]_i_1 
       (.I0(Volume_data1[1]),
        .I1(mult_out_n_90),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[0] ),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h00D1)) 
    \EQ_dout[40]_i_1 
       (.I0(p_0_in_0[5]),
        .I1(\EQ_dout[62]_i_5_n_0 ),
        .I2(\EQ_dout[56]_i_2_n_0 ),
        .I3(Volume_data1[0]),
        .O(D[32]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h00D1)) 
    \EQ_dout[41]_i_1 
       (.I0(p_0_in_0[5]),
        .I1(\EQ_dout[62]_i_5_n_0 ),
        .I2(\EQ_dout[57]_i_2_n_0 ),
        .I3(Volume_data1[0]),
        .O(D[33]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h00D1)) 
    \EQ_dout[42]_i_1 
       (.I0(p_0_in_0[5]),
        .I1(\EQ_dout[62]_i_5_n_0 ),
        .I2(\EQ_dout[58]_i_2_n_0 ),
        .I3(Volume_data1[0]),
        .O(D[34]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h00D1)) 
    \EQ_dout[43]_i_1 
       (.I0(p_0_in_0[5]),
        .I1(\EQ_dout[62]_i_5_n_0 ),
        .I2(\EQ_dout[59]_i_2_n_0 ),
        .I3(Volume_data1[0]),
        .O(D[35]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h00D1)) 
    \EQ_dout[44]_i_1 
       (.I0(p_0_in_0[5]),
        .I1(\EQ_dout[62]_i_5_n_0 ),
        .I2(\EQ_dout[60]_i_2_n_0 ),
        .I3(Volume_data1[0]),
        .O(D[36]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h00D1)) 
    \EQ_dout[45]_i_1 
       (.I0(p_0_in_0[5]),
        .I1(\EQ_dout[62]_i_5_n_0 ),
        .I2(\EQ_dout[61]_i_2_n_0 ),
        .I3(Volume_data1[0]),
        .O(D[37]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h00D1)) 
    \EQ_dout[46]_i_1 
       (.I0(p_0_in_0[5]),
        .I1(\EQ_dout[62]_i_5_n_0 ),
        .I2(\EQ_dout[62]_i_6_n_0 ),
        .I3(Volume_data1[0]),
        .O(D[38]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \EQ_dout[47]_i_2 
       (.I0(mult_out_n_81),
        .I1(\EQ_dout_reg[23] ),
        .O(D[39]));
  LUT6 #(
    .INIT(64'h00000000808A0A0A)) 
    \EQ_dout[48]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(mult_out_n_93),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[16] ),
        .O(D[40]));
  LUT6 #(
    .INIT(64'h00000000808A0A0A)) 
    \EQ_dout[49]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(mult_out_n_92),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[16] ),
        .O(D[41]));
  LUT6 #(
    .INIT(64'h0000000040450505)) 
    \EQ_dout[4]_i_1 
       (.I0(Volume_data1[1]),
        .I1(mult_out_n_89),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[0] ),
        .O(D[4]));
  LUT6 #(
    .INIT(64'h00000000808A0A0A)) 
    \EQ_dout[50]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(mult_out_n_91),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[16] ),
        .O(D[42]));
  LUT6 #(
    .INIT(64'h00000000808A0A0A)) 
    \EQ_dout[51]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(mult_out_n_90),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[16] ),
        .O(D[43]));
  LUT6 #(
    .INIT(64'h00000000808A0A0A)) 
    \EQ_dout[52]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(mult_out_n_89),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[16] ),
        .O(D[44]));
  LUT6 #(
    .INIT(64'h00000000808A0A0A)) 
    \EQ_dout[53]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(mult_out_n_88),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[16] ),
        .O(D[45]));
  LUT6 #(
    .INIT(64'h00000000808A0A0A)) 
    \EQ_dout[54]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(mult_out_n_87),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[16] ),
        .O(D[46]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \EQ_dout[55]_i_2 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(mult_out_n_81),
        .I2(\EQ_dout_reg[23] ),
        .O(D[47]));
  LUT6 #(
    .INIT(64'h0808000800000008)) 
    \EQ_dout[56]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(Volume_data1[0]),
        .I2(\counter_channel_reg[7] ),
        .I3(p_0_in_0[5]),
        .I4(\EQ_dout[62]_i_5_n_0 ),
        .I5(\EQ_dout[56]_i_2_n_0 ),
        .O(D[48]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \EQ_dout[56]_i_2 
       (.I0(mult_out_n_93),
        .I1(\EQ_dout_reg[23] ),
        .O(\EQ_dout[56]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0808000800000008)) 
    \EQ_dout[57]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(Volume_data1[0]),
        .I2(\counter_channel_reg[7] ),
        .I3(p_0_in_0[5]),
        .I4(\EQ_dout[62]_i_5_n_0 ),
        .I5(\EQ_dout[57]_i_2_n_0 ),
        .O(D[49]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \EQ_dout[57]_i_2 
       (.I0(mult_out_n_92),
        .I1(\EQ_dout_reg[23] ),
        .O(\EQ_dout[57]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0808000800000008)) 
    \EQ_dout[58]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(Volume_data1[0]),
        .I2(\counter_channel_reg[7] ),
        .I3(p_0_in_0[5]),
        .I4(\EQ_dout[62]_i_5_n_0 ),
        .I5(\EQ_dout[58]_i_2_n_0 ),
        .O(D[50]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \EQ_dout[58]_i_2 
       (.I0(mult_out_n_91),
        .I1(\EQ_dout_reg[23] ),
        .O(\EQ_dout[58]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0808000800000008)) 
    \EQ_dout[59]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(Volume_data1[0]),
        .I2(\counter_channel_reg[7] ),
        .I3(p_0_in_0[5]),
        .I4(\EQ_dout[62]_i_5_n_0 ),
        .I5(\EQ_dout[59]_i_2_n_0 ),
        .O(D[51]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \EQ_dout[59]_i_2 
       (.I0(mult_out_n_90),
        .I1(\EQ_dout_reg[23] ),
        .O(\EQ_dout[59]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040450505)) 
    \EQ_dout[5]_i_1 
       (.I0(Volume_data1[1]),
        .I1(mult_out_n_88),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[0] ),
        .O(D[5]));
  LUT6 #(
    .INIT(64'h0808000800000008)) 
    \EQ_dout[60]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(Volume_data1[0]),
        .I2(\counter_channel_reg[7] ),
        .I3(p_0_in_0[5]),
        .I4(\EQ_dout[62]_i_5_n_0 ),
        .I5(\EQ_dout[60]_i_2_n_0 ),
        .O(D[52]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \EQ_dout[60]_i_2 
       (.I0(mult_out_n_89),
        .I1(\EQ_dout_reg[23] ),
        .O(\EQ_dout[60]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0808000800000008)) 
    \EQ_dout[61]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(Volume_data1[0]),
        .I2(\counter_channel_reg[7] ),
        .I3(p_0_in_0[5]),
        .I4(\EQ_dout[62]_i_5_n_0 ),
        .I5(\EQ_dout[61]_i_2_n_0 ),
        .O(D[53]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \EQ_dout[61]_i_2 
       (.I0(mult_out_n_88),
        .I1(\EQ_dout_reg[23] ),
        .O(\EQ_dout[61]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0808000800000008)) 
    \EQ_dout[62]_i_1 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(Volume_data1[0]),
        .I2(\counter_channel_reg[7] ),
        .I3(p_0_in_0[5]),
        .I4(\EQ_dout[62]_i_5_n_0 ),
        .I5(\EQ_dout[62]_i_6_n_0 ),
        .O(D[54]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \EQ_dout[62]_i_10 
       (.I0(mult_out_n_84),
        .I1(\EQ_dout_reg[23] ),
        .O(p_0_in_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \EQ_dout[62]_i_11 
       (.I0(mult_out_n_82),
        .I1(\EQ_dout_reg[23] ),
        .O(p_0_in_0[4]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \EQ_dout[62]_i_2 
       (.I0(\EQ_dout_reg[56] [1]),
        .I1(\EQ_dout_reg[56] [7]),
        .I2(\EQ_dout_reg[56] [6]),
        .I3(\EQ_dout_reg[56] [5]),
        .I4(\EQ_dout_reg[56] [4]),
        .I5(\EQ_dout_reg[56] [3]),
        .O(Volume_data1[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFFFFFF)) 
    \EQ_dout[62]_i_3 
       (.I0(\EQ_dout_reg[56] [7]),
        .I1(\EQ_dout_reg[56] [6]),
        .I2(\EQ_dout_reg[56] [5]),
        .I3(\EQ_dout_reg[56] [4]),
        .I4(\EQ_dout_reg[56] [3]),
        .I5(\EQ_dout_reg[56] [0]),
        .O(\counter_channel_reg[7] ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \EQ_dout[62]_i_4 
       (.I0(mult_out_n_81),
        .I1(\EQ_dout_reg[23] ),
        .O(p_0_in_0[5]));
  LUT6 #(
    .INIT(64'h8000000000000001)) 
    \EQ_dout[62]_i_5 
       (.I0(p_0_in_0[3]),
        .I1(p_0_in_0[0]),
        .I2(p_0_in_0[5]),
        .I3(p_0_in_0[1]),
        .I4(p_0_in_0[2]),
        .I5(p_0_in_0[4]),
        .O(\EQ_dout[62]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \EQ_dout[62]_i_6 
       (.I0(mult_out_n_87),
        .I1(\EQ_dout_reg[23] ),
        .O(\EQ_dout[62]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \EQ_dout[62]_i_7 
       (.I0(mult_out_n_83),
        .I1(\EQ_dout_reg[23] ),
        .O(p_0_in_0[3]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \EQ_dout[62]_i_8 
       (.I0(mult_out_n_86),
        .I1(\EQ_dout_reg[23] ),
        .O(p_0_in_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \EQ_dout[62]_i_9 
       (.I0(mult_out_n_85),
        .I1(\EQ_dout_reg[23] ),
        .O(p_0_in_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \EQ_dout[63]_i_2 
       (.I0(\counter_channel_reg[2] ),
        .I1(\EQ_dout_reg[23] ),
        .I2(mult_out_n_81),
        .O(D[55]));
  LUT4 #(
    .INIT(16'h0080)) 
    \EQ_dout[63]_i_4 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(\EQ_dout_reg[56] [1]),
        .I2(\EQ_dout_reg[56] [0]),
        .I3(\counter_channel_reg[3] ),
        .O(\counter_channel_reg[2] ));
  LUT6 #(
    .INIT(64'h0000000040450505)) 
    \EQ_dout[6]_i_1 
       (.I0(Volume_data1[1]),
        .I1(mult_out_n_87),
        .I2(\EQ_dout[62]_i_5_n_0 ),
        .I3(mult_out_n_81),
        .I4(\EQ_dout_reg[23] ),
        .I5(\EQ_dout_reg[0] ),
        .O(D[6]));
  LUT6 #(
    .INIT(64'h0000CCCDCCCDCCCD)) 
    \EQ_dout[7]_i_2 
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(\counter_channel_reg[3] ),
        .I2(\EQ_dout_reg[56] [0]),
        .I3(\EQ_dout_reg[56] [1]),
        .I4(mult_out_n_81),
        .I5(\EQ_dout_reg[23] ),
        .O(D[7]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    a1_carry_i_1
       (.I0(\EQ_dout_reg[56] [2]),
        .I1(\EQ_dout_reg[56] [7]),
        .I2(\EQ_dout_reg[56] [6]),
        .I3(\EQ_dout_reg[56] [5]),
        .I4(\EQ_dout_reg[56] [4]),
        .I5(\EQ_dout_reg[56] [3]),
        .O(Volume_data1[1]));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[0]_i_10 
       (.I0(mult_out_n_105),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(\accu_reg[3]_0 ),
        .O(\accu[0]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[0]_i_3 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_102),
        .I2(\accu_reg[3] ),
        .O(\accu[0]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[0]_i_4 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_103),
        .I2(\accu_reg[3] ),
        .O(\accu[0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[0]_i_5 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_104),
        .I2(\accu_reg[3] ),
        .O(\accu[0]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[0]_i_6 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_105),
        .I2(\accu_reg[3] ),
        .O(\accu[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[0]_i_7 
       (.I0(mult_out_n_102),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(\accu_reg[3]_3 ),
        .O(\accu[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[0]_i_8 
       (.I0(mult_out_n_103),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(\accu_reg[3]_2 ),
        .O(\accu[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[0]_i_9 
       (.I0(mult_out_n_104),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(\accu_reg[3]_1 ),
        .O(\accu[0]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[12]_i_2 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_90),
        .I2(\accu_reg[3] ),
        .O(\accu[12]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[12]_i_3 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_91),
        .I2(\accu_reg[3] ),
        .O(\accu[12]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[12]_i_4 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_92),
        .I2(\accu_reg[3] ),
        .O(\accu[12]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[12]_i_5 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_93),
        .I2(\accu_reg[3] ),
        .O(\accu[12]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[12]_i_6 
       (.I0(mult_out_n_90),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(accu_reg[3]),
        .O(\accu[12]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[12]_i_7 
       (.I0(mult_out_n_91),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(accu_reg[2]),
        .O(\accu[12]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[12]_i_8 
       (.I0(mult_out_n_92),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(accu_reg[1]),
        .O(\accu[12]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[12]_i_9 
       (.I0(mult_out_n_93),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(accu_reg[0]),
        .O(\accu[12]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[16]_i_2 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_86),
        .I2(\accu_reg[3] ),
        .O(\accu[16]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[16]_i_3 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_87),
        .I2(\accu_reg[3] ),
        .O(\accu[16]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[16]_i_4 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_88),
        .I2(\accu_reg[3] ),
        .O(\accu[16]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[16]_i_5 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_89),
        .I2(\accu_reg[3] ),
        .O(\accu[16]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[16]_i_6 
       (.I0(mult_out_n_86),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(accu_reg[7]),
        .O(\accu[16]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[16]_i_7 
       (.I0(mult_out_n_87),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(accu_reg[6]),
        .O(\accu[16]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[16]_i_8 
       (.I0(mult_out_n_88),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(accu_reg[5]),
        .O(\accu[16]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[16]_i_9 
       (.I0(mult_out_n_89),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(accu_reg[4]),
        .O(\accu[16]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[20]_i_2 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_82),
        .I2(\accu_reg[3] ),
        .O(\accu[20]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[20]_i_3 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_83),
        .I2(\accu_reg[3] ),
        .O(\accu[20]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[20]_i_4 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_84),
        .I2(\accu_reg[3] ),
        .O(\accu[20]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[20]_i_5 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_85),
        .I2(\accu_reg[3] ),
        .O(\accu[20]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[20]_i_6 
       (.I0(mult_out_n_82),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(accu_reg[11]),
        .O(\accu[20]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[20]_i_7 
       (.I0(mult_out_n_83),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(accu_reg[10]),
        .O(\accu[20]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[20]_i_8 
       (.I0(mult_out_n_84),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(accu_reg[9]),
        .O(\accu[20]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[20]_i_9 
       (.I0(mult_out_n_85),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(accu_reg[8]),
        .O(\accu[20]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[24]_i_2 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_81),
        .I2(\accu_reg[3] ),
        .O(\accu[24]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[24]_i_3 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_81),
        .I2(\accu_reg[3] ),
        .O(\accu[24]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[24]_i_4 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_81),
        .I2(\accu_reg[3] ),
        .O(\accu[24]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[24]_i_5 
       (.I0(mult_out_n_81),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(accu_reg[15]),
        .O(\accu[24]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[24]_i_6 
       (.I0(mult_out_n_81),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(accu_reg[14]),
        .O(\accu[24]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[24]_i_7 
       (.I0(mult_out_n_81),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(accu_reg[13]),
        .O(\accu[24]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[24]_i_8 
       (.I0(mult_out_n_81),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(accu_reg[12]),
        .O(\accu[24]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[4]_i_2 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_98),
        .I2(\accu_reg[3] ),
        .O(\accu[4]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[4]_i_3 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_99),
        .I2(\accu_reg[3] ),
        .O(\accu[4]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[4]_i_4 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_100),
        .I2(\accu_reg[3] ),
        .O(\accu[4]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[4]_i_5 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_101),
        .I2(\accu_reg[3] ),
        .O(\accu[4]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[4]_i_6 
       (.I0(mult_out_n_98),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(\accu_reg[7]_2 ),
        .O(\accu[4]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[4]_i_7 
       (.I0(mult_out_n_99),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(\accu_reg[7]_1 ),
        .O(\accu[4]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[4]_i_8 
       (.I0(mult_out_n_100),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(\accu_reg[7]_0 ),
        .O(\accu[4]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[4]_i_9 
       (.I0(mult_out_n_101),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(accu_reg_7_sn_1),
        .O(\accu[4]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[8]_i_2 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_94),
        .I2(\accu_reg[3] ),
        .O(\accu[8]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[8]_i_3 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_95),
        .I2(\accu_reg[3] ),
        .O(\accu[8]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[8]_i_4 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_96),
        .I2(\accu_reg[3] ),
        .O(\accu[8]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \accu[8]_i_5 
       (.I0(\EQ_dout_reg[23] ),
        .I1(mult_out_n_97),
        .I2(\accu_reg[3] ),
        .O(\accu[8]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[8]_i_6 
       (.I0(mult_out_n_94),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(\accu_reg[11]_2 ),
        .O(\accu[8]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[8]_i_7 
       (.I0(mult_out_n_95),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(\accu_reg[11]_1 ),
        .O(\accu[8]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[8]_i_8 
       (.I0(mult_out_n_96),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(\accu_reg[11]_0 ),
        .O(\accu[8]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h0708)) 
    \accu[8]_i_9 
       (.I0(mult_out_n_97),
        .I1(\EQ_dout_reg[23] ),
        .I2(\accu_reg[3] ),
        .I3(accu_reg_11_sn_1),
        .O(\accu[8]_i_9_n_0 ));
  CARRY4 \accu_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\accu_reg[0]_i_2_n_0 ,\accu_reg[0]_i_2_n_1 ,\accu_reg[0]_i_2_n_2 ,\accu_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\accu[0]_i_3_n_0 ,\accu[0]_i_4_n_0 ,\accu[0]_i_5_n_0 ,\accu[0]_i_6_n_0 }),
        .O(O),
        .S({\accu[0]_i_7_n_0 ,\accu[0]_i_8_n_0 ,\accu[0]_i_9_n_0 ,\accu[0]_i_10_n_0 }));
  CARRY4 \accu_reg[12]_i_1 
       (.CI(\accu_reg[8]_i_1_n_0 ),
        .CO({\accu_reg[12]_i_1_n_0 ,\accu_reg[12]_i_1_n_1 ,\accu_reg[12]_i_1_n_2 ,\accu_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\accu[12]_i_2_n_0 ,\accu[12]_i_3_n_0 ,\accu[12]_i_4_n_0 ,\accu[12]_i_5_n_0 }),
        .O(\EQ_dout_reg[63]_i_5_1 ),
        .S({\accu[12]_i_6_n_0 ,\accu[12]_i_7_n_0 ,\accu[12]_i_8_n_0 ,\accu[12]_i_9_n_0 }));
  CARRY4 \accu_reg[16]_i_1 
       (.CI(\accu_reg[12]_i_1_n_0 ),
        .CO({\accu_reg[16]_i_1_n_0 ,\accu_reg[16]_i_1_n_1 ,\accu_reg[16]_i_1_n_2 ,\accu_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\accu[16]_i_2_n_0 ,\accu[16]_i_3_n_0 ,\accu[16]_i_4_n_0 ,\accu[16]_i_5_n_0 }),
        .O(\EQ_dout_reg[63]_i_5_2 ),
        .S({\accu[16]_i_6_n_0 ,\accu[16]_i_7_n_0 ,\accu[16]_i_8_n_0 ,\accu[16]_i_9_n_0 }));
  CARRY4 \accu_reg[20]_i_1 
       (.CI(\accu_reg[16]_i_1_n_0 ),
        .CO({\accu_reg[20]_i_1_n_0 ,\accu_reg[20]_i_1_n_1 ,\accu_reg[20]_i_1_n_2 ,\accu_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\accu[20]_i_2_n_0 ,\accu[20]_i_3_n_0 ,\accu[20]_i_4_n_0 ,\accu[20]_i_5_n_0 }),
        .O(\EQ_dout_reg[63]_i_5_3 ),
        .S({\accu[20]_i_6_n_0 ,\accu[20]_i_7_n_0 ,\accu[20]_i_8_n_0 ,\accu[20]_i_9_n_0 }));
  CARRY4 \accu_reg[24]_i_1 
       (.CI(\accu_reg[20]_i_1_n_0 ),
        .CO({\NLW_accu_reg[24]_i_1_CO_UNCONNECTED [3],\accu_reg[24]_i_1_n_1 ,\accu_reg[24]_i_1_n_2 ,\accu_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\accu[24]_i_2_n_0 ,\accu[24]_i_3_n_0 ,\accu[24]_i_4_n_0 }),
        .O(\EQ_dout_reg[63]_i_5_4 ),
        .S({\accu[24]_i_5_n_0 ,\accu[24]_i_6_n_0 ,\accu[24]_i_7_n_0 ,\accu[24]_i_8_n_0 }));
  CARRY4 \accu_reg[4]_i_1 
       (.CI(\accu_reg[0]_i_2_n_0 ),
        .CO({\accu_reg[4]_i_1_n_0 ,\accu_reg[4]_i_1_n_1 ,\accu_reg[4]_i_1_n_2 ,\accu_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\accu[4]_i_2_n_0 ,\accu[4]_i_3_n_0 ,\accu[4]_i_4_n_0 ,\accu[4]_i_5_n_0 }),
        .O(\EQ_dout_reg[63]_i_5 ),
        .S({\accu[4]_i_6_n_0 ,\accu[4]_i_7_n_0 ,\accu[4]_i_8_n_0 ,\accu[4]_i_9_n_0 }));
  CARRY4 \accu_reg[8]_i_1 
       (.CI(\accu_reg[4]_i_1_n_0 ),
        .CO({\accu_reg[8]_i_1_n_0 ,\accu_reg[8]_i_1_n_1 ,\accu_reg[8]_i_1_n_2 ,\accu_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\accu[8]_i_2_n_0 ,\accu[8]_i_3_n_0 ,\accu[8]_i_4_n_0 ,\accu[8]_i_5_n_0 }),
        .O(\EQ_dout_reg[63]_i_5_0 ),
        .S({\accu[8]_i_6_n_0 ,\accu[8]_i_7_n_0 ,\accu[8]_i_8_n_0 ,\accu[8]_i_9_n_0 }));
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
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    mult_out
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,Q}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_mult_out_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({mult_opA,mult_opA,mult_opA,mult_opA,mult_opA,mult_opA,mult_opA,mult_opA,mult_opA,mult_opA,mult_opA,Volume_data}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_mult_out_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_mult_out_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_mult_out_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(reset_n),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(reset_n),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b1),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_mult_out_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_mult_out_OVERFLOW_UNCONNECTED),
        .P({NLW_mult_out_P_UNCONNECTED[47:25],mult_out_n_81,mult_out_n_82,mult_out_n_83,mult_out_n_84,mult_out_n_85,mult_out_n_86,mult_out_n_87,mult_out_n_88,mult_out_n_89,mult_out_n_90,mult_out_n_91,mult_out_n_92,mult_out_n_93,mult_out_n_94,mult_out_n_95,mult_out_n_96,mult_out_n_97,mult_out_n_98,mult_out_n_99,mult_out_n_100,mult_out_n_101,mult_out_n_102,mult_out_n_103,mult_out_n_104,mult_out_n_105}),
        .PATTERNBDETECT(NLW_mult_out_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_mult_out_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_mult_out_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_mult_out_UNDERFLOW_UNCONNECTED));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    mult_out_i_1
       (.I0(accu_reg[15]),
        .I1(\counter_channel_reg[2] ),
        .I2(mult_out_i_9_n_0),
        .I3(Volume_data1[1]),
        .I4(mult_out_i_10_n_0),
        .O(mult_opA));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F)) 
    mult_out_i_10
       (.I0(mult_out_0[23]),
        .I1(mult_out_0[31]),
        .I2(Volume_data1[0]),
        .I3(mult_out_0[7]),
        .I4(\counter_channel_reg[7] ),
        .I5(mult_out_0[15]),
        .O(mult_out_i_10_n_0));
  MUXF7 mult_out_i_11
       (.I0(mult_out_i_19_n_0),
        .I1(mult_out_i_20_n_0),
        .O(mult_out_i_11_n_0),
        .S(accu_reg[14]));
  MUXF7 mult_out_i_12
       (.I0(mult_out_i_21_n_0),
        .I1(mult_out_i_22_n_0),
        .O(mult_out_i_12_n_0),
        .S(Volume_data1[1]));
  MUXF7 mult_out_i_13
       (.I0(mult_out_i_23_n_0),
        .I1(mult_out_i_24_n_0),
        .O(mult_out_i_13_n_0),
        .S(Volume_data1[1]));
  MUXF7 mult_out_i_14
       (.I0(mult_out_i_25_n_0),
        .I1(mult_out_i_26_n_0),
        .O(mult_out_i_14_n_0),
        .S(Volume_data1[1]));
  MUXF7 mult_out_i_15
       (.I0(mult_out_i_27_n_0),
        .I1(mult_out_i_28_n_0),
        .O(mult_out_i_15_n_0),
        .S(Volume_data1[1]));
  MUXF7 mult_out_i_16
       (.I0(mult_out_i_29_n_0),
        .I1(mult_out_i_30_n_0),
        .O(mult_out_i_16_n_0),
        .S(Volume_data1[1]));
  MUXF7 mult_out_i_17
       (.I0(mult_out_i_31_n_0),
        .I1(mult_out_i_32_n_0),
        .O(mult_out_i_17_n_0),
        .S(Volume_data1[1]));
  MUXF7 mult_out_i_18
       (.I0(mult_out_i_33_n_0),
        .I1(mult_out_i_34_n_0),
        .O(mult_out_i_18_n_0),
        .S(Volume_data1[1]));
  LUT5 #(
    .INIT(32'h00000001)) 
    mult_out_i_19
       (.I0(accu_reg[9]),
        .I1(accu_reg[10]),
        .I2(accu_reg[7]),
        .I3(accu_reg[8]),
        .I4(mult_out_i_35_n_0),
        .O(mult_out_i_19_n_0));
  LUT5 #(
    .INIT(32'hFFFFD100)) 
    mult_out_i_2
       (.I0(accu_reg[15]),
        .I1(mult_out_i_11_n_0),
        .I2(accu_reg[6]),
        .I3(\counter_channel_reg[2] ),
        .I4(mult_out_i_12_n_0),
        .O(Volume_data[6]));
  LUT5 #(
    .INIT(32'h00008000)) 
    mult_out_i_20
       (.I0(accu_reg[9]),
        .I1(accu_reg[10]),
        .I2(accu_reg[7]),
        .I3(accu_reg[8]),
        .I4(mult_out_i_36_n_0),
        .O(mult_out_i_20_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    mult_out_i_21
       (.I0(mult_out_0[22]),
        .I1(mult_out_0[30]),
        .I2(Volume_data1[0]),
        .I3(mult_out_0[6]),
        .I4(\counter_channel_reg[7] ),
        .I5(mult_out_0[14]),
        .O(mult_out_i_21_n_0));
  LUT5 #(
    .INIT(32'hB833B800)) 
    mult_out_i_22
       (.I0(mult_out_0[54]),
        .I1(Volume_data1[0]),
        .I2(mult_out_0[38]),
        .I3(\counter_channel_reg[7] ),
        .I4(mult_out_0[46]),
        .O(mult_out_i_22_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    mult_out_i_23
       (.I0(mult_out_0[21]),
        .I1(mult_out_0[29]),
        .I2(Volume_data1[0]),
        .I3(mult_out_0[5]),
        .I4(\counter_channel_reg[7] ),
        .I5(mult_out_0[13]),
        .O(mult_out_i_23_n_0));
  LUT5 #(
    .INIT(32'hB833B800)) 
    mult_out_i_24
       (.I0(mult_out_0[53]),
        .I1(Volume_data1[0]),
        .I2(mult_out_0[37]),
        .I3(\counter_channel_reg[7] ),
        .I4(mult_out_0[45]),
        .O(mult_out_i_24_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    mult_out_i_25
       (.I0(mult_out_0[20]),
        .I1(mult_out_0[28]),
        .I2(Volume_data1[0]),
        .I3(mult_out_0[4]),
        .I4(\counter_channel_reg[7] ),
        .I5(mult_out_0[12]),
        .O(mult_out_i_25_n_0));
  LUT5 #(
    .INIT(32'hB833B800)) 
    mult_out_i_26
       (.I0(mult_out_0[52]),
        .I1(Volume_data1[0]),
        .I2(mult_out_0[36]),
        .I3(\counter_channel_reg[7] ),
        .I4(mult_out_0[44]),
        .O(mult_out_i_26_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    mult_out_i_27
       (.I0(mult_out_0[19]),
        .I1(mult_out_0[27]),
        .I2(Volume_data1[0]),
        .I3(mult_out_0[3]),
        .I4(\counter_channel_reg[7] ),
        .I5(mult_out_0[11]),
        .O(mult_out_i_27_n_0));
  LUT5 #(
    .INIT(32'hB833B800)) 
    mult_out_i_28
       (.I0(mult_out_0[51]),
        .I1(Volume_data1[0]),
        .I2(mult_out_0[35]),
        .I3(\counter_channel_reg[7] ),
        .I4(mult_out_0[43]),
        .O(mult_out_i_28_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    mult_out_i_29
       (.I0(mult_out_0[18]),
        .I1(mult_out_0[26]),
        .I2(Volume_data1[0]),
        .I3(mult_out_0[2]),
        .I4(\counter_channel_reg[7] ),
        .I5(mult_out_0[10]),
        .O(mult_out_i_29_n_0));
  LUT5 #(
    .INIT(32'hFFFFD100)) 
    mult_out_i_3
       (.I0(accu_reg[15]),
        .I1(mult_out_i_11_n_0),
        .I2(accu_reg[5]),
        .I3(\counter_channel_reg[2] ),
        .I4(mult_out_i_13_n_0),
        .O(Volume_data[5]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    mult_out_i_30
       (.I0(mult_out_0[50]),
        .I1(Volume_data1[0]),
        .I2(mult_out_0[34]),
        .I3(\counter_channel_reg[7] ),
        .I4(mult_out_0[42]),
        .O(mult_out_i_30_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    mult_out_i_31
       (.I0(mult_out_0[17]),
        .I1(mult_out_0[25]),
        .I2(Volume_data1[0]),
        .I3(mult_out_0[1]),
        .I4(\counter_channel_reg[7] ),
        .I5(mult_out_0[9]),
        .O(mult_out_i_31_n_0));
  LUT5 #(
    .INIT(32'hB833B800)) 
    mult_out_i_32
       (.I0(mult_out_0[49]),
        .I1(Volume_data1[0]),
        .I2(mult_out_0[33]),
        .I3(\counter_channel_reg[7] ),
        .I4(mult_out_0[41]),
        .O(mult_out_i_32_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    mult_out_i_33
       (.I0(mult_out_0[16]),
        .I1(mult_out_0[24]),
        .I2(Volume_data1[0]),
        .I3(mult_out_0[0]),
        .I4(\counter_channel_reg[7] ),
        .I5(mult_out_0[8]),
        .O(mult_out_i_33_n_0));
  LUT5 #(
    .INIT(32'hB833B800)) 
    mult_out_i_34
       (.I0(mult_out_0[48]),
        .I1(Volume_data1[0]),
        .I2(mult_out_0[32]),
        .I3(\counter_channel_reg[7] ),
        .I4(mult_out_0[40]),
        .O(mult_out_i_34_n_0));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    mult_out_i_35
       (.I0(accu_reg[15]),
        .I1(accu_reg[13]),
        .I2(accu_reg[12]),
        .I3(accu_reg[11]),
        .O(mult_out_i_35_n_0));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    mult_out_i_36
       (.I0(accu_reg[15]),
        .I1(accu_reg[13]),
        .I2(accu_reg[12]),
        .I3(accu_reg[11]),
        .O(mult_out_i_36_n_0));
  LUT5 #(
    .INIT(32'hFFFFD100)) 
    mult_out_i_4
       (.I0(accu_reg[15]),
        .I1(mult_out_i_11_n_0),
        .I2(accu_reg[4]),
        .I3(\counter_channel_reg[2] ),
        .I4(mult_out_i_14_n_0),
        .O(Volume_data[4]));
  LUT5 #(
    .INIT(32'hFFFFD100)) 
    mult_out_i_5
       (.I0(accu_reg[15]),
        .I1(mult_out_i_11_n_0),
        .I2(accu_reg[3]),
        .I3(\counter_channel_reg[2] ),
        .I4(mult_out_i_15_n_0),
        .O(Volume_data[3]));
  LUT5 #(
    .INIT(32'hFFFFD100)) 
    mult_out_i_6
       (.I0(accu_reg[15]),
        .I1(mult_out_i_11_n_0),
        .I2(accu_reg[2]),
        .I3(\counter_channel_reg[2] ),
        .I4(mult_out_i_16_n_0),
        .O(Volume_data[2]));
  LUT5 #(
    .INIT(32'hFFFFD100)) 
    mult_out_i_7
       (.I0(accu_reg[15]),
        .I1(mult_out_i_11_n_0),
        .I2(accu_reg[1]),
        .I3(\counter_channel_reg[2] ),
        .I4(mult_out_i_17_n_0),
        .O(Volume_data[1]));
  LUT5 #(
    .INIT(32'hFFFFD100)) 
    mult_out_i_8
       (.I0(accu_reg[15]),
        .I1(mult_out_i_11_n_0),
        .I2(accu_reg[0]),
        .I3(\counter_channel_reg[2] ),
        .I4(mult_out_i_18_n_0),
        .O(Volume_data[0]));
  LUT6 #(
    .INIT(64'hD0DFD0D0D0DFDFDF)) 
    mult_out_i_9
       (.I0(mult_out_0[55]),
        .I1(\EQ_dout_reg[56] [0]),
        .I2(Volume_data1[0]),
        .I3(mult_out_0[39]),
        .I4(\counter_channel_reg[7] ),
        .I5(mult_out_0[47]),
        .O(mult_out_i_9_n_0));
endmodule

(* CHECK_LICENSE_TYPE = "ROM_32_16bit,dist_mem_gen_v8_0_12,{}" *) (* ORIG_REF_NAME = "ROM_32_16bit" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "dist_mem_gen_v8_0_12,Vivado 2018.3" *) 
module EQ_ROM_32_16bit
   (a,
    spo);
  input [4:0]a;
  output [15:0]spo;

  wire [4:0]a;
  wire [15:0]spo;
  wire [15:0]NLW_U0_dpo_UNCONNECTED;
  wire [15:0]NLW_U0_qdpo_UNCONNECTED;
  wire [15:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_I_CE = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_PIPELINE_STAGES = "0" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_QUALIFY_WE = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "5" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "32" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_clk = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "ROM_32_16bit.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "16" *) 
  EQ_dist_mem_gen_v8_0_12 U0
       (.a(a),
        .clk(1'b0),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dpo(NLW_U0_dpo_UNCONNECTED[15:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[15:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[15:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(1'b0));
endmodule

(* C_ADDR_WIDTH = "5" *) (* C_DEFAULT_DATA = "0" *) (* C_DEPTH = "32" *) 
(* C_ELABORATION_DIR = "./" *) (* C_FAMILY = "spartan7" *) (* C_HAS_CLK = "0" *) 
(* C_HAS_D = "0" *) (* C_HAS_DPO = "0" *) (* C_HAS_DPRA = "0" *) 
(* C_HAS_I_CE = "0" *) (* C_HAS_QDPO = "0" *) (* C_HAS_QDPO_CE = "0" *) 
(* C_HAS_QDPO_CLK = "0" *) (* C_HAS_QDPO_RST = "0" *) (* C_HAS_QDPO_SRST = "0" *) 
(* C_HAS_QSPO = "0" *) (* C_HAS_QSPO_CE = "0" *) (* C_HAS_QSPO_RST = "0" *) 
(* C_HAS_QSPO_SRST = "0" *) (* C_HAS_SPO = "1" *) (* C_HAS_WE = "0" *) 
(* C_MEM_INIT_FILE = "ROM_32_16bit.mif" *) (* C_MEM_TYPE = "0" *) (* C_PARSER_TYPE = "1" *) 
(* C_PIPELINE_STAGES = "0" *) (* C_QCE_JOINED = "0" *) (* C_QUALIFY_WE = "0" *) 
(* C_READ_MIF = "1" *) (* C_REG_A_D_INPUTS = "0" *) (* C_REG_DPRA_INPUT = "0" *) 
(* C_SYNC_ENABLE = "1" *) (* C_WIDTH = "16" *) (* ORIG_REF_NAME = "dist_mem_gen_v8_0_12" *) 
module EQ_dist_mem_gen_v8_0_12
   (a,
    d,
    dpra,
    clk,
    we,
    i_ce,
    qspo_ce,
    qdpo_ce,
    qdpo_clk,
    qspo_rst,
    qdpo_rst,
    qspo_srst,
    qdpo_srst,
    spo,
    dpo,
    qspo,
    qdpo);
  input [4:0]a;
  input [15:0]d;
  input [4:0]dpra;
  input clk;
  input we;
  input i_ce;
  input qspo_ce;
  input qdpo_ce;
  input qdpo_clk;
  input qspo_rst;
  input qdpo_rst;
  input qspo_srst;
  input qdpo_srst;
  output [15:0]spo;
  output [15:0]dpo;
  output [15:0]qspo;
  output [15:0]qdpo;

  wire \<const0> ;
  wire [4:0]a;
  wire [15:0]spo;

  assign dpo[15] = \<const0> ;
  assign dpo[14] = \<const0> ;
  assign dpo[13] = \<const0> ;
  assign dpo[12] = \<const0> ;
  assign dpo[11] = \<const0> ;
  assign dpo[10] = \<const0> ;
  assign dpo[9] = \<const0> ;
  assign dpo[8] = \<const0> ;
  assign dpo[7] = \<const0> ;
  assign dpo[6] = \<const0> ;
  assign dpo[5] = \<const0> ;
  assign dpo[4] = \<const0> ;
  assign dpo[3] = \<const0> ;
  assign dpo[2] = \<const0> ;
  assign dpo[1] = \<const0> ;
  assign dpo[0] = \<const0> ;
  assign qdpo[15] = \<const0> ;
  assign qdpo[14] = \<const0> ;
  assign qdpo[13] = \<const0> ;
  assign qdpo[12] = \<const0> ;
  assign qdpo[11] = \<const0> ;
  assign qdpo[10] = \<const0> ;
  assign qdpo[9] = \<const0> ;
  assign qdpo[8] = \<const0> ;
  assign qdpo[7] = \<const0> ;
  assign qdpo[6] = \<const0> ;
  assign qdpo[5] = \<const0> ;
  assign qdpo[4] = \<const0> ;
  assign qdpo[3] = \<const0> ;
  assign qdpo[2] = \<const0> ;
  assign qdpo[1] = \<const0> ;
  assign qdpo[0] = \<const0> ;
  assign qspo[15] = \<const0> ;
  assign qspo[14] = \<const0> ;
  assign qspo[13] = \<const0> ;
  assign qspo[12] = \<const0> ;
  assign qspo[11] = \<const0> ;
  assign qspo[10] = \<const0> ;
  assign qspo[9] = \<const0> ;
  assign qspo[8] = \<const0> ;
  assign qspo[7] = \<const0> ;
  assign qspo[6] = \<const0> ;
  assign qspo[5] = \<const0> ;
  assign qspo[4] = \<const0> ;
  assign qspo[3] = \<const0> ;
  assign qspo[2] = \<const0> ;
  assign qspo[1] = \<const0> ;
  assign qspo[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h000CE20A)) 
    g0_b0
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .O(spo[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00C222A0)) 
    g0_b1
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .O(spo[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h002E48F0)) 
    g0_b10
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .O(spo[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00E48F00)) 
    g0_b11
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .O(spo[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h0048F000)) 
    g0_b12
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .O(spo[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h008F0000)) 
    g0_b13
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .O(spo[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h20)) 
    g0_b14
       (.I0(a[2]),
        .I1(a[3]),
        .I2(a[4]),
        .O(spo[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h01000000)) 
    g0_b15
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .O(spo[15]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h0022280C)) 
    g0_b2
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .O(spo[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h002280C8)) 
    g0_b3
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .O(spo[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00280C8C)) 
    g0_b4
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .O(spo[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h0080C8C2)) 
    g0_b5
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .O(spo[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h000C8C2E)) 
    g0_b6
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .O(spo[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00C8C2E4)) 
    g0_b7
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .O(spo[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h008C2E48)) 
    g0_b8
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .O(spo[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00C2E48E)) 
    g0_b9
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .O(spo[9]));
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
