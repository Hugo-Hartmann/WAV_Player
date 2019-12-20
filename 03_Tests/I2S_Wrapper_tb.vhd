-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : I2S_Wrapper_tb.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-12-12
-- Last update: 2019-12-16
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Stimuli for I2S_Wrapper
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-12-12  1.0      Hugo HARTMANN   Creation
-------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- LIBRARIES DECLARATION
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_VHDL;
use lib_VHDL.all;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
entity I2S_Wrapper_tb is
end I2S_Wrapper_tb;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture A of I2S_Wrapper_tb is

    --------------------------------------------------------------------------------
    -- CONSTANTS DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_DEMI_CLK         : time      := 4445 ps;
    constant C_TIMEOUT          : time      := 100 ms;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component I2S_Wrapper is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            I2S_new_sample  : out std_logic;
            MISO_right      : in  std_logic_vector(15 downto 0);
            MISO_left       : in  std_logic_vector(15 downto 0);
            MOSI_right      : out std_logic_vector(15 downto 0);
            MOSI_left       : out std_logic_vector(15 downto 0);
            DIN             : in  std_logic;
            DOUT            : out std_logic;
            MCLK            : out std_logic;
            SCLK            : out std_logic;
            LRCK            : out std_logic
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal clk              : std_logic := '0';
    signal reset_n          : std_logic;
    signal I2S_new_sample : std_logic;
    signal MISO_right     : std_logic_vector(15 downto 0);
    signal MISO_left      : std_logic_vector(15 downto 0);
    signal MOSI_right     : std_logic_vector(15 downto 0);
    signal MOSI_left      : std_logic_vector(15 downto 0);
    signal DOUT           : std_logic;
    signal MCLK           : std_logic;
    signal SCLK           : std_logic;
    signal LRCK           : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_I2S_Wrapper_A
    -- Description: I2S wrapper for interface with Pmod module
    ----------------------------------------------------------------
    U_I2S_Wrapper_A : I2S_Wrapper port map(
        clk             => clk,
        reset_n         => reset_n,
        I2S_new_sample  => I2S_new_sample,
        MISO_right      => MISO_right,
        MISO_left       => MISO_left,
        MOSI_right      => MOSI_right,
        MOSI_left       => MOSI_left,
        DIN             => DOUT,
        DOUT            => DOUT,
        MCLK            => MCLK,
        SCLK            => SCLK,
        LRCK            => LRCK);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_clock_gen
    -- Description : 108 MHz clock generator process
    --------------------------------------------------------------------------------
    P_clk_gen : process(clk)
    begin
        clk <= not(clk) after C_DEMI_CLK;   -- Clock generation
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Reset creation
    --------------------------------------------------------------------------------
    reset_n         <= '0' , '1'    after (3*C_DEMI_CLK);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Inter connections
    --------------------------------------------------------------------------------
    MISO_right  <= std_logic_vector(unsigned(MOSI_right)+2);
    MISO_left   <= std_logic_vector(unsigned(MOSI_left)+8000);

    process
    begin

        wait for (100000*C_DEMI_CLK);

        assert false severity failure;
    end process;

end A;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------