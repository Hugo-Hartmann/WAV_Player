// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Nov 28 14:01:09 2019
// Host        : L-1V1ZTY1 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/bd/EQ/EQ_stub.v
// Design      : EQ
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module EQ(EQ_din, EQ_din_band, EQ_dout, EQ_en, 
  EQ_level_dout, EQ_select, EQ_vol_down, EQ_vol_up, clk, reset_n)
/* synthesis syn_black_box black_box_pad_pin="EQ_din[7:0],EQ_din_band[47:0],EQ_dout[63:0],EQ_en,EQ_level_dout[39:0],EQ_select[3:0],EQ_vol_down,EQ_vol_up,clk,reset_n" */;
  input [7:0]EQ_din;
  input [47:0]EQ_din_band;
  output [63:0]EQ_dout;
  input EQ_en;
  output [39:0]EQ_level_dout;
  input [3:0]EQ_select;
  input EQ_vol_down;
  input EQ_vol_up;
  input clk;
  input reset_n;
endmodule
