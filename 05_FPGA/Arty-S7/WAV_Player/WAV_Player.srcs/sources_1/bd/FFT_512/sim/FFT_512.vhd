--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Thu Nov 28 11:14:50 2019
--Host        : L-1V1ZTY1 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target FFT_512.bd
--Design      : FFT_512
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FFT_512 is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of FFT_512 : entity is "FFT_512,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=FFT_512,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_BD}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of FFT_512 : entity is "FFT_512.hwdef";
end FFT_512;

architecture STRUCTURE of FFT_512 is
  component FFT_512_FFT_Wrapper_0_0 is
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
  end component FFT_512_FFT_Wrapper_0_0;
  signal FFT_Wrapper_0_FFT_dout : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal FFT_addr_1 : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal FFT_din_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal FFT_new_sample_1 : STD_LOGIC;
  signal FFT_read_1 : STD_LOGIC;
  signal FFT_start_1 : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal reset_n_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN FFT_512_clk, FREQ_HZ 108000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of reset_n : signal is "xilinx.com:signal:reset:1.0 RST.RESET_N RST";
  attribute X_INTERFACE_PARAMETER of reset_n : signal is "XIL_INTERFACENAME RST.RESET_N, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
  FFT_addr_1(8 downto 0) <= FFT_addr(8 downto 0);
  FFT_din_1(7 downto 0) <= FFT_din(7 downto 0);
  FFT_dout(15 downto 0) <= FFT_Wrapper_0_FFT_dout(15 downto 0);
  FFT_new_sample_1 <= FFT_new_sample;
  FFT_read_1 <= FFT_read;
  FFT_start_1 <= FFT_start;
  clk_1 <= clk;
  reset_n_1 <= reset_n;
FFT_Wrapper_0: component FFT_512_FFT_Wrapper_0_0
     port map (
      FFT_addr(8 downto 0) => FFT_addr_1(8 downto 0),
      FFT_din(7 downto 0) => FFT_din_1(7 downto 0),
      FFT_dout(15 downto 0) => FFT_Wrapper_0_FFT_dout(15 downto 0),
      FFT_new_sample => FFT_new_sample_1,
      FFT_read => FFT_read_1,
      FFT_start => FFT_start_1,
      clk => clk_1,
      reset_n => reset_n_1
    );
end STRUCTURE;
