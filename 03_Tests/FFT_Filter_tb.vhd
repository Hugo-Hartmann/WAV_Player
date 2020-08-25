-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FFT_Filter_tb.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2020-08-24
-- Last update: 2020-08-25
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Stimuli for FFT_Filter
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2020-08-24  1.0      Hugo HARTMANN   Creation
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
entity FFT_Filter_tb is
end FFT_Filter_tb;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture A of FFT_Filter_tb is

    --------------------------------------------------------------------------------
    -- CONSTANTS DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_DEMI_CLK         : time      := 2315 ps;
    constant C_TIMEOUT          : time      := 500 us;

    component FFT_Filter is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            FFT_dout        : out std_logic_vector(15 downto 0);
            FFT_start       : in  std_logic;
            FFT_selection   : in  std_logic_vector(3 downto 0);
            FFT_done        : out std_logic;
            FFT_din         : in  std_logic_vector(15 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal clk              : std_logic := '0';
    signal reset_n          : std_logic;
    signal FFT_done         : std_logic;
    signal FFT_din          : std_logic_vector(15 downto 0);
    signal FFT_start        : std_logic;
    signal FFT_selection    : std_logic_vector(3 downto 0);
    signal FFT_dout         : std_logic_vector(15 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_FFT_Filter
    -- Description : FFT filter to cut unwanted frequencies before undersampling
    ----------------------------------------------------------------
    U_FFT_Filter : FFT_Filter port map(
        clk             => clk,
        reset_n         => reset_n,
        FFT_dout        => FFT_dout,
        FFT_start       => FFT_start,
        FFT_selection   => FFT_selection,
        FFT_done        => FFT_done,
        FFT_din         => FFT_din);


    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_clock_gen
    -- Description : 216 MHz clock generator process
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
    
        procedure Wait_cycles(
            constant cycles : in  integer) is
        begin
            wait for (cycles*2*C_DEMI_CLK);
        end Wait_cycles;
    
    begin
        FFT_din         <= X"7FFF";
        FFT_selection   <= "0001";
        FFT_start       <= '0';
        Wait_cycles(4);
        wait until(rising_edge(clk));

        FFT_start   <= '1';
        Wait_cycles(1);

        FFT_start   <= '0';

        wait until(FFT_done='1');
        Wait_cycles(10);

        assert false severity failure;
    end process;

end A;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------