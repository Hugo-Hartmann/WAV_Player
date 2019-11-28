--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Thu Nov 28 13:58:47 2019
--Host        : L-1V1ZTY1 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target EQ_wrapper.bd
--Design      : EQ_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity EQ_wrapper is
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
end EQ_wrapper;

architecture STRUCTURE of EQ_wrapper is
  component EQ is
  port (
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    EQ_en : in STD_LOGIC;
    EQ_dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    EQ_vol_up : in STD_LOGIC;
    EQ_vol_down : in STD_LOGIC;
    EQ_level_dout : out STD_LOGIC_VECTOR ( 39 downto 0 );
    EQ_select : in STD_LOGIC_VECTOR ( 3 downto 0 );
    EQ_din_band : in STD_LOGIC_VECTOR ( 47 downto 0 );
    EQ_din : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component EQ;
begin
EQ_i: component EQ
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
