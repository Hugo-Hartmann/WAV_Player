-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : EQ_Wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2020-07-27
-- Last update: 2020-07-27
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Wrapper for Equalizer bloc
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2020-07-27  1.0      Hugo HARTMANN   Creation
-------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- LIBRARIES DECLARATION
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_VHDL;
use lib_VHDL.TYPE_Pkg.all;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
entity EQ_Wrapper is
    generic(
        G_LEFT_CHANNEL : boolean := true
        );
    port(
        ------- Clock and reset -----------------
        clk             : in  std_logic;
        reset_n         : in  std_logic;

        ------- Volume control data -------------
        EQ_addr         : in  std_logic_vector(7 downto 0);
        EQ_write        : in  std_logic;
        EQ_level_din    : in  std_logic_vector(15 downto 0);

        ------- EQ control ----------------------
        EQ_en           : in  std_logic;
        
        ------- EQ data inputs ------------------
        EQ_din_band     : in  std_logic_vector(C_FIR_MAX*16+15 downto 0);
        EQ_din          : in  std_logic_vector(15 downto 0);

        ------- EQ data outpus ------------------
        EQ_dout         : out std_logic_vector((C_FIR_MAX+2)*16+15 downto 0);
        EQ_level_dout   : out std_logic_vector((C_FIR_MAX+2)*5+4 downto 0)

        );
end EQ_Wrapper;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of EQ_Wrapper is

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATION
    --------------------------------------------------------------------------------
    component EQ_stage is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            EQ_en           : in  std_logic;
            EQ_din_band     : in  std_logic_vector(C_FIR_MAX*16+15 downto 0);
            EQ_din          : in  std_logic_vector(15 downto 0);
            EQ_level        : in  std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
            EQ_dout         : out std_logic_vector((C_FIR_MAX+2)*16+15 downto 0)
            );
    end component;

    component EQ_volume_RAM is
        generic(
            G_LEFT_CHANNEL : boolean := true
            );
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            EQ_addr         : in  std_logic_vector(7 downto 0);
            EQ_write        : in  std_logic;
            EQ_din          : in  std_logic_vector(15 downto 0);
            EQ_level_dout   : out std_logic_vector((C_FIR_MAX+2)*5+4 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal EQ_level_net : std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_EQ_stage
    -- Description: 6 Channel audio equalizer
    ----------------------------------------------------------------
    U_EQ_stage : EQ_stage port map(
        clk             => clk,
        reset_n         => reset_n,
        EQ_en           => EQ_en,
        EQ_din_band     => EQ_din_band,
        EQ_din          => EQ_din,
        EQ_level        => EQ_level_net,
        EQ_dout         => EQ_dout);

    ----------------------------------------------------------------
    -- INSTANCE : U_EQ_volume_RAM
    -- Description: Store volume levels
    ----------------------------------------------------------------
    U_EQ_volume_RAM : EQ_volume_RAM generic map(
        G_LEFT_CHANNEL  => G_LEFT_CHANNEL)
    port map(
        clk             => clk,
        reset_n         => reset_n,
        EQ_addr         => EQ_addr,
        EQ_write        => EQ_write,
        EQ_din          => EQ_level_din,
        EQ_level_dout   => EQ_level_net);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : EQ_level_net
    --------------------------------------------------------------------------------
    EQ_level_dout   <= EQ_level_net;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------