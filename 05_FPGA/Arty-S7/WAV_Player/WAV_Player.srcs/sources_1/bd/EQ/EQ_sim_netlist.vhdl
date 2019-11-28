-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Thu Nov 28 14:01:09 2019
-- Host        : L-1V1ZTY1 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/bd/EQ/EQ_sim_netlist.vhdl
-- Design      : EQ
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s50csga324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity EQ_EQ_volume_ctrl is
  port (
    a : out STD_LOGIC_VECTOR ( 4 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \vol_data_reg[1][4]_0\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \vol_data_reg[7][4]_0\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \vol_data_reg[6][4]_0\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \vol_data_reg[5][4]_0\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \vol_data_reg[4][4]_0\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \vol_data_reg[3][4]_0\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \vol_data_reg[2][4]_0\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    clk : in STD_LOGIC;
    EQ_select : in STD_LOGIC_VECTOR ( 2 downto 0 );
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    O : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \ROM0.U_ROM_i_1_0\ : in STD_LOGIC;
    EQ_vol_down : in STD_LOGIC;
    EQ_vol_up : in STD_LOGIC;
    reset_n : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of EQ_EQ_volume_ctrl : entity is "EQ_volume_ctrl";
end EQ_EQ_volume_ctrl;

architecture STRUCTURE of EQ_EQ_volume_ctrl is
  signal \^q\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \ROM0.U_ROM_i_10_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_11_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_12_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_13_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_14_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_15_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_16_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_17_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_18_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_19_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_20_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_21_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_22_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_23_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_24_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_25_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_26_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_27_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_28_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_29_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_30_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_31_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_32_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_33_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_34_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_35_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_36_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_37_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_38_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_39_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_40_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_41_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_42_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_43_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_44_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_45_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_46_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_47_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_48_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_49_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_50_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_51_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_52_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_53_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_54_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_55_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_56_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_57_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_58_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_59_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_6_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_8_n_0\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_9_n_0\ : STD_LOGIC;
  signal \counter_hold[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter_hold[0]_i_3_n_0\ : STD_LOGIC;
  signal \counter_hold[0]_i_4_n_0\ : STD_LOGIC;
  signal \counter_hold[0]_i_5_n_0\ : STD_LOGIC;
  signal \counter_hold[0]_i_6_n_0\ : STD_LOGIC;
  signal \counter_hold[12]_i_2_n_0\ : STD_LOGIC;
  signal \counter_hold[12]_i_3_n_0\ : STD_LOGIC;
  signal \counter_hold[12]_i_4_n_0\ : STD_LOGIC;
  signal \counter_hold[12]_i_5_n_0\ : STD_LOGIC;
  signal \counter_hold[16]_i_2_n_0\ : STD_LOGIC;
  signal \counter_hold[16]_i_3_n_0\ : STD_LOGIC;
  signal \counter_hold[16]_i_4_n_0\ : STD_LOGIC;
  signal \counter_hold[16]_i_5_n_0\ : STD_LOGIC;
  signal \counter_hold[20]_i_2_n_0\ : STD_LOGIC;
  signal \counter_hold[20]_i_3_n_0\ : STD_LOGIC;
  signal \counter_hold[20]_i_4_n_0\ : STD_LOGIC;
  signal \counter_hold[20]_i_5_n_0\ : STD_LOGIC;
  signal \counter_hold[24]_i_2_n_0\ : STD_LOGIC;
  signal \counter_hold[24]_i_3_n_0\ : STD_LOGIC;
  signal \counter_hold[24]_i_4_n_0\ : STD_LOGIC;
  signal \counter_hold[24]_i_5_n_0\ : STD_LOGIC;
  signal \counter_hold[28]_i_2_n_0\ : STD_LOGIC;
  signal \counter_hold[28]_i_3_n_0\ : STD_LOGIC;
  signal \counter_hold[28]_i_4_n_0\ : STD_LOGIC;
  signal \counter_hold[28]_i_5_n_0\ : STD_LOGIC;
  signal \counter_hold[4]_i_2_n_0\ : STD_LOGIC;
  signal \counter_hold[4]_i_3_n_0\ : STD_LOGIC;
  signal \counter_hold[4]_i_4_n_0\ : STD_LOGIC;
  signal \counter_hold[4]_i_5_n_0\ : STD_LOGIC;
  signal \counter_hold[8]_i_2_n_0\ : STD_LOGIC;
  signal \counter_hold[8]_i_3_n_0\ : STD_LOGIC;
  signal \counter_hold[8]_i_4_n_0\ : STD_LOGIC;
  signal \counter_hold[8]_i_5_n_0\ : STD_LOGIC;
  signal counter_hold_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \counter_hold_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter_hold_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \counter_hold_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \counter_hold_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \counter_hold_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \counter_hold_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \counter_hold_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \counter_hold_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \counter_hold_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_hold_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter_hold_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter_hold_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter_hold_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter_hold_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter_hold_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_hold_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_hold_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter_hold_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \counter_hold_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \counter_hold_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter_hold_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \counter_hold_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \counter_hold_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter_hold_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter_hold_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \counter_hold_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \counter_hold_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \counter_hold_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \counter_hold_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \counter_hold_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \counter_hold_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \counter_hold_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \counter_hold_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \counter_hold_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \counter_hold_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \counter_hold_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \counter_hold_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \counter_hold_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \counter_hold_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \counter_hold_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \counter_hold_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \counter_hold_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \counter_hold_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \counter_hold_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \counter_hold_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \counter_hold_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \counter_hold_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \counter_hold_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_hold_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_hold_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_hold_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_hold_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_hold_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_hold_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_hold_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_hold_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_hold_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_hold_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_hold_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_hold_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_hold_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_hold_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_hold_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \counter_wait[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter_wait[0]_i_3_n_0\ : STD_LOGIC;
  signal \counter_wait[0]_i_4_n_0\ : STD_LOGIC;
  signal \counter_wait[0]_i_5_n_0\ : STD_LOGIC;
  signal \counter_wait[0]_i_6_n_0\ : STD_LOGIC;
  signal \counter_wait[12]_i_2_n_0\ : STD_LOGIC;
  signal \counter_wait[12]_i_3_n_0\ : STD_LOGIC;
  signal \counter_wait[12]_i_4_n_0\ : STD_LOGIC;
  signal \counter_wait[12]_i_5_n_0\ : STD_LOGIC;
  signal \counter_wait[16]_i_2_n_0\ : STD_LOGIC;
  signal \counter_wait[16]_i_3_n_0\ : STD_LOGIC;
  signal \counter_wait[16]_i_4_n_0\ : STD_LOGIC;
  signal \counter_wait[16]_i_5_n_0\ : STD_LOGIC;
  signal \counter_wait[20]_i_2_n_0\ : STD_LOGIC;
  signal \counter_wait[20]_i_3_n_0\ : STD_LOGIC;
  signal \counter_wait[20]_i_4_n_0\ : STD_LOGIC;
  signal \counter_wait[20]_i_5_n_0\ : STD_LOGIC;
  signal \counter_wait[24]_i_2_n_0\ : STD_LOGIC;
  signal \counter_wait[24]_i_3_n_0\ : STD_LOGIC;
  signal \counter_wait[24]_i_4_n_0\ : STD_LOGIC;
  signal \counter_wait[24]_i_5_n_0\ : STD_LOGIC;
  signal \counter_wait[28]_i_2_n_0\ : STD_LOGIC;
  signal \counter_wait[28]_i_3_n_0\ : STD_LOGIC;
  signal \counter_wait[28]_i_4_n_0\ : STD_LOGIC;
  signal \counter_wait[28]_i_5_n_0\ : STD_LOGIC;
  signal \counter_wait[4]_i_2_n_0\ : STD_LOGIC;
  signal \counter_wait[4]_i_3_n_0\ : STD_LOGIC;
  signal \counter_wait[4]_i_4_n_0\ : STD_LOGIC;
  signal \counter_wait[4]_i_5_n_0\ : STD_LOGIC;
  signal \counter_wait[8]_i_2_n_0\ : STD_LOGIC;
  signal \counter_wait[8]_i_3_n_0\ : STD_LOGIC;
  signal \counter_wait[8]_i_4_n_0\ : STD_LOGIC;
  signal \counter_wait[8]_i_5_n_0\ : STD_LOGIC;
  signal counter_wait_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \counter_wait_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter_wait_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \counter_wait_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \counter_wait_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \counter_wait_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \counter_wait_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \counter_wait_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \counter_wait_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \counter_wait_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_wait_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter_wait_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter_wait_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter_wait_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter_wait_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter_wait_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_wait_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_wait_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter_wait_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \counter_wait_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \counter_wait_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter_wait_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \counter_wait_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \counter_wait_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter_wait_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter_wait_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \counter_wait_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \counter_wait_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \counter_wait_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \counter_wait_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \counter_wait_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \counter_wait_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \counter_wait_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \counter_wait_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \counter_wait_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \counter_wait_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \counter_wait_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \counter_wait_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \counter_wait_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \counter_wait_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \counter_wait_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \counter_wait_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \counter_wait_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \counter_wait_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \counter_wait_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \counter_wait_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \counter_wait_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \counter_wait_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \counter_wait_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_wait_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_wait_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_wait_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_wait_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_wait_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_wait_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_wait_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_wait_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_wait_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_wait_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_wait_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_wait_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_wait_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_wait_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_wait_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal current_state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \current_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \current_state[2]_i_2_n_0\ : STD_LOGIC;
  signal mem_state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \mem_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \mem_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \mem_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_10_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_11_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_12_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_13_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_14_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_15_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_16_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_17_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_18_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_19_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_20_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_21_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_3_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_4_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_5_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_6_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_7_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_8_n_0\ : STD_LOGIC;
  signal \mem_state[2]_i_9_n_0\ : STD_LOGIC;
  signal next_state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \vol_data[0][4]_i_1_n_0\ : STD_LOGIC;
  signal \vol_data[1][4]_i_1_n_0\ : STD_LOGIC;
  signal \vol_data[2][4]_i_1_n_0\ : STD_LOGIC;
  signal \vol_data[3][4]_i_1_n_0\ : STD_LOGIC;
  signal \vol_data[4][4]_i_1_n_0\ : STD_LOGIC;
  signal \vol_data[5][4]_i_1_n_0\ : STD_LOGIC;
  signal \vol_data[6][4]_i_1_n_0\ : STD_LOGIC;
  signal \vol_data[7][0]_i_1_n_0\ : STD_LOGIC;
  signal \vol_data[7][1]_i_1_n_0\ : STD_LOGIC;
  signal \vol_data[7][2]_i_1_n_0\ : STD_LOGIC;
  signal \vol_data[7][3]_i_1_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_11_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_12_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_13_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_14_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_15_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_16_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_17_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_18_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_19_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_1_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_20_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_21_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_2_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_3_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_4_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_6_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_7_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_8_n_0\ : STD_LOGIC;
  signal \vol_data[7][4]_i_9_n_0\ : STD_LOGIC;
  signal \^vol_data_reg[1][4]_0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^vol_data_reg[2][4]_0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^vol_data_reg[3][4]_0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^vol_data_reg[4][4]_0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^vol_data_reg[5][4]_0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^vol_data_reg[6][4]_0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^vol_data_reg[7][4]_0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \vol_data_reg[7][4]_i_10_n_0\ : STD_LOGIC;
  signal \vol_data_reg[7][4]_i_5_n_0\ : STD_LOGIC;
  signal \NLW_counter_hold_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_counter_wait_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ROM0.U_ROM_i_30\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \ROM0.U_ROM_i_31\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \current_state[0]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \current_state[2]_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \mem_state[0]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \mem_state[2]_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \vol_data[7][0]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \vol_data[7][2]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \vol_data[7][3]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \vol_data[7][4]_i_11\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \vol_data[7][4]_i_8\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \vol_data[7][4]_i_9\ : label is "soft_lutpair12";
begin
  Q(4 downto 0) <= \^q\(4 downto 0);
  \vol_data_reg[1][4]_0\(4 downto 0) <= \^vol_data_reg[1][4]_0\(4 downto 0);
  \vol_data_reg[2][4]_0\(4 downto 0) <= \^vol_data_reg[2][4]_0\(4 downto 0);
  \vol_data_reg[3][4]_0\(4 downto 0) <= \^vol_data_reg[3][4]_0\(4 downto 0);
  \vol_data_reg[4][4]_0\(4 downto 0) <= \^vol_data_reg[4][4]_0\(4 downto 0);
  \vol_data_reg[5][4]_0\(4 downto 0) <= \^vol_data_reg[5][4]_0\(4 downto 0);
  \vol_data_reg[6][4]_0\(4 downto 0) <= \^vol_data_reg[6][4]_0\(4 downto 0);
  \vol_data_reg[7][4]_0\(4 downto 0) <= \^vol_data_reg[7][4]_0\(4 downto 0);
\ROM0.U_ROM_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \ROM0.U_ROM_i_6_n_0\,
      I1 => CO(0),
      I2 => \ROM0.U_ROM_i_8_n_0\,
      I3 => O(3),
      I4 => \ROM0.U_ROM_i_9_n_0\,
      O => a(4)
    );
\ROM0.U_ROM_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \^vol_data_reg[7][4]_0\(4),
      I1 => O(1),
      I2 => \ROM0.U_ROM_i_30_n_0\,
      I3 => O(0),
      I4 => \ROM0.U_ROM_i_31_n_0\,
      O => \ROM0.U_ROM_i_10_n_0\
    );
\ROM0.U_ROM_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ROM0.U_ROM_i_32_n_0\,
      I1 => \ROM0.U_ROM_i_33_n_0\,
      I2 => O(2),
      I3 => \ROM0.U_ROM_i_34_n_0\,
      I4 => O(1),
      I5 => \ROM0.U_ROM_i_35_n_0\,
      O => \ROM0.U_ROM_i_11_n_0\
    );
\ROM0.U_ROM_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ROM0.U_ROM_i_36_n_0\,
      I1 => \ROM0.U_ROM_i_37_n_0\,
      I2 => O(2),
      I3 => \ROM0.U_ROM_i_38_n_0\,
      I4 => O(1),
      I5 => \ROM0.U_ROM_i_39_n_0\,
      O => \ROM0.U_ROM_i_12_n_0\
    );
\ROM0.U_ROM_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \^vol_data_reg[7][4]_0\(3),
      I1 => \ROM0.U_ROM_i_1_0\,
      I2 => \^vol_data_reg[7][4]_0\(4),
      I3 => O(1),
      I4 => \ROM0.U_ROM_i_40_n_0\,
      O => \ROM0.U_ROM_i_13_n_0\
    );
\ROM0.U_ROM_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ROM0.U_ROM_i_41_n_0\,
      I1 => \ROM0.U_ROM_i_42_n_0\,
      I2 => O(2),
      I3 => \ROM0.U_ROM_i_43_n_0\,
      I4 => O(1),
      I5 => \ROM0.U_ROM_i_44_n_0\,
      O => \ROM0.U_ROM_i_14_n_0\
    );
\ROM0.U_ROM_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ROM0.U_ROM_i_45_n_0\,
      I1 => \ROM0.U_ROM_i_46_n_0\,
      I2 => O(2),
      I3 => \ROM0.U_ROM_i_47_n_0\,
      I4 => O(1),
      I5 => \ROM0.U_ROM_i_48_n_0\,
      O => \ROM0.U_ROM_i_15_n_0\
    );
\ROM0.U_ROM_i_16\: unisim.vcomponents.MUXF7
     port map (
      I0 => \ROM0.U_ROM_i_49_n_0\,
      I1 => \ROM0.U_ROM_i_50_n_0\,
      O => \ROM0.U_ROM_i_16_n_0\,
      S => O(1)
    );
\ROM0.U_ROM_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ROM0.U_ROM_i_51_n_0\,
      I1 => \ROM0.U_ROM_i_52_n_0\,
      I2 => O(2),
      I3 => \ROM0.U_ROM_i_53_n_0\,
      I4 => O(1),
      I5 => \ROM0.U_ROM_i_54_n_0\,
      O => \ROM0.U_ROM_i_17_n_0\
    );
\ROM0.U_ROM_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ROM0.U_ROM_i_55_n_0\,
      I1 => \ROM0.U_ROM_i_56_n_0\,
      I2 => O(2),
      I3 => \ROM0.U_ROM_i_57_n_0\,
      I4 => O(1),
      I5 => \ROM0.U_ROM_i_58_n_0\,
      O => \ROM0.U_ROM_i_18_n_0\
    );
\ROM0.U_ROM_i_19\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \ROM0.U_ROM_i_6_n_0\,
      I1 => O(1),
      I2 => \ROM0.U_ROM_i_22_n_0\,
      O => \ROM0.U_ROM_i_19_n_0\
    );
\ROM0.U_ROM_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \ROM0.U_ROM_i_10_n_0\,
      I1 => CO(0),
      I2 => \ROM0.U_ROM_i_11_n_0\,
      I3 => O(3),
      I4 => \ROM0.U_ROM_i_12_n_0\,
      O => a(3)
    );
\ROM0.U_ROM_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ROM0.U_ROM_i_23_n_0\,
      I1 => \ROM0.U_ROM_i_24_n_0\,
      I2 => O(2),
      I3 => \ROM0.U_ROM_i_25_n_0\,
      I4 => O(1),
      I5 => \ROM0.U_ROM_i_26_n_0\,
      O => \ROM0.U_ROM_i_20_n_0\
    );
\ROM0.U_ROM_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ROM0.U_ROM_i_27_n_0\,
      I1 => \ROM0.U_ROM_i_28_n_0\,
      I2 => O(2),
      I3 => \ROM0.U_ROM_i_29_n_0\,
      I4 => O(1),
      I5 => \ROM0.U_ROM_i_59_n_0\,
      O => \ROM0.U_ROM_i_21_n_0\
    );
\ROM0.U_ROM_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[6][4]_0\(4),
      I1 => \^vol_data_reg[7][4]_0\(0),
      I2 => O(0),
      I3 => \^vol_data_reg[6][4]_0\(2),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[6][4]_0\(3),
      O => \ROM0.U_ROM_i_22_n_0\
    );
\ROM0.U_ROM_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[6][4]_0\(0),
      I1 => \^vol_data_reg[6][4]_0\(1),
      I2 => O(0),
      I3 => \^vol_data_reg[5][4]_0\(3),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[5][4]_0\(4),
      O => \ROM0.U_ROM_i_23_n_0\
    );
\ROM0.U_ROM_i_24\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[5][4]_0\(1),
      I1 => \^vol_data_reg[5][4]_0\(2),
      I2 => O(0),
      I3 => \^vol_data_reg[4][4]_0\(4),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[5][4]_0\(0),
      O => \ROM0.U_ROM_i_24_n_0\
    );
\ROM0.U_ROM_i_25\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[4][4]_0\(2),
      I1 => \^vol_data_reg[4][4]_0\(3),
      I2 => O(0),
      I3 => \^vol_data_reg[4][4]_0\(0),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[4][4]_0\(1),
      O => \ROM0.U_ROM_i_25_n_0\
    );
\ROM0.U_ROM_i_26\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[3][4]_0\(3),
      I1 => \^vol_data_reg[3][4]_0\(4),
      I2 => O(0),
      I3 => \^vol_data_reg[3][4]_0\(1),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[3][4]_0\(2),
      O => \ROM0.U_ROM_i_26_n_0\
    );
\ROM0.U_ROM_i_27\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[2][4]_0\(4),
      I1 => \^vol_data_reg[3][4]_0\(0),
      I2 => O(0),
      I3 => \^vol_data_reg[2][4]_0\(2),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[2][4]_0\(3),
      O => \ROM0.U_ROM_i_27_n_0\
    );
\ROM0.U_ROM_i_28\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[2][4]_0\(0),
      I1 => \^vol_data_reg[2][4]_0\(1),
      I2 => O(0),
      I3 => \^vol_data_reg[1][4]_0\(3),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[1][4]_0\(4),
      O => \ROM0.U_ROM_i_28_n_0\
    );
\ROM0.U_ROM_i_29\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[1][4]_0\(1),
      I1 => \^vol_data_reg[1][4]_0\(2),
      I2 => O(0),
      I3 => \^q\(4),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[1][4]_0\(0),
      O => \ROM0.U_ROM_i_29_n_0\
    );
\ROM0.U_ROM_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \ROM0.U_ROM_i_13_n_0\,
      I1 => CO(0),
      I2 => \ROM0.U_ROM_i_14_n_0\,
      I3 => O(3),
      I4 => \ROM0.U_ROM_i_15_n_0\,
      O => a(2)
    );
\ROM0.U_ROM_i_30\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^vol_data_reg[7][4]_0\(2),
      I1 => \ROM0.U_ROM_i_1_0\,
      I2 => \^vol_data_reg[7][4]_0\(3),
      O => \ROM0.U_ROM_i_30_n_0\
    );
\ROM0.U_ROM_i_31\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^vol_data_reg[7][4]_0\(0),
      I1 => \ROM0.U_ROM_i_1_0\,
      I2 => \^vol_data_reg[7][4]_0\(1),
      O => \ROM0.U_ROM_i_31_n_0\
    );
\ROM0.U_ROM_i_32\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[6][4]_0\(3),
      I1 => \^vol_data_reg[6][4]_0\(4),
      I2 => O(0),
      I3 => \^vol_data_reg[6][4]_0\(1),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[6][4]_0\(2),
      O => \ROM0.U_ROM_i_32_n_0\
    );
\ROM0.U_ROM_i_33\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[5][4]_0\(4),
      I1 => \^vol_data_reg[6][4]_0\(0),
      I2 => O(0),
      I3 => \^vol_data_reg[5][4]_0\(2),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[5][4]_0\(3),
      O => \ROM0.U_ROM_i_33_n_0\
    );
\ROM0.U_ROM_i_34\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[5][4]_0\(0),
      I1 => \^vol_data_reg[5][4]_0\(1),
      I2 => O(0),
      I3 => \^vol_data_reg[4][4]_0\(3),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[4][4]_0\(4),
      O => \ROM0.U_ROM_i_34_n_0\
    );
\ROM0.U_ROM_i_35\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[4][4]_0\(1),
      I1 => \^vol_data_reg[4][4]_0\(2),
      I2 => O(0),
      I3 => \^vol_data_reg[3][4]_0\(4),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[4][4]_0\(0),
      O => \ROM0.U_ROM_i_35_n_0\
    );
\ROM0.U_ROM_i_36\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[3][4]_0\(2),
      I1 => \^vol_data_reg[3][4]_0\(3),
      I2 => O(0),
      I3 => \^vol_data_reg[3][4]_0\(0),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[3][4]_0\(1),
      O => \ROM0.U_ROM_i_36_n_0\
    );
\ROM0.U_ROM_i_37\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[2][4]_0\(3),
      I1 => \^vol_data_reg[2][4]_0\(4),
      I2 => O(0),
      I3 => \^vol_data_reg[2][4]_0\(1),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[2][4]_0\(2),
      O => \ROM0.U_ROM_i_37_n_0\
    );
\ROM0.U_ROM_i_38\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[1][4]_0\(4),
      I1 => \^vol_data_reg[2][4]_0\(0),
      I2 => O(0),
      I3 => \^vol_data_reg[1][4]_0\(2),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[1][4]_0\(3),
      O => \ROM0.U_ROM_i_38_n_0\
    );
\ROM0.U_ROM_i_39\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[1][4]_0\(0),
      I1 => \^vol_data_reg[1][4]_0\(1),
      I2 => O(0),
      I3 => \^q\(3),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^q\(4),
      O => \ROM0.U_ROM_i_39_n_0\
    );
\ROM0.U_ROM_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \ROM0.U_ROM_i_16_n_0\,
      I1 => CO(0),
      I2 => \ROM0.U_ROM_i_17_n_0\,
      I3 => O(3),
      I4 => \ROM0.U_ROM_i_18_n_0\,
      O => a(1)
    );
\ROM0.U_ROM_i_40\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[7][4]_0\(1),
      I1 => \^vol_data_reg[7][4]_0\(2),
      I2 => O(0),
      I3 => \^vol_data_reg[6][4]_0\(4),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[7][4]_0\(0),
      O => \ROM0.U_ROM_i_40_n_0\
    );
\ROM0.U_ROM_i_41\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[6][4]_0\(2),
      I1 => \^vol_data_reg[6][4]_0\(3),
      I2 => O(0),
      I3 => \^vol_data_reg[6][4]_0\(0),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[6][4]_0\(1),
      O => \ROM0.U_ROM_i_41_n_0\
    );
\ROM0.U_ROM_i_42\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[5][4]_0\(3),
      I1 => \^vol_data_reg[5][4]_0\(4),
      I2 => O(0),
      I3 => \^vol_data_reg[5][4]_0\(1),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[5][4]_0\(2),
      O => \ROM0.U_ROM_i_42_n_0\
    );
\ROM0.U_ROM_i_43\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[4][4]_0\(4),
      I1 => \^vol_data_reg[5][4]_0\(0),
      I2 => O(0),
      I3 => \^vol_data_reg[4][4]_0\(2),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[4][4]_0\(3),
      O => \ROM0.U_ROM_i_43_n_0\
    );
\ROM0.U_ROM_i_44\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[4][4]_0\(0),
      I1 => \^vol_data_reg[4][4]_0\(1),
      I2 => O(0),
      I3 => \^vol_data_reg[3][4]_0\(3),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[3][4]_0\(4),
      O => \ROM0.U_ROM_i_44_n_0\
    );
\ROM0.U_ROM_i_45\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[3][4]_0\(1),
      I1 => \^vol_data_reg[3][4]_0\(2),
      I2 => O(0),
      I3 => \^vol_data_reg[2][4]_0\(4),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[3][4]_0\(0),
      O => \ROM0.U_ROM_i_45_n_0\
    );
\ROM0.U_ROM_i_46\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[2][4]_0\(2),
      I1 => \^vol_data_reg[2][4]_0\(3),
      I2 => O(0),
      I3 => \^vol_data_reg[2][4]_0\(0),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[2][4]_0\(1),
      O => \ROM0.U_ROM_i_46_n_0\
    );
\ROM0.U_ROM_i_47\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[1][4]_0\(3),
      I1 => \^vol_data_reg[1][4]_0\(4),
      I2 => O(0),
      I3 => \^vol_data_reg[1][4]_0\(1),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[1][4]_0\(2),
      O => \ROM0.U_ROM_i_47_n_0\
    );
\ROM0.U_ROM_i_48\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^vol_data_reg[1][4]_0\(0),
      I2 => O(0),
      I3 => \^q\(2),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^q\(3),
      O => \ROM0.U_ROM_i_48_n_0\
    );
\ROM0.U_ROM_i_49\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[7][4]_0\(0),
      I1 => \^vol_data_reg[7][4]_0\(1),
      I2 => O(0),
      I3 => \^vol_data_reg[6][4]_0\(3),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[6][4]_0\(4),
      O => \ROM0.U_ROM_i_49_n_0\
    );
\ROM0.U_ROM_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \ROM0.U_ROM_i_19_n_0\,
      I1 => CO(0),
      I2 => \ROM0.U_ROM_i_20_n_0\,
      I3 => O(3),
      I4 => \ROM0.U_ROM_i_21_n_0\,
      O => a(0)
    );
\ROM0.U_ROM_i_50\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \^vol_data_reg[7][4]_0\(4),
      I1 => O(0),
      I2 => \^vol_data_reg[7][4]_0\(2),
      I3 => \ROM0.U_ROM_i_1_0\,
      I4 => \^vol_data_reg[7][4]_0\(3),
      O => \ROM0.U_ROM_i_50_n_0\
    );
\ROM0.U_ROM_i_51\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[6][4]_0\(1),
      I1 => \^vol_data_reg[6][4]_0\(2),
      I2 => O(0),
      I3 => \^vol_data_reg[5][4]_0\(4),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[6][4]_0\(0),
      O => \ROM0.U_ROM_i_51_n_0\
    );
\ROM0.U_ROM_i_52\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[5][4]_0\(2),
      I1 => \^vol_data_reg[5][4]_0\(3),
      I2 => O(0),
      I3 => \^vol_data_reg[5][4]_0\(0),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[5][4]_0\(1),
      O => \ROM0.U_ROM_i_52_n_0\
    );
\ROM0.U_ROM_i_53\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[4][4]_0\(3),
      I1 => \^vol_data_reg[4][4]_0\(4),
      I2 => O(0),
      I3 => \^vol_data_reg[4][4]_0\(1),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[4][4]_0\(2),
      O => \ROM0.U_ROM_i_53_n_0\
    );
\ROM0.U_ROM_i_54\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[3][4]_0\(4),
      I1 => \^vol_data_reg[4][4]_0\(0),
      I2 => O(0),
      I3 => \^vol_data_reg[3][4]_0\(2),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[3][4]_0\(3),
      O => \ROM0.U_ROM_i_54_n_0\
    );
\ROM0.U_ROM_i_55\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[3][4]_0\(0),
      I1 => \^vol_data_reg[3][4]_0\(1),
      I2 => O(0),
      I3 => \^vol_data_reg[2][4]_0\(3),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[2][4]_0\(4),
      O => \ROM0.U_ROM_i_55_n_0\
    );
\ROM0.U_ROM_i_56\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[2][4]_0\(1),
      I1 => \^vol_data_reg[2][4]_0\(2),
      I2 => O(0),
      I3 => \^vol_data_reg[1][4]_0\(4),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[2][4]_0\(0),
      O => \ROM0.U_ROM_i_56_n_0\
    );
\ROM0.U_ROM_i_57\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[1][4]_0\(2),
      I1 => \^vol_data_reg[1][4]_0\(3),
      I2 => O(0),
      I3 => \^vol_data_reg[1][4]_0\(0),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[1][4]_0\(1),
      O => \ROM0.U_ROM_i_57_n_0\
    );
\ROM0.U_ROM_i_58\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(4),
      I2 => O(0),
      I3 => \^q\(1),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^q\(2),
      O => \ROM0.U_ROM_i_58_n_0\
    );
\ROM0.U_ROM_i_59\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(3),
      I2 => O(0),
      I3 => \^q\(0),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^q\(1),
      O => \ROM0.U_ROM_i_59_n_0\
    );
\ROM0.U_ROM_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[7][4]_0\(3),
      I1 => \^vol_data_reg[7][4]_0\(4),
      I2 => O(0),
      I3 => \^vol_data_reg[7][4]_0\(1),
      I4 => \ROM0.U_ROM_i_1_0\,
      I5 => \^vol_data_reg[7][4]_0\(2),
      O => \ROM0.U_ROM_i_6_n_0\
    );
\ROM0.U_ROM_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ROM0.U_ROM_i_22_n_0\,
      I1 => \ROM0.U_ROM_i_23_n_0\,
      I2 => O(2),
      I3 => \ROM0.U_ROM_i_24_n_0\,
      I4 => O(1),
      I5 => \ROM0.U_ROM_i_25_n_0\,
      O => \ROM0.U_ROM_i_8_n_0\
    );
\ROM0.U_ROM_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ROM0.U_ROM_i_26_n_0\,
      I1 => \ROM0.U_ROM_i_27_n_0\,
      I2 => O(2),
      I3 => \ROM0.U_ROM_i_28_n_0\,
      I4 => O(1),
      I5 => \ROM0.U_ROM_i_29_n_0\,
      O => \ROM0.U_ROM_i_9_n_0\
    );
\counter_hold[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => current_state(2),
      I1 => current_state(1),
      O => \counter_hold[0]_i_2_n_0\
    );
\counter_hold[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(3),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[0]_i_3_n_0\
    );
\counter_hold[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(2),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[0]_i_4_n_0\
    );
\counter_hold[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(1),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[0]_i_5_n_0\
    );
\counter_hold[0]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => counter_hold_reg(0),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[0]_i_6_n_0\
    );
\counter_hold[12]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(15),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[12]_i_2_n_0\
    );
\counter_hold[12]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(14),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[12]_i_3_n_0\
    );
\counter_hold[12]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(13),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[12]_i_4_n_0\
    );
\counter_hold[12]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(12),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[12]_i_5_n_0\
    );
\counter_hold[16]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(19),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[16]_i_2_n_0\
    );
\counter_hold[16]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(18),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[16]_i_3_n_0\
    );
\counter_hold[16]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(17),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[16]_i_4_n_0\
    );
\counter_hold[16]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(16),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[16]_i_5_n_0\
    );
\counter_hold[20]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(23),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[20]_i_2_n_0\
    );
\counter_hold[20]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(22),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[20]_i_3_n_0\
    );
\counter_hold[20]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(21),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[20]_i_4_n_0\
    );
\counter_hold[20]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(20),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[20]_i_5_n_0\
    );
\counter_hold[24]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(27),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[24]_i_2_n_0\
    );
\counter_hold[24]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(26),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[24]_i_3_n_0\
    );
\counter_hold[24]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(25),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[24]_i_4_n_0\
    );
\counter_hold[24]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(24),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[24]_i_5_n_0\
    );
\counter_hold[28]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(31),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[28]_i_2_n_0\
    );
\counter_hold[28]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(30),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[28]_i_3_n_0\
    );
\counter_hold[28]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(29),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[28]_i_4_n_0\
    );
\counter_hold[28]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(28),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[28]_i_5_n_0\
    );
\counter_hold[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(7),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[4]_i_2_n_0\
    );
\counter_hold[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(6),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[4]_i_3_n_0\
    );
\counter_hold[4]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(5),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[4]_i_4_n_0\
    );
\counter_hold[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(4),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[4]_i_5_n_0\
    );
\counter_hold[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(11),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[8]_i_2_n_0\
    );
\counter_hold[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(10),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[8]_i_3_n_0\
    );
\counter_hold[8]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(9),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[8]_i_4_n_0\
    );
\counter_hold[8]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => counter_hold_reg(8),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_hold[8]_i_5_n_0\
    );
\counter_hold_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[0]_i_1_n_7\,
      Q => counter_hold_reg(0)
    );
\counter_hold_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_hold_reg[0]_i_1_n_0\,
      CO(2) => \counter_hold_reg[0]_i_1_n_1\,
      CO(1) => \counter_hold_reg[0]_i_1_n_2\,
      CO(0) => \counter_hold_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \counter_hold[0]_i_2_n_0\,
      O(3) => \counter_hold_reg[0]_i_1_n_4\,
      O(2) => \counter_hold_reg[0]_i_1_n_5\,
      O(1) => \counter_hold_reg[0]_i_1_n_6\,
      O(0) => \counter_hold_reg[0]_i_1_n_7\,
      S(3) => \counter_hold[0]_i_3_n_0\,
      S(2) => \counter_hold[0]_i_4_n_0\,
      S(1) => \counter_hold[0]_i_5_n_0\,
      S(0) => \counter_hold[0]_i_6_n_0\
    );
\counter_hold_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[8]_i_1_n_5\,
      Q => counter_hold_reg(10)
    );
\counter_hold_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[8]_i_1_n_4\,
      Q => counter_hold_reg(11)
    );
\counter_hold_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[12]_i_1_n_7\,
      Q => counter_hold_reg(12)
    );
\counter_hold_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_hold_reg[8]_i_1_n_0\,
      CO(3) => \counter_hold_reg[12]_i_1_n_0\,
      CO(2) => \counter_hold_reg[12]_i_1_n_1\,
      CO(1) => \counter_hold_reg[12]_i_1_n_2\,
      CO(0) => \counter_hold_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_hold_reg[12]_i_1_n_4\,
      O(2) => \counter_hold_reg[12]_i_1_n_5\,
      O(1) => \counter_hold_reg[12]_i_1_n_6\,
      O(0) => \counter_hold_reg[12]_i_1_n_7\,
      S(3) => \counter_hold[12]_i_2_n_0\,
      S(2) => \counter_hold[12]_i_3_n_0\,
      S(1) => \counter_hold[12]_i_4_n_0\,
      S(0) => \counter_hold[12]_i_5_n_0\
    );
\counter_hold_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[12]_i_1_n_6\,
      Q => counter_hold_reg(13)
    );
\counter_hold_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[12]_i_1_n_5\,
      Q => counter_hold_reg(14)
    );
\counter_hold_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[12]_i_1_n_4\,
      Q => counter_hold_reg(15)
    );
\counter_hold_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[16]_i_1_n_7\,
      Q => counter_hold_reg(16)
    );
\counter_hold_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_hold_reg[12]_i_1_n_0\,
      CO(3) => \counter_hold_reg[16]_i_1_n_0\,
      CO(2) => \counter_hold_reg[16]_i_1_n_1\,
      CO(1) => \counter_hold_reg[16]_i_1_n_2\,
      CO(0) => \counter_hold_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_hold_reg[16]_i_1_n_4\,
      O(2) => \counter_hold_reg[16]_i_1_n_5\,
      O(1) => \counter_hold_reg[16]_i_1_n_6\,
      O(0) => \counter_hold_reg[16]_i_1_n_7\,
      S(3) => \counter_hold[16]_i_2_n_0\,
      S(2) => \counter_hold[16]_i_3_n_0\,
      S(1) => \counter_hold[16]_i_4_n_0\,
      S(0) => \counter_hold[16]_i_5_n_0\
    );
\counter_hold_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[16]_i_1_n_6\,
      Q => counter_hold_reg(17)
    );
\counter_hold_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[16]_i_1_n_5\,
      Q => counter_hold_reg(18)
    );
\counter_hold_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[16]_i_1_n_4\,
      Q => counter_hold_reg(19)
    );
\counter_hold_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[0]_i_1_n_6\,
      Q => counter_hold_reg(1)
    );
\counter_hold_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[20]_i_1_n_7\,
      Q => counter_hold_reg(20)
    );
\counter_hold_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_hold_reg[16]_i_1_n_0\,
      CO(3) => \counter_hold_reg[20]_i_1_n_0\,
      CO(2) => \counter_hold_reg[20]_i_1_n_1\,
      CO(1) => \counter_hold_reg[20]_i_1_n_2\,
      CO(0) => \counter_hold_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_hold_reg[20]_i_1_n_4\,
      O(2) => \counter_hold_reg[20]_i_1_n_5\,
      O(1) => \counter_hold_reg[20]_i_1_n_6\,
      O(0) => \counter_hold_reg[20]_i_1_n_7\,
      S(3) => \counter_hold[20]_i_2_n_0\,
      S(2) => \counter_hold[20]_i_3_n_0\,
      S(1) => \counter_hold[20]_i_4_n_0\,
      S(0) => \counter_hold[20]_i_5_n_0\
    );
\counter_hold_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[20]_i_1_n_6\,
      Q => counter_hold_reg(21)
    );
\counter_hold_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[20]_i_1_n_5\,
      Q => counter_hold_reg(22)
    );
\counter_hold_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[20]_i_1_n_4\,
      Q => counter_hold_reg(23)
    );
\counter_hold_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[24]_i_1_n_7\,
      Q => counter_hold_reg(24)
    );
\counter_hold_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_hold_reg[20]_i_1_n_0\,
      CO(3) => \counter_hold_reg[24]_i_1_n_0\,
      CO(2) => \counter_hold_reg[24]_i_1_n_1\,
      CO(1) => \counter_hold_reg[24]_i_1_n_2\,
      CO(0) => \counter_hold_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_hold_reg[24]_i_1_n_4\,
      O(2) => \counter_hold_reg[24]_i_1_n_5\,
      O(1) => \counter_hold_reg[24]_i_1_n_6\,
      O(0) => \counter_hold_reg[24]_i_1_n_7\,
      S(3) => \counter_hold[24]_i_2_n_0\,
      S(2) => \counter_hold[24]_i_3_n_0\,
      S(1) => \counter_hold[24]_i_4_n_0\,
      S(0) => \counter_hold[24]_i_5_n_0\
    );
\counter_hold_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[24]_i_1_n_6\,
      Q => counter_hold_reg(25)
    );
\counter_hold_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[24]_i_1_n_5\,
      Q => counter_hold_reg(26)
    );
\counter_hold_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[24]_i_1_n_4\,
      Q => counter_hold_reg(27)
    );
\counter_hold_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[28]_i_1_n_7\,
      Q => counter_hold_reg(28)
    );
\counter_hold_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_hold_reg[24]_i_1_n_0\,
      CO(3) => \NLW_counter_hold_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \counter_hold_reg[28]_i_1_n_1\,
      CO(1) => \counter_hold_reg[28]_i_1_n_2\,
      CO(0) => \counter_hold_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_hold_reg[28]_i_1_n_4\,
      O(2) => \counter_hold_reg[28]_i_1_n_5\,
      O(1) => \counter_hold_reg[28]_i_1_n_6\,
      O(0) => \counter_hold_reg[28]_i_1_n_7\,
      S(3) => \counter_hold[28]_i_2_n_0\,
      S(2) => \counter_hold[28]_i_3_n_0\,
      S(1) => \counter_hold[28]_i_4_n_0\,
      S(0) => \counter_hold[28]_i_5_n_0\
    );
\counter_hold_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[28]_i_1_n_6\,
      Q => counter_hold_reg(29)
    );
\counter_hold_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[0]_i_1_n_5\,
      Q => counter_hold_reg(2)
    );
\counter_hold_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[28]_i_1_n_5\,
      Q => counter_hold_reg(30)
    );
\counter_hold_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[28]_i_1_n_4\,
      Q => counter_hold_reg(31)
    );
\counter_hold_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[0]_i_1_n_4\,
      Q => counter_hold_reg(3)
    );
\counter_hold_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[4]_i_1_n_7\,
      Q => counter_hold_reg(4)
    );
\counter_hold_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_hold_reg[0]_i_1_n_0\,
      CO(3) => \counter_hold_reg[4]_i_1_n_0\,
      CO(2) => \counter_hold_reg[4]_i_1_n_1\,
      CO(1) => \counter_hold_reg[4]_i_1_n_2\,
      CO(0) => \counter_hold_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_hold_reg[4]_i_1_n_4\,
      O(2) => \counter_hold_reg[4]_i_1_n_5\,
      O(1) => \counter_hold_reg[4]_i_1_n_6\,
      O(0) => \counter_hold_reg[4]_i_1_n_7\,
      S(3) => \counter_hold[4]_i_2_n_0\,
      S(2) => \counter_hold[4]_i_3_n_0\,
      S(1) => \counter_hold[4]_i_4_n_0\,
      S(0) => \counter_hold[4]_i_5_n_0\
    );
\counter_hold_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[4]_i_1_n_6\,
      Q => counter_hold_reg(5)
    );
\counter_hold_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[4]_i_1_n_5\,
      Q => counter_hold_reg(6)
    );
\counter_hold_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[4]_i_1_n_4\,
      Q => counter_hold_reg(7)
    );
\counter_hold_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[8]_i_1_n_7\,
      Q => counter_hold_reg(8)
    );
\counter_hold_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_hold_reg[4]_i_1_n_0\,
      CO(3) => \counter_hold_reg[8]_i_1_n_0\,
      CO(2) => \counter_hold_reg[8]_i_1_n_1\,
      CO(1) => \counter_hold_reg[8]_i_1_n_2\,
      CO(0) => \counter_hold_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_hold_reg[8]_i_1_n_4\,
      O(2) => \counter_hold_reg[8]_i_1_n_5\,
      O(1) => \counter_hold_reg[8]_i_1_n_6\,
      O(0) => \counter_hold_reg[8]_i_1_n_7\,
      S(3) => \counter_hold[8]_i_2_n_0\,
      S(2) => \counter_hold[8]_i_3_n_0\,
      S(1) => \counter_hold[8]_i_4_n_0\,
      S(0) => \counter_hold[8]_i_5_n_0\
    );
\counter_hold_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_hold_reg[8]_i_1_n_6\,
      Q => counter_hold_reg(9)
    );
\counter_wait[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => current_state(2),
      I1 => current_state(1),
      O => \counter_wait[0]_i_2_n_0\
    );
\counter_wait[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(3),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[0]_i_3_n_0\
    );
\counter_wait[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(2),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[0]_i_4_n_0\
    );
\counter_wait[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(1),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[0]_i_5_n_0\
    );
\counter_wait[0]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => counter_wait_reg(0),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[0]_i_6_n_0\
    );
\counter_wait[12]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(15),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[12]_i_2_n_0\
    );
\counter_wait[12]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(14),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[12]_i_3_n_0\
    );
\counter_wait[12]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(13),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[12]_i_4_n_0\
    );
\counter_wait[12]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(12),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[12]_i_5_n_0\
    );
\counter_wait[16]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(19),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[16]_i_2_n_0\
    );
\counter_wait[16]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(18),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[16]_i_3_n_0\
    );
\counter_wait[16]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(17),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[16]_i_4_n_0\
    );
\counter_wait[16]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(16),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[16]_i_5_n_0\
    );
\counter_wait[20]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(23),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[20]_i_2_n_0\
    );
\counter_wait[20]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(22),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[20]_i_3_n_0\
    );
\counter_wait[20]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(21),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[20]_i_4_n_0\
    );
\counter_wait[20]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(20),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[20]_i_5_n_0\
    );
\counter_wait[24]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(27),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[24]_i_2_n_0\
    );
\counter_wait[24]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(26),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[24]_i_3_n_0\
    );
\counter_wait[24]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(25),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[24]_i_4_n_0\
    );
\counter_wait[24]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(24),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[24]_i_5_n_0\
    );
\counter_wait[28]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(31),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[28]_i_2_n_0\
    );
\counter_wait[28]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(30),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[28]_i_3_n_0\
    );
\counter_wait[28]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(29),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[28]_i_4_n_0\
    );
\counter_wait[28]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(28),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[28]_i_5_n_0\
    );
\counter_wait[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(7),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[4]_i_2_n_0\
    );
\counter_wait[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(6),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[4]_i_3_n_0\
    );
\counter_wait[4]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(5),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[4]_i_4_n_0\
    );
\counter_wait[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => current_state(1),
      I1 => current_state(2),
      I2 => counter_wait_reg(4),
      O => \counter_wait[4]_i_5_n_0\
    );
\counter_wait[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(11),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[8]_i_2_n_0\
    );
\counter_wait[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(10),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[8]_i_3_n_0\
    );
\counter_wait[8]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(9),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[8]_i_4_n_0\
    );
\counter_wait[8]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_wait_reg(8),
      I1 => current_state(1),
      I2 => current_state(2),
      O => \counter_wait[8]_i_5_n_0\
    );
\counter_wait_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[0]_i_1_n_7\,
      Q => counter_wait_reg(0)
    );
\counter_wait_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_wait_reg[0]_i_1_n_0\,
      CO(2) => \counter_wait_reg[0]_i_1_n_1\,
      CO(1) => \counter_wait_reg[0]_i_1_n_2\,
      CO(0) => \counter_wait_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \counter_wait[0]_i_2_n_0\,
      O(3) => \counter_wait_reg[0]_i_1_n_4\,
      O(2) => \counter_wait_reg[0]_i_1_n_5\,
      O(1) => \counter_wait_reg[0]_i_1_n_6\,
      O(0) => \counter_wait_reg[0]_i_1_n_7\,
      S(3) => \counter_wait[0]_i_3_n_0\,
      S(2) => \counter_wait[0]_i_4_n_0\,
      S(1) => \counter_wait[0]_i_5_n_0\,
      S(0) => \counter_wait[0]_i_6_n_0\
    );
\counter_wait_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[8]_i_1_n_5\,
      Q => counter_wait_reg(10)
    );
\counter_wait_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[8]_i_1_n_4\,
      Q => counter_wait_reg(11)
    );
\counter_wait_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[12]_i_1_n_7\,
      Q => counter_wait_reg(12)
    );
\counter_wait_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_wait_reg[8]_i_1_n_0\,
      CO(3) => \counter_wait_reg[12]_i_1_n_0\,
      CO(2) => \counter_wait_reg[12]_i_1_n_1\,
      CO(1) => \counter_wait_reg[12]_i_1_n_2\,
      CO(0) => \counter_wait_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_wait_reg[12]_i_1_n_4\,
      O(2) => \counter_wait_reg[12]_i_1_n_5\,
      O(1) => \counter_wait_reg[12]_i_1_n_6\,
      O(0) => \counter_wait_reg[12]_i_1_n_7\,
      S(3) => \counter_wait[12]_i_2_n_0\,
      S(2) => \counter_wait[12]_i_3_n_0\,
      S(1) => \counter_wait[12]_i_4_n_0\,
      S(0) => \counter_wait[12]_i_5_n_0\
    );
\counter_wait_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[12]_i_1_n_6\,
      Q => counter_wait_reg(13)
    );
\counter_wait_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[12]_i_1_n_5\,
      Q => counter_wait_reg(14)
    );
\counter_wait_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[12]_i_1_n_4\,
      Q => counter_wait_reg(15)
    );
\counter_wait_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[16]_i_1_n_7\,
      Q => counter_wait_reg(16)
    );
\counter_wait_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_wait_reg[12]_i_1_n_0\,
      CO(3) => \counter_wait_reg[16]_i_1_n_0\,
      CO(2) => \counter_wait_reg[16]_i_1_n_1\,
      CO(1) => \counter_wait_reg[16]_i_1_n_2\,
      CO(0) => \counter_wait_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_wait_reg[16]_i_1_n_4\,
      O(2) => \counter_wait_reg[16]_i_1_n_5\,
      O(1) => \counter_wait_reg[16]_i_1_n_6\,
      O(0) => \counter_wait_reg[16]_i_1_n_7\,
      S(3) => \counter_wait[16]_i_2_n_0\,
      S(2) => \counter_wait[16]_i_3_n_0\,
      S(1) => \counter_wait[16]_i_4_n_0\,
      S(0) => \counter_wait[16]_i_5_n_0\
    );
\counter_wait_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[16]_i_1_n_6\,
      Q => counter_wait_reg(17)
    );
\counter_wait_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[16]_i_1_n_5\,
      Q => counter_wait_reg(18)
    );
\counter_wait_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[16]_i_1_n_4\,
      Q => counter_wait_reg(19)
    );
\counter_wait_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[0]_i_1_n_6\,
      Q => counter_wait_reg(1)
    );
\counter_wait_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[20]_i_1_n_7\,
      Q => counter_wait_reg(20)
    );
\counter_wait_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_wait_reg[16]_i_1_n_0\,
      CO(3) => \counter_wait_reg[20]_i_1_n_0\,
      CO(2) => \counter_wait_reg[20]_i_1_n_1\,
      CO(1) => \counter_wait_reg[20]_i_1_n_2\,
      CO(0) => \counter_wait_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_wait_reg[20]_i_1_n_4\,
      O(2) => \counter_wait_reg[20]_i_1_n_5\,
      O(1) => \counter_wait_reg[20]_i_1_n_6\,
      O(0) => \counter_wait_reg[20]_i_1_n_7\,
      S(3) => \counter_wait[20]_i_2_n_0\,
      S(2) => \counter_wait[20]_i_3_n_0\,
      S(1) => \counter_wait[20]_i_4_n_0\,
      S(0) => \counter_wait[20]_i_5_n_0\
    );
\counter_wait_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[20]_i_1_n_6\,
      Q => counter_wait_reg(21)
    );
\counter_wait_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[20]_i_1_n_5\,
      Q => counter_wait_reg(22)
    );
\counter_wait_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[20]_i_1_n_4\,
      Q => counter_wait_reg(23)
    );
\counter_wait_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[24]_i_1_n_7\,
      Q => counter_wait_reg(24)
    );
\counter_wait_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_wait_reg[20]_i_1_n_0\,
      CO(3) => \counter_wait_reg[24]_i_1_n_0\,
      CO(2) => \counter_wait_reg[24]_i_1_n_1\,
      CO(1) => \counter_wait_reg[24]_i_1_n_2\,
      CO(0) => \counter_wait_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_wait_reg[24]_i_1_n_4\,
      O(2) => \counter_wait_reg[24]_i_1_n_5\,
      O(1) => \counter_wait_reg[24]_i_1_n_6\,
      O(0) => \counter_wait_reg[24]_i_1_n_7\,
      S(3) => \counter_wait[24]_i_2_n_0\,
      S(2) => \counter_wait[24]_i_3_n_0\,
      S(1) => \counter_wait[24]_i_4_n_0\,
      S(0) => \counter_wait[24]_i_5_n_0\
    );
\counter_wait_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[24]_i_1_n_6\,
      Q => counter_wait_reg(25)
    );
\counter_wait_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[24]_i_1_n_5\,
      Q => counter_wait_reg(26)
    );
\counter_wait_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[24]_i_1_n_4\,
      Q => counter_wait_reg(27)
    );
\counter_wait_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[28]_i_1_n_7\,
      Q => counter_wait_reg(28)
    );
\counter_wait_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_wait_reg[24]_i_1_n_0\,
      CO(3) => \NLW_counter_wait_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \counter_wait_reg[28]_i_1_n_1\,
      CO(1) => \counter_wait_reg[28]_i_1_n_2\,
      CO(0) => \counter_wait_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_wait_reg[28]_i_1_n_4\,
      O(2) => \counter_wait_reg[28]_i_1_n_5\,
      O(1) => \counter_wait_reg[28]_i_1_n_6\,
      O(0) => \counter_wait_reg[28]_i_1_n_7\,
      S(3) => \counter_wait[28]_i_2_n_0\,
      S(2) => \counter_wait[28]_i_3_n_0\,
      S(1) => \counter_wait[28]_i_4_n_0\,
      S(0) => \counter_wait[28]_i_5_n_0\
    );
\counter_wait_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[28]_i_1_n_6\,
      Q => counter_wait_reg(29)
    );
\counter_wait_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[0]_i_1_n_5\,
      Q => counter_wait_reg(2)
    );
\counter_wait_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[28]_i_1_n_5\,
      Q => counter_wait_reg(30)
    );
\counter_wait_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[28]_i_1_n_4\,
      Q => counter_wait_reg(31)
    );
\counter_wait_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[0]_i_1_n_4\,
      Q => counter_wait_reg(3)
    );
\counter_wait_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[4]_i_1_n_7\,
      Q => counter_wait_reg(4)
    );
\counter_wait_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_wait_reg[0]_i_1_n_0\,
      CO(3) => \counter_wait_reg[4]_i_1_n_0\,
      CO(2) => \counter_wait_reg[4]_i_1_n_1\,
      CO(1) => \counter_wait_reg[4]_i_1_n_2\,
      CO(0) => \counter_wait_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_wait_reg[4]_i_1_n_4\,
      O(2) => \counter_wait_reg[4]_i_1_n_5\,
      O(1) => \counter_wait_reg[4]_i_1_n_6\,
      O(0) => \counter_wait_reg[4]_i_1_n_7\,
      S(3) => \counter_wait[4]_i_2_n_0\,
      S(2) => \counter_wait[4]_i_3_n_0\,
      S(1) => \counter_wait[4]_i_4_n_0\,
      S(0) => \counter_wait[4]_i_5_n_0\
    );
\counter_wait_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[4]_i_1_n_6\,
      Q => counter_wait_reg(5)
    );
\counter_wait_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[4]_i_1_n_5\,
      Q => counter_wait_reg(6)
    );
\counter_wait_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[4]_i_1_n_4\,
      Q => counter_wait_reg(7)
    );
\counter_wait_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[8]_i_1_n_7\,
      Q => counter_wait_reg(8)
    );
\counter_wait_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_wait_reg[4]_i_1_n_0\,
      CO(3) => \counter_wait_reg[8]_i_1_n_0\,
      CO(2) => \counter_wait_reg[8]_i_1_n_1\,
      CO(1) => \counter_wait_reg[8]_i_1_n_2\,
      CO(0) => \counter_wait_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_wait_reg[8]_i_1_n_4\,
      O(2) => \counter_wait_reg[8]_i_1_n_5\,
      O(1) => \counter_wait_reg[8]_i_1_n_6\,
      O(0) => \counter_wait_reg[8]_i_1_n_7\,
      S(3) => \counter_wait[8]_i_2_n_0\,
      S(2) => \counter_wait[8]_i_3_n_0\,
      S(1) => \counter_wait[8]_i_4_n_0\,
      S(0) => \counter_wait[8]_i_5_n_0\
    );
\counter_wait_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \counter_wait_reg[8]_i_1_n_6\,
      Q => counter_wait_reg(9)
    );
\current_state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EC23EFEF"
    )
        port map (
      I0 => mem_state(0),
      I1 => current_state(2),
      I2 => current_state(1),
      I3 => current_state(0),
      I4 => EQ_vol_up,
      O => next_state(0)
    );
\current_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF000000C8"
    )
        port map (
      I0 => EQ_vol_down,
      I1 => current_state(0),
      I2 => EQ_vol_up,
      I3 => current_state(2),
      I4 => current_state(1),
      I5 => \current_state[1]_i_2_n_0\,
      O => next_state(1)
    );
\current_state[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA22FA00"
    )
        port map (
      I0 => \current_state[2]_i_2_n_0\,
      I1 => \mem_state[2]_i_8_n_0\,
      I2 => mem_state(1),
      I3 => current_state(1),
      I4 => current_state(2),
      O => \current_state[1]_i_2_n_0\
    );
\current_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0C0CAE00"
    )
        port map (
      I0 => mem_state(2),
      I1 => \current_state[2]_i_2_n_0\,
      I2 => \mem_state[2]_i_4_n_0\,
      I3 => current_state(1),
      I4 => current_state(2),
      O => next_state(2)
    );
\current_state[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBA000A0"
    )
        port map (
      I0 => current_state(2),
      I1 => current_state(1),
      I2 => EQ_vol_up,
      I3 => current_state(0),
      I4 => EQ_vol_down,
      O => \current_state[2]_i_2_n_0\
    );
\current_state_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => next_state(0),
      Q => current_state(0)
    );
\current_state_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => next_state(1),
      Q => current_state(1)
    );
\current_state_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => next_state(2),
      Q => current_state(2)
    );
\mem_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7577337745440044"
    )
        port map (
      I0 => \mem_state[0]_i_2_n_0\,
      I1 => \mem_state[2]_i_2_n_0\,
      I2 => \mem_state[2]_i_3_n_0\,
      I3 => current_state(2),
      I4 => \mem_state[2]_i_4_n_0\,
      I5 => mem_state(0),
      O => \mem_state[0]_i_1_n_0\
    );
\mem_state[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5D"
    )
        port map (
      I0 => current_state(0),
      I1 => EQ_vol_up,
      I2 => current_state(2),
      O => \mem_state[0]_i_2_n_0\
    );
\mem_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF337733CF004400"
    )
        port map (
      I0 => current_state(0),
      I1 => \mem_state[2]_i_2_n_0\,
      I2 => \mem_state[2]_i_3_n_0\,
      I3 => current_state(2),
      I4 => \mem_state[2]_i_4_n_0\,
      I5 => mem_state(1),
      O => \mem_state[1]_i_1_n_0\
    );
\mem_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF77FFCFCC44CC"
    )
        port map (
      I0 => current_state(0),
      I1 => \mem_state[2]_i_2_n_0\,
      I2 => \mem_state[2]_i_3_n_0\,
      I3 => current_state(2),
      I4 => \mem_state[2]_i_4_n_0\,
      I5 => mem_state(2),
      O => \mem_state[2]_i_1_n_0\
    );
\mem_state[2]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFEFF"
    )
        port map (
      I0 => counter_wait_reg(17),
      I1 => counter_wait_reg(26),
      I2 => counter_wait_reg(30),
      I3 => counter_wait_reg(8),
      I4 => \mem_state[2]_i_17_n_0\,
      O => \mem_state[2]_i_10_n_0\
    );
\mem_state[2]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => counter_wait_reg(29),
      I1 => counter_wait_reg(22),
      I2 => counter_wait_reg(24),
      I3 => counter_wait_reg(16),
      O => \mem_state[2]_i_11_n_0\
    );
\mem_state[2]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => counter_wait_reg(31),
      I1 => counter_wait_reg(20),
      I2 => counter_wait_reg(27),
      I3 => counter_wait_reg(10),
      O => \mem_state[2]_i_12_n_0\
    );
\mem_state[2]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFBFF"
    )
        port map (
      I0 => counter_hold_reg(7),
      I1 => counter_hold_reg(22),
      I2 => counter_hold_reg(10),
      I3 => counter_hold_reg(12),
      I4 => \mem_state[2]_i_18_n_0\,
      O => \mem_state[2]_i_13_n_0\
    );
\mem_state[2]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
        port map (
      I0 => counter_hold_reg(11),
      I1 => counter_hold_reg(16),
      I2 => counter_hold_reg(0),
      I3 => counter_hold_reg(28),
      I4 => \mem_state[2]_i_19_n_0\,
      O => \mem_state[2]_i_14_n_0\
    );
\mem_state[2]_i_15\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFBFF"
    )
        port map (
      I0 => counter_hold_reg(5),
      I1 => counter_hold_reg(13),
      I2 => counter_hold_reg(4),
      I3 => counter_hold_reg(17),
      I4 => \mem_state[2]_i_20_n_0\,
      O => \mem_state[2]_i_15_n_0\
    );
\mem_state[2]_i_16\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => counter_hold_reg(2),
      I1 => counter_hold_reg(1),
      I2 => counter_hold_reg(29),
      I3 => counter_hold_reg(31),
      I4 => \mem_state[2]_i_21_n_0\,
      O => \mem_state[2]_i_16_n_0\
    );
\mem_state[2]_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => counter_wait_reg(9),
      I1 => counter_wait_reg(11),
      I2 => counter_wait_reg(5),
      I3 => counter_wait_reg(6),
      O => \mem_state[2]_i_17_n_0\
    );
\mem_state[2]_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => counter_hold_reg(18),
      I1 => counter_hold_reg(19),
      I2 => counter_hold_reg(26),
      I3 => counter_hold_reg(25),
      O => \mem_state[2]_i_18_n_0\
    );
\mem_state[2]_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => counter_hold_reg(14),
      I1 => counter_hold_reg(27),
      I2 => counter_hold_reg(30),
      I3 => counter_hold_reg(3),
      O => \mem_state[2]_i_19_n_0\
    );
\mem_state[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11001000"
    )
        port map (
      I0 => current_state(1),
      I1 => current_state(2),
      I2 => EQ_vol_up,
      I3 => current_state(0),
      I4 => EQ_vol_down,
      O => \mem_state[2]_i_2_n_0\
    );
\mem_state[2]_i_20\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => counter_hold_reg(8),
      I1 => counter_hold_reg(23),
      I2 => counter_hold_reg(15),
      I3 => counter_hold_reg(24),
      O => \mem_state[2]_i_20_n_0\
    );
\mem_state[2]_i_21\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => counter_hold_reg(6),
      I1 => counter_hold_reg(20),
      I2 => counter_hold_reg(9),
      I3 => counter_hold_reg(21),
      O => \mem_state[2]_i_21_n_0\
    );
\mem_state[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"47"
    )
        port map (
      I0 => EQ_vol_down,
      I1 => current_state(0),
      I2 => EQ_vol_up,
      O => \mem_state[2]_i_3_n_0\
    );
\mem_state[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"101010FF"
    )
        port map (
      I0 => \mem_state[2]_i_5_n_0\,
      I1 => \mem_state[2]_i_6_n_0\,
      I2 => \mem_state[2]_i_7_n_0\,
      I3 => \mem_state[2]_i_8_n_0\,
      I4 => current_state(1),
      O => \mem_state[2]_i_4_n_0\
    );
\mem_state[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFDFF"
    )
        port map (
      I0 => counter_wait_reg(14),
      I1 => counter_wait_reg(25),
      I2 => counter_wait_reg(1),
      I3 => counter_wait_reg(15),
      I4 => counter_wait_reg(3),
      I5 => counter_wait_reg(0),
      O => \mem_state[2]_i_5_n_0\
    );
\mem_state[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFBF"
    )
        port map (
      I0 => \mem_state[2]_i_9_n_0\,
      I1 => counter_wait_reg(23),
      I2 => counter_wait_reg(7),
      I3 => counter_wait_reg(28),
      I4 => counter_wait_reg(19),
      I5 => \mem_state[2]_i_10_n_0\,
      O => \mem_state[2]_i_6_n_0\
    );
\mem_state[2]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => counter_wait_reg(12),
      I1 => counter_wait_reg(2),
      I2 => counter_wait_reg(4),
      I3 => \mem_state[2]_i_11_n_0\,
      I4 => \mem_state[2]_i_12_n_0\,
      O => \mem_state[2]_i_7_n_0\
    );
\mem_state[2]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \mem_state[2]_i_13_n_0\,
      I1 => \mem_state[2]_i_14_n_0\,
      I2 => \mem_state[2]_i_15_n_0\,
      I3 => \mem_state[2]_i_16_n_0\,
      O => \mem_state[2]_i_8_n_0\
    );
\mem_state[2]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => counter_wait_reg(18),
      I1 => current_state(1),
      I2 => counter_wait_reg(21),
      I3 => counter_wait_reg(13),
      O => \mem_state[2]_i_9_n_0\
    );
\mem_state_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \mem_state[0]_i_1_n_0\,
      Q => mem_state(0)
    );
\mem_state_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \mem_state[1]_i_1_n_0\,
      Q => mem_state(1)
    );
\mem_state_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \mem_state[2]_i_1_n_0\,
      Q => mem_state(2)
    );
\vol_data[0][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => EQ_select(2),
      I1 => EQ_select(0),
      I2 => EQ_select(1),
      I3 => \vol_data[7][4]_i_4_n_0\,
      O => \vol_data[0][4]_i_1_n_0\
    );
\vol_data[1][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => EQ_select(2),
      I1 => \vol_data[7][4]_i_4_n_0\,
      I2 => EQ_select(1),
      I3 => EQ_select(0),
      O => \vol_data[1][4]_i_1_n_0\
    );
\vol_data[2][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => EQ_select(2),
      I1 => EQ_select(0),
      I2 => EQ_select(1),
      I3 => \vol_data[7][4]_i_4_n_0\,
      O => \vol_data[2][4]_i_1_n_0\
    );
\vol_data[3][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => EQ_select(2),
      I1 => \vol_data[7][4]_i_4_n_0\,
      I2 => EQ_select(1),
      I3 => EQ_select(0),
      O => \vol_data[3][4]_i_1_n_0\
    );
\vol_data[4][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => EQ_select(0),
      I1 => EQ_select(1),
      I2 => EQ_select(2),
      I3 => \vol_data[7][4]_i_4_n_0\,
      O => \vol_data[4][4]_i_1_n_0\
    );
\vol_data[5][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => EQ_select(2),
      I1 => \vol_data[7][4]_i_4_n_0\,
      I2 => EQ_select(1),
      I3 => EQ_select(0),
      O => \vol_data[5][4]_i_1_n_0\
    );
\vol_data[6][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => EQ_select(0),
      I1 => EQ_select(1),
      I2 => EQ_select(2),
      I3 => \vol_data[7][4]_i_4_n_0\,
      O => \vol_data[6][4]_i_1_n_0\
    );
\vol_data[7][0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \vol_data[7][4]_i_6_n_0\,
      O => \vol_data[7][0]_i_1_n_0\
    );
\vol_data[7][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \vol_data[7][4]_i_6_n_0\,
      I1 => \vol_data[7][4]_i_7_n_0\,
      I2 => \vol_data[7][4]_i_8_n_0\,
      O => \vol_data[7][1]_i_1_n_0\
    );
\vol_data[7][2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DB24"
    )
        port map (
      I0 => \vol_data[7][4]_i_8_n_0\,
      I1 => \vol_data[7][4]_i_7_n_0\,
      I2 => \vol_data[7][4]_i_6_n_0\,
      I3 => \vol_data[7][4]_i_9_n_0\,
      O => \vol_data[7][2]_i_1_n_0\
    );
\vol_data[7][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFB2004"
    )
        port map (
      I0 => \vol_data[7][4]_i_6_n_0\,
      I1 => \vol_data[7][4]_i_7_n_0\,
      I2 => \vol_data[7][4]_i_8_n_0\,
      I3 => \vol_data[7][4]_i_9_n_0\,
      I4 => \vol_data_reg[7][4]_i_10_n_0\,
      O => \vol_data[7][3]_i_1_n_0\
    );
\vol_data[7][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => EQ_select(2),
      I1 => \vol_data[7][4]_i_4_n_0\,
      I2 => EQ_select(1),
      I3 => EQ_select(0),
      O => \vol_data[7][4]_i_1_n_0\
    );
\vol_data[7][4]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \vol_data[7][4]_i_8_n_0\,
      I1 => \vol_data_reg[7][4]_i_10_n_0\,
      I2 => \vol_data[7][4]_i_9_n_0\,
      I3 => \vol_data_reg[7][4]_i_5_n_0\,
      I4 => \vol_data[7][4]_i_6_n_0\,
      O => \vol_data[7][4]_i_11_n_0\
    );
\vol_data[7][4]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[3][4]_0\(4),
      I1 => \^vol_data_reg[2][4]_0\(4),
      I2 => EQ_select(1),
      I3 => \^vol_data_reg[1][4]_0\(4),
      I4 => EQ_select(0),
      I5 => \^q\(4),
      O => \vol_data[7][4]_i_12_n_0\
    );
\vol_data[7][4]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[7][4]_0\(4),
      I1 => \^vol_data_reg[6][4]_0\(4),
      I2 => EQ_select(1),
      I3 => \^vol_data_reg[5][4]_0\(4),
      I4 => EQ_select(0),
      I5 => \^vol_data_reg[4][4]_0\(4),
      O => \vol_data[7][4]_i_13_n_0\
    );
\vol_data[7][4]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[3][4]_0\(0),
      I1 => \^vol_data_reg[2][4]_0\(0),
      I2 => EQ_select(1),
      I3 => \^vol_data_reg[1][4]_0\(0),
      I4 => EQ_select(0),
      I5 => \^q\(0),
      O => \vol_data[7][4]_i_14_n_0\
    );
\vol_data[7][4]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[7][4]_0\(0),
      I1 => \^vol_data_reg[6][4]_0\(0),
      I2 => EQ_select(1),
      I3 => \^vol_data_reg[5][4]_0\(0),
      I4 => EQ_select(0),
      I5 => \^vol_data_reg[4][4]_0\(0),
      O => \vol_data[7][4]_i_15_n_0\
    );
\vol_data[7][4]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[3][4]_0\(1),
      I1 => \^vol_data_reg[2][4]_0\(1),
      I2 => EQ_select(1),
      I3 => \^vol_data_reg[1][4]_0\(1),
      I4 => EQ_select(0),
      I5 => \^q\(1),
      O => \vol_data[7][4]_i_16_n_0\
    );
\vol_data[7][4]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[7][4]_0\(1),
      I1 => \^vol_data_reg[6][4]_0\(1),
      I2 => EQ_select(1),
      I3 => \^vol_data_reg[5][4]_0\(1),
      I4 => EQ_select(0),
      I5 => \^vol_data_reg[4][4]_0\(1),
      O => \vol_data[7][4]_i_17_n_0\
    );
\vol_data[7][4]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[3][4]_0\(2),
      I1 => \^vol_data_reg[2][4]_0\(2),
      I2 => EQ_select(1),
      I3 => \^vol_data_reg[1][4]_0\(2),
      I4 => EQ_select(0),
      I5 => \^q\(2),
      O => \vol_data[7][4]_i_18_n_0\
    );
\vol_data[7][4]_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[7][4]_0\(2),
      I1 => \^vol_data_reg[6][4]_0\(2),
      I2 => EQ_select(1),
      I3 => \^vol_data_reg[5][4]_0\(2),
      I4 => EQ_select(0),
      I5 => \^vol_data_reg[4][4]_0\(2),
      O => \vol_data[7][4]_i_19_n_0\
    );
\vol_data[7][4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6AAAAAAAAAAAA9A"
    )
        port map (
      I0 => \vol_data_reg[7][4]_i_5_n_0\,
      I1 => \vol_data[7][4]_i_6_n_0\,
      I2 => \vol_data[7][4]_i_7_n_0\,
      I3 => \vol_data[7][4]_i_8_n_0\,
      I4 => \vol_data[7][4]_i_9_n_0\,
      I5 => \vol_data_reg[7][4]_i_10_n_0\,
      O => \vol_data[7][4]_i_2_n_0\
    );
\vol_data[7][4]_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[3][4]_0\(3),
      I1 => \^vol_data_reg[2][4]_0\(3),
      I2 => EQ_select(1),
      I3 => \^vol_data_reg[1][4]_0\(3),
      I4 => EQ_select(0),
      I5 => \^q\(3),
      O => \vol_data[7][4]_i_20_n_0\
    );
\vol_data[7][4]_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^vol_data_reg[7][4]_0\(3),
      I1 => \^vol_data_reg[6][4]_0\(3),
      I2 => EQ_select(1),
      I3 => \^vol_data_reg[5][4]_0\(3),
      I4 => EQ_select(0),
      I5 => \^vol_data_reg[4][4]_0\(3),
      O => \vol_data[7][4]_i_21_n_0\
    );
\vol_data[7][4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reset_n,
      O => \vol_data[7][4]_i_3_n_0\
    );
\vol_data[7][4]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7FF0000"
    )
        port map (
      I0 => \vol_data[7][4]_i_11_n_0\,
      I1 => current_state(0),
      I2 => current_state(2),
      I3 => current_state(1),
      I4 => \vol_data[7][4]_i_7_n_0\,
      O => \vol_data[7][4]_i_4_n_0\
    );
\vol_data[7][4]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \vol_data[7][4]_i_14_n_0\,
      I1 => \vol_data[7][4]_i_15_n_0\,
      I2 => EQ_select(2),
      O => \vol_data[7][4]_i_6_n_0\
    );
\vol_data[7][4]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFDFD"
    )
        port map (
      I0 => current_state(1),
      I1 => current_state(2),
      I2 => current_state(0),
      I3 => \vol_data_reg[7][4]_i_5_n_0\,
      I4 => \vol_data_reg[7][4]_i_10_n_0\,
      O => \vol_data[7][4]_i_7_n_0\
    );
\vol_data[7][4]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \vol_data[7][4]_i_16_n_0\,
      I1 => \vol_data[7][4]_i_17_n_0\,
      I2 => EQ_select(2),
      O => \vol_data[7][4]_i_8_n_0\
    );
\vol_data[7][4]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \vol_data[7][4]_i_18_n_0\,
      I1 => \vol_data[7][4]_i_19_n_0\,
      I2 => EQ_select(2),
      O => \vol_data[7][4]_i_9_n_0\
    );
\vol_data_reg[0][0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[0][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][0]_i_1_n_0\,
      Q => \^q\(0)
    );
\vol_data_reg[0][1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[0][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][1]_i_1_n_0\,
      Q => \^q\(1)
    );
\vol_data_reg[0][2]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \vol_data[0][4]_i_1_n_0\,
      D => \vol_data[7][2]_i_1_n_0\,
      PRE => \vol_data[7][4]_i_3_n_0\,
      Q => \^q\(2)
    );
\vol_data_reg[0][3]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \vol_data[0][4]_i_1_n_0\,
      D => \vol_data[7][3]_i_1_n_0\,
      PRE => \vol_data[7][4]_i_3_n_0\,
      Q => \^q\(3)
    );
\vol_data_reg[0][4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[0][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][4]_i_2_n_0\,
      Q => \^q\(4)
    );
\vol_data_reg[1][0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[1][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][0]_i_1_n_0\,
      Q => \^vol_data_reg[1][4]_0\(0)
    );
\vol_data_reg[1][1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[1][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][1]_i_1_n_0\,
      Q => \^vol_data_reg[1][4]_0\(1)
    );
\vol_data_reg[1][2]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \vol_data[1][4]_i_1_n_0\,
      D => \vol_data[7][2]_i_1_n_0\,
      PRE => \vol_data[7][4]_i_3_n_0\,
      Q => \^vol_data_reg[1][4]_0\(2)
    );
\vol_data_reg[1][3]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \vol_data[1][4]_i_1_n_0\,
      D => \vol_data[7][3]_i_1_n_0\,
      PRE => \vol_data[7][4]_i_3_n_0\,
      Q => \^vol_data_reg[1][4]_0\(3)
    );
\vol_data_reg[1][4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[1][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][4]_i_2_n_0\,
      Q => \^vol_data_reg[1][4]_0\(4)
    );
\vol_data_reg[2][0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[2][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][0]_i_1_n_0\,
      Q => \^vol_data_reg[2][4]_0\(0)
    );
\vol_data_reg[2][1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[2][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][1]_i_1_n_0\,
      Q => \^vol_data_reg[2][4]_0\(1)
    );
\vol_data_reg[2][2]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \vol_data[2][4]_i_1_n_0\,
      D => \vol_data[7][2]_i_1_n_0\,
      PRE => \vol_data[7][4]_i_3_n_0\,
      Q => \^vol_data_reg[2][4]_0\(2)
    );
\vol_data_reg[2][3]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \vol_data[2][4]_i_1_n_0\,
      D => \vol_data[7][3]_i_1_n_0\,
      PRE => \vol_data[7][4]_i_3_n_0\,
      Q => \^vol_data_reg[2][4]_0\(3)
    );
\vol_data_reg[2][4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[2][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][4]_i_2_n_0\,
      Q => \^vol_data_reg[2][4]_0\(4)
    );
\vol_data_reg[3][0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[3][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][0]_i_1_n_0\,
      Q => \^vol_data_reg[3][4]_0\(0)
    );
\vol_data_reg[3][1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[3][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][1]_i_1_n_0\,
      Q => \^vol_data_reg[3][4]_0\(1)
    );
\vol_data_reg[3][2]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \vol_data[3][4]_i_1_n_0\,
      D => \vol_data[7][2]_i_1_n_0\,
      PRE => \vol_data[7][4]_i_3_n_0\,
      Q => \^vol_data_reg[3][4]_0\(2)
    );
\vol_data_reg[3][3]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \vol_data[3][4]_i_1_n_0\,
      D => \vol_data[7][3]_i_1_n_0\,
      PRE => \vol_data[7][4]_i_3_n_0\,
      Q => \^vol_data_reg[3][4]_0\(3)
    );
\vol_data_reg[3][4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[3][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][4]_i_2_n_0\,
      Q => \^vol_data_reg[3][4]_0\(4)
    );
\vol_data_reg[4][0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[4][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][0]_i_1_n_0\,
      Q => \^vol_data_reg[4][4]_0\(0)
    );
\vol_data_reg[4][1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[4][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][1]_i_1_n_0\,
      Q => \^vol_data_reg[4][4]_0\(1)
    );
\vol_data_reg[4][2]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \vol_data[4][4]_i_1_n_0\,
      D => \vol_data[7][2]_i_1_n_0\,
      PRE => \vol_data[7][4]_i_3_n_0\,
      Q => \^vol_data_reg[4][4]_0\(2)
    );
\vol_data_reg[4][3]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \vol_data[4][4]_i_1_n_0\,
      D => \vol_data[7][3]_i_1_n_0\,
      PRE => \vol_data[7][4]_i_3_n_0\,
      Q => \^vol_data_reg[4][4]_0\(3)
    );
\vol_data_reg[4][4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[4][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][4]_i_2_n_0\,
      Q => \^vol_data_reg[4][4]_0\(4)
    );
\vol_data_reg[5][0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[5][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][0]_i_1_n_0\,
      Q => \^vol_data_reg[5][4]_0\(0)
    );
\vol_data_reg[5][1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[5][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][1]_i_1_n_0\,
      Q => \^vol_data_reg[5][4]_0\(1)
    );
\vol_data_reg[5][2]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \vol_data[5][4]_i_1_n_0\,
      D => \vol_data[7][2]_i_1_n_0\,
      PRE => \vol_data[7][4]_i_3_n_0\,
      Q => \^vol_data_reg[5][4]_0\(2)
    );
\vol_data_reg[5][3]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \vol_data[5][4]_i_1_n_0\,
      D => \vol_data[7][3]_i_1_n_0\,
      PRE => \vol_data[7][4]_i_3_n_0\,
      Q => \^vol_data_reg[5][4]_0\(3)
    );
\vol_data_reg[5][4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[5][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][4]_i_2_n_0\,
      Q => \^vol_data_reg[5][4]_0\(4)
    );
\vol_data_reg[6][0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[6][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][0]_i_1_n_0\,
      Q => \^vol_data_reg[6][4]_0\(0)
    );
\vol_data_reg[6][1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[6][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][1]_i_1_n_0\,
      Q => \^vol_data_reg[6][4]_0\(1)
    );
\vol_data_reg[6][2]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \vol_data[6][4]_i_1_n_0\,
      D => \vol_data[7][2]_i_1_n_0\,
      PRE => \vol_data[7][4]_i_3_n_0\,
      Q => \^vol_data_reg[6][4]_0\(2)
    );
\vol_data_reg[6][3]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \vol_data[6][4]_i_1_n_0\,
      D => \vol_data[7][3]_i_1_n_0\,
      PRE => \vol_data[7][4]_i_3_n_0\,
      Q => \^vol_data_reg[6][4]_0\(3)
    );
\vol_data_reg[6][4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[6][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][4]_i_2_n_0\,
      Q => \^vol_data_reg[6][4]_0\(4)
    );
\vol_data_reg[7][0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[7][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][0]_i_1_n_0\,
      Q => \^vol_data_reg[7][4]_0\(0)
    );
\vol_data_reg[7][1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[7][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][1]_i_1_n_0\,
      Q => \^vol_data_reg[7][4]_0\(1)
    );
\vol_data_reg[7][2]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \vol_data[7][4]_i_1_n_0\,
      D => \vol_data[7][2]_i_1_n_0\,
      PRE => \vol_data[7][4]_i_3_n_0\,
      Q => \^vol_data_reg[7][4]_0\(2)
    );
\vol_data_reg[7][3]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \vol_data[7][4]_i_1_n_0\,
      D => \vol_data[7][3]_i_1_n_0\,
      PRE => \vol_data[7][4]_i_3_n_0\,
      Q => \^vol_data_reg[7][4]_0\(3)
    );
\vol_data_reg[7][4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \vol_data[7][4]_i_1_n_0\,
      CLR => \vol_data[7][4]_i_3_n_0\,
      D => \vol_data[7][4]_i_2_n_0\,
      Q => \^vol_data_reg[7][4]_0\(4)
    );
\vol_data_reg[7][4]_i_10\: unisim.vcomponents.MUXF7
     port map (
      I0 => \vol_data[7][4]_i_20_n_0\,
      I1 => \vol_data[7][4]_i_21_n_0\,
      O => \vol_data_reg[7][4]_i_10_n_0\,
      S => EQ_select(2)
    );
\vol_data_reg[7][4]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \vol_data[7][4]_i_12_n_0\,
      I1 => \vol_data[7][4]_i_13_n_0\,
      O => \vol_data_reg[7][4]_i_5_n_0\,
      S => EQ_select(2)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity EQ_Multiplier is
  port (
    D : out STD_LOGIC_VECTOR ( 55 downto 0 );
    Volume_data1 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \counter_channel_reg[3]\ : out STD_LOGIC;
    \counter_channel_reg[7]\ : out STD_LOGIC;
    \counter_channel_reg[2]\ : out STD_LOGIC;
    O : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \EQ_dout_reg[63]_i_5\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \EQ_dout_reg[63]_i_5_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \EQ_dout_reg[63]_i_5_1\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \EQ_dout_reg[63]_i_5_2\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \EQ_dout_reg[63]_i_5_3\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \EQ_dout_reg[63]_i_5_4\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    reset_n : in STD_LOGIC;
    clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \EQ_dout_reg[23]\ : in STD_LOGIC;
    \EQ_dout_reg[0]\ : in STD_LOGIC;
    \EQ_dout_reg[56]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \EQ_dout_reg[16]\ : in STD_LOGIC;
    accu_reg : in STD_LOGIC_VECTOR ( 15 downto 0 );
    mult_out_0 : in STD_LOGIC_VECTOR ( 55 downto 0 );
    \accu_reg[3]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \accu_reg[3]_0\ : in STD_LOGIC;
    \accu_reg[3]_1\ : in STD_LOGIC;
    \accu_reg[3]_2\ : in STD_LOGIC;
    \accu_reg[3]_3\ : in STD_LOGIC;
    accu_reg_7_sp_1 : in STD_LOGIC;
    \accu_reg[7]_0\ : in STD_LOGIC;
    \accu_reg[7]_1\ : in STD_LOGIC;
    \accu_reg[7]_2\ : in STD_LOGIC;
    accu_reg_11_sp_1 : in STD_LOGIC;
    \accu_reg[11]_0\ : in STD_LOGIC;
    \accu_reg[11]_1\ : in STD_LOGIC;
    \accu_reg[11]_2\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of EQ_Multiplier : entity is "Multiplier";
end EQ_Multiplier;

architecture STRUCTURE of EQ_Multiplier is
  signal \EQ_dout[56]_i_2_n_0\ : STD_LOGIC;
  signal \EQ_dout[57]_i_2_n_0\ : STD_LOGIC;
  signal \EQ_dout[58]_i_2_n_0\ : STD_LOGIC;
  signal \EQ_dout[59]_i_2_n_0\ : STD_LOGIC;
  signal \EQ_dout[60]_i_2_n_0\ : STD_LOGIC;
  signal \EQ_dout[61]_i_2_n_0\ : STD_LOGIC;
  signal \EQ_dout[62]_i_5_n_0\ : STD_LOGIC;
  signal \EQ_dout[62]_i_6_n_0\ : STD_LOGIC;
  signal Volume_data : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \^volume_data1\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \accu[0]_i_10_n_0\ : STD_LOGIC;
  signal \accu[0]_i_3_n_0\ : STD_LOGIC;
  signal \accu[0]_i_4_n_0\ : STD_LOGIC;
  signal \accu[0]_i_5_n_0\ : STD_LOGIC;
  signal \accu[0]_i_6_n_0\ : STD_LOGIC;
  signal \accu[0]_i_7_n_0\ : STD_LOGIC;
  signal \accu[0]_i_8_n_0\ : STD_LOGIC;
  signal \accu[0]_i_9_n_0\ : STD_LOGIC;
  signal \accu[12]_i_2_n_0\ : STD_LOGIC;
  signal \accu[12]_i_3_n_0\ : STD_LOGIC;
  signal \accu[12]_i_4_n_0\ : STD_LOGIC;
  signal \accu[12]_i_5_n_0\ : STD_LOGIC;
  signal \accu[12]_i_6_n_0\ : STD_LOGIC;
  signal \accu[12]_i_7_n_0\ : STD_LOGIC;
  signal \accu[12]_i_8_n_0\ : STD_LOGIC;
  signal \accu[12]_i_9_n_0\ : STD_LOGIC;
  signal \accu[16]_i_2_n_0\ : STD_LOGIC;
  signal \accu[16]_i_3_n_0\ : STD_LOGIC;
  signal \accu[16]_i_4_n_0\ : STD_LOGIC;
  signal \accu[16]_i_5_n_0\ : STD_LOGIC;
  signal \accu[16]_i_6_n_0\ : STD_LOGIC;
  signal \accu[16]_i_7_n_0\ : STD_LOGIC;
  signal \accu[16]_i_8_n_0\ : STD_LOGIC;
  signal \accu[16]_i_9_n_0\ : STD_LOGIC;
  signal \accu[20]_i_2_n_0\ : STD_LOGIC;
  signal \accu[20]_i_3_n_0\ : STD_LOGIC;
  signal \accu[20]_i_4_n_0\ : STD_LOGIC;
  signal \accu[20]_i_5_n_0\ : STD_LOGIC;
  signal \accu[20]_i_6_n_0\ : STD_LOGIC;
  signal \accu[20]_i_7_n_0\ : STD_LOGIC;
  signal \accu[20]_i_8_n_0\ : STD_LOGIC;
  signal \accu[20]_i_9_n_0\ : STD_LOGIC;
  signal \accu[24]_i_2_n_0\ : STD_LOGIC;
  signal \accu[24]_i_3_n_0\ : STD_LOGIC;
  signal \accu[24]_i_4_n_0\ : STD_LOGIC;
  signal \accu[24]_i_5_n_0\ : STD_LOGIC;
  signal \accu[24]_i_6_n_0\ : STD_LOGIC;
  signal \accu[24]_i_7_n_0\ : STD_LOGIC;
  signal \accu[24]_i_8_n_0\ : STD_LOGIC;
  signal \accu[4]_i_2_n_0\ : STD_LOGIC;
  signal \accu[4]_i_3_n_0\ : STD_LOGIC;
  signal \accu[4]_i_4_n_0\ : STD_LOGIC;
  signal \accu[4]_i_5_n_0\ : STD_LOGIC;
  signal \accu[4]_i_6_n_0\ : STD_LOGIC;
  signal \accu[4]_i_7_n_0\ : STD_LOGIC;
  signal \accu[4]_i_8_n_0\ : STD_LOGIC;
  signal \accu[4]_i_9_n_0\ : STD_LOGIC;
  signal \accu[8]_i_2_n_0\ : STD_LOGIC;
  signal \accu[8]_i_3_n_0\ : STD_LOGIC;
  signal \accu[8]_i_4_n_0\ : STD_LOGIC;
  signal \accu[8]_i_5_n_0\ : STD_LOGIC;
  signal \accu[8]_i_6_n_0\ : STD_LOGIC;
  signal \accu[8]_i_7_n_0\ : STD_LOGIC;
  signal \accu[8]_i_8_n_0\ : STD_LOGIC;
  signal \accu[8]_i_9_n_0\ : STD_LOGIC;
  signal \accu_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \accu_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \accu_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \accu_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \accu_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \accu_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \accu_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \accu_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \accu_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \accu_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \accu_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \accu_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \accu_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \accu_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \accu_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \accu_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \accu_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \accu_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \accu_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \accu_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \accu_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \accu_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \accu_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \accu_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \accu_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \accu_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \accu_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal accu_reg_11_sn_1 : STD_LOGIC;
  signal accu_reg_7_sn_1 : STD_LOGIC;
  signal \^counter_channel_reg[2]\ : STD_LOGIC;
  signal \^counter_channel_reg[3]\ : STD_LOGIC;
  signal \^counter_channel_reg[7]\ : STD_LOGIC;
  signal mult_opA : STD_LOGIC_VECTOR ( 7 to 7 );
  signal mult_out_i_10_n_0 : STD_LOGIC;
  signal mult_out_i_11_n_0 : STD_LOGIC;
  signal mult_out_i_12_n_0 : STD_LOGIC;
  signal mult_out_i_13_n_0 : STD_LOGIC;
  signal mult_out_i_14_n_0 : STD_LOGIC;
  signal mult_out_i_15_n_0 : STD_LOGIC;
  signal mult_out_i_16_n_0 : STD_LOGIC;
  signal mult_out_i_17_n_0 : STD_LOGIC;
  signal mult_out_i_18_n_0 : STD_LOGIC;
  signal mult_out_i_19_n_0 : STD_LOGIC;
  signal mult_out_i_20_n_0 : STD_LOGIC;
  signal mult_out_i_21_n_0 : STD_LOGIC;
  signal mult_out_i_22_n_0 : STD_LOGIC;
  signal mult_out_i_23_n_0 : STD_LOGIC;
  signal mult_out_i_24_n_0 : STD_LOGIC;
  signal mult_out_i_25_n_0 : STD_LOGIC;
  signal mult_out_i_26_n_0 : STD_LOGIC;
  signal mult_out_i_27_n_0 : STD_LOGIC;
  signal mult_out_i_28_n_0 : STD_LOGIC;
  signal mult_out_i_29_n_0 : STD_LOGIC;
  signal mult_out_i_30_n_0 : STD_LOGIC;
  signal mult_out_i_31_n_0 : STD_LOGIC;
  signal mult_out_i_32_n_0 : STD_LOGIC;
  signal mult_out_i_33_n_0 : STD_LOGIC;
  signal mult_out_i_34_n_0 : STD_LOGIC;
  signal mult_out_i_35_n_0 : STD_LOGIC;
  signal mult_out_i_36_n_0 : STD_LOGIC;
  signal mult_out_i_9_n_0 : STD_LOGIC;
  signal mult_out_n_100 : STD_LOGIC;
  signal mult_out_n_101 : STD_LOGIC;
  signal mult_out_n_102 : STD_LOGIC;
  signal mult_out_n_103 : STD_LOGIC;
  signal mult_out_n_104 : STD_LOGIC;
  signal mult_out_n_105 : STD_LOGIC;
  signal mult_out_n_81 : STD_LOGIC;
  signal mult_out_n_82 : STD_LOGIC;
  signal mult_out_n_83 : STD_LOGIC;
  signal mult_out_n_84 : STD_LOGIC;
  signal mult_out_n_85 : STD_LOGIC;
  signal mult_out_n_86 : STD_LOGIC;
  signal mult_out_n_87 : STD_LOGIC;
  signal mult_out_n_88 : STD_LOGIC;
  signal mult_out_n_89 : STD_LOGIC;
  signal mult_out_n_90 : STD_LOGIC;
  signal mult_out_n_91 : STD_LOGIC;
  signal mult_out_n_92 : STD_LOGIC;
  signal mult_out_n_93 : STD_LOGIC;
  signal mult_out_n_94 : STD_LOGIC;
  signal mult_out_n_95 : STD_LOGIC;
  signal mult_out_n_96 : STD_LOGIC;
  signal mult_out_n_97 : STD_LOGIC;
  signal mult_out_n_98 : STD_LOGIC;
  signal mult_out_n_99 : STD_LOGIC;
  signal p_0_in_0 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \NLW_accu_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_mult_out_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_mult_out_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_mult_out_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_mult_out_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_mult_out_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_mult_out_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_mult_out_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_mult_out_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_mult_out_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_mult_out_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 25 );
  signal NLW_mult_out_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \EQ_dout[23]_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \EQ_dout[24]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \EQ_dout[25]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \EQ_dout[26]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \EQ_dout[27]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \EQ_dout[28]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \EQ_dout[29]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \EQ_dout[30]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \EQ_dout[31]_i_2\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \EQ_dout[32]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \EQ_dout[33]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \EQ_dout[34]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \EQ_dout[35]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \EQ_dout[36]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \EQ_dout[37]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \EQ_dout[38]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \EQ_dout[39]_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \EQ_dout[40]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \EQ_dout[41]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \EQ_dout[42]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \EQ_dout[43]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \EQ_dout[44]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \EQ_dout[45]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \EQ_dout[46]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \EQ_dout[47]_i_2\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \EQ_dout[55]_i_2\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \EQ_dout[56]_i_2\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \EQ_dout[57]_i_2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \EQ_dout[58]_i_2\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \EQ_dout[59]_i_2\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \EQ_dout[60]_i_2\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \EQ_dout[61]_i_2\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \EQ_dout[62]_i_10\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \EQ_dout[62]_i_11\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \EQ_dout[62]_i_4\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \EQ_dout[62]_i_6\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \EQ_dout[62]_i_7\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \EQ_dout[62]_i_8\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \EQ_dout[62]_i_9\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \EQ_dout[63]_i_2\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of mult_out_i_35 : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of mult_out_i_36 : label is "soft_lutpair28";
begin
  Volume_data1(1 downto 0) <= \^volume_data1\(1 downto 0);
  accu_reg_11_sn_1 <= accu_reg_11_sp_1;
  accu_reg_7_sn_1 <= accu_reg_7_sp_1;
  \counter_channel_reg[2]\ <= \^counter_channel_reg[2]\;
  \counter_channel_reg[3]\ <= \^counter_channel_reg[3]\;
  \counter_channel_reg[7]\ <= \^counter_channel_reg[7]\;
\EQ_dout[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040450505"
    )
        port map (
      I0 => \^volume_data1\(1),
      I1 => mult_out_n_93,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[0]\,
      O => D(0)
    );
\EQ_dout[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040450505"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => mult_out_n_93,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[16]\,
      O => D(8)
    );
\EQ_dout[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040450505"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => mult_out_n_92,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[16]\,
      O => D(9)
    );
\EQ_dout[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040450505"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => mult_out_n_91,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[16]\,
      O => D(10)
    );
\EQ_dout[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040450505"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => mult_out_n_90,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[16]\,
      O => D(11)
    );
\EQ_dout[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040450505"
    )
        port map (
      I0 => \^volume_data1\(1),
      I1 => mult_out_n_92,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[0]\,
      O => D(1)
    );
\EQ_dout[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040450505"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => mult_out_n_89,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[16]\,
      O => D(12)
    );
\EQ_dout[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040450505"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => mult_out_n_88,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[16]\,
      O => D(13)
    );
\EQ_dout[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040450505"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => mult_out_n_87,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[16]\,
      O => D(14)
    );
\EQ_dout[23]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"15"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => mult_out_n_81,
      I2 => \EQ_dout_reg[23]\,
      O => D(15)
    );
\EQ_dout[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22020002"
    )
        port map (
      I0 => \^volume_data1\(0),
      I1 => \^counter_channel_reg[7]\,
      I2 => p_0_in_0(5),
      I3 => \EQ_dout[62]_i_5_n_0\,
      I4 => \EQ_dout[56]_i_2_n_0\,
      O => D(16)
    );
\EQ_dout[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22020002"
    )
        port map (
      I0 => \^volume_data1\(0),
      I1 => \^counter_channel_reg[7]\,
      I2 => p_0_in_0(5),
      I3 => \EQ_dout[62]_i_5_n_0\,
      I4 => \EQ_dout[57]_i_2_n_0\,
      O => D(17)
    );
\EQ_dout[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22020002"
    )
        port map (
      I0 => \^volume_data1\(0),
      I1 => \^counter_channel_reg[7]\,
      I2 => p_0_in_0(5),
      I3 => \EQ_dout[62]_i_5_n_0\,
      I4 => \EQ_dout[58]_i_2_n_0\,
      O => D(18)
    );
\EQ_dout[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22020002"
    )
        port map (
      I0 => \^volume_data1\(0),
      I1 => \^counter_channel_reg[7]\,
      I2 => p_0_in_0(5),
      I3 => \EQ_dout[62]_i_5_n_0\,
      I4 => \EQ_dout[59]_i_2_n_0\,
      O => D(19)
    );
\EQ_dout[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22020002"
    )
        port map (
      I0 => \^volume_data1\(0),
      I1 => \^counter_channel_reg[7]\,
      I2 => p_0_in_0(5),
      I3 => \EQ_dout[62]_i_5_n_0\,
      I4 => \EQ_dout[60]_i_2_n_0\,
      O => D(20)
    );
\EQ_dout[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22020002"
    )
        port map (
      I0 => \^volume_data1\(0),
      I1 => \^counter_channel_reg[7]\,
      I2 => p_0_in_0(5),
      I3 => \EQ_dout[62]_i_5_n_0\,
      I4 => \EQ_dout[61]_i_2_n_0\,
      O => D(21)
    );
\EQ_dout[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040450505"
    )
        port map (
      I0 => \^volume_data1\(1),
      I1 => mult_out_n_91,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[0]\,
      O => D(2)
    );
\EQ_dout[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22020002"
    )
        port map (
      I0 => \^volume_data1\(0),
      I1 => \^counter_channel_reg[7]\,
      I2 => p_0_in_0(5),
      I3 => \EQ_dout[62]_i_5_n_0\,
      I4 => \EQ_dout[62]_i_6_n_0\,
      O => D(22)
    );
\EQ_dout[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_81,
      O => D(23)
    );
\EQ_dout[32]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008B33"
    )
        port map (
      I0 => mult_out_n_93,
      I1 => \EQ_dout[62]_i_5_n_0\,
      I2 => mult_out_n_81,
      I3 => \EQ_dout_reg[23]\,
      I4 => \EQ_dout_reg[0]\,
      O => D(24)
    );
\EQ_dout[33]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008B33"
    )
        port map (
      I0 => mult_out_n_92,
      I1 => \EQ_dout[62]_i_5_n_0\,
      I2 => mult_out_n_81,
      I3 => \EQ_dout_reg[23]\,
      I4 => \EQ_dout_reg[0]\,
      O => D(25)
    );
\EQ_dout[34]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008B33"
    )
        port map (
      I0 => mult_out_n_91,
      I1 => \EQ_dout[62]_i_5_n_0\,
      I2 => mult_out_n_81,
      I3 => \EQ_dout_reg[23]\,
      I4 => \EQ_dout_reg[0]\,
      O => D(26)
    );
\EQ_dout[35]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008B33"
    )
        port map (
      I0 => mult_out_n_90,
      I1 => \EQ_dout[62]_i_5_n_0\,
      I2 => mult_out_n_81,
      I3 => \EQ_dout_reg[23]\,
      I4 => \EQ_dout_reg[0]\,
      O => D(27)
    );
\EQ_dout[36]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008B33"
    )
        port map (
      I0 => mult_out_n_89,
      I1 => \EQ_dout[62]_i_5_n_0\,
      I2 => mult_out_n_81,
      I3 => \EQ_dout_reg[23]\,
      I4 => \EQ_dout_reg[0]\,
      O => D(28)
    );
\EQ_dout[37]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008B33"
    )
        port map (
      I0 => mult_out_n_88,
      I1 => \EQ_dout[62]_i_5_n_0\,
      I2 => mult_out_n_81,
      I3 => \EQ_dout_reg[23]\,
      I4 => \EQ_dout_reg[0]\,
      O => D(29)
    );
\EQ_dout[38]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008B33"
    )
        port map (
      I0 => mult_out_n_87,
      I1 => \EQ_dout[62]_i_5_n_0\,
      I2 => mult_out_n_81,
      I3 => \EQ_dout_reg[23]\,
      I4 => \EQ_dout_reg[0]\,
      O => D(30)
    );
\EQ_dout[39]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0222"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => \^counter_channel_reg[3]\,
      I2 => mult_out_n_81,
      I3 => \EQ_dout_reg[23]\,
      O => D(31)
    );
\EQ_dout[39]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(3),
      I1 => \EQ_dout_reg[56]\(4),
      I2 => \EQ_dout_reg[56]\(5),
      I3 => \EQ_dout_reg[56]\(6),
      I4 => \EQ_dout_reg[56]\(7),
      O => \^counter_channel_reg[3]\
    );
\EQ_dout[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040450505"
    )
        port map (
      I0 => \^volume_data1\(1),
      I1 => mult_out_n_90,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[0]\,
      O => D(3)
    );
\EQ_dout[40]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00D1"
    )
        port map (
      I0 => p_0_in_0(5),
      I1 => \EQ_dout[62]_i_5_n_0\,
      I2 => \EQ_dout[56]_i_2_n_0\,
      I3 => \^volume_data1\(0),
      O => D(32)
    );
\EQ_dout[41]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00D1"
    )
        port map (
      I0 => p_0_in_0(5),
      I1 => \EQ_dout[62]_i_5_n_0\,
      I2 => \EQ_dout[57]_i_2_n_0\,
      I3 => \^volume_data1\(0),
      O => D(33)
    );
\EQ_dout[42]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00D1"
    )
        port map (
      I0 => p_0_in_0(5),
      I1 => \EQ_dout[62]_i_5_n_0\,
      I2 => \EQ_dout[58]_i_2_n_0\,
      I3 => \^volume_data1\(0),
      O => D(34)
    );
\EQ_dout[43]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00D1"
    )
        port map (
      I0 => p_0_in_0(5),
      I1 => \EQ_dout[62]_i_5_n_0\,
      I2 => \EQ_dout[59]_i_2_n_0\,
      I3 => \^volume_data1\(0),
      O => D(35)
    );
\EQ_dout[44]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00D1"
    )
        port map (
      I0 => p_0_in_0(5),
      I1 => \EQ_dout[62]_i_5_n_0\,
      I2 => \EQ_dout[60]_i_2_n_0\,
      I3 => \^volume_data1\(0),
      O => D(36)
    );
\EQ_dout[45]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00D1"
    )
        port map (
      I0 => p_0_in_0(5),
      I1 => \EQ_dout[62]_i_5_n_0\,
      I2 => \EQ_dout[61]_i_2_n_0\,
      I3 => \^volume_data1\(0),
      O => D(37)
    );
\EQ_dout[46]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00D1"
    )
        port map (
      I0 => p_0_in_0(5),
      I1 => \EQ_dout[62]_i_5_n_0\,
      I2 => \EQ_dout[62]_i_6_n_0\,
      I3 => \^volume_data1\(0),
      O => D(38)
    );
\EQ_dout[47]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => mult_out_n_81,
      I1 => \EQ_dout_reg[23]\,
      O => D(39)
    );
\EQ_dout[48]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000808A0A0A"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => mult_out_n_93,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[16]\,
      O => D(40)
    );
\EQ_dout[49]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000808A0A0A"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => mult_out_n_92,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[16]\,
      O => D(41)
    );
\EQ_dout[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040450505"
    )
        port map (
      I0 => \^volume_data1\(1),
      I1 => mult_out_n_89,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[0]\,
      O => D(4)
    );
\EQ_dout[50]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000808A0A0A"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => mult_out_n_91,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[16]\,
      O => D(42)
    );
\EQ_dout[51]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000808A0A0A"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => mult_out_n_90,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[16]\,
      O => D(43)
    );
\EQ_dout[52]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000808A0A0A"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => mult_out_n_89,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[16]\,
      O => D(44)
    );
\EQ_dout[53]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000808A0A0A"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => mult_out_n_88,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[16]\,
      O => D(45)
    );
\EQ_dout[54]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000808A0A0A"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => mult_out_n_87,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[16]\,
      O => D(46)
    );
\EQ_dout[55]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => mult_out_n_81,
      I2 => \EQ_dout_reg[23]\,
      O => D(47)
    );
\EQ_dout[56]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0808000800000008"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => \^volume_data1\(0),
      I2 => \^counter_channel_reg[7]\,
      I3 => p_0_in_0(5),
      I4 => \EQ_dout[62]_i_5_n_0\,
      I5 => \EQ_dout[56]_i_2_n_0\,
      O => D(48)
    );
\EQ_dout[56]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => mult_out_n_93,
      I1 => \EQ_dout_reg[23]\,
      O => \EQ_dout[56]_i_2_n_0\
    );
\EQ_dout[57]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0808000800000008"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => \^volume_data1\(0),
      I2 => \^counter_channel_reg[7]\,
      I3 => p_0_in_0(5),
      I4 => \EQ_dout[62]_i_5_n_0\,
      I5 => \EQ_dout[57]_i_2_n_0\,
      O => D(49)
    );
\EQ_dout[57]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => mult_out_n_92,
      I1 => \EQ_dout_reg[23]\,
      O => \EQ_dout[57]_i_2_n_0\
    );
\EQ_dout[58]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0808000800000008"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => \^volume_data1\(0),
      I2 => \^counter_channel_reg[7]\,
      I3 => p_0_in_0(5),
      I4 => \EQ_dout[62]_i_5_n_0\,
      I5 => \EQ_dout[58]_i_2_n_0\,
      O => D(50)
    );
\EQ_dout[58]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => mult_out_n_91,
      I1 => \EQ_dout_reg[23]\,
      O => \EQ_dout[58]_i_2_n_0\
    );
\EQ_dout[59]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0808000800000008"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => \^volume_data1\(0),
      I2 => \^counter_channel_reg[7]\,
      I3 => p_0_in_0(5),
      I4 => \EQ_dout[62]_i_5_n_0\,
      I5 => \EQ_dout[59]_i_2_n_0\,
      O => D(51)
    );
\EQ_dout[59]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => mult_out_n_90,
      I1 => \EQ_dout_reg[23]\,
      O => \EQ_dout[59]_i_2_n_0\
    );
\EQ_dout[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040450505"
    )
        port map (
      I0 => \^volume_data1\(1),
      I1 => mult_out_n_88,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[0]\,
      O => D(5)
    );
\EQ_dout[60]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0808000800000008"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => \^volume_data1\(0),
      I2 => \^counter_channel_reg[7]\,
      I3 => p_0_in_0(5),
      I4 => \EQ_dout[62]_i_5_n_0\,
      I5 => \EQ_dout[60]_i_2_n_0\,
      O => D(52)
    );
\EQ_dout[60]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => mult_out_n_89,
      I1 => \EQ_dout_reg[23]\,
      O => \EQ_dout[60]_i_2_n_0\
    );
\EQ_dout[61]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0808000800000008"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => \^volume_data1\(0),
      I2 => \^counter_channel_reg[7]\,
      I3 => p_0_in_0(5),
      I4 => \EQ_dout[62]_i_5_n_0\,
      I5 => \EQ_dout[61]_i_2_n_0\,
      O => D(53)
    );
\EQ_dout[61]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => mult_out_n_88,
      I1 => \EQ_dout_reg[23]\,
      O => \EQ_dout[61]_i_2_n_0\
    );
\EQ_dout[62]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0808000800000008"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => \^volume_data1\(0),
      I2 => \^counter_channel_reg[7]\,
      I3 => p_0_in_0(5),
      I4 => \EQ_dout[62]_i_5_n_0\,
      I5 => \EQ_dout[62]_i_6_n_0\,
      O => D(54)
    );
\EQ_dout[62]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => mult_out_n_84,
      I1 => \EQ_dout_reg[23]\,
      O => p_0_in_0(2)
    );
\EQ_dout[62]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => mult_out_n_82,
      I1 => \EQ_dout_reg[23]\,
      O => p_0_in_0(4)
    );
\EQ_dout[62]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(1),
      I1 => \EQ_dout_reg[56]\(7),
      I2 => \EQ_dout_reg[56]\(6),
      I3 => \EQ_dout_reg[56]\(5),
      I4 => \EQ_dout_reg[56]\(4),
      I5 => \EQ_dout_reg[56]\(3),
      O => \^volume_data1\(0)
    );
\EQ_dout[62]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFFFFFF"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(7),
      I1 => \EQ_dout_reg[56]\(6),
      I2 => \EQ_dout_reg[56]\(5),
      I3 => \EQ_dout_reg[56]\(4),
      I4 => \EQ_dout_reg[56]\(3),
      I5 => \EQ_dout_reg[56]\(0),
      O => \^counter_channel_reg[7]\
    );
\EQ_dout[62]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => mult_out_n_81,
      I1 => \EQ_dout_reg[23]\,
      O => p_0_in_0(5)
    );
\EQ_dout[62]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000001"
    )
        port map (
      I0 => p_0_in_0(3),
      I1 => p_0_in_0(0),
      I2 => p_0_in_0(5),
      I3 => p_0_in_0(1),
      I4 => p_0_in_0(2),
      I5 => p_0_in_0(4),
      O => \EQ_dout[62]_i_5_n_0\
    );
\EQ_dout[62]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => mult_out_n_87,
      I1 => \EQ_dout_reg[23]\,
      O => \EQ_dout[62]_i_6_n_0\
    );
\EQ_dout[62]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => mult_out_n_83,
      I1 => \EQ_dout_reg[23]\,
      O => p_0_in_0(3)
    );
\EQ_dout[62]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => mult_out_n_86,
      I1 => \EQ_dout_reg[23]\,
      O => p_0_in_0(0)
    );
\EQ_dout[62]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => mult_out_n_85,
      I1 => \EQ_dout_reg[23]\,
      O => p_0_in_0(1)
    );
\EQ_dout[63]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => \^counter_channel_reg[2]\,
      I1 => \EQ_dout_reg[23]\,
      I2 => mult_out_n_81,
      O => D(55)
    );
\EQ_dout[63]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => \EQ_dout_reg[56]\(1),
      I2 => \EQ_dout_reg[56]\(0),
      I3 => \^counter_channel_reg[3]\,
      O => \^counter_channel_reg[2]\
    );
\EQ_dout[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040450505"
    )
        port map (
      I0 => \^volume_data1\(1),
      I1 => mult_out_n_87,
      I2 => \EQ_dout[62]_i_5_n_0\,
      I3 => mult_out_n_81,
      I4 => \EQ_dout_reg[23]\,
      I5 => \EQ_dout_reg[0]\,
      O => D(6)
    );
\EQ_dout[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000CCCDCCCDCCCD"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => \^counter_channel_reg[3]\,
      I2 => \EQ_dout_reg[56]\(0),
      I3 => \EQ_dout_reg[56]\(1),
      I4 => mult_out_n_81,
      I5 => \EQ_dout_reg[23]\,
      O => D(7)
    );
a1_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \EQ_dout_reg[56]\(2),
      I1 => \EQ_dout_reg[56]\(7),
      I2 => \EQ_dout_reg[56]\(6),
      I3 => \EQ_dout_reg[56]\(5),
      I4 => \EQ_dout_reg[56]\(4),
      I5 => \EQ_dout_reg[56]\(3),
      O => \^volume_data1\(1)
    );
\accu[0]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_105,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => \accu_reg[3]_0\,
      O => \accu[0]_i_10_n_0\
    );
\accu[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_102,
      I2 => \accu_reg[3]\(0),
      O => \accu[0]_i_3_n_0\
    );
\accu[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_103,
      I2 => \accu_reg[3]\(0),
      O => \accu[0]_i_4_n_0\
    );
\accu[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_104,
      I2 => \accu_reg[3]\(0),
      O => \accu[0]_i_5_n_0\
    );
\accu[0]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_105,
      I2 => \accu_reg[3]\(0),
      O => \accu[0]_i_6_n_0\
    );
\accu[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_102,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => \accu_reg[3]_3\,
      O => \accu[0]_i_7_n_0\
    );
\accu[0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_103,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => \accu_reg[3]_2\,
      O => \accu[0]_i_8_n_0\
    );
\accu[0]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_104,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => \accu_reg[3]_1\,
      O => \accu[0]_i_9_n_0\
    );
\accu[12]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_90,
      I2 => \accu_reg[3]\(0),
      O => \accu[12]_i_2_n_0\
    );
\accu[12]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_91,
      I2 => \accu_reg[3]\(0),
      O => \accu[12]_i_3_n_0\
    );
\accu[12]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_92,
      I2 => \accu_reg[3]\(0),
      O => \accu[12]_i_4_n_0\
    );
\accu[12]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_93,
      I2 => \accu_reg[3]\(0),
      O => \accu[12]_i_5_n_0\
    );
\accu[12]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_90,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => accu_reg(3),
      O => \accu[12]_i_6_n_0\
    );
\accu[12]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_91,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => accu_reg(2),
      O => \accu[12]_i_7_n_0\
    );
\accu[12]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_92,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => accu_reg(1),
      O => \accu[12]_i_8_n_0\
    );
\accu[12]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_93,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => accu_reg(0),
      O => \accu[12]_i_9_n_0\
    );
\accu[16]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_86,
      I2 => \accu_reg[3]\(0),
      O => \accu[16]_i_2_n_0\
    );
\accu[16]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_87,
      I2 => \accu_reg[3]\(0),
      O => \accu[16]_i_3_n_0\
    );
\accu[16]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_88,
      I2 => \accu_reg[3]\(0),
      O => \accu[16]_i_4_n_0\
    );
\accu[16]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_89,
      I2 => \accu_reg[3]\(0),
      O => \accu[16]_i_5_n_0\
    );
\accu[16]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_86,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => accu_reg(7),
      O => \accu[16]_i_6_n_0\
    );
\accu[16]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_87,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => accu_reg(6),
      O => \accu[16]_i_7_n_0\
    );
\accu[16]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_88,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => accu_reg(5),
      O => \accu[16]_i_8_n_0\
    );
\accu[16]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_89,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => accu_reg(4),
      O => \accu[16]_i_9_n_0\
    );
\accu[20]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_82,
      I2 => \accu_reg[3]\(0),
      O => \accu[20]_i_2_n_0\
    );
\accu[20]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_83,
      I2 => \accu_reg[3]\(0),
      O => \accu[20]_i_3_n_0\
    );
\accu[20]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_84,
      I2 => \accu_reg[3]\(0),
      O => \accu[20]_i_4_n_0\
    );
\accu[20]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_85,
      I2 => \accu_reg[3]\(0),
      O => \accu[20]_i_5_n_0\
    );
\accu[20]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_82,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => accu_reg(11),
      O => \accu[20]_i_6_n_0\
    );
\accu[20]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_83,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => accu_reg(10),
      O => \accu[20]_i_7_n_0\
    );
\accu[20]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_84,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => accu_reg(9),
      O => \accu[20]_i_8_n_0\
    );
\accu[20]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_85,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => accu_reg(8),
      O => \accu[20]_i_9_n_0\
    );
\accu[24]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_81,
      I2 => \accu_reg[3]\(0),
      O => \accu[24]_i_2_n_0\
    );
\accu[24]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_81,
      I2 => \accu_reg[3]\(0),
      O => \accu[24]_i_3_n_0\
    );
\accu[24]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_81,
      I2 => \accu_reg[3]\(0),
      O => \accu[24]_i_4_n_0\
    );
\accu[24]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_81,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => accu_reg(15),
      O => \accu[24]_i_5_n_0\
    );
\accu[24]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_81,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => accu_reg(14),
      O => \accu[24]_i_6_n_0\
    );
\accu[24]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_81,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => accu_reg(13),
      O => \accu[24]_i_7_n_0\
    );
\accu[24]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_81,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => accu_reg(12),
      O => \accu[24]_i_8_n_0\
    );
\accu[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_98,
      I2 => \accu_reg[3]\(0),
      O => \accu[4]_i_2_n_0\
    );
\accu[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_99,
      I2 => \accu_reg[3]\(0),
      O => \accu[4]_i_3_n_0\
    );
\accu[4]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_100,
      I2 => \accu_reg[3]\(0),
      O => \accu[4]_i_4_n_0\
    );
\accu[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_101,
      I2 => \accu_reg[3]\(0),
      O => \accu[4]_i_5_n_0\
    );
\accu[4]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_98,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => \accu_reg[7]_2\,
      O => \accu[4]_i_6_n_0\
    );
\accu[4]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_99,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => \accu_reg[7]_1\,
      O => \accu[4]_i_7_n_0\
    );
\accu[4]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_100,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => \accu_reg[7]_0\,
      O => \accu[4]_i_8_n_0\
    );
\accu[4]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_101,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => accu_reg_7_sn_1,
      O => \accu[4]_i_9_n_0\
    );
\accu[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_94,
      I2 => \accu_reg[3]\(0),
      O => \accu[8]_i_2_n_0\
    );
\accu[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_95,
      I2 => \accu_reg[3]\(0),
      O => \accu[8]_i_3_n_0\
    );
\accu[8]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_96,
      I2 => \accu_reg[3]\(0),
      O => \accu[8]_i_4_n_0\
    );
\accu[8]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \EQ_dout_reg[23]\,
      I1 => mult_out_n_97,
      I2 => \accu_reg[3]\(0),
      O => \accu[8]_i_5_n_0\
    );
\accu[8]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_94,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => \accu_reg[11]_2\,
      O => \accu[8]_i_6_n_0\
    );
\accu[8]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_95,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => \accu_reg[11]_1\,
      O => \accu[8]_i_7_n_0\
    );
\accu[8]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_96,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => \accu_reg[11]_0\,
      O => \accu[8]_i_8_n_0\
    );
\accu[8]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => mult_out_n_97,
      I1 => \EQ_dout_reg[23]\,
      I2 => \accu_reg[3]\(0),
      I3 => accu_reg_11_sn_1,
      O => \accu[8]_i_9_n_0\
    );
\accu_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \accu_reg[0]_i_2_n_0\,
      CO(2) => \accu_reg[0]_i_2_n_1\,
      CO(1) => \accu_reg[0]_i_2_n_2\,
      CO(0) => \accu_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => \accu[0]_i_3_n_0\,
      DI(2) => \accu[0]_i_4_n_0\,
      DI(1) => \accu[0]_i_5_n_0\,
      DI(0) => \accu[0]_i_6_n_0\,
      O(3 downto 0) => O(3 downto 0),
      S(3) => \accu[0]_i_7_n_0\,
      S(2) => \accu[0]_i_8_n_0\,
      S(1) => \accu[0]_i_9_n_0\,
      S(0) => \accu[0]_i_10_n_0\
    );
\accu_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \accu_reg[8]_i_1_n_0\,
      CO(3) => \accu_reg[12]_i_1_n_0\,
      CO(2) => \accu_reg[12]_i_1_n_1\,
      CO(1) => \accu_reg[12]_i_1_n_2\,
      CO(0) => \accu_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \accu[12]_i_2_n_0\,
      DI(2) => \accu[12]_i_3_n_0\,
      DI(1) => \accu[12]_i_4_n_0\,
      DI(0) => \accu[12]_i_5_n_0\,
      O(3 downto 0) => \EQ_dout_reg[63]_i_5_1\(3 downto 0),
      S(3) => \accu[12]_i_6_n_0\,
      S(2) => \accu[12]_i_7_n_0\,
      S(1) => \accu[12]_i_8_n_0\,
      S(0) => \accu[12]_i_9_n_0\
    );
\accu_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \accu_reg[12]_i_1_n_0\,
      CO(3) => \accu_reg[16]_i_1_n_0\,
      CO(2) => \accu_reg[16]_i_1_n_1\,
      CO(1) => \accu_reg[16]_i_1_n_2\,
      CO(0) => \accu_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \accu[16]_i_2_n_0\,
      DI(2) => \accu[16]_i_3_n_0\,
      DI(1) => \accu[16]_i_4_n_0\,
      DI(0) => \accu[16]_i_5_n_0\,
      O(3 downto 0) => \EQ_dout_reg[63]_i_5_2\(3 downto 0),
      S(3) => \accu[16]_i_6_n_0\,
      S(2) => \accu[16]_i_7_n_0\,
      S(1) => \accu[16]_i_8_n_0\,
      S(0) => \accu[16]_i_9_n_0\
    );
\accu_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \accu_reg[16]_i_1_n_0\,
      CO(3) => \accu_reg[20]_i_1_n_0\,
      CO(2) => \accu_reg[20]_i_1_n_1\,
      CO(1) => \accu_reg[20]_i_1_n_2\,
      CO(0) => \accu_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \accu[20]_i_2_n_0\,
      DI(2) => \accu[20]_i_3_n_0\,
      DI(1) => \accu[20]_i_4_n_0\,
      DI(0) => \accu[20]_i_5_n_0\,
      O(3 downto 0) => \EQ_dout_reg[63]_i_5_3\(3 downto 0),
      S(3) => \accu[20]_i_6_n_0\,
      S(2) => \accu[20]_i_7_n_0\,
      S(1) => \accu[20]_i_8_n_0\,
      S(0) => \accu[20]_i_9_n_0\
    );
\accu_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \accu_reg[20]_i_1_n_0\,
      CO(3) => \NLW_accu_reg[24]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \accu_reg[24]_i_1_n_1\,
      CO(1) => \accu_reg[24]_i_1_n_2\,
      CO(0) => \accu_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \accu[24]_i_2_n_0\,
      DI(1) => \accu[24]_i_3_n_0\,
      DI(0) => \accu[24]_i_4_n_0\,
      O(3 downto 0) => \EQ_dout_reg[63]_i_5_4\(3 downto 0),
      S(3) => \accu[24]_i_5_n_0\,
      S(2) => \accu[24]_i_6_n_0\,
      S(1) => \accu[24]_i_7_n_0\,
      S(0) => \accu[24]_i_8_n_0\
    );
\accu_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \accu_reg[0]_i_2_n_0\,
      CO(3) => \accu_reg[4]_i_1_n_0\,
      CO(2) => \accu_reg[4]_i_1_n_1\,
      CO(1) => \accu_reg[4]_i_1_n_2\,
      CO(0) => \accu_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \accu[4]_i_2_n_0\,
      DI(2) => \accu[4]_i_3_n_0\,
      DI(1) => \accu[4]_i_4_n_0\,
      DI(0) => \accu[4]_i_5_n_0\,
      O(3 downto 0) => \EQ_dout_reg[63]_i_5\(3 downto 0),
      S(3) => \accu[4]_i_6_n_0\,
      S(2) => \accu[4]_i_7_n_0\,
      S(1) => \accu[4]_i_8_n_0\,
      S(0) => \accu[4]_i_9_n_0\
    );
\accu_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \accu_reg[4]_i_1_n_0\,
      CO(3) => \accu_reg[8]_i_1_n_0\,
      CO(2) => \accu_reg[8]_i_1_n_1\,
      CO(1) => \accu_reg[8]_i_1_n_2\,
      CO(0) => \accu_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \accu[8]_i_2_n_0\,
      DI(2) => \accu[8]_i_3_n_0\,
      DI(1) => \accu[8]_i_4_n_0\,
      DI(0) => \accu[8]_i_5_n_0\,
      O(3 downto 0) => \EQ_dout_reg[63]_i_5_0\(3 downto 0),
      S(3) => \accu[8]_i_6_n_0\,
      S(2) => \accu[8]_i_7_n_0\,
      S(1) => \accu[8]_i_8_n_0\,
      S(0) => \accu[8]_i_9_n_0\
    );
mult_out: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 1,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 1,
      BREG => 1,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 16) => B"00000000000000",
      A(15 downto 0) => Q(15 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_mult_out_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => mult_opA(7),
      B(16) => mult_opA(7),
      B(15) => mult_opA(7),
      B(14) => mult_opA(7),
      B(13) => mult_opA(7),
      B(12) => mult_opA(7),
      B(11) => mult_opA(7),
      B(10) => mult_opA(7),
      B(9) => mult_opA(7),
      B(8) => mult_opA(7),
      B(7) => mult_opA(7),
      B(6 downto 0) => Volume_data(6 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_mult_out_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_mult_out_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_mult_out_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => reset_n,
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => reset_n,
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => '1',
      CLK => clk,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_mult_out_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_mult_out_OVERFLOW_UNCONNECTED,
      P(47 downto 25) => NLW_mult_out_P_UNCONNECTED(47 downto 25),
      P(24) => mult_out_n_81,
      P(23) => mult_out_n_82,
      P(22) => mult_out_n_83,
      P(21) => mult_out_n_84,
      P(20) => mult_out_n_85,
      P(19) => mult_out_n_86,
      P(18) => mult_out_n_87,
      P(17) => mult_out_n_88,
      P(16) => mult_out_n_89,
      P(15) => mult_out_n_90,
      P(14) => mult_out_n_91,
      P(13) => mult_out_n_92,
      P(12) => mult_out_n_93,
      P(11) => mult_out_n_94,
      P(10) => mult_out_n_95,
      P(9) => mult_out_n_96,
      P(8) => mult_out_n_97,
      P(7) => mult_out_n_98,
      P(6) => mult_out_n_99,
      P(5) => mult_out_n_100,
      P(4) => mult_out_n_101,
      P(3) => mult_out_n_102,
      P(2) => mult_out_n_103,
      P(1) => mult_out_n_104,
      P(0) => mult_out_n_105,
      PATTERNBDETECT => NLW_mult_out_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_mult_out_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_mult_out_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_mult_out_UNDERFLOW_UNCONNECTED
    );
mult_out_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => accu_reg(15),
      I1 => \^counter_channel_reg[2]\,
      I2 => mult_out_i_9_n_0,
      I3 => \^volume_data1\(1),
      I4 => mult_out_i_10_n_0,
      O => mult_opA(7)
    );
mult_out_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"505F3030505F3F3F"
    )
        port map (
      I0 => mult_out_0(23),
      I1 => mult_out_0(31),
      I2 => \^volume_data1\(0),
      I3 => mult_out_0(7),
      I4 => \^counter_channel_reg[7]\,
      I5 => mult_out_0(15),
      O => mult_out_i_10_n_0
    );
mult_out_i_11: unisim.vcomponents.MUXF7
     port map (
      I0 => mult_out_i_19_n_0,
      I1 => mult_out_i_20_n_0,
      O => mult_out_i_11_n_0,
      S => accu_reg(14)
    );
mult_out_i_12: unisim.vcomponents.MUXF7
     port map (
      I0 => mult_out_i_21_n_0,
      I1 => mult_out_i_22_n_0,
      O => mult_out_i_12_n_0,
      S => \^volume_data1\(1)
    );
mult_out_i_13: unisim.vcomponents.MUXF7
     port map (
      I0 => mult_out_i_23_n_0,
      I1 => mult_out_i_24_n_0,
      O => mult_out_i_13_n_0,
      S => \^volume_data1\(1)
    );
mult_out_i_14: unisim.vcomponents.MUXF7
     port map (
      I0 => mult_out_i_25_n_0,
      I1 => mult_out_i_26_n_0,
      O => mult_out_i_14_n_0,
      S => \^volume_data1\(1)
    );
mult_out_i_15: unisim.vcomponents.MUXF7
     port map (
      I0 => mult_out_i_27_n_0,
      I1 => mult_out_i_28_n_0,
      O => mult_out_i_15_n_0,
      S => \^volume_data1\(1)
    );
mult_out_i_16: unisim.vcomponents.MUXF7
     port map (
      I0 => mult_out_i_29_n_0,
      I1 => mult_out_i_30_n_0,
      O => mult_out_i_16_n_0,
      S => \^volume_data1\(1)
    );
mult_out_i_17: unisim.vcomponents.MUXF7
     port map (
      I0 => mult_out_i_31_n_0,
      I1 => mult_out_i_32_n_0,
      O => mult_out_i_17_n_0,
      S => \^volume_data1\(1)
    );
mult_out_i_18: unisim.vcomponents.MUXF7
     port map (
      I0 => mult_out_i_33_n_0,
      I1 => mult_out_i_34_n_0,
      O => mult_out_i_18_n_0,
      S => \^volume_data1\(1)
    );
mult_out_i_19: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => accu_reg(9),
      I1 => accu_reg(10),
      I2 => accu_reg(7),
      I3 => accu_reg(8),
      I4 => mult_out_i_35_n_0,
      O => mult_out_i_19_n_0
    );
mult_out_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFD100"
    )
        port map (
      I0 => accu_reg(15),
      I1 => mult_out_i_11_n_0,
      I2 => accu_reg(6),
      I3 => \^counter_channel_reg[2]\,
      I4 => mult_out_i_12_n_0,
      O => Volume_data(6)
    );
mult_out_i_20: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => accu_reg(9),
      I1 => accu_reg(10),
      I2 => accu_reg(7),
      I3 => accu_reg(8),
      I4 => mult_out_i_36_n_0,
      O => mult_out_i_20_n_0
    );
mult_out_i_21: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => mult_out_0(22),
      I1 => mult_out_0(30),
      I2 => \^volume_data1\(0),
      I3 => mult_out_0(6),
      I4 => \^counter_channel_reg[7]\,
      I5 => mult_out_0(14),
      O => mult_out_i_21_n_0
    );
mult_out_i_22: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => mult_out_0(54),
      I1 => \^volume_data1\(0),
      I2 => mult_out_0(38),
      I3 => \^counter_channel_reg[7]\,
      I4 => mult_out_0(46),
      O => mult_out_i_22_n_0
    );
mult_out_i_23: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => mult_out_0(21),
      I1 => mult_out_0(29),
      I2 => \^volume_data1\(0),
      I3 => mult_out_0(5),
      I4 => \^counter_channel_reg[7]\,
      I5 => mult_out_0(13),
      O => mult_out_i_23_n_0
    );
mult_out_i_24: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => mult_out_0(53),
      I1 => \^volume_data1\(0),
      I2 => mult_out_0(37),
      I3 => \^counter_channel_reg[7]\,
      I4 => mult_out_0(45),
      O => mult_out_i_24_n_0
    );
mult_out_i_25: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => mult_out_0(20),
      I1 => mult_out_0(28),
      I2 => \^volume_data1\(0),
      I3 => mult_out_0(4),
      I4 => \^counter_channel_reg[7]\,
      I5 => mult_out_0(12),
      O => mult_out_i_25_n_0
    );
mult_out_i_26: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => mult_out_0(52),
      I1 => \^volume_data1\(0),
      I2 => mult_out_0(36),
      I3 => \^counter_channel_reg[7]\,
      I4 => mult_out_0(44),
      O => mult_out_i_26_n_0
    );
mult_out_i_27: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => mult_out_0(19),
      I1 => mult_out_0(27),
      I2 => \^volume_data1\(0),
      I3 => mult_out_0(3),
      I4 => \^counter_channel_reg[7]\,
      I5 => mult_out_0(11),
      O => mult_out_i_27_n_0
    );
mult_out_i_28: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => mult_out_0(51),
      I1 => \^volume_data1\(0),
      I2 => mult_out_0(35),
      I3 => \^counter_channel_reg[7]\,
      I4 => mult_out_0(43),
      O => mult_out_i_28_n_0
    );
mult_out_i_29: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => mult_out_0(18),
      I1 => mult_out_0(26),
      I2 => \^volume_data1\(0),
      I3 => mult_out_0(2),
      I4 => \^counter_channel_reg[7]\,
      I5 => mult_out_0(10),
      O => mult_out_i_29_n_0
    );
mult_out_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFD100"
    )
        port map (
      I0 => accu_reg(15),
      I1 => mult_out_i_11_n_0,
      I2 => accu_reg(5),
      I3 => \^counter_channel_reg[2]\,
      I4 => mult_out_i_13_n_0,
      O => Volume_data(5)
    );
mult_out_i_30: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => mult_out_0(50),
      I1 => \^volume_data1\(0),
      I2 => mult_out_0(34),
      I3 => \^counter_channel_reg[7]\,
      I4 => mult_out_0(42),
      O => mult_out_i_30_n_0
    );
mult_out_i_31: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => mult_out_0(17),
      I1 => mult_out_0(25),
      I2 => \^volume_data1\(0),
      I3 => mult_out_0(1),
      I4 => \^counter_channel_reg[7]\,
      I5 => mult_out_0(9),
      O => mult_out_i_31_n_0
    );
mult_out_i_32: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => mult_out_0(49),
      I1 => \^volume_data1\(0),
      I2 => mult_out_0(33),
      I3 => \^counter_channel_reg[7]\,
      I4 => mult_out_0(41),
      O => mult_out_i_32_n_0
    );
mult_out_i_33: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => mult_out_0(16),
      I1 => mult_out_0(24),
      I2 => \^volume_data1\(0),
      I3 => mult_out_0(0),
      I4 => \^counter_channel_reg[7]\,
      I5 => mult_out_0(8),
      O => mult_out_i_33_n_0
    );
mult_out_i_34: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => mult_out_0(48),
      I1 => \^volume_data1\(0),
      I2 => mult_out_0(32),
      I3 => \^counter_channel_reg[7]\,
      I4 => mult_out_0(40),
      O => mult_out_i_34_n_0
    );
mult_out_i_35: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => accu_reg(15),
      I1 => accu_reg(13),
      I2 => accu_reg(12),
      I3 => accu_reg(11),
      O => mult_out_i_35_n_0
    );
mult_out_i_36: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => accu_reg(15),
      I1 => accu_reg(13),
      I2 => accu_reg(12),
      I3 => accu_reg(11),
      O => mult_out_i_36_n_0
    );
mult_out_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFD100"
    )
        port map (
      I0 => accu_reg(15),
      I1 => mult_out_i_11_n_0,
      I2 => accu_reg(4),
      I3 => \^counter_channel_reg[2]\,
      I4 => mult_out_i_14_n_0,
      O => Volume_data(4)
    );
mult_out_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFD100"
    )
        port map (
      I0 => accu_reg(15),
      I1 => mult_out_i_11_n_0,
      I2 => accu_reg(3),
      I3 => \^counter_channel_reg[2]\,
      I4 => mult_out_i_15_n_0,
      O => Volume_data(3)
    );
mult_out_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFD100"
    )
        port map (
      I0 => accu_reg(15),
      I1 => mult_out_i_11_n_0,
      I2 => accu_reg(2),
      I3 => \^counter_channel_reg[2]\,
      I4 => mult_out_i_16_n_0,
      O => Volume_data(2)
    );
mult_out_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFD100"
    )
        port map (
      I0 => accu_reg(15),
      I1 => mult_out_i_11_n_0,
      I2 => accu_reg(1),
      I3 => \^counter_channel_reg[2]\,
      I4 => mult_out_i_17_n_0,
      O => Volume_data(1)
    );
mult_out_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFD100"
    )
        port map (
      I0 => accu_reg(15),
      I1 => mult_out_i_11_n_0,
      I2 => accu_reg(0),
      I3 => \^counter_channel_reg[2]\,
      I4 => mult_out_i_18_n_0,
      O => Volume_data(0)
    );
mult_out_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D0DFD0D0D0DFDFDF"
    )
        port map (
      I0 => mult_out_0(55),
      I1 => \EQ_dout_reg[56]\(0),
      I2 => \^volume_data1\(0),
      I3 => mult_out_0(39),
      I4 => \^counter_channel_reg[7]\,
      I5 => mult_out_0(47),
      O => mult_out_i_9_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity EQ_dist_mem_gen_v8_0_12 is
  port (
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    d : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 4 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    i_ce : in STD_LOGIC;
    qspo_ce : in STD_LOGIC;
    qdpo_ce : in STD_LOGIC;
    qdpo_clk : in STD_LOGIC;
    qspo_rst : in STD_LOGIC;
    qdpo_rst : in STD_LOGIC;
    qspo_srst : in STD_LOGIC;
    qdpo_srst : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 15 downto 0 );
    qspo : out STD_LOGIC_VECTOR ( 15 downto 0 );
    qdpo : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute C_ADDR_WIDTH : integer;
  attribute C_ADDR_WIDTH of EQ_dist_mem_gen_v8_0_12 : entity is 5;
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of EQ_dist_mem_gen_v8_0_12 : entity is "0";
  attribute C_DEPTH : integer;
  attribute C_DEPTH of EQ_dist_mem_gen_v8_0_12 : entity is 32;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of EQ_dist_mem_gen_v8_0_12 : entity is "./";
  attribute C_FAMILY : string;
  attribute C_FAMILY of EQ_dist_mem_gen_v8_0_12 : entity is "spartan7";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QSPO_CE : integer;
  attribute C_HAS_QSPO_CE of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of EQ_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_MEM_INIT_FILE : string;
  attribute C_MEM_INIT_FILE of EQ_dist_mem_gen_v8_0_12 : entity is "ROM_32_16bit.mif";
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_PARSER_TYPE : integer;
  attribute C_PARSER_TYPE of EQ_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_READ_MIF : integer;
  attribute C_READ_MIF of EQ_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_REG_A_D_INPUTS : integer;
  attribute C_REG_A_D_INPUTS of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of EQ_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_SYNC_ENABLE : integer;
  attribute C_SYNC_ENABLE of EQ_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_WIDTH : integer;
  attribute C_WIDTH of EQ_dist_mem_gen_v8_0_12 : entity is 16;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of EQ_dist_mem_gen_v8_0_12 : entity is "dist_mem_gen_v8_0_12";
end EQ_dist_mem_gen_v8_0_12;

architecture STRUCTURE of EQ_dist_mem_gen_v8_0_12 is
  signal \<const0>\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of g0_b0 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of g0_b1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of g0_b10 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of g0_b11 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of g0_b12 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of g0_b13 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of g0_b14 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of g0_b15 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of g0_b2 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of g0_b3 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of g0_b4 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of g0_b5 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of g0_b6 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of g0_b7 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of g0_b8 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of g0_b9 : label is "soft_lutpair4";
begin
  dpo(15) <= \<const0>\;
  dpo(14) <= \<const0>\;
  dpo(13) <= \<const0>\;
  dpo(12) <= \<const0>\;
  dpo(11) <= \<const0>\;
  dpo(10) <= \<const0>\;
  dpo(9) <= \<const0>\;
  dpo(8) <= \<const0>\;
  dpo(7) <= \<const0>\;
  dpo(6) <= \<const0>\;
  dpo(5) <= \<const0>\;
  dpo(4) <= \<const0>\;
  dpo(3) <= \<const0>\;
  dpo(2) <= \<const0>\;
  dpo(1) <= \<const0>\;
  dpo(0) <= \<const0>\;
  qdpo(15) <= \<const0>\;
  qdpo(14) <= \<const0>\;
  qdpo(13) <= \<const0>\;
  qdpo(12) <= \<const0>\;
  qdpo(11) <= \<const0>\;
  qdpo(10) <= \<const0>\;
  qdpo(9) <= \<const0>\;
  qdpo(8) <= \<const0>\;
  qdpo(7) <= \<const0>\;
  qdpo(6) <= \<const0>\;
  qdpo(5) <= \<const0>\;
  qdpo(4) <= \<const0>\;
  qdpo(3) <= \<const0>\;
  qdpo(2) <= \<const0>\;
  qdpo(1) <= \<const0>\;
  qdpo(0) <= \<const0>\;
  qspo(15) <= \<const0>\;
  qspo(14) <= \<const0>\;
  qspo(13) <= \<const0>\;
  qspo(12) <= \<const0>\;
  qspo(11) <= \<const0>\;
  qspo(10) <= \<const0>\;
  qspo(9) <= \<const0>\;
  qspo(8) <= \<const0>\;
  qspo(7) <= \<const0>\;
  qspo(6) <= \<const0>\;
  qspo(5) <= \<const0>\;
  qspo(4) <= \<const0>\;
  qspo(3) <= \<const0>\;
  qspo(2) <= \<const0>\;
  qspo(1) <= \<const0>\;
  qspo(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
g0_b0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000CE20A"
    )
        port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      O => spo(0)
    );
g0_b1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00C222A0"
    )
        port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      O => spo(1)
    );
g0_b10: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002E48F0"
    )
        port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      O => spo(10)
    );
g0_b11: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00E48F00"
    )
        port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      O => spo(11)
    );
g0_b12: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0048F000"
    )
        port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      O => spo(12)
    );
g0_b13: unisim.vcomponents.LUT5
    generic map(
      INIT => X"008F0000"
    )
        port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      O => spo(13)
    );
g0_b14: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => a(2),
      I1 => a(3),
      I2 => a(4),
      O => spo(14)
    );
g0_b15: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000000"
    )
        port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      O => spo(15)
    );
g0_b2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0022280C"
    )
        port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      O => spo(2)
    );
g0_b3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002280C8"
    )
        port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      O => spo(3)
    );
g0_b4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00280C8C"
    )
        port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      O => spo(4)
    );
g0_b5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080C8C2"
    )
        port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      O => spo(5)
    );
g0_b6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000C8C2E"
    )
        port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      O => spo(6)
    );
g0_b7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00C8C2E4"
    )
        port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      O => spo(7)
    );
g0_b8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"008C2E48"
    )
        port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      O => spo(8)
    );
g0_b9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00C2E48E"
    )
        port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      O => spo(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity EQ_ROM_32_16bit is
  port (
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of EQ_ROM_32_16bit : entity is "ROM_32_16bit,dist_mem_gen_v8_0_12,{}";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of EQ_ROM_32_16bit : entity is "ROM_32_16bit";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of EQ_ROM_32_16bit : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of EQ_ROM_32_16bit : entity is "dist_mem_gen_v8_0_12,Vivado 2018.3";
end EQ_ROM_32_16bit;

architecture STRUCTURE of EQ_ROM_32_16bit is
  signal NLW_U0_dpo_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_U0_qdpo_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_U0_qspo_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "spartan7";
  attribute C_HAS_D : integer;
  attribute C_HAS_D of U0 : label is 0;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of U0 : label is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of U0 : label is 0;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of U0 : label is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of U0 : label is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of U0 : label is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of U0 : label is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of U0 : label is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of U0 : label is 0;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of U0 : label is 0;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 0;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of U0 : label is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of U0 : label is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of U0 : label is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of U0 : label is 0;
  attribute c_addr_width : integer;
  attribute c_addr_width of U0 : label is 5;
  attribute c_default_data : string;
  attribute c_default_data of U0 : label is "0";
  attribute c_depth : integer;
  attribute c_depth of U0 : label is 32;
  attribute c_elaboration_dir : string;
  attribute c_elaboration_dir of U0 : label is "./";
  attribute c_has_clk : integer;
  attribute c_has_clk of U0 : label is 0;
  attribute c_has_qspo : integer;
  attribute c_has_qspo of U0 : label is 0;
  attribute c_has_qspo_ce : integer;
  attribute c_has_qspo_ce of U0 : label is 0;
  attribute c_has_qspo_rst : integer;
  attribute c_has_qspo_rst of U0 : label is 0;
  attribute c_has_qspo_srst : integer;
  attribute c_has_qspo_srst of U0 : label is 0;
  attribute c_has_spo : integer;
  attribute c_has_spo of U0 : label is 1;
  attribute c_mem_init_file : string;
  attribute c_mem_init_file of U0 : label is "ROM_32_16bit.mif";
  attribute c_parser_type : integer;
  attribute c_parser_type of U0 : label is 1;
  attribute c_read_mif : integer;
  attribute c_read_mif of U0 : label is 1;
  attribute c_reg_a_d_inputs : integer;
  attribute c_reg_a_d_inputs of U0 : label is 0;
  attribute c_sync_enable : integer;
  attribute c_sync_enable of U0 : label is 1;
  attribute c_width : integer;
  attribute c_width of U0 : label is 16;
begin
U0: entity work.EQ_dist_mem_gen_v8_0_12
     port map (
      a(4 downto 0) => a(4 downto 0),
      clk => '0',
      d(15 downto 0) => B"0000000000000000",
      dpo(15 downto 0) => NLW_U0_dpo_UNCONNECTED(15 downto 0),
      dpra(4 downto 0) => B"00000",
      i_ce => '1',
      qdpo(15 downto 0) => NLW_U0_qdpo_UNCONNECTED(15 downto 0),
      qdpo_ce => '1',
      qdpo_clk => '0',
      qdpo_rst => '0',
      qdpo_srst => '0',
      qspo(15 downto 0) => NLW_U0_qspo_UNCONNECTED(15 downto 0),
      qspo_ce => '1',
      qspo_rst => '0',
      qspo_srst => '0',
      spo(15 downto 0) => spo(15 downto 0),
      we => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity EQ_EQ_stage is
  port (
    reset_n_0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \vol_data_reg[1][4]\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \vol_data_reg[2][4]\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \vol_data_reg[3][4]\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \vol_data_reg[4][4]\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \vol_data_reg[5][4]\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \vol_data_reg[6][4]\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \vol_data_reg[7][4]\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    EQ_dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    \EQ_dout_reg[23]_0\ : in STD_LOGIC;
    EQ_select : in STD_LOGIC_VECTOR ( 2 downto 0 );
    clk : in STD_LOGIC;
    EQ_en : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 55 downto 0 );
    reset_n : in STD_LOGIC;
    EQ_vol_down : in STD_LOGIC;
    EQ_vol_up : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of EQ_EQ_stage : entity is "EQ_stage";
end EQ_EQ_stage;

architecture STRUCTURE of EQ_EQ_stage is
  signal EQ_dout0 : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \EQ_dout[15]_i_1_n_0\ : STD_LOGIC;
  signal \EQ_dout[23]_i_1_n_0\ : STD_LOGIC;
  signal \EQ_dout[31]_i_1_n_0\ : STD_LOGIC;
  signal \EQ_dout[38]_i_2_n_0\ : STD_LOGIC;
  signal \EQ_dout[39]_i_1_n_0\ : STD_LOGIC;
  signal \EQ_dout[47]_i_1_n_0\ : STD_LOGIC;
  signal \EQ_dout[54]_i_2_n_0\ : STD_LOGIC;
  signal \EQ_dout[55]_i_1_n_0\ : STD_LOGIC;
  signal \EQ_dout[63]_i_1_n_0\ : STD_LOGIC;
  signal \EQ_dout[63]_i_3_n_0\ : STD_LOGIC;
  signal \EQ_dout[7]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_current_state_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_onehot_current_state_reg_n_0_[3]\ : STD_LOGIC;
  signal \FSM_onehot_current_state_reg_n_0_[4]\ : STD_LOGIC;
  signal \ROM0.U_ROM_i_7_n_3\ : STD_LOGIC;
  signal ROM_out : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal U_Mult_n_32 : STD_LOGIC;
  signal U_Mult_n_33 : STD_LOGIC;
  signal U_Mult_n_34 : STD_LOGIC;
  signal U_Mult_n_35 : STD_LOGIC;
  signal U_Mult_n_36 : STD_LOGIC;
  signal U_Mult_n_37 : STD_LOGIC;
  signal U_Mult_n_38 : STD_LOGIC;
  signal U_Mult_n_39 : STD_LOGIC;
  signal U_Mult_n_40 : STD_LOGIC;
  signal U_Mult_n_41 : STD_LOGIC;
  signal U_Mult_n_42 : STD_LOGIC;
  signal U_Mult_n_43 : STD_LOGIC;
  signal U_Mult_n_44 : STD_LOGIC;
  signal U_Mult_n_45 : STD_LOGIC;
  signal U_Mult_n_46 : STD_LOGIC;
  signal U_Mult_n_47 : STD_LOGIC;
  signal U_Mult_n_48 : STD_LOGIC;
  signal U_Mult_n_49 : STD_LOGIC;
  signal U_Mult_n_50 : STD_LOGIC;
  signal U_Mult_n_51 : STD_LOGIC;
  signal U_Mult_n_52 : STD_LOGIC;
  signal U_Mult_n_53 : STD_LOGIC;
  signal U_Mult_n_54 : STD_LOGIC;
  signal U_Mult_n_55 : STD_LOGIC;
  signal U_Mult_n_58 : STD_LOGIC;
  signal U_Mult_n_59 : STD_LOGIC;
  signal U_Mult_n_60 : STD_LOGIC;
  signal U_Mult_n_61 : STD_LOGIC;
  signal U_Mult_n_62 : STD_LOGIC;
  signal U_Mult_n_63 : STD_LOGIC;
  signal U_Mult_n_64 : STD_LOGIC;
  signal U_Mult_n_65 : STD_LOGIC;
  signal U_Mult_n_66 : STD_LOGIC;
  signal U_Mult_n_67 : STD_LOGIC;
  signal U_Mult_n_68 : STD_LOGIC;
  signal U_Mult_n_69 : STD_LOGIC;
  signal U_Mult_n_70 : STD_LOGIC;
  signal U_Mult_n_71 : STD_LOGIC;
  signal U_Mult_n_72 : STD_LOGIC;
  signal U_Mult_n_73 : STD_LOGIC;
  signal U_Mult_n_74 : STD_LOGIC;
  signal U_Mult_n_75 : STD_LOGIC;
  signal U_Mult_n_76 : STD_LOGIC;
  signal U_Mult_n_77 : STD_LOGIC;
  signal U_Mult_n_78 : STD_LOGIC;
  signal U_Mult_n_79 : STD_LOGIC;
  signal U_Mult_n_80 : STD_LOGIC;
  signal U_Mult_n_81 : STD_LOGIC;
  signal U_Mult_n_82 : STD_LOGIC;
  signal U_Mult_n_83 : STD_LOGIC;
  signal U_Mult_n_84 : STD_LOGIC;
  signal U_Mult_n_85 : STD_LOGIC;
  signal U_Mult_n_86 : STD_LOGIC;
  signal U_Mult_n_87 : STD_LOGIC;
  signal U_Mult_n_88 : STD_LOGIC;
  signal Volume_coef : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Volume_data1 : STD_LOGIC_VECTOR ( 5 downto 4 );
  signal a : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal a1_carry_i_2_n_0 : STD_LOGIC;
  signal a1_carry_i_3_n_0 : STD_LOGIC;
  signal a1_carry_i_4_n_0 : STD_LOGIC;
  signal a1_carry_i_5_n_0 : STD_LOGIC;
  signal a1_carry_n_0 : STD_LOGIC;
  signal a1_carry_n_1 : STD_LOGIC;
  signal a1_carry_n_2 : STD_LOGIC;
  signal a1_carry_n_3 : STD_LOGIC;
  signal a1_carry_n_4 : STD_LOGIC;
  signal a1_carry_n_5 : STD_LOGIC;
  signal a1_carry_n_6 : STD_LOGIC;
  signal a1_carry_n_7 : STD_LOGIC;
  signal \accu[0]_i_1_n_0\ : STD_LOGIC;
  signal accu_clr : STD_LOGIC;
  signal accu_reg : STD_LOGIC_VECTOR ( 27 downto 12 );
  signal \accu_reg_n_0_[0]\ : STD_LOGIC;
  signal \accu_reg_n_0_[10]\ : STD_LOGIC;
  signal \accu_reg_n_0_[11]\ : STD_LOGIC;
  signal \accu_reg_n_0_[1]\ : STD_LOGIC;
  signal \accu_reg_n_0_[2]\ : STD_LOGIC;
  signal \accu_reg_n_0_[3]\ : STD_LOGIC;
  signal \accu_reg_n_0_[4]\ : STD_LOGIC;
  signal \accu_reg_n_0_[5]\ : STD_LOGIC;
  signal \accu_reg_n_0_[6]\ : STD_LOGIC;
  signal \accu_reg_n_0_[7]\ : STD_LOGIC;
  signal \accu_reg_n_0_[8]\ : STD_LOGIC;
  signal \accu_reg_n_0_[9]\ : STD_LOGIC;
  signal cnt_channel_inc : STD_LOGIC;
  signal \counter_channel[2]_i_1_n_0\ : STD_LOGIC;
  signal \counter_channel[3]_i_1_n_0\ : STD_LOGIC;
  signal \counter_channel[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_channel[5]_i_1_n_0\ : STD_LOGIC;
  signal \counter_channel[5]_i_2_n_0\ : STD_LOGIC;
  signal \counter_channel[6]_i_2_n_0\ : STD_LOGIC;
  signal \counter_channel[7]_i_1_n_0\ : STD_LOGIC;
  signal \counter_channel[7]_i_2_n_0\ : STD_LOGIC;
  signal \counter_channel[7]_i_3_n_0\ : STD_LOGIC;
  signal \counter_channel_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \data_in_reg_n_0_[0]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[10]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[11]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[12]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[13]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[14]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[15]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[16]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[17]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[18]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[19]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[1]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[20]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[21]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[22]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[23]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[24]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[25]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[26]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[27]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[28]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[29]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[2]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[30]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[31]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[32]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[33]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[34]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[35]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[36]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[37]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[38]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[39]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[3]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[40]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[41]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[42]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[43]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[44]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[45]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[46]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[47]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[48]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[49]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[4]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[50]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[51]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[52]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[53]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[54]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[55]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[5]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[6]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[7]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[8]\ : STD_LOGIC;
  signal \data_in_reg_n_0_[9]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \^reset_n_0\ : STD_LOGIC;
  signal \NLW_ROM0.U_ROM_i_7_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_ROM0.U_ROM_i_7_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \EQ_dout[38]_i_2\ : label is "soft_lutpair37";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[0]\ : label is "eq_reset:000001,eq_pipe2:001000,eq_pipe3:010000,eq_store:100000,eq_pipe1:000100,eq_idle:000010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[1]\ : label is "eq_reset:000001,eq_pipe2:001000,eq_pipe3:010000,eq_store:100000,eq_pipe1:000100,eq_idle:000010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[2]\ : label is "eq_reset:000001,eq_pipe2:001000,eq_pipe3:010000,eq_store:100000,eq_pipe1:000100,eq_idle:000010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[3]\ : label is "eq_reset:000001,eq_pipe2:001000,eq_pipe3:010000,eq_store:100000,eq_pipe1:000100,eq_idle:000010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[4]\ : label is "eq_reset:000001,eq_pipe2:001000,eq_pipe3:010000,eq_store:100000,eq_pipe1:000100,eq_idle:000010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[5]\ : label is "eq_reset:000001,eq_pipe2:001000,eq_pipe3:010000,eq_store:100000,eq_pipe1:000100,eq_idle:000010";
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of \ROM0.U_ROM\ : label is "ROM_32_16bit,dist_mem_gen_v8_0_12,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of \ROM0.U_ROM\ : label is "yes";
  attribute x_core_info : string;
  attribute x_core_info of \ROM0.U_ROM\ : label is "dist_mem_gen_v8_0_12,Vivado 2018.3";
  attribute SOFT_HLUTNM of \counter_channel[0]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \counter_channel[1]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \counter_channel[2]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \counter_channel[3]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \counter_channel[5]_i_2\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \counter_channel[6]_i_2\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \counter_channel[7]_i_2\ : label is "soft_lutpair36";
begin
  reset_n_0 <= \^reset_n_0\;
\EQ_dout[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => U_Mult_n_59,
      I1 => \counter_channel_reg__0\(1),
      I2 => cnt_channel_inc,
      I3 => Volume_data1(5),
      O => \EQ_dout[15]_i_1_n_0\
    );
\EQ_dout[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => Volume_data1(4),
      I1 => \counter_channel_reg__0\(0),
      I2 => cnt_channel_inc,
      I3 => Volume_data1(5),
      O => \EQ_dout[23]_i_1_n_0\
    );
\EQ_dout[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => \counter_channel_reg__0\(1),
      I1 => \counter_channel_reg__0\(0),
      I2 => cnt_channel_inc,
      I3 => \counter_channel_reg__0\(2),
      I4 => U_Mult_n_58,
      O => \EQ_dout[31]_i_1_n_0\
    );
\EQ_dout[38]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => U_Mult_n_58,
      I1 => \counter_channel_reg__0\(0),
      I2 => \counter_channel_reg__0\(1),
      O => \EQ_dout[38]_i_2_n_0\
    );
\EQ_dout[39]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \counter_channel_reg__0\(0),
      I1 => \counter_channel_reg__0\(1),
      I2 => Volume_data1(5),
      I3 => cnt_channel_inc,
      O => \EQ_dout[39]_i_1_n_0\
    );
\EQ_dout[47]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => U_Mult_n_59,
      I1 => \counter_channel_reg__0\(1),
      I2 => Volume_data1(5),
      I3 => cnt_channel_inc,
      O => \EQ_dout[47]_i_1_n_0\
    );
\EQ_dout[54]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \counter_channel_reg__0\(0),
      I1 => Volume_data1(4),
      O => \EQ_dout[54]_i_2_n_0\
    );
\EQ_dout[55]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => Volume_data1(4),
      I1 => \counter_channel_reg__0\(0),
      I2 => Volume_data1(5),
      I3 => cnt_channel_inc,
      O => \EQ_dout[55]_i_1_n_0\
    );
\EQ_dout[63]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \counter_channel_reg__0\(0),
      I1 => \counter_channel_reg__0\(1),
      I2 => Volume_data1(5),
      I3 => cnt_channel_inc,
      O => \EQ_dout[63]_i_1_n_0\
    );
\EQ_dout[63]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reset_n,
      O => \EQ_dout[63]_i_3_n_0\
    );
\EQ_dout[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F00010"
    )
        port map (
      I0 => \counter_channel_reg__0\(1),
      I1 => \counter_channel_reg__0\(0),
      I2 => cnt_channel_inc,
      I3 => \counter_channel_reg__0\(2),
      I4 => U_Mult_n_58,
      O => \EQ_dout[7]_i_1_n_0\
    );
\EQ_dout_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[7]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_55,
      Q => EQ_dout(0)
    );
\EQ_dout_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[15]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(42),
      Q => EQ_dout(10)
    );
\EQ_dout_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[15]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(43),
      Q => EQ_dout(11)
    );
\EQ_dout_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[15]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(44),
      Q => EQ_dout(12)
    );
\EQ_dout_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[15]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(45),
      Q => EQ_dout(13)
    );
\EQ_dout_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[15]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(46),
      Q => EQ_dout(14)
    );
\EQ_dout_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[15]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(47),
      Q => EQ_dout(15)
    );
\EQ_dout_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[23]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_47,
      Q => EQ_dout(16)
    );
\EQ_dout_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[23]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_46,
      Q => EQ_dout(17)
    );
\EQ_dout_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[23]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_45,
      Q => EQ_dout(18)
    );
\EQ_dout_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[23]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_44,
      Q => EQ_dout(19)
    );
\EQ_dout_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[7]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_54,
      Q => EQ_dout(1)
    );
\EQ_dout_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[23]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_43,
      Q => EQ_dout(20)
    );
\EQ_dout_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[23]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_42,
      Q => EQ_dout(21)
    );
\EQ_dout_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[23]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_41,
      Q => EQ_dout(22)
    );
\EQ_dout_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[23]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_40,
      Q => EQ_dout(23)
    );
\EQ_dout_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[31]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_39,
      Q => EQ_dout(24)
    );
\EQ_dout_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[31]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_38,
      Q => EQ_dout(25)
    );
\EQ_dout_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[31]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_37,
      Q => EQ_dout(26)
    );
\EQ_dout_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[31]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_36,
      Q => EQ_dout(27)
    );
\EQ_dout_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[31]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_35,
      Q => EQ_dout(28)
    );
\EQ_dout_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[31]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_34,
      Q => EQ_dout(29)
    );
\EQ_dout_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[7]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_53,
      Q => EQ_dout(2)
    );
\EQ_dout_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[31]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_33,
      Q => EQ_dout(30)
    );
\EQ_dout_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[31]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_32,
      Q => EQ_dout(31)
    );
\EQ_dout_reg[32]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[39]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(32),
      Q => EQ_dout(32)
    );
\EQ_dout_reg[33]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[39]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(33),
      Q => EQ_dout(33)
    );
\EQ_dout_reg[34]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[39]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(34),
      Q => EQ_dout(34)
    );
\EQ_dout_reg[35]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[39]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(35),
      Q => EQ_dout(35)
    );
\EQ_dout_reg[36]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[39]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(36),
      Q => EQ_dout(36)
    );
\EQ_dout_reg[37]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[39]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(37),
      Q => EQ_dout(37)
    );
\EQ_dout_reg[38]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[39]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(38),
      Q => EQ_dout(38)
    );
\EQ_dout_reg[39]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[39]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(39),
      Q => EQ_dout(39)
    );
\EQ_dout_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[7]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_52,
      Q => EQ_dout(3)
    );
\EQ_dout_reg[40]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[47]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(40),
      Q => EQ_dout(40)
    );
\EQ_dout_reg[41]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[47]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(41),
      Q => EQ_dout(41)
    );
\EQ_dout_reg[42]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[47]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(42),
      Q => EQ_dout(42)
    );
\EQ_dout_reg[43]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[47]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(43),
      Q => EQ_dout(43)
    );
\EQ_dout_reg[44]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[47]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(44),
      Q => EQ_dout(44)
    );
\EQ_dout_reg[45]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[47]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(45),
      Q => EQ_dout(45)
    );
\EQ_dout_reg[46]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[47]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(46),
      Q => EQ_dout(46)
    );
\EQ_dout_reg[47]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[47]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(47),
      Q => EQ_dout(47)
    );
\EQ_dout_reg[48]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[55]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(48),
      Q => EQ_dout(48)
    );
\EQ_dout_reg[49]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[55]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(49),
      Q => EQ_dout(49)
    );
\EQ_dout_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[7]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_51,
      Q => EQ_dout(4)
    );
\EQ_dout_reg[50]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[55]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(50),
      Q => EQ_dout(50)
    );
\EQ_dout_reg[51]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[55]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(51),
      Q => EQ_dout(51)
    );
\EQ_dout_reg[52]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[55]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(52),
      Q => EQ_dout(52)
    );
\EQ_dout_reg[53]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[55]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(53),
      Q => EQ_dout(53)
    );
\EQ_dout_reg[54]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[55]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(54),
      Q => EQ_dout(54)
    );
\EQ_dout_reg[55]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[55]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(55),
      Q => EQ_dout(55)
    );
\EQ_dout_reg[56]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[63]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(56),
      Q => EQ_dout(56)
    );
\EQ_dout_reg[57]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[63]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(57),
      Q => EQ_dout(57)
    );
\EQ_dout_reg[58]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[63]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(58),
      Q => EQ_dout(58)
    );
\EQ_dout_reg[59]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[63]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(59),
      Q => EQ_dout(59)
    );
\EQ_dout_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[7]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_50,
      Q => EQ_dout(5)
    );
\EQ_dout_reg[60]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[63]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(60),
      Q => EQ_dout(60)
    );
\EQ_dout_reg[61]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[63]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(61),
      Q => EQ_dout(61)
    );
\EQ_dout_reg[62]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[63]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(62),
      Q => EQ_dout(62)
    );
\EQ_dout_reg[63]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[63]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(63),
      Q => EQ_dout(63)
    );
\EQ_dout_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[7]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_49,
      Q => EQ_dout(6)
    );
\EQ_dout_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[7]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => U_Mult_n_48,
      Q => EQ_dout(7)
    );
\EQ_dout_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[15]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(40),
      Q => EQ_dout(8)
    );
\EQ_dout_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \EQ_dout[15]_i_1_n_0\,
      CLR => \EQ_dout[63]_i_3_n_0\,
      D => EQ_dout0(41),
      Q => EQ_dout(9)
    );
\FSM_onehot_current_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFAE"
    )
        port map (
      I0 => \EQ_dout[63]_i_1_n_0\,
      I1 => accu_clr,
      I2 => EQ_en,
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \FSM_onehot_current_state[1]_i_1_n_0\
    );
\FSM_onehot_current_state[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F444"
    )
        port map (
      I0 => U_Mult_n_60,
      I1 => cnt_channel_inc,
      I2 => EQ_en,
      I3 => accu_clr,
      O => \FSM_onehot_current_state[2]_i_1_n_0\
    );
\FSM_onehot_current_state[5]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reset_n,
      O => \^reset_n_0\
    );
\FSM_onehot_current_state_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => '0',
      PRE => \^reset_n_0\,
      Q => \FSM_onehot_current_state_reg_n_0_[0]\
    );
\FSM_onehot_current_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => \FSM_onehot_current_state[1]_i_1_n_0\,
      Q => accu_clr
    );
\FSM_onehot_current_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => \FSM_onehot_current_state[2]_i_1_n_0\,
      Q => \FSM_onehot_current_state_reg_n_0_[2]\
    );
\FSM_onehot_current_state_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => \FSM_onehot_current_state_reg_n_0_[2]\,
      Q => \FSM_onehot_current_state_reg_n_0_[3]\
    );
\FSM_onehot_current_state_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => \FSM_onehot_current_state_reg_n_0_[3]\,
      Q => \FSM_onehot_current_state_reg_n_0_[4]\
    );
\FSM_onehot_current_state_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => \FSM_onehot_current_state_reg_n_0_[4]\,
      Q => cnt_channel_inc
    );
\ROM0.U_ROM\: entity work.EQ_ROM_32_16bit
     port map (
      a(4 downto 0) => a(4 downto 0),
      spo(15 downto 0) => ROM_out(15 downto 0)
    );
\ROM0.U_ROM_i_7\: unisim.vcomponents.CARRY4
     port map (
      CI => a1_carry_n_0,
      CO(3 downto 1) => \NLW_ROM0.U_ROM_i_7_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \ROM0.U_ROM_i_7_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_ROM0.U_ROM_i_7_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"0001"
    );
U_EQ_volume_ctrl: entity work.EQ_EQ_volume_ctrl
     port map (
      CO(0) => \ROM0.U_ROM_i_7_n_3\,
      EQ_select(2 downto 0) => EQ_select(2 downto 0),
      EQ_vol_down => EQ_vol_down,
      EQ_vol_up => EQ_vol_up,
      O(3) => a1_carry_n_4,
      O(2) => a1_carry_n_5,
      O(1) => a1_carry_n_6,
      O(0) => a1_carry_n_7,
      Q(4 downto 0) => Q(4 downto 0),
      \ROM0.U_ROM_i_1_0\ => U_Mult_n_59,
      a(4 downto 0) => a(4 downto 0),
      clk => clk,
      reset_n => reset_n,
      \vol_data_reg[1][4]_0\(4 downto 0) => \vol_data_reg[1][4]\(4 downto 0),
      \vol_data_reg[2][4]_0\(4 downto 0) => \vol_data_reg[2][4]\(4 downto 0),
      \vol_data_reg[3][4]_0\(4 downto 0) => \vol_data_reg[3][4]\(4 downto 0),
      \vol_data_reg[4][4]_0\(4 downto 0) => \vol_data_reg[4][4]\(4 downto 0),
      \vol_data_reg[5][4]_0\(4 downto 0) => \vol_data_reg[5][4]\(4 downto 0),
      \vol_data_reg[6][4]_0\(4 downto 0) => \vol_data_reg[6][4]\(4 downto 0),
      \vol_data_reg[7][4]_0\(4 downto 0) => \vol_data_reg[7][4]\(4 downto 0)
    );
U_Mult: entity work.EQ_Multiplier
     port map (
      D(55 downto 24) => EQ_dout0(63 downto 32),
      D(23) => U_Mult_n_32,
      D(22) => U_Mult_n_33,
      D(21) => U_Mult_n_34,
      D(20) => U_Mult_n_35,
      D(19) => U_Mult_n_36,
      D(18) => U_Mult_n_37,
      D(17) => U_Mult_n_38,
      D(16) => U_Mult_n_39,
      D(15) => U_Mult_n_40,
      D(14) => U_Mult_n_41,
      D(13) => U_Mult_n_42,
      D(12) => U_Mult_n_43,
      D(11) => U_Mult_n_44,
      D(10) => U_Mult_n_45,
      D(9) => U_Mult_n_46,
      D(8) => U_Mult_n_47,
      D(7) => U_Mult_n_48,
      D(6) => U_Mult_n_49,
      D(5) => U_Mult_n_50,
      D(4) => U_Mult_n_51,
      D(3) => U_Mult_n_52,
      D(2) => U_Mult_n_53,
      D(1) => U_Mult_n_54,
      D(0) => U_Mult_n_55,
      \EQ_dout_reg[0]\ => \EQ_dout[38]_i_2_n_0\,
      \EQ_dout_reg[16]\ => \EQ_dout[54]_i_2_n_0\,
      \EQ_dout_reg[23]\ => \EQ_dout_reg[23]_0\,
      \EQ_dout_reg[56]\(7 downto 0) => \counter_channel_reg__0\(7 downto 0),
      \EQ_dout_reg[63]_i_5\(3) => U_Mult_n_65,
      \EQ_dout_reg[63]_i_5\(2) => U_Mult_n_66,
      \EQ_dout_reg[63]_i_5\(1) => U_Mult_n_67,
      \EQ_dout_reg[63]_i_5\(0) => U_Mult_n_68,
      \EQ_dout_reg[63]_i_5_0\(3) => U_Mult_n_69,
      \EQ_dout_reg[63]_i_5_0\(2) => U_Mult_n_70,
      \EQ_dout_reg[63]_i_5_0\(1) => U_Mult_n_71,
      \EQ_dout_reg[63]_i_5_0\(0) => U_Mult_n_72,
      \EQ_dout_reg[63]_i_5_1\(3) => U_Mult_n_73,
      \EQ_dout_reg[63]_i_5_1\(2) => U_Mult_n_74,
      \EQ_dout_reg[63]_i_5_1\(1) => U_Mult_n_75,
      \EQ_dout_reg[63]_i_5_1\(0) => U_Mult_n_76,
      \EQ_dout_reg[63]_i_5_2\(3) => U_Mult_n_77,
      \EQ_dout_reg[63]_i_5_2\(2) => U_Mult_n_78,
      \EQ_dout_reg[63]_i_5_2\(1) => U_Mult_n_79,
      \EQ_dout_reg[63]_i_5_2\(0) => U_Mult_n_80,
      \EQ_dout_reg[63]_i_5_3\(3) => U_Mult_n_81,
      \EQ_dout_reg[63]_i_5_3\(2) => U_Mult_n_82,
      \EQ_dout_reg[63]_i_5_3\(1) => U_Mult_n_83,
      \EQ_dout_reg[63]_i_5_3\(0) => U_Mult_n_84,
      \EQ_dout_reg[63]_i_5_4\(3) => U_Mult_n_85,
      \EQ_dout_reg[63]_i_5_4\(2) => U_Mult_n_86,
      \EQ_dout_reg[63]_i_5_4\(1) => U_Mult_n_87,
      \EQ_dout_reg[63]_i_5_4\(0) => U_Mult_n_88,
      O(3) => U_Mult_n_61,
      O(2) => U_Mult_n_62,
      O(1) => U_Mult_n_63,
      O(0) => U_Mult_n_64,
      Q(15 downto 0) => Volume_coef(15 downto 0),
      Volume_data1(1 downto 0) => Volume_data1(5 downto 4),
      accu_reg(15 downto 0) => accu_reg(27 downto 12),
      \accu_reg[11]_0\ => \accu_reg_n_0_[9]\,
      \accu_reg[11]_1\ => \accu_reg_n_0_[10]\,
      \accu_reg[11]_2\ => \accu_reg_n_0_[11]\,
      \accu_reg[3]\(0) => accu_clr,
      \accu_reg[3]_0\ => \accu_reg_n_0_[0]\,
      \accu_reg[3]_1\ => \accu_reg_n_0_[1]\,
      \accu_reg[3]_2\ => \accu_reg_n_0_[2]\,
      \accu_reg[3]_3\ => \accu_reg_n_0_[3]\,
      \accu_reg[7]_0\ => \accu_reg_n_0_[5]\,
      \accu_reg[7]_1\ => \accu_reg_n_0_[6]\,
      \accu_reg[7]_2\ => \accu_reg_n_0_[7]\,
      accu_reg_11_sp_1 => \accu_reg_n_0_[8]\,
      accu_reg_7_sp_1 => \accu_reg_n_0_[4]\,
      clk => clk,
      \counter_channel_reg[2]\ => U_Mult_n_60,
      \counter_channel_reg[3]\ => U_Mult_n_58,
      \counter_channel_reg[7]\ => U_Mult_n_59,
      mult_out_0(55) => \data_in_reg_n_0_[55]\,
      mult_out_0(54) => \data_in_reg_n_0_[54]\,
      mult_out_0(53) => \data_in_reg_n_0_[53]\,
      mult_out_0(52) => \data_in_reg_n_0_[52]\,
      mult_out_0(51) => \data_in_reg_n_0_[51]\,
      mult_out_0(50) => \data_in_reg_n_0_[50]\,
      mult_out_0(49) => \data_in_reg_n_0_[49]\,
      mult_out_0(48) => \data_in_reg_n_0_[48]\,
      mult_out_0(47) => \data_in_reg_n_0_[47]\,
      mult_out_0(46) => \data_in_reg_n_0_[46]\,
      mult_out_0(45) => \data_in_reg_n_0_[45]\,
      mult_out_0(44) => \data_in_reg_n_0_[44]\,
      mult_out_0(43) => \data_in_reg_n_0_[43]\,
      mult_out_0(42) => \data_in_reg_n_0_[42]\,
      mult_out_0(41) => \data_in_reg_n_0_[41]\,
      mult_out_0(40) => \data_in_reg_n_0_[40]\,
      mult_out_0(39) => \data_in_reg_n_0_[39]\,
      mult_out_0(38) => \data_in_reg_n_0_[38]\,
      mult_out_0(37) => \data_in_reg_n_0_[37]\,
      mult_out_0(36) => \data_in_reg_n_0_[36]\,
      mult_out_0(35) => \data_in_reg_n_0_[35]\,
      mult_out_0(34) => \data_in_reg_n_0_[34]\,
      mult_out_0(33) => \data_in_reg_n_0_[33]\,
      mult_out_0(32) => \data_in_reg_n_0_[32]\,
      mult_out_0(31) => \data_in_reg_n_0_[31]\,
      mult_out_0(30) => \data_in_reg_n_0_[30]\,
      mult_out_0(29) => \data_in_reg_n_0_[29]\,
      mult_out_0(28) => \data_in_reg_n_0_[28]\,
      mult_out_0(27) => \data_in_reg_n_0_[27]\,
      mult_out_0(26) => \data_in_reg_n_0_[26]\,
      mult_out_0(25) => \data_in_reg_n_0_[25]\,
      mult_out_0(24) => \data_in_reg_n_0_[24]\,
      mult_out_0(23) => \data_in_reg_n_0_[23]\,
      mult_out_0(22) => \data_in_reg_n_0_[22]\,
      mult_out_0(21) => \data_in_reg_n_0_[21]\,
      mult_out_0(20) => \data_in_reg_n_0_[20]\,
      mult_out_0(19) => \data_in_reg_n_0_[19]\,
      mult_out_0(18) => \data_in_reg_n_0_[18]\,
      mult_out_0(17) => \data_in_reg_n_0_[17]\,
      mult_out_0(16) => \data_in_reg_n_0_[16]\,
      mult_out_0(15) => \data_in_reg_n_0_[15]\,
      mult_out_0(14) => \data_in_reg_n_0_[14]\,
      mult_out_0(13) => \data_in_reg_n_0_[13]\,
      mult_out_0(12) => \data_in_reg_n_0_[12]\,
      mult_out_0(11) => \data_in_reg_n_0_[11]\,
      mult_out_0(10) => \data_in_reg_n_0_[10]\,
      mult_out_0(9) => \data_in_reg_n_0_[9]\,
      mult_out_0(8) => \data_in_reg_n_0_[8]\,
      mult_out_0(7) => \data_in_reg_n_0_[7]\,
      mult_out_0(6) => \data_in_reg_n_0_[6]\,
      mult_out_0(5) => \data_in_reg_n_0_[5]\,
      mult_out_0(4) => \data_in_reg_n_0_[4]\,
      mult_out_0(3) => \data_in_reg_n_0_[3]\,
      mult_out_0(2) => \data_in_reg_n_0_[2]\,
      mult_out_0(1) => \data_in_reg_n_0_[1]\,
      mult_out_0(0) => \data_in_reg_n_0_[0]\,
      reset_n => reset_n
    );
\Volume_coef_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => ROM_out(0),
      Q => Volume_coef(0)
    );
\Volume_coef_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => ROM_out(10),
      Q => Volume_coef(10)
    );
\Volume_coef_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => ROM_out(11),
      Q => Volume_coef(11)
    );
\Volume_coef_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => ROM_out(12),
      Q => Volume_coef(12)
    );
\Volume_coef_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => ROM_out(13),
      Q => Volume_coef(13)
    );
\Volume_coef_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => ROM_out(14),
      Q => Volume_coef(14)
    );
\Volume_coef_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => ROM_out(15),
      Q => Volume_coef(15)
    );
\Volume_coef_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => ROM_out(1),
      Q => Volume_coef(1)
    );
\Volume_coef_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => ROM_out(2),
      Q => Volume_coef(2)
    );
\Volume_coef_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => ROM_out(3),
      Q => Volume_coef(3)
    );
\Volume_coef_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => ROM_out(4),
      Q => Volume_coef(4)
    );
\Volume_coef_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => ROM_out(5),
      Q => Volume_coef(5)
    );
\Volume_coef_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => ROM_out(6),
      Q => Volume_coef(6)
    );
\Volume_coef_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => ROM_out(7),
      Q => Volume_coef(7)
    );
\Volume_coef_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => ROM_out(8),
      Q => Volume_coef(8)
    );
\Volume_coef_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_n_0\,
      D => ROM_out(9),
      Q => Volume_coef(9)
    );
a1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => a1_carry_n_0,
      CO(2) => a1_carry_n_1,
      CO(1) => a1_carry_n_2,
      CO(0) => a1_carry_n_3,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => Volume_data1(5),
      DI(0) => '0',
      O(3) => a1_carry_n_4,
      O(2) => a1_carry_n_5,
      O(1) => a1_carry_n_6,
      O(0) => a1_carry_n_7,
      S(3) => a1_carry_i_2_n_0,
      S(2) => a1_carry_i_3_n_0,
      S(1) => a1_carry_i_4_n_0,
      S(0) => a1_carry_i_5_n_0
    );
a1_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \counter_channel_reg__0\(2),
      I1 => \counter_channel_reg__0\(7),
      I2 => \counter_channel_reg__0\(6),
      I3 => \counter_channel_reg__0\(5),
      I4 => \counter_channel_reg__0\(4),
      I5 => \counter_channel_reg__0\(3),
      O => a1_carry_i_2_n_0
    );
a1_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \counter_channel_reg__0\(1),
      I1 => \counter_channel_reg__0\(7),
      I2 => \counter_channel_reg__0\(6),
      I3 => \counter_channel_reg__0\(5),
      I4 => \counter_channel_reg__0\(4),
      I5 => \counter_channel_reg__0\(3),
      O => a1_carry_i_3_n_0
    );
a1_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Volume_data1(5),
      I1 => U_Mult_n_59,
      O => a1_carry_i_4_n_0
    );
a1_carry_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \counter_channel_reg__0\(1),
      I1 => \counter_channel_reg__0\(7),
      I2 => \counter_channel_reg__0\(6),
      I3 => \counter_channel_reg__0\(5),
      I4 => \counter_channel_reg__0\(4),
      I5 => \counter_channel_reg__0\(3),
      O => a1_carry_i_5_n_0
    );
\accu[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAAAFFFFAAA8"
    )
        port map (
      I0 => cnt_channel_inc,
      I1 => \counter_channel_reg__0\(0),
      I2 => \counter_channel_reg__0\(1),
      I3 => \counter_channel_reg__0\(2),
      I4 => accu_clr,
      I5 => U_Mult_n_58,
      O => \accu[0]_i_1_n_0\
    );
\accu_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_64,
      Q => \accu_reg_n_0_[0]\
    );
\accu_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_70,
      Q => \accu_reg_n_0_[10]\
    );
\accu_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_69,
      Q => \accu_reg_n_0_[11]\
    );
\accu_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_76,
      Q => accu_reg(12)
    );
\accu_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_75,
      Q => accu_reg(13)
    );
\accu_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_74,
      Q => accu_reg(14)
    );
\accu_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_73,
      Q => accu_reg(15)
    );
\accu_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_80,
      Q => accu_reg(16)
    );
\accu_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_79,
      Q => accu_reg(17)
    );
\accu_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_78,
      Q => accu_reg(18)
    );
\accu_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_77,
      Q => accu_reg(19)
    );
\accu_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_63,
      Q => \accu_reg_n_0_[1]\
    );
\accu_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_84,
      Q => accu_reg(20)
    );
\accu_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_83,
      Q => accu_reg(21)
    );
\accu_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_82,
      Q => accu_reg(22)
    );
\accu_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_81,
      Q => accu_reg(23)
    );
\accu_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_88,
      Q => accu_reg(24)
    );
\accu_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_87,
      Q => accu_reg(25)
    );
\accu_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_86,
      Q => accu_reg(26)
    );
\accu_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_85,
      Q => accu_reg(27)
    );
\accu_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_62,
      Q => \accu_reg_n_0_[2]\
    );
\accu_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_61,
      Q => \accu_reg_n_0_[3]\
    );
\accu_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_68,
      Q => \accu_reg_n_0_[4]\
    );
\accu_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_67,
      Q => \accu_reg_n_0_[5]\
    );
\accu_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_66,
      Q => \accu_reg_n_0_[6]\
    );
\accu_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_65,
      Q => \accu_reg_n_0_[7]\
    );
\accu_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_72,
      Q => \accu_reg_n_0_[8]\
    );
\accu_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \accu[0]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => U_Mult_n_71,
      Q => \accu_reg_n_0_[9]\
    );
\counter_channel[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => accu_clr,
      I1 => \counter_channel_reg__0\(0),
      O => p_0_in(0)
    );
\counter_channel[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"06"
    )
        port map (
      I0 => \counter_channel_reg__0\(0),
      I1 => \counter_channel_reg__0\(1),
      I2 => accu_clr,
      O => p_0_in(1)
    );
\counter_channel[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1540"
    )
        port map (
      I0 => accu_clr,
      I1 => \counter_channel_reg__0\(1),
      I2 => \counter_channel_reg__0\(0),
      I3 => \counter_channel_reg__0\(2),
      O => \counter_channel[2]_i_1_n_0\
    );
\counter_channel[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"15554000"
    )
        port map (
      I0 => accu_clr,
      I1 => \counter_channel_reg__0\(0),
      I2 => \counter_channel_reg__0\(1),
      I3 => \counter_channel_reg__0\(2),
      I4 => \counter_channel_reg__0\(3),
      O => \counter_channel[3]_i_1_n_0\
    );
\counter_channel[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1555555540000000"
    )
        port map (
      I0 => accu_clr,
      I1 => \counter_channel_reg__0\(2),
      I2 => \counter_channel_reg__0\(1),
      I3 => \counter_channel_reg__0\(0),
      I4 => \counter_channel_reg__0\(3),
      I5 => \counter_channel_reg__0\(4),
      O => \counter_channel[4]_i_1_n_0\
    );
\counter_channel[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1555555540000000"
    )
        port map (
      I0 => accu_clr,
      I1 => \counter_channel_reg__0\(3),
      I2 => \counter_channel[5]_i_2_n_0\,
      I3 => \counter_channel_reg__0\(2),
      I4 => \counter_channel_reg__0\(4),
      I5 => \counter_channel_reg__0\(5),
      O => \counter_channel[5]_i_1_n_0\
    );
\counter_channel[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \counter_channel_reg__0\(1),
      I1 => \counter_channel_reg__0\(0),
      O => \counter_channel[5]_i_2_n_0\
    );
\counter_channel[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000007FFF8000"
    )
        port map (
      I0 => \counter_channel_reg__0\(4),
      I1 => \counter_channel[6]_i_2_n_0\,
      I2 => \counter_channel_reg__0\(3),
      I3 => \counter_channel_reg__0\(5),
      I4 => \counter_channel_reg__0\(6),
      I5 => accu_clr,
      O => p_0_in(6)
    );
\counter_channel[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \counter_channel_reg__0\(0),
      I1 => \counter_channel_reg__0\(1),
      I2 => \counter_channel_reg__0\(2),
      O => \counter_channel[6]_i_2_n_0\
    );
\counter_channel[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => cnt_channel_inc,
      I1 => accu_clr,
      O => \counter_channel[7]_i_1_n_0\
    );
\counter_channel[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1540"
    )
        port map (
      I0 => accu_clr,
      I1 => \counter_channel_reg__0\(6),
      I2 => \counter_channel[7]_i_3_n_0\,
      I3 => \counter_channel_reg__0\(7),
      O => \counter_channel[7]_i_2_n_0\
    );
\counter_channel[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \counter_channel_reg__0\(4),
      I1 => \counter_channel_reg__0\(2),
      I2 => \counter_channel_reg__0\(1),
      I3 => \counter_channel_reg__0\(0),
      I4 => \counter_channel_reg__0\(3),
      I5 => \counter_channel_reg__0\(5),
      O => \counter_channel[7]_i_3_n_0\
    );
\counter_channel_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \counter_channel[7]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => p_0_in(0),
      Q => \counter_channel_reg__0\(0)
    );
\counter_channel_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \counter_channel[7]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => p_0_in(1),
      Q => \counter_channel_reg__0\(1)
    );
\counter_channel_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \counter_channel[7]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => \counter_channel[2]_i_1_n_0\,
      Q => \counter_channel_reg__0\(2)
    );
\counter_channel_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \counter_channel[7]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => \counter_channel[3]_i_1_n_0\,
      Q => \counter_channel_reg__0\(3)
    );
\counter_channel_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \counter_channel[7]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => \counter_channel[4]_i_1_n_0\,
      Q => \counter_channel_reg__0\(4)
    );
\counter_channel_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \counter_channel[7]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => \counter_channel[5]_i_1_n_0\,
      Q => \counter_channel_reg__0\(5)
    );
\counter_channel_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \counter_channel[7]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => p_0_in(6),
      Q => \counter_channel_reg__0\(6)
    );
\counter_channel_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \counter_channel[7]_i_1_n_0\,
      CLR => \^reset_n_0\,
      D => \counter_channel[7]_i_2_n_0\,
      Q => \counter_channel_reg__0\(7)
    );
\data_in_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(0),
      Q => \data_in_reg_n_0_[0]\
    );
\data_in_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(10),
      Q => \data_in_reg_n_0_[10]\
    );
\data_in_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(11),
      Q => \data_in_reg_n_0_[11]\
    );
\data_in_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(12),
      Q => \data_in_reg_n_0_[12]\
    );
\data_in_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(13),
      Q => \data_in_reg_n_0_[13]\
    );
\data_in_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(14),
      Q => \data_in_reg_n_0_[14]\
    );
\data_in_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(15),
      Q => \data_in_reg_n_0_[15]\
    );
\data_in_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(16),
      Q => \data_in_reg_n_0_[16]\
    );
\data_in_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(17),
      Q => \data_in_reg_n_0_[17]\
    );
\data_in_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(18),
      Q => \data_in_reg_n_0_[18]\
    );
\data_in_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(19),
      Q => \data_in_reg_n_0_[19]\
    );
\data_in_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(1),
      Q => \data_in_reg_n_0_[1]\
    );
\data_in_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(20),
      Q => \data_in_reg_n_0_[20]\
    );
\data_in_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(21),
      Q => \data_in_reg_n_0_[21]\
    );
\data_in_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(22),
      Q => \data_in_reg_n_0_[22]\
    );
\data_in_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(23),
      Q => \data_in_reg_n_0_[23]\
    );
\data_in_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(24),
      Q => \data_in_reg_n_0_[24]\
    );
\data_in_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(25),
      Q => \data_in_reg_n_0_[25]\
    );
\data_in_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(26),
      Q => \data_in_reg_n_0_[26]\
    );
\data_in_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(27),
      Q => \data_in_reg_n_0_[27]\
    );
\data_in_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(28),
      Q => \data_in_reg_n_0_[28]\
    );
\data_in_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(29),
      Q => \data_in_reg_n_0_[29]\
    );
\data_in_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(2),
      Q => \data_in_reg_n_0_[2]\
    );
\data_in_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(30),
      Q => \data_in_reg_n_0_[30]\
    );
\data_in_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(31),
      Q => \data_in_reg_n_0_[31]\
    );
\data_in_reg[32]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(32),
      Q => \data_in_reg_n_0_[32]\
    );
\data_in_reg[33]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(33),
      Q => \data_in_reg_n_0_[33]\
    );
\data_in_reg[34]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(34),
      Q => \data_in_reg_n_0_[34]\
    );
\data_in_reg[35]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(35),
      Q => \data_in_reg_n_0_[35]\
    );
\data_in_reg[36]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(36),
      Q => \data_in_reg_n_0_[36]\
    );
\data_in_reg[37]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(37),
      Q => \data_in_reg_n_0_[37]\
    );
\data_in_reg[38]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(38),
      Q => \data_in_reg_n_0_[38]\
    );
\data_in_reg[39]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(39),
      Q => \data_in_reg_n_0_[39]\
    );
\data_in_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(3),
      Q => \data_in_reg_n_0_[3]\
    );
\data_in_reg[40]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(40),
      Q => \data_in_reg_n_0_[40]\
    );
\data_in_reg[41]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(41),
      Q => \data_in_reg_n_0_[41]\
    );
\data_in_reg[42]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(42),
      Q => \data_in_reg_n_0_[42]\
    );
\data_in_reg[43]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(43),
      Q => \data_in_reg_n_0_[43]\
    );
\data_in_reg[44]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(44),
      Q => \data_in_reg_n_0_[44]\
    );
\data_in_reg[45]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(45),
      Q => \data_in_reg_n_0_[45]\
    );
\data_in_reg[46]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(46),
      Q => \data_in_reg_n_0_[46]\
    );
\data_in_reg[47]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(47),
      Q => \data_in_reg_n_0_[47]\
    );
\data_in_reg[48]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(48),
      Q => \data_in_reg_n_0_[48]\
    );
\data_in_reg[49]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(49),
      Q => \data_in_reg_n_0_[49]\
    );
\data_in_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(4),
      Q => \data_in_reg_n_0_[4]\
    );
\data_in_reg[50]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(50),
      Q => \data_in_reg_n_0_[50]\
    );
\data_in_reg[51]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(51),
      Q => \data_in_reg_n_0_[51]\
    );
\data_in_reg[52]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(52),
      Q => \data_in_reg_n_0_[52]\
    );
\data_in_reg[53]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(53),
      Q => \data_in_reg_n_0_[53]\
    );
\data_in_reg[54]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(54),
      Q => \data_in_reg_n_0_[54]\
    );
\data_in_reg[55]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(55),
      Q => \data_in_reg_n_0_[55]\
    );
\data_in_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(5),
      Q => \data_in_reg_n_0_[5]\
    );
\data_in_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(6),
      Q => \data_in_reg_n_0_[6]\
    );
\data_in_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(7),
      Q => \data_in_reg_n_0_[7]\
    );
\data_in_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(8),
      Q => \data_in_reg_n_0_[8]\
    );
\data_in_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => EQ_en,
      CLR => \^reset_n_0\,
      D => D(9),
      Q => \data_in_reg_n_0_[9]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity EQ_EQ_EQ_stage_0_0 is
  port (
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    EQ_en : in STD_LOGIC;
    EQ_select : in STD_LOGIC_VECTOR ( 3 downto 0 );
    EQ_vol_up : in STD_LOGIC;
    EQ_vol_down : in STD_LOGIC;
    EQ_din_band : in STD_LOGIC_VECTOR ( 47 downto 0 );
    EQ_din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    EQ_dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    EQ_level_dout : out STD_LOGIC_VECTOR ( 39 downto 0 )
  );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of EQ_EQ_EQ_stage_0_0 : entity is "EQ_EQ_stage_0_0,EQ_stage,{}";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of EQ_EQ_EQ_stage_0_0 : entity is "EQ_EQ_stage_0_0";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of EQ_EQ_EQ_stage_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of EQ_EQ_EQ_stage_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of EQ_EQ_EQ_stage_0_0 : entity is "EQ_stage,Vivado 2018.3";
end EQ_EQ_EQ_stage_0_0;

architecture STRUCTURE of EQ_EQ_EQ_stage_0_0 is
  signal \EQ_dout_reg[63]_i_5_n_0\ : STD_LOGIC;
  signal U0_n_0 : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 108000000, PHASE 0.000, CLK_DOMAIN EQ_clk, INSERT_VIP 0";
  attribute x_interface_info of reset_n : signal is "xilinx.com:signal:reset:1.0 reset_n RST";
  attribute x_interface_parameter of reset_n : signal is "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
\EQ_dout_reg[63]_i_5\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => U0_n_0,
      D => '1',
      Q => \EQ_dout_reg[63]_i_5_n_0\
    );
U0: entity work.EQ_EQ_stage
     port map (
      D(55 downto 8) => EQ_din_band(47 downto 0),
      D(7 downto 0) => EQ_din(7 downto 0),
      EQ_dout(63 downto 0) => EQ_dout(63 downto 0),
      \EQ_dout_reg[23]_0\ => \EQ_dout_reg[63]_i_5_n_0\,
      EQ_en => EQ_en,
      EQ_select(2 downto 0) => EQ_select(2 downto 0),
      EQ_vol_down => EQ_vol_down,
      EQ_vol_up => EQ_vol_up,
      Q(4 downto 0) => EQ_level_dout(4 downto 0),
      clk => clk,
      reset_n => reset_n,
      reset_n_0 => U0_n_0,
      \vol_data_reg[1][4]\(4 downto 0) => EQ_level_dout(9 downto 5),
      \vol_data_reg[2][4]\(4 downto 0) => EQ_level_dout(14 downto 10),
      \vol_data_reg[3][4]\(4 downto 0) => EQ_level_dout(19 downto 15),
      \vol_data_reg[4][4]\(4 downto 0) => EQ_level_dout(24 downto 20),
      \vol_data_reg[5][4]\(4 downto 0) => EQ_level_dout(29 downto 25),
      \vol_data_reg[6][4]\(4 downto 0) => EQ_level_dout(34 downto 30),
      \vol_data_reg[7][4]\(4 downto 0) => EQ_level_dout(39 downto 35)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity EQ is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of EQ : entity is true;
  attribute hw_handoff : string;
  attribute hw_handoff of EQ : entity is "EQ.hwdef";
end EQ;

architecture STRUCTURE of EQ is
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of EQ_stage_0 : label is "EQ_EQ_stage_0_0,EQ_stage,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of EQ_stage_0 : label is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of EQ_stage_0 : label is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of EQ_stage_0 : label is "EQ_stage,Vivado 2018.3";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN EQ_clk, FREQ_HZ 108000000, INSERT_VIP 0, PHASE 0.000";
  attribute x_interface_info of reset_n : signal is "xilinx.com:signal:reset:1.0 RST.RESET_N RST";
  attribute x_interface_parameter of reset_n : signal is "XIL_INTERFACENAME RST.RESET_N, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
EQ_stage_0: entity work.EQ_EQ_EQ_stage_0_0
     port map (
      EQ_din(7 downto 0) => EQ_din(7 downto 0),
      EQ_din_band(47 downto 0) => EQ_din_band(47 downto 0),
      EQ_dout(63 downto 0) => EQ_dout(63 downto 0),
      EQ_en => EQ_en,
      EQ_level_dout(39 downto 0) => EQ_level_dout(39 downto 0),
      EQ_select(3 downto 0) => EQ_select(3 downto 0),
      EQ_vol_down => EQ_vol_down,
      EQ_vol_up => EQ_vol_up,
      clk => clk,
      reset_n => reset_n
    );
end STRUCTURE;
