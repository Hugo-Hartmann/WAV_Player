// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Oct 31 15:16:32 2019
// Host        : L-1V1ZTY1 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/MMCM_108MHZ/MMCM_108MHZ_stub.v
// Design      : MMCM_108MHZ
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module MMCM_108MHZ(clk, reset, locked, CLK12MHZ)
/* synthesis syn_black_box black_box_pad_pin="clk,reset,locked,CLK12MHZ" */;
  output clk;
  input reset;
  output locked;
  input CLK12MHZ;
endmodule
