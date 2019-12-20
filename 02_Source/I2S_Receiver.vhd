-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : I2S_Receiver.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-12-12
-- Last update: 2019-12-17
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: I2S Receiver for interface with Pmod module
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
entity I2S_Receiver is
    port(

        ------- Clock and RESET ------------------
        clk         : in  std_logic;                        -- clock
        reset_n     : in  std_logic;                        -- reset_n

        ------- Audio in -----------------------
        Audio_in    : in  std_logic;

        ------- Audio out -----------------------
        Audio_out   : out std_logic_vector(23 downto 0);

        ------- I2S interface --------------------
        done        : out std_logic;
        sclk        : in  std_logic;
        sclk_toggle : in  std_logic;
        lrck_toggle : in  std_logic

        );
end I2S_Receiver;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of I2S_Receiver is

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal din          : std_logic_vector(24 downto 0);
    signal bit_counter  : unsigned(7 downto 0);
    signal cnt_end      : std_logic;
    signal cnt_last     : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter
    -- Description : Counter for data bits
    --------------------------------------------------------------------------------
    P_counter : process(clk, reset_n)
    begin
        if(reset_n='0') then
            bit_counter    <= to_unsigned(25, bit_counter'length);
        elsif(rising_edge(clk)) then
            if(lrck_toggle='1') then
                bit_counter <= to_unsigned(25, bit_counter'length);
            elsif(sclk_toggle='1' and sclk='1' and cnt_end='0') then
                bit_counter <= bit_counter - 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : cnt_end
    --------------------------------------------------------------------------------
    cnt_end     <= '1' when(bit_counter=0) else '0';
    cnt_last    <= '1' when(bit_counter=1) else '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_serial
    -- Description : De-serialize data
    --------------------------------------------------------------------------------
    P_serial : process(clk, reset_n)
    begin
        if(reset_n='0') then
            din <= (others => '0');
        elsif(rising_edge(clk)) then
            if(sclk_toggle='1' and sclk='1' and cnt_end='0') then
                din    <= din(din'high-1 downto 0) & Audio_in;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Output assignation
    --------------------------------------------------------------------------------
    Audio_out   <= din(din'high-1 downto 0); -- first bit registered is not data

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_done
    -- Description : 
    --------------------------------------------------------------------------------
    P_done : process(clk, reset_n)
    begin
        if(reset_n='0') then
            done    <= '0';
        elsif(rising_edge(clk)) then
            if(sclk_toggle='1' and sclk='1' and cnt_last='1') then
                done    <= '1';
            else
                done    <= '0';
            end if;
        end if;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------