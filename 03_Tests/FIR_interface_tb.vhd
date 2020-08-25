-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FIR_interface_tb.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2020-08-25
-- Last update: 2020-08-25
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Stimuli for FIR_interface
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2020-08-25  1.0      Hugo HARTMANN   Creation
-------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- LIBRARIES DECLARATION
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_VHDL;
use lib_VHDL.all;
use lib_VHDL.TYPE_Pkg.all;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
entity FIR_interface_tb is
end FIR_interface_tb;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture A of FIR_interface_tb is

    --------------------------------------------------------------------------------
    -- CONSTANTS DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_DEMI_CLK         : time      := 2315 ps;
    constant C_TIMEOUT          : time      := 500 us;

    component FIR_interface is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            FIR_dout        : out std_logic_vector(C_FIR_MAX*16+15 downto 0);
            FIR_start       : in  std_logic;
            FIR_done        : out std_logic;
            FIR_din         : in  std_logic_vector(15 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal clk              : std_logic := '0';
    signal reset_n          : std_logic;
    signal FIR_done         : std_logic;
    signal FIR_din          : std_logic_vector(15 downto 0);
    signal FIR_start        : std_logic;
    signal FIR_dout         : std_logic_vector(C_FIR_MAX*16+15 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_FIR_interface
    -- Description: FIR wrapper for multiple FIR filters working on same data
    ----------------------------------------------------------------
    U_FIR_interface : FIR_interface port map(
        clk             => clk,
        reset_n         => reset_n,
        FIR_dout        => FIR_dout,
        FIR_start       => FIR_start,
        FIR_done        => FIR_done,
        FIR_din         => FIR_din);


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
        FIR_din         <= X"7FFF";
        FIR_start       <= '0';
        Wait_cycles(4);
        wait until(rising_edge(clk));

        FIR_start   <= '1';
        Wait_cycles(1);

        FIR_start   <= '0';

        wait until(FIR_done='1');
        Wait_cycles(10);

        assert false severity failure;
    end process;

end A;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------