-------------------------------------------------------------------------------
--  This entire design, which includes all of the components and related files,
--  has been created and owned by : ELSYS DESIGN
--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : WAV_Player.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-23
-- Last update: 2019-10-24
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 8-bit Audio player (Fs = 22050 kHz) clocked @108MHz
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
entity WAV_Player is
    port(
    
        ------- Clock and RESET ------------------
        clk         : in  std_logic;                               -- clock
        reset_n     : in  std_logic;                               -- reset_n

        ------- WAV out --------------------------
        WAV_dout    : out std_logic;

        ------- WAV in ---------------------------
        WAV_din     : in  std_logic_vector(7 downto 0);

        ------- WAV control ----------------------
        WAV_read    : out std_logic
        );
end WAV_Player;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of WAV_Player is

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal PWM_counter      : unsigned(7 downto 0);
    signal PWM_end          : std_logic;
    signal PWM_threshold    : std_logic_vector(7 downto 0);
    signal PWM_thresh_zero  : std_logic;
    signal PWM_thresh_eq    : std_logic;
    signal sample_counter   : unsigned(15 downto 0);
    signal load_sample      : std_logic;
    signal cnt_sample_end   : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_count_PWM
    -- Description : counter management for PWM
    --------------------------------------------------------------------------------
    P_count_PWM : process(clk, reset_n)
    begin
        if(reset_n='0') then
            PWM_counter    <= to_unsigned(0, PWM_counter'length);
        elsif(rising_edge(clk)) then
            if(cnt_sample_end='1') then
                PWM_counter <= to_unsigned(254, PWM_counter'length);
            elsif(PWM_end='1') then
                PWM_counter <= to_unsigned(0, PWM_counter'length);
            else
                PWM_counter <= PWM_counter + 1;
            end if;
        end if;
    end process;
    
    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : PWM control signals
    --------------------------------------------------------------------------------
    PWM_end <= '1' when(PWM_counter=254) else '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_count_sample
    -- Description : counter management for sampling
    --------------------------------------------------------------------------------
    P_count_sample : process(clk, reset_n)
    begin
        if(reset_n='0') then
            sample_counter    <= to_unsigned(0, sample_counter'length);
        elsif(rising_edge(clk)) then
            if(cnt_sample_end='1') then
                sample_counter <= to_unsigned(0, sample_counter'length);
            else
                sample_counter <= sample_counter + 1;
            end if;
        end if;
    end process;
    
    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : sampling control signals
    --------------------------------------------------------------------------------
    cnt_sample_end  <= '1' when(sample_counter=4898) else '0';
    load_sample     <= cnt_sample_end;
    WAV_read        <= cnt_sample_end;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_sample
    -- Description : load sample value
    --------------------------------------------------------------------------------
    P_sample : process(clk, reset_n)
    begin
        if(reset_n='0') then
            PWM_threshold    <= (others => '0');
        elsif(rising_edge(clk)) then
            if(load_sample='1') then
                PWM_threshold   <= WAV_din;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : PWM threshold check
    --------------------------------------------------------------------------------
    PWM_thresh_zero <= '1' when(unsigned(PWM_threshold)=0) else '0';
    PWM_thresh_eq   <= '1' when(unsigned(PWM_threshold)=PWM_counter+1) else '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_out
    -- Description : manage output with PWM
    --------------------------------------------------------------------------------
    P_out : process(clk, reset_n)
    begin
        if(reset_n='0') then
            WAV_dout    <= '0';
        elsif(rising_edge(clk)) then
            if(PWM_end='1') then
                if(PWM_thresh_zero='1') then
                    WAV_dout    <= '0';
                else
                    WAV_dout    <= '1';
                end if;
            else
                if(PWM_thresh_eq='1') then
                    WAV_dout    <= '0';
                end if;
            end if;
        end if;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------