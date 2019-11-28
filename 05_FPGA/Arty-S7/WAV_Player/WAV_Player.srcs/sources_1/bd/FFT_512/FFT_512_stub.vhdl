-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Thu Nov 28 11:20:45 2019
-- Host        : L-1V1ZTY1 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/bd/FFT_512/FFT_512_stub.vhdl
-- Design      : FFT_512
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7s50csga324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FFT_512 is
  Port ( 
    FFT_addr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    FFT_din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    FFT_dout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    FFT_new_sample : in STD_LOGIC;
    FFT_read : in STD_LOGIC;
    FFT_start : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC
  );

end FFT_512;

architecture stub of FFT_512 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "FFT_addr[8:0],FFT_din[7:0],FFT_dout[15:0],FFT_new_sample,FFT_read,FFT_start,clk,reset_n";
begin
end;
