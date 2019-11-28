-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FFT_UAL_tb.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-21
-- Last update: 2019-11-21
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Stimuli for FFT_UAL
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-11-21  1.0      Hugo HARTMANN   Creation
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
entity FFT_UAL_tb is
end FFT_UAL_tb;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture A of FFT_UAL_tb is

    --------------------------------------------------------------------------------
    -- CONSTANTS DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_DEMI_CLK         : time      := 4630 ps;
    constant C_TIMEOUT          : time      := 100 ms;
    constant G_OPERAND_SIZE     : integer   := 16;

    component FFT_UAL is
        generic(
            G_OPERAND_SIZE  : integer := 16
            );
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            FFT_doutA_r     : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_doutA_i     : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_doutB_r     : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_doutB_i     : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_en          : in  std_logic;
            FFT_done        : out std_logic;
            FFT_dinA_r      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_dinA_i      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_dinB_r      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_dinB_i      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_coef_r      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_coef_i      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal clk              : std_logic := '0';
    signal reset_n          : std_logic;
    signal FFT_doutA_r      : std_logic_vector(G_OPERAND_SIZE-1 downto 0);
    signal FFT_doutA_i      : std_logic_vector(G_OPERAND_SIZE-1 downto 0);
    signal FFT_doutB_r      : std_logic_vector(G_OPERAND_SIZE-1 downto 0);
    signal FFT_doutB_i      : std_logic_vector(G_OPERAND_SIZE-1 downto 0);
    signal FFT_en           : std_logic;
    signal FFT_done         : std_logic;
    signal FFT_dinA_r       : std_logic_vector(G_OPERAND_SIZE-1 downto 0);
    signal FFT_dinA_i       : std_logic_vector(G_OPERAND_SIZE-1 downto 0);
    signal FFT_dinB_r       : std_logic_vector(G_OPERAND_SIZE-1 downto 0);
    signal FFT_dinB_i       : std_logic_vector(G_OPERAND_SIZE-1 downto 0);
    signal FFT_coef_r       : std_logic_vector(G_OPERAND_SIZE-1 downto 0);
    signal FFT_coef_i       : std_logic_vector(G_OPERAND_SIZE-1 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_FFT_UAL
    -- Description: UAL for FFT 2x2 computation
    ----------------------------------------------------------------
    U_FFT_UAL : FFT_UAL generic map(
        G_OPERAND_SIZE  => G_OPERAND_SIZE)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        FFT_doutA_r => FFT_doutA_r,
        FFT_doutA_i => FFT_doutA_i,
        FFT_doutB_r => FFT_doutB_r,
        FFT_doutB_i => FFT_doutB_i,
        FFT_en      => FFT_en,
        FFT_done    => FFT_done,
        FFT_dinA_r  => FFT_dinA_r,
        FFT_dinA_i  => FFT_dinA_i,
        FFT_dinB_r  => FFT_dinB_r,
        FFT_dinB_i  => FFT_dinB_i,
        FFT_coef_r  => FFT_coef_r,
        FFT_coef_i  => FFT_coef_i);

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
        FFT_en      <= '0';
        FFT_dinA_r  <= (others => '0');
        FFT_dinA_i  <= (others => '0');
        FFT_dinB_r  <= (others => '0');
        FFT_dinB_i  <= (others => '0');
        FFT_coef_r  <= (others => '0');
        FFT_coef_i  <= (others => '0');
        wait for (10*C_DEMI_CLK);

        FFT_en      <= '1';
        FFT_dinA_r  <= std_logic_vector(to_unsigned(500, 16));
        FFT_dinA_i  <= std_logic_vector(to_unsigned(500, 16));
        FFT_dinB_r  <= std_logic_vector(to_unsigned(250, 16));
        FFT_dinB_i  <= std_logic_vector(to_unsigned(100, 16));
        FFT_coef_r  <= std_logic_vector(to_unsigned(32767, 16));
        FFT_coef_i  <= std_logic_vector(to_unsigned(16384, 16));
        wait for (2*C_DEMI_CLK);

        FFT_en      <= '0';
        FFT_dinA_r  <= (others => '0');
        FFT_dinA_i  <= (others => '0');
        FFT_dinB_r  <= (others => '0');
        FFT_dinB_i  <= (others => '0');
        FFT_coef_r  <= (others => '0');
        FFT_coef_i  <= (others => '0');
        wait for (10*C_DEMI_CLK);

        wait for (15*C_DEMI_CLK);

        assert false severity failure;
    end process;

end A;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------