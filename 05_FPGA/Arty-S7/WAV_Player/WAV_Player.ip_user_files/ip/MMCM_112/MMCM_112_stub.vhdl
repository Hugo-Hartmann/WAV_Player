-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Thu Dec 19 10:06:21 2019
-- Host        : L-1V1ZTY1 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/MMCM_112/MMCM_112_stub.vhdl
-- Design      : MMCM_112
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7s50csga324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MMCM_112 is
  Port ( 
    clk_112 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    CLK12MHZ : in STD_LOGIC
  );

end MMCM_112;

architecture stub of MMCM_112 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_112,reset,locked,CLK12MHZ";
begin
end;
