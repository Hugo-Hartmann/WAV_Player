-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FFT_RAM_Wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-25
-- Last update: 2019-12-09
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Custom RAM wrapper for FFT module
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-11-25  1.0      Hugo HARTMANN   Creation
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
entity FFT_RAM_Wrapper is
    generic(
        G_BEHAVIOURAL   : boolean := false
        );
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- RAM in ---------------------------
        FFT_din         : in  std_logic_vector(7 downto 0);
        RAM_dinA_r      : in  std_logic_vector(15 downto 0);
        RAM_dinA_i      : in  std_logic_vector(15 downto 0);
        RAM_dinB_r      : in  std_logic_vector(15 downto 0);
        RAM_dinB_i      : in  std_logic_vector(15 downto 0);

        ------- RAM control ----------------------
        FFT_done        : in  std_logic;
        FFT_addrA_r     : in  std_logic_vector(8 downto 0);
        FFT_addrB_r     : in  std_logic_vector(8 downto 0);
        FFT_addrC_r     : in  std_logic_vector(7 downto 0);
        FFT_addrA_w     : in  std_logic_vector(8 downto 0);
        FFT_addrB_w     : in  std_logic_vector(8 downto 0);
        FFT_new_sample  : in  std_logic;

        ------- RAM out --------------------------
        RAM_doutA_r     : out std_logic_vector(15 downto 0);
        RAM_doutA_i     : out std_logic_vector(15 downto 0);
        RAM_doutB_r     : out std_logic_vector(15 downto 0);
        RAM_doutB_i     : out std_logic_vector(15 downto 0);
        RAM_doutC_r     : out std_logic_vector(15 downto 0);
        RAM_doutC_i     : out std_logic_vector(15 downto 0)

        );
end FFT_RAM_Wrapper;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of FFT_RAM_Wrapper is

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component BRAM_512_32bit
        port(
            clka    : in  std_logic;
            wea     : in  std_logic_vector(0 downto 0);
            addra   : in  std_logic_vector(8 downto 0);
            dina    : in  std_logic_vector(31 downto 0);
            douta   : out std_logic_vector(31 downto 0);
            clkb    : in  std_logic;
            web     : in  std_logic_vector(0 downto 0);
            addrb   : in  std_logic_vector(8 downto 0);
            dinb    : in  std_logic_vector(31 downto 0);
            doutb   : out std_logic_vector(31 downto 0)
        );
    end component;

    component BRAM_512_16bit
        port(
            clka    : in  std_logic;
            wea     : in  std_logic_vector(0 downto 0);
            addra   : in  std_logic_vector(8 downto 0);
            dina    : in  std_logic_vector(15 downto 0);
            douta   : out std_logic_vector(15 downto 0);
            clkb    : in  std_logic;
            web     : in  std_logic_vector(0 downto 0);
            addrb   : in  std_logic_vector(8 downto 0);
            dinb    : in  std_logic_vector(15 downto 0);
            doutb   : out std_logic_vector(15 downto 0)
        );
    end component;

    component ROM_256_32bit
    port(
        clka    : in  std_logic;
        addra   : in  std_logic_vector(7 downto 0);
        douta   : out std_logic_vector(31 downto 0)
        );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal din_map          : unsigned(7 downto 0);
    signal addrA_map        : unsigned(8 downto 0);
    signal addrB_map        : unsigned(8 downto 0);
    signal RAM_smple_wrA    : std_logic_vector(0 downto 0);
    signal RAM_smple_addrA  : std_logic_vector(8 downto 0);
    signal RAM_smple_dinA   : std_logic_vector(15 downto 0);
    signal RAM_smple_doutA  : std_logic_vector(15 downto 0);
    signal RAM_smple_wrB    : std_logic_vector(0 downto 0);
    signal RAM_smple_addrB  : std_logic_vector(8 downto 0);
    signal RAM_smple_dinB   : std_logic_vector(15 downto 0);
    signal RAM_smple_doutB  : std_logic_vector(15 downto 0);
    signal addr_counter     : unsigned(8 downto 0);
    signal RAM_FFTA_wrA     : std_logic_vector(0 downto 0);
    signal RAM_FFTA_addrA   : std_logic_vector(8 downto 0);
    signal RAM_FFTA_dinA    : std_logic_vector(31 downto 0);
    signal RAM_FFTA_doutA   : std_logic_vector(31 downto 0);
    signal RAM_FFTA_wrB     : std_logic_vector(0 downto 0);
    signal RAM_FFTA_addrB   : std_logic_vector(8 downto 0);
    signal RAM_FFTA_dinB    : std_logic_vector(31 downto 0);
    signal RAM_FFTA_doutB   : std_logic_vector(31 downto 0);
    signal RAM_FFTB_wrA     : std_logic_vector(0 downto 0);
    signal RAM_FFTB_addrA   : std_logic_vector(8 downto 0);
    signal RAM_FFTB_dinA    : std_logic_vector(31 downto 0);
    signal RAM_FFTB_doutA   : std_logic_vector(31 downto 0);
    signal RAM_FFTB_wrB     : std_logic_vector(0 downto 0);
    signal RAM_FFTB_addrB   : std_logic_vector(8 downto 0);
    signal RAM_FFTB_dinB    : std_logic_vector(31 downto 0);
    signal RAM_FFTB_doutB   : std_logic_vector(31 downto 0);
    signal RAM_select       : std_logic_vector(1 downto 0);
    signal FFT_write        : std_logic;
    signal FFT_write_d      : std_logic;
    signal ROM_addr         : std_logic_vector(7 downto 0);
    signal ROM_dout         : std_logic_vector(31 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_count
    -- Description : Generate rotating address for RAM_sample
    --------------------------------------------------------------------------------
    P_count : process(clk, reset_n)
    begin
        if(reset_n='0') then
            addr_counter    <= to_unsigned(0, addr_counter'length);
        elsif(rising_edge(clk)) then
            if(FFT_new_sample='1') then
                addr_counter    <= addr_counter + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Mapping start of RAM_sample with addresses
    --------------------------------------------------------------------------------
    addrA_map   <= unsigned(FFT_addrA_r) + addr_counter;
    addrB_map   <= unsigned(FFT_addrB_r) + addr_counter;

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM_Sample
    -- Description : Contains last 512 Audio samples (always up-to-date)
    ----------------------------------------------------------------
    RAM0 : if G_BEHAVIOURAL=false generate
        U_RAM_Sample : BRAM_512_16bit port map(
            clka    => clk,
            wea     => RAM_smple_wrA,
            addra   => RAM_smple_addrA,
            dina    => RAM_smple_dinA,
            douta   => RAM_smple_doutA,
            clkb    => clk,
            web     => RAM_smple_wrB,
            addrb   => RAM_smple_addrB,
            dinb    => RAM_smple_dinB,
            doutb   => RAM_smple_doutB);
    end generate;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : RAM_sample port multiplexing
    --------------------------------------------------------------------------------
    RAM_smple_wrA   <= (0 downto 0 => FFT_new_sample);
    RAM_smple_addrA <= std_logic_vector(addrA_map)  when(FFT_new_sample='0') else std_logic_vector(addr_counter);
    din_map         <= unsigned(FFT_din) - 128;
    RAM_smple_dinA  <= std_logic_vector(din_map) & X"00";
    RAM_smple_wrB   <= "0";
    RAM_smple_addrB <= std_logic_vector(addrB_map);
    RAM_smple_dinB  <= X"0000";

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM_FFTA
    -- Description : Contains 512 complex numbers from FFT computations
    ----------------------------------------------------------------
    RAM1 : if G_BEHAVIOURAL=false generate
        U_RAM_FFTA : BRAM_512_32bit port map(
            clka    => clk,
            wea     => RAM_FFTA_wrA,
            addra   => RAM_FFTA_addrA,
            dina    => RAM_FFTA_dinA,
            douta   => RAM_FFTA_doutA,
            clkb    => clk,
            web     => RAM_FFTA_wrB,
            addrb   => RAM_FFTA_addrB,
            dinb    => RAM_FFTA_dinB,
            doutb   => RAM_FFTA_doutB);
    end generate;

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM_FFTB
    -- Description : Contains 512 complex numbers from FFT computations
    ----------------------------------------------------------------
    RAM2 : if G_BEHAVIOURAL=false generate
        U_RAM_FFTB : BRAM_512_32bit port map(
            clka    => clk,
            wea     => RAM_FFTB_wrA,
            addra   => RAM_FFTB_addrA,
            dina    => RAM_FFTB_dinA,
            douta   => RAM_FFTB_doutA,
            clkb    => clk,
            web     => RAM_FFTB_wrB,
            addrb   => RAM_FFTB_addrB,
            dinb    => RAM_FFTB_dinB,
            doutb   => RAM_FFTB_doutB);
    end generate;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Generate write signal
    --------------------------------------------------------------------------------
    FFT_write   <= FFT_done;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_select
    -- Description : Deal with RAM selection for FFT computations
    --------------------------------------------------------------------------------
    P_select : process(clk, reset_n)
    begin
        if(reset_n='0') then
            FFT_write_d <= '0';
            RAM_select  <= "10";
        elsif(rising_edge(clk)) then
            FFT_write_d <= FFT_write;
            if(FFT_new_sample='1') then
                RAM_select  <= "10";
            elsif(FFT_write_d='1' and FFT_write='0') then
                RAM_select  <= '0' & (NOT RAM_select(0));
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : RAM_FFT port multiplexing
    --------------------------------------------------------------------------------
    
    --- Port A - FFTA
    RAM_FFTA_wrA    <= "0"          when(RAM_select(0)='1') else (others => FFT_write);
    RAM_FFTA_addrA  <= FFT_addrA_r  when(RAM_select(0)='1') else FFT_addrA_w;
    RAM_FFTA_dinA   <= RAM_dinA_r & RAM_dinA_i;

    --- Port B - FFTA
    RAM_FFTA_wrB    <= "0"          when(RAM_select(0)='1') else (others => FFT_write);
    RAM_FFTA_addrB  <= FFT_addrB_r  when(RAM_select(0)='1') else FFT_addrB_w;
    RAM_FFTA_dinB   <= RAM_dinB_r & RAM_dinB_i;

    --- Port A - FFTB
    RAM_FFTB_wrA    <= "0"          when(RAM_select(0)='0') else (others => FFT_write);
    RAM_FFTB_addrA  <= FFT_addrA_r  when(RAM_select(0)='0') else FFT_addrA_w;
    RAM_FFTB_dinA   <= RAM_dinA_r & RAM_dinA_i;

    --- Port B - FFTB
    RAM_FFTB_wrB    <= "0"          when(RAM_select(0)='0') else (others => FFT_write);
    RAM_FFTB_addrB  <= FFT_addrB_r  when(RAM_select(0)='0') else FFT_addrB_w;
    RAM_FFTB_dinB   <= RAM_dinB_r & RAM_dinB_i;

    --- Outputs
    RAM_doutA_r     <= RAM_FFTA_doutA(31 downto 16) when(RAM_select="01") else
                       RAM_FFTB_doutA(31 downto 16) when(RAM_select="00") else
                       RAM_smple_doutA;
    RAM_doutA_i     <= RAM_FFTA_doutA(15 downto 0) when(RAM_select="01") else
                       RAM_FFTB_doutA(15 downto 0) when(RAM_select="00") else
                       (others => '0');

    RAM_doutB_r     <= RAM_FFTA_doutB(31 downto 16) when(RAM_select="01") else
                       RAM_FFTB_doutB(31 downto 16) when(RAM_select="00") else
                       RAM_smple_doutB;
    RAM_doutB_i     <= RAM_FFTA_doutB(15 downto 0) when(RAM_select="01") else
                       RAM_FFTB_doutB(15 downto 0) when(RAM_select="00") else
                       (others => '0');

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : ROM port mapping
    --------------------------------------------------------------------------------
    ROM_addr    <= FFT_addrC_r;
    RAM_doutC_r <= ROM_dout(31 downto 16);
    RAM_doutC_i <= ROM_dout(15 downto 0);

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM_COEF
    -- Description : Contains 512 complex numbers from FFT computations
    ----------------------------------------------------------------
    RAM3 : if G_BEHAVIOURAL=false generate
        U_RAM_COEF : ROM_256_32bit port map(
            clka    => clk,
            addra   => ROM_addr,
            douta   => ROM_dout);
    end generate;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------