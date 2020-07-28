-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : EQ_FSM.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-05
-- Last update: 2020-07-28
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Channel audio equalizer FSM
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-11-05 1.0      Hugo HARTMANN   Creation
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
entity EQ_FSM is
    port(
    
        ------- Clock and RESET ------------------
        clk         : in  std_logic;                        -- clock
        reset_n     : in  std_logic;                        -- reset_n

        ------- EQ control ----------------------
        EQ_start    : in  std_logic;
        EQ_UAL_done : in  std_logic;
        EQ_select   : out std_logic_vector(3 downto 0);
        EQ_en       : out std_logic;
        EQ_clear    : out std_logic;
        EQ_done     : out std_logic
        );
end EQ_FSM;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of EQ_FSM is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type EQ_STATE is (EQ_RESET, EQ_IDLE, EQ_COMPUTE, EQ_COMPUTE_LAST, EQ_WAIT_PIPE,
                      EQ_WAIT_END, EQ_END);

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal current_state    : EQ_STATE;
    signal next_state       : EQ_STATE;
    signal mem_state        : EQ_STATE;
    signal return_state     : EQ_STATE;
    signal EQ_start_d       : std_logic;
    signal cnt_sel          : unsigned(3 downto 0);
    signal cnt_sel_clr      : std_logic;
    signal cnt_sel_inc      : std_logic;
    signal cnt_sel_end      : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_start
    -- Description : EQ_start_d reg
    --------------------------------------------------------------------------------
    P_start : process(clk, reset_n)
    begin
        if(reset_n='0') then
            EQ_start_d  <= '0';
        elsif(rising_edge(clk)) then
            EQ_start_d  <= EQ_start;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter_select
    -- Description : Counter for select signal
    --------------------------------------------------------------------------------
    P_counter_select : process(clk, reset_n)
    begin
        if(reset_n='0') then
            cnt_sel <= to_unsigned(0, cnt_sel'length);
        elsif(rising_edge(clk)) then
            if(cnt_sel_clr='1') then
                cnt_sel <= to_unsigned(0, cnt_sel'length);
            elsif(cnt_sel_inc='1') then
                cnt_sel <= cnt_sel + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : End cnt_sel signaling
    --------------------------------------------------------------------------------
    cnt_sel_end  <= '1' when(cnt_sel=1+C_FIR_MAX) else '0';

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
    P_FSM_EQ_comb : process(current_state, mem_state, EQ_start_d, cnt_sel_end, EQ_UAL_done)
    begin
        return_state    <= mem_state;
        EQ_clear        <= '0';
        EQ_en           <= '0';
        EQ_done         <= '0';
        cnt_sel_clr     <= '0';
        cnt_sel_inc     <= '0';

        case current_state is
            when EQ_RESET =>
                next_state  <= EQ_IDLE;

            when EQ_IDLE =>
                EQ_clear    <= '1';
                cnt_sel_clr <= '1';
                if(EQ_start_d='1') then
                    next_state  <= EQ_COMPUTE;
                else
                    next_state  <= EQ_IDLE;
                end if;

            when EQ_COMPUTE =>
                cnt_sel_inc <= '1';
                EQ_en       <= '1';
                if(cnt_sel_end='1') then
                    next_state      <= EQ_WAIT_PIPE;
                    return_state    <= EQ_COMPUTE_LAST;
                else
                    next_state      <= EQ_COMPUTE;
                end if;

            when EQ_COMPUTE_LAST =>
                EQ_en           <= '1';
                next_state      <= EQ_WAIT_PIPE;
                return_state    <= EQ_END;

            when EQ_WAIT_PIPE =>
                if(EQ_UAL_done='1') then
                    next_state  <= EQ_WAIT_END;
                else
                    next_state  <= EQ_WAIT_PIPE;
                end if;

            when EQ_WAIT_END =>
                if(EQ_UAL_done='0') then
                    next_state  <= mem_state;
                else
                    next_state  <= EQ_WAIT_END;
                end if;

            when EQ_END =>
                EQ_done     <= '1';
                next_state  <= EQ_IDLE;

        end case;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Forward EQ_select
    --------------------------------------------------------------------------------
    EQ_select   <= std_logic_vector(cnt_sel);

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------