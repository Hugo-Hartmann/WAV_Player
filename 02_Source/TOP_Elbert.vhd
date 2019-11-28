-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : TOP_elbert.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-23
-- Last update: 2019-10-24
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: TOP level
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
entity TOP is
    port(
        CLK         : in  std_logic;

        HSYNC_IN    : in  std_logic;
        VSYNC_IN    : in  std_logic;
        RED_IN      : in  std_logic_vector(2 downto 0);
        GREEN_IN    : in  std_logic_vector(2 downto 0);
        BLUE_IN     : in  std_logic_vector(1 downto 0);

        HSYNC_OUT   : out std_logic;
        VSYNC_OUT   : out std_logic;
        RED_OUT     : out std_logic_vector(2 downto 0);
        GREEN_OUT   : out std_logic_vector(2 downto 0);
        BLUE_OUT    : out std_logic_vector(1 downto 0);

        LED         : out std_logic;

        AUDIO_IN    : in  std_logic;

        AUDIO_OUT_L : out std_logic;
        AUDIO_OUT_R : out std_logic

        );
end TOP;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of TOP is

    signal counter_led  : unsigned(32 downto 0);
    signal LED_temp     : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    process(CLK)
    begin
        if(rising_edge(clk)) then
            if(counter_led=6000000) then
                counter_led <= (others => '0');
                LED_temp    <= NOT LED_temp;
            else
                counter_led <= counter_led+1;
            end if;
        end if;
    end process;
    
    LED         <= LED_temp;


    HSYNC_OUT   <= HSYNC_IN;
    VSYNC_OUT   <= VSYNC_IN;
    RED_OUT     <= RED_IN;
    GREEN_OUT   <= GREEN_IN;
    BLUE_OUT    <= BLUE_IN;

    AUDIO_OUT_R <= AUDIO_IN;
    AUDIO_OUT_L <= AUDIO_IN;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------