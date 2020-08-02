-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : EQ_Wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2020-07-27
-- Last update: 2020-08-02
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
    port(
        ------- Clock and reset -----------------
        clk             : in  std_logic;
        reset_n         : in  std_logic;

        ------- Volume control data -------------
        EQ_addr         : in  std_logic_vector(7 downto 0);
        EQ_write        : in  std_logic;
        EQ_level_din    : in  std_logic_vector(15 downto 0);

        ------- EQ control ----------------------
        EQ_start        : in  std_logic;
        EQ_done         : out std_logic;

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
    component EQ_Config_RAM is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            EQ_addr         : in  std_logic_vector(7 downto 0);
            EQ_write        : in  std_logic;
            EQ_din          : in  std_logic_vector(15 downto 0);
            EQ_sel_dout     : out std_logic_vector(7 downto 0);
            EQ_level_dout   : out std_logic_vector((C_FIR_MAX+2)*5+4 downto 0)
            );
    end component;

    component EQ_FSM is
        port(
            clk         : in  std_logic;
            reset_n     : in  std_logic;
            EQ_start    : in  std_logic;
            EQ_UAL_done : in  std_logic;
            EQ_select   : out std_logic_vector(3 downto 0);
            EQ_en       : out std_logic;
            EQ_clear    : out std_logic;
            EQ_done     : out std_logic
            );
    end component;

    component EQ_UAL is
        port(
            clk         : in  std_logic;
            reset_n     : in  std_logic;
            EQ_en       : in  std_logic;
            EQ_select   : in  std_logic_vector(3 downto 0);
            EQ_clear    : in  std_logic;
            EQ_UAL_done : out std_logic;
            EQ_din_band : in  std_logic_vector(C_FIR_MAX*16+15 downto 0);
            EQ_din      : in  std_logic_vector(15 downto 0);
            EQ_level    : in  std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
            EQ_chan_sel : in  std_logic_vector(7 downto 0);
            EQ_dout     : out std_logic_vector((C_FIR_MAX+2)*16+15 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal EQ_level_net : std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
    signal EQ_UAL_done  : std_logic;
    signal EQ_clear     : std_logic;
    signal EQ_en        : std_logic;
    signal EQ_select    : std_logic_vector(3 downto 0);
    signal EQ_sel_dout  : std_logic_vector(7 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_EQ_Config_RAM
    -- Description: Store volume levels
    ----------------------------------------------------------------
    U_EQ_Config_RAM : EQ_Config_RAM port map(
        clk             => clk,
        reset_n         => reset_n,
        EQ_addr         => EQ_addr,
        EQ_write        => EQ_write,
        EQ_din          => EQ_level_din,
        EQ_sel_dout     => EQ_sel_dout,
        EQ_level_dout   => EQ_level_net);

    ----------------------------------------------------------------
    -- INSTANCE : U_EQ_FSM
    -- Description: Channel audio equalizer FSM
    ----------------------------------------------------------------
    U_EQ_FSM : EQ_FSM port map(
        clk         => clk,
        reset_n     => reset_n,
        EQ_start    => EQ_start,
        EQ_UAL_done => EQ_UAL_done,
        EQ_select   => EQ_select,
        EQ_en       => EQ_en,
        EQ_clear    => EQ_clear,
        EQ_done     => EQ_done);

    ----------------------------------------------------------------
    -- INSTANCE : U_EQ_UAL
    -- Description: UAL for equalizer (Multiplier + Accumulator)
    ----------------------------------------------------------------
    U_EQ_UAL : EQ_UAL port map(
        clk         => clk,
        reset_n     => reset_n,
        EQ_en       => EQ_en,
        EQ_select   => EQ_select,
        EQ_clear    => EQ_clear,
        EQ_UAL_done => EQ_UAL_done,
        EQ_din_band => EQ_din_band,
        EQ_din      => EQ_din,
        EQ_level    => EQ_level_net,
        EQ_chan_sel => EQ_sel_dout,
        EQ_dout     => EQ_dout);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : EQ_level_net
    --------------------------------------------------------------------------------
    EQ_level_dout   <= EQ_level_net;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------