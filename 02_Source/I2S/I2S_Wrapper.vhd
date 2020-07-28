-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : I2S_Wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-12-12
-- Last update: 2019-12-12
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: I2S wrapper for interface with Pmod module
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-12-12  1.0      Hugo HARTMANN   Creation
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
entity I2S_Wrapper is
    port(

        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- Audio Control --------------------
        I2S_new_sample  : out std_logic;

        ------- Audio MISO -----------------------
        MISO_right      : in  std_logic_vector(15 downto 0);
        MISO_left       : in  std_logic_vector(15 downto 0);

        ------- Audio MOSI -----------------------
        MOSI_right      : out std_logic_vector(15 downto 0);
        MOSI_left       : out std_logic_vector(15 downto 0);

        ------- I2S interface --------------------
        DIN             : in  std_logic;
        DOUT            : out std_logic;
        MCLK            : out std_logic;
        SCLK            : out std_logic;
        LRCK            : out std_logic

        );
end I2S_Wrapper;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of I2S_Wrapper is

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component I2S_Emitter is
        port(
            clk         : in  std_logic;
            reset_n     : in  std_logic;
            Audio_in    : in  std_logic_vector(23 downto 0);
            Audio_out   : out std_logic;
            sclk        : in  std_logic;
            sclk_toggle : in  std_logic;
            lrck_toggle : in  std_logic
            );
    end component;

    component I2S_Receiver is
        port(
            clk         : in  std_logic;
            reset_n     : in  std_logic;
            Audio_in    : in  std_logic;
            Audio_out   : out std_logic_vector(23 downto 0);
            done        : out std_logic;
            sclk        : in  std_logic;
            sclk_toggle : in  std_logic;
            lrck_toggle : in  std_logic
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal counter_mclk     : unsigned(15 downto 0);
    signal mclk_toggle      : std_logic;
    signal mclk_buffer      : std_logic;
    signal counter_sclk     : unsigned(15 downto 0);
    signal sclk_toggle      : std_logic;
    signal sclk_buffer      : std_logic;
    signal counter_lrck     : unsigned(15 downto 0);
    signal lrck_toggle      : std_logic;
    signal lrck_toggle_d    : std_logic;
    signal lrck_buffer      : std_logic;
    signal New_sample       : std_logic;
    signal Receiver_out     : std_logic_vector(23 downto 0);
    signal MISO_full        : std_logic_vector(31 downto 0);
    signal Emitter_in       : std_logic_vector(23 downto 0);
    signal Receiver_done    : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_I2S_Emitter
    -- Description : I2S Emitter for interface with Pmod module
    ----------------------------------------------------------------
    U_I2S_Emitter : I2S_Emitter port map(
        clk         => clk,
        reset_n     => reset_n,
        Audio_in    => Emitter_in,
        Audio_out   => DOUT,
        sclk        => sclk_buffer,
        sclk_toggle => sclk_toggle,
        lrck_toggle => lrck_toggle_d);

    ----------------------------------------------------------------
    -- INSTANCE : U_I2S_Receiver
    -- Description : I2S Receiver for interface with Pmod module
    ----------------------------------------------------------------
    U_I2S_Receiver : I2S_Receiver port map(
        clk         => clk,
        reset_n     => reset_n,
        Audio_in    => DIN,
        Audio_out   => Receiver_out,
        done        => Receiver_done,
        sclk        => sclk_buffer,
        sclk_toggle => sclk_toggle,
        lrck_toggle => lrck_toggle);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_mclk_gen
    -- Description : mclk generation
    --------------------------------------------------------------------------------
    P_mclk_gen : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter_mclk    <= to_unsigned(0, counter_mclk'length);
            mclk_buffer     <= '1';
        elsif(rising_edge(clk)) then
            if(mclk_toggle='1') then
                mclk_buffer     <= NOT mclk_buffer;
                counter_mclk    <= to_unsigned(0, counter_mclk'length);
            else
                counter_mclk <= counter_mclk + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : mclk signals assignation
    --------------------------------------------------------------------------------
    mclk_toggle <= '1' when(counter_mclk=4) else '0';
    MCLK        <= mclk_buffer;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_sclk_gen
    -- Description : sclk generation
    --------------------------------------------------------------------------------
    P_sclk_gen : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter_sclk    <= to_unsigned(0, counter_sclk'length);
            sclk_buffer     <= '1';
        elsif(rising_edge(clk)) then
            if(sclk_toggle='1') then
                sclk_buffer     <= NOT sclk_buffer;
                counter_sclk    <= to_unsigned(0, counter_sclk'length);
            else
                counter_sclk <= counter_sclk + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : sclk signals assignation
    --------------------------------------------------------------------------------
    sclk_toggle <= '1' when(counter_sclk=19) else '0';
    SCLK        <= sclk_buffer;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_lrck_gen
    -- Description : lrck generation
    --------------------------------------------------------------------------------
    P_lrck_gen : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter_lrck    <= to_unsigned(0, counter_lrck'length);
            lrck_buffer     <= '1';
        elsif(rising_edge(clk)) then
            if(lrck_toggle='1') then
                lrck_buffer     <= NOT lrck_buffer;
                counter_lrck    <= to_unsigned(0, counter_lrck'length);
            else
                counter_lrck <= counter_lrck + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : lrck signals assignation
    --------------------------------------------------------------------------------
    lrck_toggle <= '1' when(counter_lrck=1279) else '0';
    LRCK        <= lrck_buffer;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_lrck_delay
    -- Description : delayed lrck signal for Emitter
    --------------------------------------------------------------------------------
    P_lrck_delay : process(clk, reset_n)
    begin
        if(reset_n='0') then
            lrck_toggle_d   <= '0';
        elsif(rising_edge(clk)) then
            lrck_toggle_d   <= lrck_toggle;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : New sample signal
    --------------------------------------------------------------------------------
    New_sample      <= '1' when(lrck_buffer='1' and lrck_toggle='1') else '0';
    I2S_new_sample  <= New_sample;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg
    -- Description : register inputs and outputs
    --------------------------------------------------------------------------------
    P_reg : process(clk, reset_n)
    begin
        if(reset_n='0') then
            MOSI_right  <= (others => '0');
            MOSI_left   <= (others => '0');
            MISO_full   <= (others => '0');
        elsif(rising_edge(clk)) then

            if(New_sample='1') then
                MISO_full   <= MISO_left & MISO_right;
            end if;

            if(lrck_buffer='0' and Receiver_done='1') then
                MOSI_left   <= Receiver_out(23 downto 8);
            end if;

            if(lrck_buffer='1' and Receiver_done='1') then
                MOSI_right  <= Receiver_out(23 downto 8);
            end if;

        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : data multiplexing
    --------------------------------------------------------------------------------
    Emitter_in  <= MISO_full(31 downto 16) & X"00" when(lrck_buffer='0') else 
                   MISO_full(15 downto 0) & X"00";

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------