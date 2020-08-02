-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : Crossbar.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2020-08-02
-- Last update: 2020-08-02
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Mini crossbar unit
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2020-08-02  1.0      Hugo HARTMANN   Creation
-------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- LIBRARIES DECLARATION
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
entity Crossbar is
    port(

        ------- Clock and RESET ------------------
        clk                 : in  std_logic;                        -- clock
        reset_n             : in  std_logic;                        -- reset_n

        ------- Input interface ------------------
        CRS_addr_in         : in  std_logic_vector(7 downto 0);
        CRS_write_in        : in  std_logic;
        CRS_din             : in  std_logic_vector(15 downto 0);

        ------- Output interface ------------------
        CRS_addr_out        : out std_logic_vector(7 downto 0);
        CRS_write_left_out  : out std_logic;
        CRS_write_right_out : out std_logic;
        CRS_dout            : out std_logic_vector(15 downto 0)

        );
end Crossbar;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of Crossbar is

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_cross
    -- Description : Select inputs
    --------------------------------------------------------------------------------
    P_cross : process(reset_n, clk)
    begin
        if(reset_n='0') then
            CRS_addr_out        <= (others => '0');
            CRS_write_left_out  <= '0';
            CRS_write_right_out <= '0';
            CRS_dout            <= (others => '0');
        elsif(rising_edge(clk)) then
            CRS_addr_out    <= CRS_addr_in;
            CRS_dout        <= CRS_din;
            if(CRS_write_in='1') then
                if(CRS_addr_in(7)='1') then
                    CRS_write_left_out  <= '1';
                    CRS_write_right_out <= '0';
                else
                    CRS_write_left_out  <= '0';
                    CRS_write_right_out <= '1';
                end if;
            else
                CRS_write_left_out  <= '0';
                CRS_write_right_out <= '0';
            end if;
        end if;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------