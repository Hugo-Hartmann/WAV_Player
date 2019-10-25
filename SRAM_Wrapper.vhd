-------------------------------------------------------------------------------
--  This entire design, which includes all of the components and related files,
--  has been created and owned by : ELSYS DESIGN
--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : SRAM_Wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-24
-- Last update: 2019-10-25
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: SRAM wrapper
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-10-24  1.0      Hugo HARTMANN   Creation
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
entity SRAM_Wrapper is
    generic(
        G_BEHAVIOURAL   : boolean := false
        );
    port(
    
        ------- Clock and RESET ------------------
        clk         : in  std_logic;                        -- clock
        reset_n     : in  std_logic;                        -- reset_n

        ------- UART Interface -------------------
        UART_dout   : in  std_logic_vector(7 downto 0);
        UART_write  : in  std_logic;
        UART_read   : out std_logic;

        ------- WAV Player Interface -------------
        RAM_dout    : out std_logic_vector(7 downto 0);
        RAM_read    : in  std_logic

        );
end SRAM_Wrapper;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of SRAM_Wrapper is

    --------------------------------------------------------------------------------
    -- CONSTANTS DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_RAM_MAX_ADDR : integer   := 22049;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component SRAM_8bit
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            wea     : in  std_logic_vector(0 downto 0);
            addra   : in  std_logic_vector(14 downto 0);
            dina    : in  std_logic_vector(7 downto 0);
            douta   : out std_logic_vector(7 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal counter_read     : unsigned(14 downto 0);
    signal cnt_read_end     : std_logic;
    signal counter_write    : unsigned(14 downto 0);
    signal cnt_write_end    : std_logic;
    signal SRAM1_addr       : std_logic_vector(14 downto 0);
    signal SRAM1_write      : std_logic_vector(0 downto 0);
    signal SRAM1_dout       : std_logic_vector(7 downto 0);
    signal SRAM2_addr       : std_logic_vector(14 downto 0);
    signal SRAM2_write      : std_logic_vector(0 downto 0);
    signal SRAM2_dout       : std_logic_vector(7 downto 0);
    signal SRAM_select      : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_SRAM1
    -- Description : Contains 5 seconds of 8-bit audio
    ----------------------------------------------------------------
    SRAM1 : if G_BEHAVIOURAL=false generate
        U_SRAM1 : SRAM_8bit port map(
            clka    => clk,
            addra   => SRAM1_addr,
            wea     => SRAM1_write,
            ena     => '1',
            dina    => UART_dout,
            douta   => SRAM1_dout);
    end generate;

    ----------------------------------------------------------------
    -- INSTANCE : U_SRAM2
    -- Description : Contains 5 seconds of 8-bit audio
    ----------------------------------------------------------------
    SRAM2 : if G_BEHAVIOURAL=false generate
        U_SRAM2 : SRAM_8bit port map(
            clka    => clk,
            addra   => SRAM2_addr,
            wea     => SRAM2_write,
            ena     => '1',
            dina    => UART_dout,
            douta   => SRAM2_dout);
    end generate;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_count_read
    -- Description : counter management for reads
    --------------------------------------------------------------------------------
    P_count_read : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter_read    <= to_unsigned(0, counter_read'length);
        elsif(rising_edge(clk)) then
            if(RAM_read='1') then
                if(cnt_read_end='1') then
                    counter_read    <= to_unsigned(0, counter_read'length);
                else
                    counter_read    <= counter_read + 1;
                end if;
            end if;
        end if;
    end process;
    
    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Counter_read cycle back
    --------------------------------------------------------------------------------
    cnt_read_end    <= '1' when(counter_read=to_unsigned(C_RAM_MAX_ADDR, counter_read'length)) else '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_count_write
    -- Description : counter management for writes
    --------------------------------------------------------------------------------
    P_count_write : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter_write    <= to_unsigned(0, counter_write'length);
        elsif(rising_edge(clk)) then
            if(UART_write='1') then
                if(cnt_write_end='1') then
                    counter_write    <= to_unsigned(0, counter_write'length);
                else
                    counter_write    <= counter_write + 1;
                end if;
            end if;
        end if;
    end process;
    
    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Counter_write cycle back
    --------------------------------------------------------------------------------
    cnt_write_end   <= '1' when(counter_write=to_unsigned(C_RAM_MAX_ADDR, counter_read'length)) else '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_SRAM_select
    -- Description : toggle SRAM_select and start UART reads
    --------------------------------------------------------------------------------
    P_SRAM_select : process(clk, reset_n)
    begin
        if(reset_n='0') then
            SRAM_select <= '0';
            UART_read   <= '0';
        elsif(rising_edge(clk)) then
            if(RAM_read='1' and cnt_read_end='1') then
                SRAM_select <= NOT SRAM_select;
                UART_read   <= '1';
            else
                UART_read   <= '0';
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : SRAM selection
    --------------------------------------------------------------------------------
    SRAM1_addr  <= std_logic_vector(counter_read) when(SRAM_select='0') else std_logic_vector(counter_write);
    SRAM1_write <= "0" when(SRAM_select='0') else (0 downto 0 => UART_write);
    RAM_dout    <= SRAM1_dout when(SRAM_select='0') else SRAM2_dout;
    SRAM2_addr  <= std_logic_vector(counter_read) when(SRAM_select='1') else std_logic_vector(counter_write);
    SRAM2_write <= "0" when(SRAM_select='1') else (0 downto 0 => UART_write);

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------