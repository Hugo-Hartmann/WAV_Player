-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : NRM_Mapper_tb.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2020-08-04
-- Last update: 2020-08-04
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Stimuli for NRM_Wrapper
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2020-08-04  1.0      Hugo HARTMANN   Creation
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
entity NRM_Mapper_tb is
end NRM_Mapper_tb;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture A of NRM_Mapper_tb is

    --------------------------------------------------------------------------------
    -- CONSTANTS DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_DEMI_CLK         : time      := 2315 ps;
    constant C_TIMEOUT          : time      := 100 ms;
    constant G_OPERAND_SIZE     : integer   := 16;

    component NRM_Mapper is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            NRM_rounds_nb   : in  std_logic_vector(3 downto 0);
            NRM_en          : in  std_logic;
            NRM_din         : in  std_logic_vector(15 downto 0);
            NRM_dout        : out std_logic_vector(15 downto 0);
            NRM_addr_map    : out std_logic_vector(10 downto 0);
            NRM_addr_valid  : out std_logic
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal clk              : std_logic := '0';
    signal reset_n          : std_logic;
    signal NRM_rounds_nb    : std_logic_vector(3 downto 0);
    signal NRM_en           : std_logic;
    signal NRM_din          : std_logic_vector(15 downto 0);
    signal NRM_dout         : std_logic_vector(15 downto 0);
    signal NRM_addr_map     : std_logic_vector(10 downto 0);
    signal NRM_addr_valid   : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_NRM_Mapper
    -- Description: Correctly maps FFT addresses based on FFT number of points
    ----------------------------------------------------------------
    U_NRM_Mapper : NRM_Mapper port map(
        clk             => clk,
        reset_n         => reset_n,
        NRM_rounds_nb   => NRM_rounds_nb,
        NRM_en          => NRM_en,
        NRM_din         => NRM_din,
        NRM_dout        => NRM_dout,
        NRM_addr_map    => NRM_addr_map,
        NRM_addr_valid  => NRM_addr_valid);


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

        procedure Test_config(
            constant cfg : in  integer) is
        begin
            NRM_en          <= '1';
            NRM_din         <= X"AAAA";
            NRM_rounds_nb   <= std_logic_vector(to_unsigned(cfg, NRM_rounds_nb'length));
            Wait_cycles(2048);

            NRM_en          <= '0';
            NRM_din         <= X"0000";
            wait until(NRM_addr_valid='0');
            Wait_cycles(5);
        end Test_config;

    begin
        NRM_en          <= '0';
        NRM_din         <= X"0000";
        NRM_rounds_nb   <= X"0";
        Wait_cycles(5);
        wait until(rising_edge(clk));


        for i in 1 to 11 loop
            Test_config(i);
        end loop;

        Wait_cycles(10);

        assert false severity failure;
    end process;

end A;------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------