-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : UART_Wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-23
-- Last update: 2020-07-23
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Wrapper of an UART clocked at 108 MHz
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
entity UART_Wrapper is
    generic(
        G_SPEED         : INTEGER := 3686400;                           -- speed in baud
        G_PARITY_BIT    : INTEGER := 1;                                 -- use parity bit
        G_PARIY_EVEN    : INTEGER := 1                                  -- select even/odd parity
        );
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                                -- clock
        reset_n         : in  std_logic;                                -- reset_n

        ------- UART signals ---------------------
        Tx              : out std_logic;
        Rx              : in  std_logic;

        ------- Interface with WAV Player --------
        UART_addr       : out std_logic_vector(7 downto 0);
        UART_write      : out std_logic;
        UART_dout       : out std_logic_vector(15 downto 0);
        
        ------- Interface PUSH -------------------
        UART_send       : in  std_logic;
        UART_busy       : out std_logic;
        UART_din        : in  std_logic_vector(7 downto 0)
        
        );
end UART_Wrapper;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of UART_Wrapper is

    --------------------------------------------------------------------------------
    -- TYPE DECLARATIONS
    --------------------------------------------------------------------------------
    type UART_STATE is (UART_RESET, UART_IDLE, UART_SAMPLE, UART_SET_ADDR,
                        UART_WRITE_DATA);

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATION
    --------------------------------------------------------------------------------
    component UART_Rx is
        generic(
            G_SPEED         : INTEGER := 3686400;
            G_N_BITS        : INTEGER := 8;
            G_PARITY_BIT    : INTEGER := 1;
            G_PARIY_EVEN    : INTEGER := 1
            );
        port(
            clk          : in  std_logic;
            reset_n      : in  std_logic;
            Rx           : in  std_logic;
            Rx_new       : out std_logic;
            Rx_out       : out std_logic_vector(G_N_BITS-1 downto 0)
            );
    end component;

    component UART_Tx is
        generic(
            G_SPEED         : INTEGER := 3686400;
            G_N_BITS        : INTEGER := 8;
            G_PARITY_BIT    : INTEGER := 1;
            G_PARIY_EVEN    : INTEGER := 1
            );
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            Tx              : out std_logic;
            Tx_send         : in  std_logic;
            Tx_busy         : out std_logic;
            Tx_in           : in  std_logic_vector(G_N_BITS-1 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal current_state    : UART_STATE;
    signal next_state       : UART_STATE;
    signal Rx_new           : std_logic;
    signal Rx_out           : std_logic_vector(7 downto 0);
    signal data_buff        : std_logic_vector(15 downto 0);
    signal cnt_byte         : unsigned(3 downto 0);
    signal cnt_byte_end     : std_logic;
    signal shift_data       : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_Rx
    -- Description : Rx part of an UART
    ----------------------------------------------------------------
    U_Rx : UART_Rx generic map(
        G_SPEED         => G_SPEED,
        G_N_BITS        => 8,
        G_PARITY_BIT    => G_PARITY_BIT,
        G_PARIY_EVEN    => G_PARIY_EVEN)
    port map(
        clk     => clk,
        reset_n => reset_n,
        Rx      => Rx,
        Rx_new  => Rx_new,
        Rx_out  => Rx_out);

    ----------------------------------------------------------------
    -- INSTANCE : U_Tx
    -- Description : Tx part of an UART
    ----------------------------------------------------------------
    U_Tx : UART_Tx generic map(
        G_SPEED         => G_SPEED,
        G_N_BITS        => 8,
        G_PARITY_BIT    => G_PARITY_BIT,
        G_PARIY_EVEN    => G_PARIY_EVEN)
    port map(
        clk     => clk,
        reset_n => reset_n,
        Tx      => Tx,
        Tx_busy => UART_busy,
        Tx_send => UART_send,
        Tx_in   => UART_din);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_addr
    -- Description : Register address to register file
    --------------------------------------------------------------------------------
    P_addr : process(clk, reset_n)
    begin
        if(reset_n='0') then
            UART_addr   <= (others => '0');
        elsif(rising_edge(clk)) then
            if(Rx_new='1' and shift_data='0') then
                UART_addr   <= Rx_out;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_data
    -- Description : Register data to register file
    --------------------------------------------------------------------------------
    P_data : process(clk, reset_n)
    begin
        if(reset_n='0') then
            data_buff   <= (others => '0');
        elsif(rising_edge(clk)) then
            if(Rx_new='1') then
                data_buff   <= data_buff(7 downto 0) & Rx_out;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Mapping
    --------------------------------------------------------------------------------
    UART_dout   <= data_buff;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter
    -- Description : Count number of bytes received
    --------------------------------------------------------------------------------
    P_counter : process(clk, reset_n)
    begin
        if(reset_n='0') then
            cnt_byte    <= to_unsigned(2, cnt_byte'length);
        elsif(rising_edge(clk)) then
            if(shift_data='0') then
                cnt_byte    <= to_unsigned(2, cnt_byte'length);
            elsif(Rx_new='1') then
                cnt_byte    <= cnt_byte - 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter_end
    -- Description : End counter indicator
    --------------------------------------------------------------------------------
    P_counter_end : process(clk, reset_n)
    begin
        if(reset_n='0') then
            cnt_byte_end    <= '0';
        elsif(rising_edge(clk)) then
            if(cnt_byte=0) then
                cnt_byte_end    <= '1';
            else
                cnt_byte_end    <= '0';
            end if;
        end if;
    end process;

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
    --------------------------------------------------------------------------------
    P_FSM_UART_comb : process(current_state, Rx_new, cnt_byte_end)
    begin
        UART_write  <= '0';
        shift_data  <= '0';

        case current_state is
            when UART_RESET =>
                next_state  <= UART_IDLE;
                
            when UART_IDLE =>
                if(Rx_new='1') then
                    next_state  <= UART_SET_ADDR;
                else
                    next_state  <= UART_IDLE;
                end if;

            when UART_SET_ADDR =>
                    next_state  <= UART_SAMPLE;

            when UART_SAMPLE =>
                shift_data  <= '1';
                if(cnt_byte_end='1') then
                    next_state  <= UART_WRITE_DATA;
                else
                    next_state  <= UART_SAMPLE;
                end if;

            when UART_WRITE_DATA =>
                UART_write  <= '1';
                next_state  <= UART_IDLE;

        end case;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------