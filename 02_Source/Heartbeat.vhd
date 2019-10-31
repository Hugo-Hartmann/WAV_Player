-------------------------------------------------------------------------------
--  This entire design, which includes all of the components and related files,
--  has been created and owned by : ELSYS DESIGN
--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : Heartbeat.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-23
-- Last update: 2019-10-24
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Blink a LED at 1Hz
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-10-23  1.0      Hugo HARTMANN   Creation
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
entity Hearbeat is
    generic(
        G_HALF_PERIOD     : INTEGER := 16#337F980#      -- heartbeat period
        );
    port(
    
        ------- Clock and RESET ------------------
        clk          : in  std_logic;                      -- clock
        reset_n      : in  std_logic;                      -- reset_n

        ------- Output ---------------------------
        LED          : out std_logic
        );
end Hearbeat;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of Hearbeat is

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal counter      : unsigned(31 downto 0);
    signal LED_state    : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_count
    -- Description : counter management
    --------------------------------------------------------------------------------
    P_count : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter    <= to_unsigned(G_HALF_PERIOD, counter'length);
            LED_state  <= '0';
        elsif(rising_edge(clk)) then
            if(counter=0) then
                LED_state    <= NOT(LED_state);
                counter      <= to_unsigned(G_HALF_PERIOD, counter'length);
            else
                counter      <= counter - 1;
            end if;
        end if;
    end process;
    
    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Output assignments
    --------------------------------------------------------------------------------
    LED         <= LED_state;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------