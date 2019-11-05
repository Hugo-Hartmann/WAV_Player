-------------------------------------------------------------------------------
--  This entire design, which includes all of the components and related files,
--  has been created and owned by : ELSYS DESIGN
--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : EQ_volume_ctrl.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-04
-- Last update: 2019-11-05
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 6 Channel audio equalizer volume controller
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-11-04 1.0      Hugo HARTMANN   Creation
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
entity EQ_volume_ctrl is
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- EQ control ----------------------
        sw              : in  std_logic_vector(3 downto 0);
        EQ_vol_up       : in  std_logic;
        EQ_vol_down     : in  std_logic;

        ------- EQ out --------------------------
        EQ_level_dout   : out std_logic_vector((C_FIR_MAX+2)*5+4 downto 0)

        );
end EQ_volume_ctrl;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of EQ_volume_ctrl is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type EQ_STATE is (EQ_RESET, EQ_IDLE, EQ_UP, EQ_DOWN, EQ_HOLD_UP, EQ_HOLD_DOWN,
                      EQ_WAIT_UP, EQ_WAIT_DOWN);
    type vol_tab is array (0 to C_FIR_MAX+2) of unsigned(4 downto 0);

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal current_state    : EQ_STATE;
    signal next_state       : EQ_STATE;
    signal return_state     : EQ_STATE;
    signal mem_state        : EQ_STATE;
    signal vol_up           : std_logic;
    signal vol_down         : std_logic;
    signal vol_select       : std_logic_vector(2 downto 0);
    signal vol_data         : vol_tab;
    signal counter_hold     : unsigned(31 downto 0);
    signal cnt_hold_clr     : std_logic;
    signal cnt_hold_end     : std_logic;
    signal counter_wait     : unsigned(31 downto 0);
    signal cnt_wait_clr     : std_logic;
    signal cnt_wait_end     : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Volume selecter
    --------------------------------------------------------------------------------
    vol_select  <= sw(2 downto 0);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Volume levels
    --------------------------------------------------------------------------------
    process(vol_data)
    begin
        for i in vol_data'range loop
            EQ_level_dout(i*5+4 downto i*5) <= std_logic_vector(vol_data(i));
        end loop;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_Volume
    -- Description : Control volume levels
    --------------------------------------------------------------------------------
    P_Volume : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in vol_data'range loop
                vol_data(i)  <= to_unsigned(12, vol_data(i)'length);
            end loop;
        elsif(rising_edge(clk)) then
            if(vol_up='1' and vol_data(to_integer(unsigned(vol_select)))<24) then
                vol_data(to_integer(unsigned(vol_select)))   <= vol_data(to_integer(unsigned(vol_select))) + 1;
            elsif(vol_down='1' and vol_data(to_integer(unsigned(vol_select)))>0) then
                vol_data(to_integer(unsigned(vol_select)))   <= vol_data(to_integer(unsigned(vol_select))) - 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_Counter_hold
    -- Description : Timer to trigger multiple volume up/down series
    --------------------------------------------------------------------------------
    P_Counter_hold : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter_hold    <= to_unsigned(0, counter_hold'length);
        elsif(rising_edge(clk)) then
            if(cnt_hold_clr='1') then
                counter_hold    <= to_unsigned(0, counter_hold'length);
            else
                counter_hold    <= counter_hold + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : cnt_hold_end
    --------------------------------------------------------------------------------
    cnt_hold_end    <= '1' when(counter_hold=108000000) else '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_Counter_wait
    -- Description : Timer to trigger one volume up/down inside a series
    --------------------------------------------------------------------------------
    P_Counter_wait : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter_wait    <= to_unsigned(0, counter_wait'length);
        elsif(rising_edge(clk)) then
            if(cnt_wait_clr='1') then
                counter_wait    <= to_unsigned(0, counter_wait'length);
            else
                counter_wait    <= counter_wait + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : cnt_wait_end
    --------------------------------------------------------------------------------
    cnt_wait_end    <= '1' when(counter_wait=21600000) else '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_FSM_EQ_sync
    -- Description : FSM_EQ sequential part (current_state logic)
    --------------------------------------------------------------------------------
    P_FSM_EQ_sync : process(clk, reset_n)
    begin
        if(reset_n='0') then
            current_state   <= EQ_RESET;
            mem_state       <= EQ_RESET;
        elsif(rising_edge(clk)) then
            current_state   <= next_state;
            mem_state       <= return_state;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMB PROCESS : P_FSM_EQ_comb
    -- Description : FSM_EQ combinatorial part (next_state logic)
    --------------------------------------------------------------------------------
    P_FSM_EQ_comb : process(current_state, mem_state, cnt_wait_end, cnt_hold_end, EQ_vol_up, EQ_vol_down)
    begin
    vol_up          <= '0';
    vol_down        <= '0';
    cnt_hold_clr    <= '1';
    cnt_wait_clr    <= '1';
    return_state    <= mem_state;

        case current_state is
            when EQ_RESET =>
                next_state  <= EQ_IDLE;

            when EQ_IDLE =>
                if(EQ_vol_up='1') then
                    next_state      <= EQ_UP;
                    return_state    <= EQ_HOLD_UP;
                elsif(EQ_vol_down='1') then
                    next_state      <= EQ_DOWN;
                    return_state    <= EQ_HOLD_DOWN;
                else
                    next_state  <= EQ_IDLE;
                end if;

            when EQ_UP =>
                vol_up      <= '1';
                next_state  <= mem_state;

            when EQ_HOLD_UP =>
                cnt_hold_clr    <= '0';
                if(EQ_vol_up='0') then
                    next_state  <= EQ_IDLE;
                elsif(cnt_hold_end='1') then
                    next_state      <= EQ_UP;
                    return_state    <= EQ_WAIT_UP;
                else
                    next_state  <= EQ_HOLD_UP;
                end if;

            when EQ_WAIT_UP =>
                cnt_wait_clr    <= '0';
                if(EQ_vol_up='0') then
                    next_state  <= EQ_IDLE;
                elsif(cnt_wait_end='1') then
                    next_state      <= EQ_UP;
                    return_state    <= EQ_WAIT_UP;
                else
                    next_state  <= EQ_WAIT_UP;
                end if;

            when EQ_DOWN =>
                vol_down    <= '1';
                next_state  <= mem_state;

            when EQ_HOLD_DOWN =>
                cnt_hold_clr    <= '0';
                if(EQ_vol_down='0') then
                    next_state  <= EQ_IDLE;
                elsif(cnt_hold_end='1') then
                    next_state      <= EQ_DOWN;
                    return_state    <= EQ_WAIT_DOWN;
                else
                    next_state  <= EQ_HOLD_DOWN;
                end if;

            when EQ_WAIT_DOWN =>
                cnt_wait_clr    <= '0';
                if(EQ_vol_down='0') then
                    next_state  <= EQ_IDLE;
                elsif(cnt_wait_end='1') then
                    next_state      <= EQ_DOWN;
                    return_state    <= EQ_WAIT_DOWN;
                else
                    next_state  <= EQ_WAIT_DOWN;
                end if;

        end case;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------