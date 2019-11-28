--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Wed Nov  6 16:21:44 2019
--Host        : L-1V1ZTY1 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target FIR.bd
--Design      : FIR
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FIR is
  port (
    FIR_din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    FIR_dout : out STD_LOGIC_VECTOR ( 47 downto 0 );
    FIR_start : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of FIR : entity is "FIR,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=FIR,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_BD}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of FIR : entity is "FIR.hwdef";
end FIR;

architecture STRUCTURE of FIR is
  component FIR_FIR_interface_0_0 is
  port (
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    FIR_dout : out STD_LOGIC_VECTOR ( 47 downto 0 );
    FIR_start : in STD_LOGIC;
    FIR_din : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component FIR_FIR_interface_0_0;
  signal FIR_din_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal FIR_interface_0_FIR_dout : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal FIR_start_1 : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal reset_n_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN FIR_clk, FREQ_HZ 108000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of reset_n : signal is "xilinx.com:signal:reset:1.0 RST.RESET_N RST";
  attribute X_INTERFACE_PARAMETER of reset_n : signal is "XIL_INTERFACENAME RST.RESET_N, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
  FIR_din_1(7 downto 0) <= FIR_din(7 downto 0);
  FIR_dout(47 downto 0) <= FIR_interface_0_FIR_dout(47 downto 0);
  FIR_start_1 <= FIR_start;
  clk_1 <= clk;
  reset_n_1 <= reset_n;
FIR_interface_0: component FIR_FIR_interface_0_0
     port map (
      FIR_din(7 downto 0) => FIR_din_1(7 downto 0),
      FIR_dout(47 downto 0) => FIR_interface_0_FIR_dout(47 downto 0),
      FIR_start => FIR_start_1,
      clk => clk_1,
      reset_n => reset_n_1
    );
end STRUCTURE;
