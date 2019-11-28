-------------------------------------------------------------------------------
--  This entire design, which includes all of the components and related files,
--  has been created and owned by : ELSYS DESIGN
--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : FFT_Wrapper_tb.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-27
-- Last update: 2019-11-27
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
            FFT_din         : in  std_logic_vector(7 downto 0);
            FFT_addr        : in  std_logic_vector(8 downto 0);
            FFT_new_sample  : in  std_logic;
            FFT_start       : in  std_logic;
            FFT_read        : in  std_logic;
            FFT_dout        : out std_logic_vector(15 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal clk              : std_logic := '0';
    signal reset_n          : std_logic;
    signal FFT_din          : std_logic_vector(7 downto 0);
    signal FFT_addr         : std_logic_vector(8 downto 0);
    signal FFT_new_sample   : std_logic;
    signal FFT_start        : std_logic;
    signal FFT_read         : std_logic;
    signal FFT_dout         : std_logic_vector(15 downto 0);

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
        FFT_addr        => FFT_addr,
        FFT_new_sample  => FFT_new_sample,
        FFT_start       => FFT_start,
        FFT_read        => FFT_read,
        FFT_dout        => FFT_dout);

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
        FFT_addr        <= (others => '0');
        FFT_start       <= '0';
        FFT_read        <= '0';
        FFT_new_sample  <= '0';
        wait for (11*C_DEMI_CLK);

        FFT_start       <= '1';
        wait for (2*C_DEMI_CLK);

        FFT_start       <= '0';
        FFT_new_sample  <= '1';
        wait for (2*C_DEMI_CLK);

        FFT_new_sample  <= '0';
        wait for (10000*C_DEMI_CLK);

        FFT_read    <= '1';
        for i in 0 to 256 loop
            FFT_addr    <= std_logic_vector(to_unsigned(i, FFT_addr'length));
            wait for (2*C_DEMI_CLK);
        end loop;

        wait for (15*C_DEMI_CLK);

        assert false severity failure;
    end process;

end A;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------