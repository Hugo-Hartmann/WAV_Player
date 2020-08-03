-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : VU_wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-12-31
-- Last update: 2020-08-03
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Stimuli of VU metre
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-12-31  1.0      Hugo HARTMANN   Creation
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
entity VU_wrapper is
end VU_wrapper;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture A of VU_wrapper is

    --------------------------------------------------------------------------------
    -- CONSTANTS DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_DEMI_CLK_216     : time      := 2315 ps;
    constant C_TIMEOUT          : time      := 1 ms;

    component VU_metre is
        port(
            clk         : in  std_logic;
            reset_n     : in  std_logic;
            VU_start    : in  std_logic;
            VU_din      : in  std_logic_vector(C_FIR_TOT*16+15 downto 0);
            VU_dout     : out std_logic_vector(C_FIR_TOT*5+4 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal clk_216  : std_logic := '0';
    signal reset_n  : std_logic;
    signal VU_start : std_logic;
    signal VU_din   : std_logic_vector(C_FIR_TOT*16+15 downto 0);
    signal VU_dout  : std_logic_vector(C_FIR_TOT*5+4 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_VU_metre
    -- Description: 2048 element VU-metre
    ----------------------------------------------------------------
    U_VU_metre : VU_metre port map(
        clk         => clk_216,
        reset_n     => reset_n,
        VU_start    => VU_start,
        VU_din      => VU_din,
        VU_dout     => VU_dout);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_clock_gen_216
    -- Description : 216 MHz clock generator process
    --------------------------------------------------------------------------------
    P_clock_gen_216 : process(clk_216)
    begin
        clk_216 <= not(clk_216) after C_DEMI_CLK_216;   -- Clock generation
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Reset creation
    --------------------------------------------------------------------------------
    reset_n         <= '0' , '1'    after (3*C_DEMI_CLK_216);

    VU_din  <= X"7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF";

    P_scenario : process
    begin
        wait for(8400*C_DEMI_CLK_216);

        VU_start    <= '1';
        wait for(2*C_DEMI_CLK_216);

        VU_start    <= '0';
        wait for(8400*C_DEMI_CLK_216);

        assert false severity failure;

    end process;

end A;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------