-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : NRM_Wrapper_tb.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-27
-- Last update: 2019-12-09
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Stimuli for NRM_Wrapper
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
entity NRM_Wrapper_tb is
end NRM_Wrapper_tb;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture A of NRM_Wrapper_tb is

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

    component NRM_Wrapper is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            NRM_addrA_w     : in  std_logic_vector(8 downto 0);
            NRM_addrB_w     : in  std_logic_vector(8 downto 0);
            NRM_dinA_r      : in  std_logic_vector(15 downto 0);
            NRM_dinA_i      : in  std_logic_vector(15 downto 0);
            NRM_dinB_r      : in  std_logic_vector(15 downto 0);
            NRM_dinB_i      : in  std_logic_vector(15 downto 0);
            NRM_write       : in  std_logic;
            NRM_new_sample  : in  std_logic;
            NRM_start       : in  std_logic;
            NRM_read        : in  std_logic;
            NRM_addr_r      : in  std_logic_vector(8 downto 0);
            NRM_dout        : out std_logic_vector(15 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal clk              : std_logic := '0';
    signal reset_n          : std_logic;
    signal FFT_din          : std_logic_vector(7 downto 0);
    signal FFT_new_sample   : std_logic;
    signal FFT_addrA        : std_logic_vector(8 downto 0);
    signal FFT_addrB        : std_logic_vector(8 downto 0);
    signal FFT_doutA_r      : std_logic_vector(15 downto 0);
    signal FFT_doutA_i      : std_logic_vector(15 downto 0);
    signal FFT_doutB_r      : std_logic_vector(15 downto 0);
    signal FFT_doutB_i      : std_logic_vector(15 downto 0);
    signal FFT_write        : std_logic;
    signal FFT_done         : std_logic;
    signal NRM_start        : std_logic;
    signal NRM_read         : std_logic;
    signal NRM_addr         : std_logic_vector(8 downto 0);
    signal NRM_dout         : std_logic_vector(15 downto 0);
    signal NRM_new_sample   : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_NRM_Wrapper
    -- Description: NRM_Wrapper for custom NRM module
    ----------------------------------------------------------------
    U_NRM_Wrapper : NRM_Wrapper port map(
        clk             => clk,
        reset_n         => reset_n,
        NRM_addrA_w     => FFT_addrA,
        NRM_addrB_w     => FFT_addrB,
        NRM_dinA_r      => FFT_doutA_r,
        NRM_dinA_i      => FFT_doutA_i,
        NRM_dinB_r      => FFT_doutB_r,
        NRM_dinB_i      => FFT_doutB_i,
        NRM_write       => FFT_write,
        NRM_new_sample  => NRM_new_sample,
        NRM_start       => NRM_start,
        NRM_read        => NRM_read,
        NRM_addr_r      => NRM_addr,
        NRM_dout        => NRM_dout);


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
        NRM_new_sample  <= '0';
        NRM_start       <= '0';
        NRM_read        <= '0';
        NRM_addr        <= (others => '0');
        wait for (11*C_DEMI_CLK);

        NRM_start       <= '1';
        wait for (2*C_DEMI_CLK);

        NRM_new_sample  <= '1';
        NRM_start       <= '0';
        wait for (2*C_DEMI_CLK);

        NRM_new_sample  <= '0';
        FFT_new_sample  <= '1';
        wait for (2*C_DEMI_CLK);

        FFT_new_sample  <= '0';
        wait for (2*C_DEMI_CLK);

        wait until(FFT_done='1');
        wait for (2*C_DEMI_CLK);

        NRM_new_sample  <= '1';
        wait for (2*C_DEMI_CLK);

        NRM_new_sample  <= '0';
        wait for (1200*C_DEMI_CLK);

        NRM_read    <= '1';
        for i in 0 to 256 loop
            NRM_addr    <= std_logic_vector(to_unsigned(i, NRM_addr'length));
            wait for (2*C_DEMI_CLK);
        end loop;

        wait for (15*C_DEMI_CLK);

        assert false severity failure;
    end process;

end A;------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------