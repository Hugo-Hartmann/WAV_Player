-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : UART_Tx.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-23
-- Last update: 2019-10-24
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Tx part of an UART clocked at 108 MHz
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
entity UART_Tx is
    generic(
        G_SPEED         : INTEGER := 115200;                        -- speed in baud
        G_N_BITS        : INTEGER := 8;                             -- number of bits transmitted
        G_PARITY_BIT    : INTEGER := 0;                             -- use parity bit
        G_PARIY_EVEN    : INTEGER := 0                              -- select even/odd parity
        );
    port(
    
        ------- Clock and RESET ------------------
        clk          : in  std_logic;                               -- clock
        reset_n      : in  std_logic;                               -- reset_n

        ------- Output ---------------------------
        Tx           : out std_logic;

        ------- Control signals ------------------
        Tx_send      : in  std_logic;                               -- control signal
        Tx_busy      : out std_logic;                               -- busy signal
        
        ------- Input ----------------------------
        Tx_in       : in   std_logic_vector(G_N_BITS-1 downto 0)    -- UART_Tx input
        );
end UART_Tx;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of UART_Tx is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type UART_STATE is (UART_RESET, UART_IDLE, UART_START, UART_WAIT);

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal counter          : unsigned(18 downto 0); -- counter size needed
    signal bit_counter      : unsigned(3 downto 0);
    signal g_speed_divide   : unsigned(18 downto 0);
    signal Tx_data          : std_logic_vector(G_N_BITS+G_PARITY_BIT downto 0);
    signal current_state    : UART_STATE;
    signal next_state       : UART_STATE;
    signal Tx_parity        : std_logic;
    signal parity_bit       : std_logic;
    signal counter_set      : std_logic;
    signal data_load        : std_logic;
    signal end_count        : std_logic;
    signal end_bit_count    : std_logic;
    signal mapped_speed     : unsigned(18 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- COMBINATORY : 
    -- Description : map generic to counter value ONLY true at clk=108MHz
    --------------------------------------------------------------------------------
    mapped_speed    <= to_unsigned(938, mapped_speed'length) when (G_SPEED=115200) else
                       to_unsigned(29 , mapped_speed'length) when (G_SPEED=3686400) else
                       to_unsigned(938, mapped_speed'length);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_count
    -- Description : counter management
    --------------------------------------------------------------------------------
    P_count : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter        <= (others => '0');
        elsif(rising_edge(clk)) then
            if(counter_set='1') then
                counter <= mapped_speed;
            elsif(counter=0) then
                counter <= mapped_speed;
            else
                counter <= counter - 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : end_count
    --------------------------------------------------------------------------------
    end_count   <= '1' when (counter=0) else '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_bit_count
    -- Description : counter management
    --------------------------------------------------------------------------------
    P_bit_count : process(clk, reset_n)
    begin
        if(reset_n='0') then       -- start + bits + parity + stop (even when parity is not enabled)
            bit_counter <= to_unsigned(1+G_N_BITS+1+1, bit_counter'length);
        elsif(rising_edge(clk)) then
            if(counter_set='1') then
                bit_counter <= to_unsigned(1+G_N_BITS+1+1, bit_counter'length);
            elsif(end_count='1') then
                bit_counter <= bit_counter - 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : end_bit_count
    --------------------------------------------------------------------------------
    end_bit_count   <= '1' when (bit_counter=0) else '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg_data
    -- Description : Tx output register
    --------------------------------------------------------------------------------
    P_reg_data : process(clk, reset_n)
    begin
        if(reset_n='0') then
            Tx_data <= (others => '1');
        elsif(rising_edge(clk)) then
            if(data_load='1') then
                Tx_data <= parity_bit & Tx_in & '0'; -- parity + bits + start
            elsif(end_count='1') then
                Tx_data <= '1' & Tx_data(Tx_data'high downto 1);
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Send Tx
    --------------------------------------------------------------------------------
    Tx  <= Tx_data(0);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Tx Parity
    --------------------------------------------------------------------------------
    data_parity : process(Tx_in)
    
    variable local_parity : std_logic := '0';
    
    begin
        local_parity   := Tx_in(0);
        for i in 1 to Tx_in'high loop
            local_parity   := local_parity XOR Tx_in(i);
        end loop;
    
    Tx_parity   <= local_parity;
    
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Parity management
    --------------------------------------------------------------------------------
    parity_bit  <= '1' when (G_PARITY_BIT=0 or
                                 (G_PARIY_EVEN=1 and Tx_parity='1') or
                                 (G_PARIY_EVEN=0 and Tx_parity='0'))
                       else '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_FSM_UART_sync
    -- Description : FSM_UART sequential part (current_state logic)
    --------------------------------------------------------------------------------
    P_FSM_UART_sync : process(clk, reset_n)
    begin
        if(reset_n='0') then
            current_state <= UART_RESET;
        elsif(rising_edge(clk)) then
            current_state <= next_state;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMB PROCESS : P_FSM_UART_comb
    -- Description : FSM_UART combinatorial part (next_state logic)
    --               States :
    --                        UART_RESET    : reset
    --                        UART_IDLE     : idle state
    --                        UART_START    : set counters and load data
    --                        UART_WAIT     : wait for end of transmission
    --------------------------------------------------------------------------------
    P_FSM_UART_comb : process(current_state, end_bit_count, Tx_send)
    begin
        counter_set <= '0';
        data_load   <= '0';
        Tx_busy     <= '0';
        
        case current_state is
            when UART_RESET =>
                next_state  <= UART_IDLE;
                
            when UART_IDLE =>
                if(Tx_send='1') then
                    next_state  <= UART_START;
                else
                    next_state  <= UART_IDLE;
                end if;

            when UART_START =>
                Tx_busy     <= '1';
                data_load   <= '1';
                counter_set <= '1';
                next_state  <= UART_WAIT;

            when UART_WAIT =>
                Tx_busy     <= '1';
                if(end_bit_count='1') then
                    next_state  <= UART_IDLE;
                else
                    next_state  <= UART_WAIT;
                end if;

        end case;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------