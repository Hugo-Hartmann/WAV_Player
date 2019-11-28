--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Wed Nov  6 15:26:31 2019
--Host        : L-1V1ZTY1 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target EQ.bd
--Design      : EQ
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of EQ : entity is "EQ,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=EQ,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_BD}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of EQ : entity is "EQ.hwdef";
end EQ;

architecture STRUCTURE of EQ is
  component EQ_EQ_stage_0_0 is
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
  end component EQ_EQ_stage_0_0;
  signal EQ_din_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal EQ_din_band_1 : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal EQ_en_1 : STD_LOGIC;
  signal EQ_select_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal EQ_stage_0_EQ_dout : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal EQ_stage_0_EQ_level_dout : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal EQ_vol_down_1 : STD_LOGIC;
  signal EQ_vol_up_1 : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal reset_n_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN EQ_clk, FREQ_HZ 108000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of reset_n : signal is "xilinx.com:signal:reset:1.0 RST.RESET_N RST";
  attribute X_INTERFACE_PARAMETER of reset_n : signal is "XIL_INTERFACENAME RST.RESET_N, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
  EQ_din_1(7 downto 0) <= EQ_din(7 downto 0);
  EQ_din_band_1(47 downto 0) <= EQ_din_band(47 downto 0);
  EQ_dout(63 downto 0) <= EQ_stage_0_EQ_dout(63 downto 0);
  EQ_en_1 <= EQ_en;
  EQ_level_dout(39 downto 0) <= EQ_stage_0_EQ_level_dout(39 downto 0);
  EQ_select_1(3 downto 0) <= EQ_select(3 downto 0);
  EQ_vol_down_1 <= EQ_vol_down;
  EQ_vol_up_1 <= EQ_vol_up;
  clk_1 <= clk;
  reset_n_1 <= reset_n;
EQ_stage_0: component EQ_EQ_stage_0_0
     port map (
      EQ_din(7 downto 0) => EQ_din_1(7 downto 0),
      EQ_din_band(47 downto 0) => EQ_din_band_1(47 downto 0),
      EQ_dout(63 downto 0) => EQ_stage_0_EQ_dout(63 downto 0),
      EQ_en => EQ_en_1,
      EQ_level_dout(39 downto 0) => EQ_stage_0_EQ_level_dout(39 downto 0),
      EQ_select(3 downto 0) => EQ_select_1(3 downto 0),
      EQ_vol_down => EQ_vol_down_1,
      EQ_vol_up => EQ_vol_up_1,
      clk => clk_1,
      reset_n => reset_n_1
    );
end STRUCTURE;
