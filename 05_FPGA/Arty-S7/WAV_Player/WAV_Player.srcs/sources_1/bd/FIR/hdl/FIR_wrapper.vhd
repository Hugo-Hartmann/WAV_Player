--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Wed Nov  6 16:21:44 2019
--Host        : L-1V1ZTY1 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target FIR_wrapper.bd
--Design      : FIR_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FIR_wrapper is
  port (
    FIR_din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    FIR_dout : out STD_LOGIC_VECTOR ( 47 downto 0 );
    FIR_start : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC
  );
end FIR_wrapper;

architecture STRUCTURE of FIR_wrapper is
  component FIR is
  port (
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    FIR_dout : out STD_LOGIC_VECTOR ( 47 downto 0 );
    FIR_start : in STD_LOGIC;
    FIR_din : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component FIR;
begin
FIR_i: component FIR
     port map (
      FIR_din(7 downto 0) => FIR_din(7 downto 0),
      FIR_dout(47 downto 0) => FIR_dout(47 downto 0),
      FIR_start => FIR_start,
      clk => clk,
      reset_n => reset_n
    );
end STRUCTURE;
