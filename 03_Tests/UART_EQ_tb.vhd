-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : UART_EQ_tb.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2020-07-27
-- Last update: 2020-07-29
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Stimuli for FFT_UAL
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2020-07-27  1.0      Hugo HARTMANN   Creation
-------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- LIBRARIES DECLARATION
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_VHDL;
use lib_VHDL.all;
use lib_VHDL.TYPE_Pkg.all;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
entity UART_EQ_tb is
end UART_EQ_tb;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture A of UART_EQ_tb is

    --------------------------------------------------------------------------------
    -- CONSTANTS DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_DEMI_CLK         : time      := 4630 ps;
    constant C_TIMEOUT          : time      := 100 ms;
    constant G_OPERAND_SIZE     : integer   := 16;

    component EQ_Wrapper is
        generic(
            G_LEFT_CHANNEL : boolean := true
            );
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            EQ_addr         : in  std_logic_vector(7 downto 0);
            EQ_write        : in  std_logic;
            EQ_level_din    : in  std_logic_vector(15 downto 0);
            EQ_start        : in  std_logic;
            EQ_done         : out std_logic;
            EQ_din_band     : in  std_logic_vector(C_FIR_MAX*16+15 downto 0);
            EQ_din          : in  std_logic_vector(15 downto 0);
            EQ_dout         : out std_logic_vector((C_FIR_MAX+2)*16+15 downto 0);
            EQ_level_dout   : out std_logic_vector((C_FIR_MAX+2)*5+4 downto 0)
            );
    end component;

    component UART_Wrapper is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            Tx              : out std_logic;
            Rx              : in  std_logic;
            UART_addr       : out std_logic_vector(7 downto 0);
            UART_write      : out std_logic;
            UART_dout       : out std_logic_vector(15 downto 0);
            UART_send       : in  std_logic;
            UART_busy       : out std_logic;
            UART_din        : in  std_logic_vector(7 downto 0)
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
    signal clk              : std_logic := '0';
    signal reset_n          : std_logic;
    signal TX               : std_logic;
    signal RX               : std_logic;
    signal UART_addr        : std_logic_vector(7 downto 0);
    signal UART_write       : std_logic;
    signal UART_dout        : std_logic_vector(15 downto 0);
    signal UART_send        : std_logic := '0';
    signal UART_din         : std_logic_vector(7 downto 0) := (others => '0');
    signal EQ_start         : std_logic;
    signal EQ_done          : std_logic;
    signal EQ_din_band      : std_logic_vector(C_FIR_MAX*16+15 downto 0) := X"0084FFFF0083008200810080";
    signal EQ_din           : std_logic_vector(15 downto 0) := X"007F";
    signal EQ_level_dout    : std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
    signal Tx_busy          : std_logic;
    signal Tx_in            : std_logic_vector(7 downto 0);
    signal Tx_send          : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_EQ_Wrapper
    -- Description: Wrapper for Equalizer bloc
    ----------------------------------------------------------------
    U_EQ_Wrapper : EQ_Wrapper generic map(
        G_LEFT_CHANNEL  => false)
    port map(
        clk             => clk,
        reset_n         => reset_n,
        EQ_addr         => UART_addr,
        EQ_write        => UART_write,
        EQ_level_din    => UART_dout,
        EQ_start        => EQ_start,
        EQ_done         => EQ_done,
        EQ_din_band     => EQ_din_band,
        EQ_din          => EQ_din,
        EQ_dout         => open,
        EQ_level_dout   => EQ_level_dout);

    ----------------------------------------------------------------
    -- INSTANCE : U_UART_Wrapper
    -- Description: Wrapper of an UART clocked at 216 MHz
    ----------------------------------------------------------------
    U_UART_Wrapper : UART_Wrapper port map(
        clk         => clk,
        reset_n     => reset_n,
        Tx          => RX,
        Rx          => TX,
        UART_dout   => UART_dout,
        UART_addr   => UART_addr,
        UART_write  => UART_write,
        UART_send   => UART_send,
        UART_busy   => open,
        UART_din    => UART_din);

    ----------------------------------------------------------------
    -- INSTANCE : U_Tx
    -- Description : Tx part of an UART
    ----------------------------------------------------------------
    U_Tx : UART_Tx generic map(
        G_SPEED         => 3686400,
        G_N_BITS        => 8,
        G_PARITY_BIT    => 1,
        G_PARIY_EVEN    => 1)
    port map(
        clk     => clk,
        reset_n => reset_n,
        Tx      => TX,
        Tx_busy => Tx_busy,
        Tx_send => Tx_send,
        Tx_in   => Tx_in);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_clock_gen
    -- Description : 108 MHz clock generator process
    --------------------------------------------------------------------------------
    P_clk_gen : process(clk)
    begin
        clk <= not(clk) after C_DEMI_CLK;   -- Clock generation
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Reset creation
    --------------------------------------------------------------------------------
    reset_n         <= '0' , '1'    after (3*C_DEMI_CLK);

    process

        procedure Wait_cycles(
            constant cycles : in  integer) is
        begin
            wait for (cycles*2*C_DEMI_CLK);
        end Wait_cycles;

        procedure Send_cmd(

            constant addr   : in  std_logic_vector(7 downto 0);
            constant data   : in  std_logic_vector(15 downto 0)) is

        begin
            Tx_send <= '1';
            Tx_in   <= addr;
            wait until(Tx_busy='1');

            Tx_send <= '0';
            wait until(Tx_busy='0');

            Tx_send <= '1';
            Tx_in   <= data(15 downto 8);
            wait until(Tx_busy='1');

            Tx_send <= '0';
            wait until(Tx_busy='0');
            
            Tx_send <= '1';
            Tx_in   <= data(7 downto 0);
            wait until(Tx_busy='1');

            Tx_send <= '0';
            wait until(Tx_busy='0');
        end Send_cmd;

    begin
        EQ_start    <= '0';
        Tx_send     <= '0';
        Tx_in       <= (others => '0');
        Wait_cycles(4);
        wait until(rising_edge(clk));

        Wait_cycles(2);
        Send_cmd(X"40", X"000A");

        Wait_cycles(10);
        EQ_start    <= '1';

        Wait_cycles(1);
        EQ_start    <= '0';

        wait until(EQ_done='1');

        Wait_cycles(10);
        EQ_start    <= '1';

        Wait_cycles(1);
        EQ_start    <= '0';

        wait until(EQ_done='1');

        Wait_cycles(10);

        assert false severity failure;
    end process;

end A;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------