-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : PSH_Driver_tb.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2020-07-23
-- Last update: 2020-07-24
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Stimuli for PSH_Driver
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2020-07-23  1.0      Hugo HARTMANN   Creation
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
entity PSH_Driver_tb is
end PSH_Driver_tb;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture A of PSH_Driver_tb is

    --------------------------------------------------------------------------------
    -- CONSTANTS DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_DEMI_CLK_108     : time      := 4630 ps;
    constant C_DEMI_CLK_216     : time      := 2315 ps;
    constant C_TIMEOUT          : time      := 20 ms;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component PSH_Driver is
        port(
            clk_108         : in  std_logic;
            clk_216         : in  std_logic;
            reset_n         : in  std_logic;
            VGA_new_frame   : in  std_logic;
            WAV_push        : in  std_logic_vector(8 downto 0);
            FFT_push        : in  std_logic_vector(16 downto 0);
            VU_push         : in  std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
            UART_send       : out std_logic;
            UART_busy       : in  std_logic;
            UART_din        : out std_logic_vector(7 downto 0);
            PSH_done        : out std_logic
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

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal clk_108          : std_logic := '0';
    signal clk_216          : std_logic := '0';
    signal reset_n          : std_logic;
    signal VGA_new_frame    : std_logic;
    signal WAV_push         : std_logic_vector(8 downto 0);
    signal FFT_push         : std_logic_vector(16 downto 0);
    signal VU_push          : std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
    signal UART_send        : std_logic;
    signal UART_busy        : std_logic;
    signal UART_din         : std_logic_vector(7 downto 0);
    signal RX               : std_logic := '1';
    signal TX               : std_logic;
    signal UART_addr        : std_logic_vector(7 downto 0);
    signal UART_write       : std_logic;
    signal UART_dout        : std_logic_vector(15 downto 0);
    signal Rx_new           : std_logic;
    signal Rx_out           : std_logic_vector(7 downto 0);
    signal PSH_done         : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_PSH_Driver
    -- Description: Forward data from FFT, WAV and VU-metre to UART
    ----------------------------------------------------------------
    U_PSH_Driver : PSH_Driver port map(
        clk_108         => clk_108,
        clk_216         => clk_216,
        reset_n         => reset_n,
        VGA_new_frame   => VGA_new_frame,
        WAV_push        => WAV_push,
        FFT_push        => FFT_push,
        VU_push         => VU_push,
        UART_send       => UART_send,
        UART_busy       => UART_busy,
        UART_din        => UART_din,
        PSH_done        => PSH_done);

    ----------------------------------------------------------------
    -- INSTANCE : U_UART_Wrapper
    -- Description: Wrapper of an UART clocked at 216 MHz
    ----------------------------------------------------------------
    U_UART_Wrapper : UART_Wrapper port map(
        clk         => clk_216,
        reset_n     => reset_n,
        Tx          => TX,
        Rx          => RX,
        UART_dout   => UART_dout,
        UART_addr   => UART_addr,
        UART_write  => UART_write,
        UART_send   => UART_send,
        UART_busy   => UART_busy,
        UART_din    => UART_din);

    ----------------------------------------------------------------
    -- INSTANCE : U_Rx
    -- Description : Rx part of an UART
    ----------------------------------------------------------------
    U_Rx : UART_Rx generic map(
        G_SPEED         => 3686400,
        G_N_BITS        => 8,
        G_PARITY_BIT    => 1,
        G_PARIY_EVEN    => 1)
    port map(
        clk     => clk_216,
        reset_n => reset_n,
        Rx      => TX,
        Rx_new  => Rx_new,
        Rx_out  => Rx_out);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_clock_gen_108
    -- Description : 108 MHz clock generator process
    --------------------------------------------------------------------------------
    P_clock_gen_108 : process(clk_108)
    begin
        clk_108 <= not(clk_108) after C_DEMI_CLK_108;   -- Clock generation
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_clock_gen_216
    -- Description : 216 MHz clock generator process
    --------------------------------------------------------------------------------
    P_clock_gen_216 : process(clk_216)
    begin
        clk_216 <= not(clk_216) after C_DEMI_CLK_216;   -- Clock generation
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Reset creation
    --------------------------------------------------------------------------------
    reset_n         <= '0' , '1'    after (3*C_DEMI_CLK_216);

    process
    
        procedure Wait_cycles(
            constant cycles : in  integer) is
        begin
            wait for (cycles*2*C_DEMI_CLK_216);
        end Wait_cycles;
    
    begin
        VU_push         <= (others => '0');
        WAV_push        <= (others => '0');
        FFT_push        <= (others => '0');
        VGA_new_frame   <= '0';
        Wait_cycles(4000); -- Mandatory for correct RESET of FIFOs
        wait until(rising_edge(clk_216));

        VGA_new_frame   <= '1'; -- RESET0
        Wait_cycles(1);

        VGA_new_frame   <= '0';
        Wait_cycles(2);

        VGA_new_frame   <= '1'; -- RESET1
        Wait_cycles(1);

        VGA_new_frame   <= '0';
        Wait_cycles(2);

        VGA_new_frame   <= '1';
        Wait_cycles(1);

        VGA_new_frame   <= '0';
        Wait_cycles(2);

        WAV_push        <= '1' & X"DD";
        FFT_push        <= '1' & X"BB" & X"CC";
        Wait_cycles(10);

        WAV_push        <= '0' & X"DD";
        FFT_push        <= '0' & X"BB" & X"CC";
        Wait_cycles(1);


        wait until(PSH_done='1');
        wait until(Rx_new='1');
        Wait_cycles(10);

        assert false severity failure;
    end process;

end A;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------