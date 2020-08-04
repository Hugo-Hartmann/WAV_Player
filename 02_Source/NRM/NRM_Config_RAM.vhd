-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : NRM_Config_RAM.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2020-08-04
-- Last update: 2020-08-04
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Store NRM Config
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2020-08-04 1.0      Hugo HARTMANN   Creation
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
entity NRM_Config_RAM is
    port(
    
        ------- Clock and RESET ------------------
        clk                 : in  std_logic;                        -- clock
        reset_n             : in  std_logic;                        -- reset_n

        ------- Config interface -------------
        CFG_addr            : in  std_logic_vector(7 downto 0);
        CFG_write           : in  std_logic;
        CFG_din             : in  std_logic_vector(15 downto 0);

        ------- NRM out --------------------------
        NRM_rounds_nb       : out std_logic_vector(3 downto 0)

        );
end NRM_Config_RAM;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of NRM_Config_RAM is

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal addr_d           : std_logic_vector(7 downto 0);
    signal write_d          : std_logic;
    signal din_d            : std_logic_vector(15 downto 0);
    signal rd_addr_valid    : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SNRM PROCESS : P_reg_input
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
        if(addr_d(6 downto 0)="1000000") then
            rd_addr_valid  <= '1';
        else
            rd_addr_valid  <= '0';
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SNRM PROCESS : P_RAM_sampling
    -- Description : RAM emulation
    --------------------------------------------------------------------------------
    P_RAM_sampling : process(clk, reset_n)
    begin
        if(reset_n='0') then
            NRM_rounds_nb       <= X"B";
        elsif(rising_edge(clk)) then
            if(rd_addr_valid='1' and write_d='1') then
                NRM_rounds_nb   <= din_d(3 downto 0);
            end if;
        end if;
    end process;


end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------