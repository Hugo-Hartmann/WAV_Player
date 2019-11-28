// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Nov 28 11:20:45 2019
// Host        : L-1V1ZTY1 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/bd/FFT_512/FFT_512_stub.v
// Design      : FFT_512
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module FFT_512(FFT_addr, FFT_din, FFT_dout, FFT_new_sample, 
  FFT_read, FFT_start, clk, reset_n)
/* synthesis syn_black_box black_box_pad_pin="FFT_addr[8:0],FFT_din[7:0],FFT_dout[15:0],FFT_new_sample,FFT_read,FFT_start,clk,reset_n" */;
  input [8:0]FFT_addr;
  input [7:0]FFT_din;
  output [15:0]FFT_dout;
  input FFT_new_sample;
  input FFT_read;
  input FFT_start;
  input clk;
  input reset_n;
endmodule
