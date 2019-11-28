-- (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:FFT_Wrapper:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY FFT_512_FFT_Wrapper_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    reset_n : IN STD_LOGIC;
    FFT_din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    FFT_addr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    FFT_new_sample : IN STD_LOGIC;
    FFT_start : IN STD_LOGIC;
    FFT_read : IN STD_LOGIC;
    FFT_dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END FFT_512_FFT_Wrapper_0_0;

ARCHITECTURE FFT_512_FFT_Wrapper_0_0_arch OF FFT_512_FFT_Wrapper_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF FFT_512_FFT_Wrapper_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT FFT_Wrapper IS
    GENERIC (
      G_BEHAVIOURAL : BOOLEAN
    );
    PORT (
      clk : IN STD_LOGIC;
      reset_n : IN STD_LOGIC;
      FFT_din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      FFT_addr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      FFT_new_sample : IN STD_LOGIC;
      FFT_start : IN STD_LOGIC;
      FFT_read : IN STD_LOGIC;
      FFT_dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
  END COMPONENT FFT_Wrapper;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF FFT_512_FFT_Wrapper_0_0_arch: ARCHITECTURE IS "FFT_Wrapper,Vivado 2018.3";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF FFT_512_FFT_Wrapper_0_0_arch : ARCHITECTURE IS "FFT_512_FFT_Wrapper_0_0,FFT_Wrapper,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF FFT_512_FFT_Wrapper_0_0_arch: ARCHITECTURE IS "FFT_512_FFT_Wrapper_0_0,FFT_Wrapper,{x_ipProduct=Vivado 2018.3,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=FFT_Wrapper,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,G_BEHAVIOURAL=false}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF FFT_512_FFT_Wrapper_0_0_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF reset_n: SIGNAL IS "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF reset_n: SIGNAL IS "xilinx.com:signal:reset:1.0 reset_n RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 108000000, PHASE 0.000, CLK_DOMAIN FFT_512_clk, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : FFT_Wrapper
    GENERIC MAP (
      G_BEHAVIOURAL => false
    )
    PORT MAP (
      clk => clk,
      reset_n => reset_n,
      FFT_din => FFT_din,
      FFT_addr => FFT_addr,
      FFT_new_sample => FFT_new_sample,
      FFT_start => FFT_start,
      FFT_read => FFT_read,
      FFT_dout => FFT_dout
    );
END FFT_512_FFT_Wrapper_0_0_arch;
