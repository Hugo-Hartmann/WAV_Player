-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FFT_Config_RAM.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2020-08-02
-- Last update: 2020-08-04
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Store FFT Config
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2020-08-02 1.0      Hugo HARTMANN   Creation
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
entity FFT_Config_RAM is
    port(
    
        ------- Clock and RESET ------------------
        clk                 : in  std_logic;                        -- clock
        reset_n             : in  std_logic;                        -- reset_n

        ------- Config interface -------------
        CFG_addr            : in  std_logic_vector(7 downto 0);
        CFG_write           : in  std_logic;
        CFG_din             : in  std_logic_vector(15 downto 0);

        ------- FFT out --------------------------
        FFT_rounds_nb       : out std_logic_vector(3 downto 0);
        FFT_sample_point    : out std_logic_vector(3 downto 0);
        FFT_end_point       : out std_logic_vector(3 downto 0)

        );
end FFT_Config_RAM;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of FFT_Config_RAM is

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal addr_d           : std_logic_vector(7 downto 0);
    signal write_d          : std_logic;
    signal din_d            : std_logic_vector(15 downto 0);
    signal spl_addr_valid   : std_logic;
    signal rd_addr_valid    : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SFFT PROCESS : P_reg_input
    -- Description : register all inputs
    --------------------------------------------------------------------------------
    P_reg_input : process(clk, reset_n)
    begin
        if(reset_n='0') then
            addr_d  <= (others => '0');
            write_d <= '0';
            din_d   <= (others => '0');
        elsif(rising_edge(clk)) then
            addr_d  <= CFG_addr;
            write_d <= CFG_write;
            din_d   <= CFG_din;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Check address ranges
    --------------------------------------------------------------------------------
    process(addr_d)
    begin
        if(addr_d(6 downto 0)="0110000") then
            spl_addr_valid  <= '1';
        else
            spl_addr_valid  <= '0';
        end if;

        if(addr_d(6 downto 0)="0110001") then
            rd_addr_valid  <= '1';
        else
            rd_addr_valid  <= '0';
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SFFT PROCESS : P_RAM_sampling
    -- Description : RAM emulation
    --------------------------------------------------------------------------------
    P_RAM_sampling : process(clk, reset_n)
    begin
        if(reset_n='0') then
            FFT_rounds_nb       <= X"B";
            FFT_sample_point    <= (others => '0');
            FFT_end_point       <= (others => '0');
        elsif(rising_edge(clk)) then
            if(spl_addr_valid='1' and write_d='1') then
                FFT_sample_point    <= din_d(3 downto 0);
                FFT_end_point       <= din_d(11 downto 8);
            end if;

            if(rd_addr_valid='1' and write_d='1') then
                FFT_rounds_nb   <= din_d(3 downto 0);
            end if;
        end if;
    end process;


end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------