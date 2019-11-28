-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : RAM_Wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-24
-- Last update: 2019-11-25
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: RAM wrapper
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
entity RAM_Wrapper is
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
end RAM_Wrapper;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of RAM_Wrapper is

    --------------------------------------------------------------------------------
    -- CONSTANTS DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_RAM_MAX_ADDR : integer   := 22049;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component RAM_22050_8bit
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
    signal RAM0_addr        : std_logic_vector(14 downto 0);
    signal RAM0_write       : std_logic_vector(0 downto 0);
    signal RAM0_dout        : std_logic_vector(7 downto 0);
    signal RAM1_addr        : std_logic_vector(14 downto 0);
    signal RAM1_write       : std_logic_vector(0 downto 0);
    signal RAM1_dout        : std_logic_vector(7 downto 0);
    signal RAM_select       : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM0
    -- Description : Contains 1 second of 8-bit audio
    ----------------------------------------------------------------
    RAM0 : if G_BEHAVIOURAL=false generate
        U_RAM0 : RAM_22050_8bit port map(
            clka    => clk,
            addra   => RAM0_addr,
            wea     => RAM0_write,
            ena     => '1',
            dina    => UART_dout,
            douta   => RAM0_dout);
    end generate;

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM1
    -- Description : Contains 1 second of 8-bit audio
    ----------------------------------------------------------------
    RAM1 : if G_BEHAVIOURAL=false generate
        U_RAM1 : RAM_22050_8bit port map(
            clka    => clk,
            addra   => RAM1_addr,
            wea     => RAM1_write,
            ena     => '1',
            dina    => UART_dout,
            douta   => RAM1_dout);
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
    -- SEQ PROCESS : P_RAM_select
    -- Description : toggle RAM_select and start UART reads
    --------------------------------------------------------------------------------
    P_RAM_select : process(clk, reset_n)
    begin
        if(reset_n='0') then
            RAM_select <= '0';
            UART_read   <= '0';
        elsif(rising_edge(clk)) then
            if(RAM_read='1' and cnt_read_end='1') then
                RAM_select <= NOT RAM_select;
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
    RAM0_addr  <= std_logic_vector(counter_read) when(RAM_select='0') else std_logic_vector(counter_write);
    RAM0_write <= "0" when(RAM_select='0') else (0 downto 0 => UART_write);
    RAM_dout    <= RAM0_dout when(RAM_select='0') else RAM1_dout;
    RAM1_addr  <= std_logic_vector(counter_read) when(RAM_select='1') else std_logic_vector(counter_write);
    RAM1_write <= "0" when(RAM_select='1') else (0 downto 0 => UART_write);

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------