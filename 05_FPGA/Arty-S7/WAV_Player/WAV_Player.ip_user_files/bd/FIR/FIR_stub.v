// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Nov 28 14:11:39 2019
// Host        : L-1V1ZTY1 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/bd/FIR/FIR_stub.v
// Design      : FIR
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module FIR(FIR_din, FIR_dout, FIR_start, clk, reset_n)
/* synthesis syn_black_box black_box_pad_pin="FIR_din[7:0],FIR_dout[47:0],FIR_start,clk,reset_n" */;
  input [7:0]FIR_din;
  output [47:0]FIR_dout;
  input FIR_start;
  input clk;
  input reset_n;
endmodule
