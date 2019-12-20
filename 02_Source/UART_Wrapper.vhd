-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : UART_Wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-23
-- Last update: 2019-12-17
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
        UART_din        : in std_logic_vector(15 downto 0);
        UART_write      : in std_logic
        );
end UART_Wrapper;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of UART_Wrapper is

    --------------------------------------------------------------------------------
    -- TYPE DECLARATIONS
    --------------------------------------------------------------------------------
    type UART_STATE is (UART_RESET, UART_IDLE, UART_SEND1, UART_WAIT1, UART_SEND2, UART_WAIT2);

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATION
    --------------------------------------------------------------------------------
    component UART_Rx is
        generic(
            G_SPEED         : INTEGER := 115200;
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
            G_SPEED         : INTEGER := 115200;
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
    signal Tx_busy          : std_logic;
    signal Tx_send          : std_logic;
    signal Tx_in            : std_logic_vector(7 downto 0);
    signal Rx_new           : std_logic;
    signal Rx_out           : std_logic_vector(7 downto 0);
    signal data_shift       : std_logic;

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
        Tx_busy => Tx_busy,
        Tx_send => Tx_send,
        Tx_in   => Tx_in);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg
    -- Description : Register data
    --------------------------------------------------------------------------------
    P_reg : process(clk, reset_n)
    begin
        if(reset_n='0') then
            Tx_in   <= (others => '0');
        elsif(rising_edge(clk)) then
            if(UART_write='1') then
                Tx_in   <= UART_din(15 downto 8);
            elsif(data_shift='1') then
                Tx_in   <= UART_din(7 downto 0);
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
            current_state   <= UART_RESET;
        elsif(rising_edge(clk)) then
            current_state   <= next_state;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMB PROCESS : P_FSM_UART_comb
    -- Description : FSM_UART combinatorial part (next_state logic)
    --------------------------------------------------------------------------------
    P_FSM_UART_comb : process(current_state, UART_write, Tx_busy)
    begin
        Tx_send     <= '0';
        data_shift  <= '0';

        case current_state is
            when UART_RESET =>
                next_state  <= UART_IDLE;

            when UART_IDLE =>
                if(UART_write='1') then
                    next_state  <= UART_SEND1;
                else
                    next_state  <= UART_IDLE;
                end if;

            when UART_SEND1 =>
                Tx_send     <= '1';
                next_state  <= UART_WAIT1;

            when UART_WAIT1 =>
                if(Tx_busy='1') then
                    next_state  <= UART_WAIT1;
                else
                    next_state  <= UART_SEND2;
                end if;

            when UART_SEND2 =>
                Tx_send     <= '1';
                data_shift  <= '1';
                next_state  <= UART_WAIT2;

            when UART_WAIT2 =>
                if(Tx_busy='1') then
                    next_state  <= UART_WAIT2;
                else
                    next_state  <= UART_IDLE;
                end if;

        end case;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------