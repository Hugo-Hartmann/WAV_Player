-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FFT_Sampler.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2020-08-02
-- Last update: 2020-08-02
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Manage sampling for FFT module
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
entity FFT_Sampler is
    port(

        ------- Clock and RESET ------------------
        clk                 : in  std_logic;                        -- clock
        reset_n             : in  std_logic;                        -- reset_n

        ------- Audio interface ------------------
        FFT_din             : in  std_logic_vector(15 downto 0);
        FFT_new_sample      : in  std_logic;

        ------- Config interface -----------------
        FFT_sample_point    : in  std_logic_vector(3 downto 0);
        FFT_end_point       : in  std_logic_vector(3 downto 0);

        ------- FFT interface --------------------
        FFT_sample          : out std_logic_vector(15 downto 0);
        FFT_sample_valid    : out std_logic

        );
end FFT_Sampler;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of FFT_Sampler is

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal cnt_sample       : unsigned(3 downto 0);
    signal cnt_sample_end   : std_logic;
    signal cnt_sample_half  : std_logic;
    signal cnt_sample_zero  : std_logic;
    signal FFT_din_d        : std_logic_vector(15 downto 0);
    signal FFT_new_sample_d : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_input
    -- Description : Register inputs
    --------------------------------------------------------------------------------
    P_input : process(reset_n, clk)
    begin
        if(reset_n='0') then
            FFT_din_d           <= (others => '0');
            FFT_new_sample_d    <= '0';
        elsif(rising_edge(clk)) then
            FFT_din_d           <= FFT_din;
            FFT_new_sample_d    <= FFT_new_sample;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter_sample
    -- Description : Counter to let samples through
    --------------------------------------------------------------------------------
    P_counter_sample : process(reset_n, clk)
    begin
        if(reset_n='0') then
            cnt_sample  <= to_unsigned(0, cnt_sample'length);
        elsif(rising_edge(clk)) then
            if(FFT_new_sample_d='1') then
                if(cnt_sample_end='1') then
                    cnt_sample  <= to_unsigned(0, cnt_sample'length);
                else
                    cnt_sample  <= cnt_sample + 1;
                end if;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter_control
    -- Description : Control signals generated from cnt_sample
    --------------------------------------------------------------------------------
    P_counter_control : process(reset_n, clk)
    begin
        if(reset_n='0') then
            cnt_sample_end  <= '0';
            cnt_sample_zero <= '0';
            cnt_sample_half <= '0';
        elsif(rising_edge(clk)) then
            if(cnt_sample=0) then
                cnt_sample_zero <= '1';
            else
                cnt_sample_zero <= '0';
            end if;

            if(cnt_sample=unsigned(FFT_sample_point)) then
                cnt_sample_half <= '1';
            else
                cnt_sample_half <= '0';
            end if;

            if(cnt_sample=unsigned(FFT_end_point)) then
                cnt_sample_end <= '1';
            else
                cnt_sample_end <= '0';
            end if;

        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_output
    -- Description : Register outputs
    --------------------------------------------------------------------------------
    P_output : process(reset_n, clk)
    begin
        if(reset_n='0') then
            FFT_sample          <= (others => '0');
            FFT_sample_valid    <= '0';
        elsif(rising_edge(clk)) then
            FFT_sample  <= FFT_din_d;
            if(FFT_new_sample_d='1') then
                if(cnt_sample_zero='1' OR cnt_sample_half='1') then
                    FFT_sample_valid    <= '1';
                else
                    FFT_sample_valid    <= '0';
                end if;
            else
                FFT_sample_valid    <= '0';
            end if;
        end if;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------