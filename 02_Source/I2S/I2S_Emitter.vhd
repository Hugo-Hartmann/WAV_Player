-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : I2S_Emitter.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-12-12
-- Last update: 2019-12-17
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: I2S Emitter for interface with Pmod module
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-12-12  1.0      Hugo HARTMANN   Creation
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
entity I2S_Emitter is
    port(

        ------- Clock and RESET ------------------
        clk         : in  std_logic;                        -- clock
        reset_n     : in  std_logic;                        -- reset_n

        ------- Audio in -----------------------
        Audio_in    : in  std_logic_vector(23 downto 0);

        ------- Audio out -----------------------
        Audio_out   : out std_logic;

        ------- I2S interface --------------------
        sclk        : in  std_logic;
        sclk_toggle : in  std_logic;
        lrck_toggle : in  std_logic

        );
end I2S_Emitter;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of I2S_Emitter is

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal dout : std_logic_vector(24 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin


    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_serial
    -- Description : Serialize data
    --------------------------------------------------------------------------------
    P_serial : process(clk, reset_n)
    begin
        if(reset_n='0') then
            dout    <= (others => '0');
        elsif(rising_edge(clk)) then
            if(lrck_toggle='1') then
                dout    <= '0' & Audio_in;
            elsif(sclk_toggle='1' and sclk='0') then
                dout    <= dout(dout'high-1 downto 0) & '0';
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Output assignation
    --------------------------------------------------------------------------------
    Audio_out   <= dout(dout'high);

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------