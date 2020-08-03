-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : EQ_Config_RAM.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2020-07-27
-- Last update: 2020-08-03
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Store Equalizer config
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2020-07-27 1.0      Hugo HARTMANN   Creation
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
entity EQ_Config_RAM is
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- Config interface -----------------
        CFG_addr        : in  std_logic_vector(7 downto 0);
        CFG_write       : in  std_logic;
        CFG_din         : in  std_logic_vector(15 downto 0);

        ------- EQ Config out --------------------
        EQ_sel_dout     : out std_logic_vector(C_FIR_TOT downto 0);
        EQ_level_dout   : out std_logic_vector(C_FIR_TOT*5+4 downto 0)

        );
end EQ_Config_RAM;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of EQ_Config_RAM is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type vol_tab is array (0 to C_FIR_TOT) of std_logic_vector(4 downto 0);

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal EQ_level         : vol_tab;
    signal addr_d           : std_logic_vector(7 downto 0);
    signal write_d          : std_logic;
    signal din_d            : std_logic_vector(15 downto 0);
    signal sel_addr_valid   : std_logic;
    signal lvl_addr_valid   : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg_input
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
    -- Description : Check address range for level
    --------------------------------------------------------------------------------
    process(addr_d)
    begin
        if(addr_d(6 downto 4)="001") then
            lvl_addr_valid  <= '1';
        else
            lvl_addr_valid  <= '0';
        end if;

        if(addr_d(6 downto 4)="010") then
            sel_addr_valid  <= '1';
        else
            sel_addr_valid  <= '0';
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_RAM_lvl
    -- Description : RAM emulation
    --------------------------------------------------------------------------------
    P_RAM_lvl : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in EQ_level'range loop
                EQ_level(i)  <= std_logic_vector(to_unsigned(12, 5));
            end loop;
        elsif(rising_edge(clk)) then
            if(lvl_addr_valid='1' and write_d='1') then
                EQ_level(to_integer(unsigned(addr_d(3 downto 0))))  <= din_d(4 downto 0);
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg_output
    -- Description : Map data to output bus
    --------------------------------------------------------------------------------
    P_reg_output : process(clk, reset_n)
    begin
        if(reset_n='0') then
            EQ_level_dout <= (others => '0');
        elsif(rising_edge(clk)) then
            for i in EQ_level'range loop
                EQ_level_dout(i*5+4 downto i*5) <= EQ_level(i);
            end loop;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_RAM_sel
    -- Description : RAM emulation
    --------------------------------------------------------------------------------
    P_RAM_sel : process(clk, reset_n)
    begin
        if(reset_n='0') then
            EQ_sel_dout <= (0 => '0', EQ_sel_dout'high => '0', others => '1');
        elsif(rising_edge(clk)) then
            if(sel_addr_valid='1' and write_d='1') then
                EQ_sel_dout(to_integer(unsigned(addr_d(3 downto 0))))   <= din_d(0);
            end if;
        end if;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------