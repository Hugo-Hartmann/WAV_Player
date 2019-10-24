-------------------------------------------------------------------------------
--  This entire design, which includes all of the components and related files,
--  has been created and owned by : ELSYS DESIGN
--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : UART_Wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-23
-- Last update: 2019-10-23
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
        G_SPEED         : INTEGER := 115200;                            -- speed in baud
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
        UART_dout       : out std_logic_vector(7 downto 0);
        UART_write      : out std_logic;
        UART_read       : in  std_logic
        );
end UART_Wrapper;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of UART_Wrapper is

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
    signal Tx_busy          : std_logic;
    signal Tx_send          : std_logic;
    signal Tx_in            : std_logic_vector(7 downto 0);
    signal Rx_new           : std_logic;
    signal Rx_out           : std_logic_vector(7 downto 0);

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
    -- COMBINATORY :
    -- Description : forward data and control signals
    --------------------------------------------------------------------------------
    UART_dout   <= Rx_out;
    UART_write  <= Rx_new;
    Tx_send     <= UART_read;
    Tx_in       <= X"AA";

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------