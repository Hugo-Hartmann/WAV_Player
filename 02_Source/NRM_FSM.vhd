-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : NRM_FSM.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-12-09
-- Last update: 2020-07-24
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: FSM to execute Normalization computations
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-12-09  1.0      Hugo HARTMANN   Creation
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
entity NRM_FSM is
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- NRM out --------------------------
        NRM_addr        : out std_logic_vector(10 downto 0);

        ------- NRM control ----------------------
        NRM_start       : in  std_logic;
        NRM_new_sample  : in  std_logic;
        NRM_loaded      : in  std_logic;
        NRM_open        : out std_logic;
        NRM_en          : out std_logic

        );
end NRM_FSM;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of NRM_FSM is

    --------------------------------------------------------------------------------
    -- TYPE DECLARATIONS
    --------------------------------------------------------------------------------
    type NRM_STATE is (NRM_RESET, NRM_IDLE, NRM_WAIT_SAMPLE, NRM_LOAD_SAMPLE,
                       NRM_NORM_LOOP, NRM_NORM_END);

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal send_en          : std_logic;
    signal current_state    : NRM_STATE;
    signal next_state       : NRM_STATE;
    signal counter_addr     : unsigned(10 downto 0);
    signal cnt_addr_clr     : std_logic;
    signal cnt_addr_inc     : std_logic;
    signal cnt_addr_end     : std_logic;
    signal addr             : unsigned(10 downto 0);
    signal addr_d           : std_logic_vector(10 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_NRM_en
    -- Description : Enable pipeline
    --------------------------------------------------------------------------------
    P_NRM_en : process(clk, reset_n)
    begin
        if(reset_n='0') then
            NRM_en  <= '0';
        elsif(rising_edge(clk)) then
            NRM_en  <= send_en;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter_addr
    -- Description : Counter to generate addresses
    --------------------------------------------------------------------------------
    P_counter_addr : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter_addr    <= to_unsigned(0, counter_addr'length);
        elsif(rising_edge(clk)) then
            if(cnt_addr_clr='1') then
                counter_addr    <= to_unsigned(0, counter_addr'length);
            elsif(cnt_addr_inc='1') then
                counter_addr    <= counter_addr + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Address assignation for the normalizer
    --------------------------------------------------------------------------------
    Addr    <= counter_addr;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg
    -- Description : Register addresses
    --------------------------------------------------------------------------------
    P_reg : process(clk, reset_n)
    begin
        if(reset_n='0') then
            Addr_d  <= (others => '0');
        elsif(rising_edge(clk)) then
            Addr_d  <= std_logic_vector(Addr);
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Output address assignation
    --------------------------------------------------------------------------------
    NRM_addr    <= Addr_d;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : End address signaling
    --------------------------------------------------------------------------------
    cnt_addr_end    <= '1' when(Addr_d=std_logic_vector(to_unsigned(2046, Addr_d'length))) else '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_FSM_NRM_sync
    -- Description : FSM_NRM sequential part (current_state logic)
    --------------------------------------------------------------------------------
    P_FSM_NRM_sync : process(clk, reset_n)
    begin
        if(reset_n='0') then
            current_state   <= NRM_RESET;
        elsif(rising_edge(clk)) then
            current_state   <= next_state;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMB PROCESS : P_FSM_NRM_comb
    -- Description : FSM_NRM combinatorial part (next_state logic)
    --------------------------------------------------------------------------------
    P_FSM_NRM_comb : process(current_state, NRM_start, NRM_new_sample, NRM_loaded, cnt_addr_end)
    begin
        send_en         <= '0';
        NRM_open        <= '0';
        cnt_addr_clr    <= '0';
        cnt_addr_inc    <= '0';

        case current_state is
            when NRM_RESET =>
                next_state  <= NRM_IDLE;

            when NRM_IDLE =>
                if(NRM_start='1') then
                    next_state  <= NRM_WAIT_SAMPLE;
                else
                    next_state  <= NRM_IDLE;
                end if;

            when NRM_WAIT_SAMPLE =>
                if(NRM_new_sample='1') then
                    next_state  <= NRM_LOAD_SAMPLE;
                else
                    next_state  <= NRM_WAIT_SAMPLE;
                end if;

            when NRM_LOAD_SAMPLE =>
                NRM_open        <= '1';
                cnt_addr_clr    <= '1';
                if(NRM_loaded='1') then
                    next_state  <= NRM_NORM_LOOP;
                else
                    next_state  <= NRM_LOAD_SAMPLE;
                end if;

            when NRM_NORM_LOOP =>
                cnt_addr_inc    <= '1';
                send_en         <= '1';
                if(cnt_addr_end='1') then
                    next_state  <= NRM_NORM_END;
                else
                    next_state  <= NRM_NORM_LOOP;
                end if;

            when NRM_NORM_END =>
                next_state      <= NRM_IDLE;

        end case;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------