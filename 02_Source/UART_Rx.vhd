-------------------------------------------------------------------------------
--  This entire design, which includes all of the components and related files,
--  has been created and owned by : ELSYS DESIGN
--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : UART_Rx.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-23
-- Last update: 2019-10-24
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Rx part of an UART clocked at 108 MHz
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
entity UART_Rx is
    generic(
        G_SPEED         : INTEGER := 115200;                        -- speed in baud
        G_N_BITS        : INTEGER := 8;                             -- number of bits transmitted
        G_PARITY_BIT    : INTEGER := 1;                             -- use parity bit
        G_PARIY_EVEN    : INTEGER := 0                              -- select even/odd parity
        );
    port(

        ------- Clock and RESET ------------------
        clk          : in  std_logic;                               -- clock
        reset_n      : in  std_logic;                               -- reset_n

        ------- Input ----------------------------
        Rx           : in  std_logic;

        ------- Control signals ------------------
        Rx_new       : out std_logic;                               -- control signal

        ------- Output ---------------------------
        Rx_out       : out std_logic_vector(G_N_BITS-1 downto 0)    -- UART_Rx output
        );
end UART_Rx;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of UART_Rx is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type UART_STATE is (UART_RESET, UART_IDLE,
                        UART_START, UART_WAIT, UART_PARITY,
                        UART_END);

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal counter          : unsigned(18 downto 0); -- counter size needed
    signal bit_counter      : unsigned(3 downto 0);
    signal Rx_pipe0         : std_logic;
    signal Rx_pipe1         : std_logic;
    signal Rx_pipe2         : std_logic;
    signal Rx_data          : std_logic_vector(G_N_BITS+G_PARITY_BIT downto 0);
    signal current_state    : UART_STATE;
    signal next_state       : UART_STATE;
    signal start            : std_logic;
    signal store_data       : std_logic;
    signal Rx_parity        : std_logic;
    signal combined_parity  : std_logic;
    signal counter_set      : std_logic;
    signal end_count        : std_logic;
    signal end_bit_count    : std_logic;
    signal correct_parity   : std_logic;
    signal mapped_speed     : unsigned(18 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg_input
    -- Description : input data pipelining
    --------------------------------------------------------------------------------
    P_reg_input : process(clk, reset_n)
    begin
        if(reset_n='0') then
            Rx_pipe0    <= '0';
            Rx_pipe1    <= '0';
            Rx_pipe2    <= '0';
        elsif(rising_edge(clk)) then
            Rx_pipe0    <= Rx;
            Rx_pipe1    <= Rx_pipe0;
            Rx_pipe2    <= Rx_pipe1;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : start signal
    --------------------------------------------------------------------------------
    start   <= '1' when (Rx_pipe2='1' and Rx_pipe1='0') else '0';

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
                counter <= '0' & mapped_speed(mapped_speed'high downto 1);
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
        if(reset_n='0') then        --start + bits + parity + stop
            bit_counter <= to_unsigned(1+G_N_BITS+G_PARITY_BIT+1, bit_counter'length);
        elsif(rising_edge(clk)) then
            if(counter_set='1') then
                bit_counter <= to_unsigned(1+G_N_BITS+G_PARITY_BIT+1, bit_counter'length);
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
    -- Description : data register clocking with enable signals
    --------------------------------------------------------------------------------
    P_reg_data : process(clk, reset_n)
    begin
        if(reset_n='0') then
            Rx_data <= (others => '0');
        elsif(rising_edge(clk)) then
            if(end_count='1') then
                Rx_data <= Rx_pipe1 & Rx_data(Rx_data'high downto 1);
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Rx Parity
    --------------------------------------------------------------------------------
    data_parity : process(Rx_data)
    
    variable local_parity : std_logic := '0';
    
    begin
        local_parity   := Rx_data(0);
        for i in 1 to Rx_data'high-2 loop -- ignore stop bit and parity bit
            local_parity   := local_parity XOR Rx_data(i);
        end loop;
    
    Rx_parity   <= local_parity;
    
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Parity management
    --------------------------------------------------------------------------------
    combined_parity <= Rx_data(Rx_data'high-1) XOR Rx_parity;
    correct_parity  <= '1' when (G_PARITY_BIT=0 or
                                 (G_PARIY_EVEN=0 and combined_parity='1') or
                                 (G_PARIY_EVEN=1 and combined_parity='0'))
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
    --                        UART_START    : set counters
    --                        UART_WAIT     : wait for end of reception
    --                        UART_PARITY   : check parity
    --                        UART_END      : send new value if parity was correct
    --------------------------------------------------------------------------------
    P_FSM_UART_comb : process(current_state, start, correct_parity, end_bit_count)
    begin
        counter_set <= '0';
        store_data  <= '0';

        case current_state is
            when UART_RESET =>
                next_state  <= UART_IDLE;
                
            when UART_IDLE =>
                if(start='1') then
                    next_state  <= UART_START;
                else
                    next_state  <= UART_IDLE;
                end if;

            when UART_START =>
                counter_set <= '1';
                next_state  <= UART_WAIT;

            when UART_WAIT =>
                if(end_bit_count='1') then
                    next_state  <= UART_PARITY;
                else
                    next_state  <= UART_WAIT;
                end if;

            when UART_PARITY =>
                if(correct_parity='1') then
                    next_state  <= UART_END;
                else
                    next_state  <= UART_IDLE;
                end if;

            when UART_END =>
                store_data  <= '1';
                next_state  <= UART_IDLE;
        end case;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg_output
    -- Description : output data management
    --------------------------------------------------------------------------------
    PARITY : if G_PARITY_BIT=1 generate
    
        P_reg_output : process(clk, reset_n)
        begin
            if(reset_n='0') then
                Rx_out  <= (others => '0');
                Rx_new  <= '0';
            elsif(rising_edge(clk)) then
                if(store_data='1') then
                    Rx_out  <= Rx_data(Rx_data'high-2 downto 0);
                    Rx_new  <= '1';
                else
                    Rx_new  <= '0';
                end if;
            end if;
        end process;
        
    end generate PARITY;

    NO_PARITY : if G_PARITY_BIT=0 generate
    
        P_reg_output : process(clk, reset_n)
        begin
            if(reset_n='0') then
                Rx_out  <= (others => '0');
                Rx_new  <= '0';
            elsif(rising_edge(clk)) then
                if(store_data='1') then
                    Rx_out  <= Rx_data(Rx_data'high-1 downto 0);
                    Rx_new  <= '1';
                else
                    Rx_new  <= '0';
                end if;
            end if;
        end process;
        
    end generate NO_PARITY;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------