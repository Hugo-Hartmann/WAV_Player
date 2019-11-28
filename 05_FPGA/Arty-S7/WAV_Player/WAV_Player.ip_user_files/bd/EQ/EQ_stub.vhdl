-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Thu Nov 28 14:01:09 2019
-- Host        : L-1V1ZTY1 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/bd/EQ/EQ_stub.vhdl
-- Design      : EQ
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7s50csga324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EQ is
  Port ( 
    EQ_din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    EQ_din_band : in STD_LOGIC_VECTOR ( 47 downto 0 );
    EQ_dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    EQ_en : in STD_LOGIC;
    EQ_level_dout : out STD_LOGIC_VECTOR ( 39 downto 0 );
    EQ_select : in STD_LOGIC_VECTOR ( 3 downto 0 );
    EQ_vol_down : in STD_LOGIC;
    EQ_vol_up : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC
  );

end EQ;

architecture stub of EQ is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "EQ_din[7:0],EQ_din_band[47:0],EQ_dout[63:0],EQ_en,EQ_level_dout[39:0],EQ_select[3:0],EQ_vol_down,EQ_vol_up,clk,reset_n";
begin
end;
