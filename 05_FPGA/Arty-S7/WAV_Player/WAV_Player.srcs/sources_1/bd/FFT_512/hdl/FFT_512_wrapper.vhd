--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Thu Nov 28 11:14:50 2019
--Host        : L-1V1ZTY1 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target FFT_512_wrapper.bd
--Design      : FFT_512_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FFT_512_wrapper is
  port (
    FFT_addr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    FFT_din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    FFT_dout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    FFT_new_sample : in STD_LOGIC;
    FFT_read : in STD_LOGIC;
    FFT_start : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC
  );
end FFT_512_wrapper;

architecture STRUCTURE of FFT_512_wrapper is
  component FFT_512 is
  port (
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    FFT_din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    FFT_addr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    FFT_new_sample : in STD_LOGIC;
    FFT_start : in STD_LOGIC;
    FFT_read : in STD_LOGIC;
    FFT_dout : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component FFT_512;
begin
FFT_512_i: component FFT_512
     port map (
      FFT_addr(8 downto 0) => FFT_addr(8 downto 0),
      FFT_din(7 downto 0) => FFT_din(7 downto 0),
      FFT_dout(15 downto 0) => FFT_dout(15 downto 0),
      FFT_new_sample => FFT_new_sample,
      FFT_read => FFT_read,
      FFT_start => FFT_start,
      clk => clk,
      reset_n => reset_n
    );
end STRUCTURE;
