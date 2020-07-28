-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : EQ_volume_RAM.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2020-07-27
-- Last update: 2020-07-27
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Store volume levels
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
entity EQ_volume_RAM is
    generic(
        G_LEFT_CHANNEL : boolean := true
        );
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- Interface with UART --------
        EQ_addr         : in  std_logic_vector(7 downto 0);
        EQ_write        : in  std_logic;
        EQ_din          : in  std_logic_vector(15 downto 0);

        ------- EQ out --------------------------
        EQ_level_dout   : out std_logic_vector((C_FIR_MAX+2)*5+4 downto 0)

        );
end EQ_volume_RAM;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of EQ_volume_RAM is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type vol_tab is array (0 to C_FIR_MAX+2) of std_logic_vector(4 downto 0);

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal EQ_level     : vol_tab;
    signal EQ_addr_d    : std_logic_vector(7 downto 0);
    signal EQ_write_d   : std_logic;
    signal EQ_din_d     : std_logic_vector(15 downto 0);
    signal addr_valid   : std_logic;

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
            EQ_addr_d   <= (others => '0');
            EQ_write_d  <= '0';
            EQ_din_d    <= (others => '0');
        elsif(rising_edge(clk)) then
            EQ_addr_d   <= EQ_addr;
            EQ_write_d  <= EQ_write;
            EQ_din_d    <= EQ_din;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Check address range
    --------------------------------------------------------------------------------
    GEN_RIGHT_CHANNEL : if(G_LEFT_CHANNEL=false) generate
        process(EQ_addr_d)
        begin
            if(EQ_addr_d(7)='0' and EQ_addr_d(6)='1') then
                addr_valid  <= '1';
            else
                addr_valid  <= '0';
            end if;
        end process;
    end generate GEN_RIGHT_CHANNEL;
    
    GEN_LEFT_CHANNEL : if(G_LEFT_CHANNEL=true) generate
        process(EQ_addr_d)
        begin
            if(EQ_addr_d(7)='1' and EQ_addr_d(6)='1') then
                addr_valid  <= '1';
            else
                addr_valid  <= '0';
            end if;
        end process;
    end generate GEN_LEFT_CHANNEL;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_RAM
    -- Description : RAM emulation
    --------------------------------------------------------------------------------
    P_RAM : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in EQ_level'range loop
                EQ_level(i)  <= std_logic_vector(to_unsigned(12, 5));
            end loop;
        elsif(rising_edge(clk)) then
            if(addr_valid='1' and EQ_write_d='1') then
                EQ_level(to_integer(unsigned(EQ_addr_d(4 downto 0))))    <= EQ_din_d(4 downto 0);
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

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------