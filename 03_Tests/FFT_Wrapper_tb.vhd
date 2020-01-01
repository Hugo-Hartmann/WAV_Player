-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FFT_Wrapper_tb.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-27
-- Last update: 2020-01-01
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Stimuli for FFT_Wrapper
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-11-27  1.0      Hugo HARTMANN   Creation
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
entity FFT_Wrapper_tb is
end FFT_Wrapper_tb;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture A of FFT_Wrapper_tb is

    --------------------------------------------------------------------------------
    -- CONSTANTS DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_DEMI_CLK         : time      := 4630 ps;
    constant C_TIMEOUT          : time      := 100 ms;
    constant G_OPERAND_SIZE     : integer   := 16;

    component FFT_Wrapper is
        generic(
            G_BEHAVIOURAL   : boolean := false
            );
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            FFT_din         : in  std_logic_vector(15 downto 0);
            FFT_new_sample  : in  std_logic;
            FFT_addrA       : out std_logic_vector(8 downto 0);
            FFT_addrB       : out std_logic_vector(8 downto 0);
            FFT_doutA_r     : out std_logic_vector(15 downto 0);
            FFT_doutA_i     : out std_logic_vector(15 downto 0);
            FFT_doutB_r     : out std_logic_vector(15 downto 0);
            FFT_doutB_i     : out std_logic_vector(15 downto 0);
            FFT_write       : out std_logic;
            FFT_done        : out std_logic
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal clk              : std_logic := '0';
    signal reset_n          : std_logic;
    signal FFT_din          : std_logic_vector(15 downto 0);
    signal FFT_new_sample   : std_logic;
    signal FFT_addrA        : std_logic_vector(8 downto 0);
    signal FFT_addrB        : std_logic_vector(8 downto 0);
    signal FFT_doutA_r      : std_logic_vector(15 downto 0);
    signal FFT_doutA_i      : std_logic_vector(15 downto 0);
    signal FFT_doutB_r      : std_logic_vector(15 downto 0);
    signal FFT_doutB_i      : std_logic_vector(15 downto 0);
    signal FFT_write        : std_logic;
    signal FFT_done         : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_FFT_Wrapper
    -- Description: FFT_Wrapper for custom FFT module
    ----------------------------------------------------------------
    U_FFT_Wrapper : FFT_Wrapper port map(
        clk             => clk,
        reset_n         => reset_n,
        FFT_din         => FFT_din,
        FFT_new_sample  => FFT_new_sample,
        FFT_addrA       => FFT_addrA,
        FFT_addrB       => FFT_addrB,
        FFT_doutA_r     => FFT_doutA_r,
        FFT_doutA_i     => FFT_doutA_i,
        FFT_doutB_r     => FFT_doutB_r,
        FFT_doutB_i     => FFT_doutB_i,
        FFT_write       => FFT_write,
        FFT_done        => FFT_done);


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

    process
    begin
        FFT_din         <= (others => '0');
        FFT_new_sample  <= '0';
        wait for (11*C_DEMI_CLK);

        FFT_new_sample  <= '1';
        wait for (2*C_DEMI_CLK);

        FFT_new_sample  <= '0';
        wait for (5500*C_DEMI_CLK);

        wait for (15*C_DEMI_CLK);

        assert false severity failure;
    end process;

end A;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------