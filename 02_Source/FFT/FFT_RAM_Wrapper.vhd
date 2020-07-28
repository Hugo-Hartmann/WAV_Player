-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FFT_RAM_Wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-25
-- Last update: 2020-03-27
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
        FFT_din         : in  std_logic_vector(15 downto 0);
        RAM_dinA_r      : in  std_logic_vector(15 downto 0);
        RAM_dinA_i      : in  std_logic_vector(15 downto 0);
        RAM_dinB_r      : in  std_logic_vector(15 downto 0);
        RAM_dinB_i      : in  std_logic_vector(15 downto 0);

        ------- RAM control ----------------------
        FFT_addr_valid  : in  std_logic;
        FFT_done        : in  std_logic;
        FFT_addrA_r     : in  std_logic_vector(10 downto 0);
        FFT_addrB_r     : in  std_logic_vector(10 downto 0);
        FFT_addrC_r     : in  std_logic_vector(9 downto 0);
        FFT_addrA_w     : in  std_logic_vector(10 downto 0);
        FFT_addrB_w     : in  std_logic_vector(10 downto 0);
        FFT_new_sample  : in  std_logic;
        FFT_start       : in  std_logic;

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
    component BRAM_2048_32bit
        port(
            clka    : in  std_logic;
            wea     : in  std_logic_vector(0 downto 0);
            ena     : in  std_logic;
            addra   : in  std_logic_vector(10 downto 0);
            dina    : in  std_logic_vector(31 downto 0);
            douta   : out std_logic_vector(31 downto 0);
            clkb    : in  std_logic;
            web     : in  std_logic_vector(0 downto 0);
            enb     : in  std_logic;
            addrb   : in  std_logic_vector(10 downto 0);
            dinb    : in  std_logic_vector(31 downto 0);
            doutb   : out std_logic_vector(31 downto 0)
        );
    end component;

    component BRAM_2048_16bit
        port(
            clka    : in  std_logic;
            wea     : in  std_logic_vector(0 downto 0);
            ena     : in  std_logic;
            addra   : in  std_logic_vector(10 downto 0);
            dina    : in  std_logic_vector(15 downto 0);
            douta   : out std_logic_vector(15 downto 0);
            clkb    : in  std_logic;
            web     : in  std_logic_vector(0 downto 0);
            enb     : in  std_logic;
            addrb   : in  std_logic_vector(10 downto 0);
            dinb    : in  std_logic_vector(15 downto 0);
            doutb   : out std_logic_vector(15 downto 0)
        );
    end component;

    component ROM_1024_32bit
    port(
        clka    : in  std_logic;
        addra   : in  std_logic_vector(9 downto 0);
        douta   : out std_logic_vector(31 downto 0)
        );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal addrA_map            : unsigned(10 downto 0);
    signal addrB_map            : unsigned(10 downto 0);
    signal RAM_smple_wrA        : std_logic_vector(0 downto 0);
    signal RAM_smple_enA        : std_logic;
    signal RAM_smple_addrA      : std_logic_vector(10 downto 0);
    signal RAM_smple_dinA       : std_logic_vector(15 downto 0);
    signal RAM_smple_doutA      : std_logic_vector(15 downto 0);
    signal RAM_smple_wrB        : std_logic_vector(0 downto 0);
    signal RAM_smple_enB        : std_logic;
    signal RAM_smple_addrB      : std_logic_vector(10 downto 0);
    signal RAM_smple_dinB       : std_logic_vector(15 downto 0);
    signal RAM_smple_doutB      : std_logic_vector(15 downto 0);
    signal addr_counter         : unsigned(10 downto 0);
    signal RAM_FFTA_wrA         : std_logic_vector(0 downto 0);
    signal RAM_FFTA_enA         : std_logic;
    signal RAM_FFTA_addrA       : std_logic_vector(10 downto 0);
    signal RAM_FFTA_dinA        : std_logic_vector(31 downto 0);
    signal RAM_FFTA_doutA       : std_logic_vector(31 downto 0);
    signal RAM_FFTA_wrB         : std_logic_vector(0 downto 0);
    signal RAM_FFTA_enB         : std_logic;
    signal RAM_FFTA_addrB       : std_logic_vector(10 downto 0);
    signal RAM_FFTA_dinB        : std_logic_vector(31 downto 0);
    signal RAM_FFTA_doutB       : std_logic_vector(31 downto 0);
    signal RAM_FFTB_wrA         : std_logic_vector(0 downto 0);
    signal RAM_FFTB_enA         : std_logic;
    signal RAM_FFTB_addrA       : std_logic_vector(10 downto 0);
    signal RAM_FFTB_dinA        : std_logic_vector(31 downto 0);
    signal RAM_FFTB_doutA       : std_logic_vector(31 downto 0);
    signal RAM_FFTB_wrB         : std_logic_vector(0 downto 0);
    signal RAM_FFTB_enB         : std_logic;
    signal RAM_FFTB_addrB       : std_logic_vector(10 downto 0);
    signal RAM_FFTB_dinB        : std_logic_vector(31 downto 0);
    signal RAM_FFTB_doutB       : std_logic_vector(31 downto 0);
    signal RAM_select           : std_logic_vector(1 downto 0);
    signal FFT_write            : std_logic;
    signal FFT_write_d          : std_logic;
    signal ROM_addr             : std_logic_vector(9 downto 0);
    signal ROM_dout             : std_logic_vector(31 downto 0);
    signal ROM_dout_d           : std_logic_vector(31 downto 0);
    signal RAM_FFTA_doutA_d     : std_logic_vector(31 downto 0);
    signal RAM_FFTA_doutB_d     : std_logic_vector(31 downto 0);
    signal RAM_FFTB_doutA_d     : std_logic_vector(31 downto 0);
    signal RAM_FFTB_doutB_d     : std_logic_vector(31 downto 0);
    signal RAM_smple_doutA_d    : std_logic_vector(15 downto 0);
    signal RAM_smple_doutB_d    : std_logic_vector(15 downto 0);
    signal RAM_smple_rdA        : std_logic;
    signal RAM_smple_rdB        : std_logic;
    signal RAM_FFTA_rdA         : std_logic;
    signal RAM_FFTA_rdB         : std_logic;
    signal RAM_FFTB_rdA         : std_logic;
    signal RAM_FFTB_rdB         : std_logic;

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

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Creating enable signals for RAMs
    --------------------------------------------------------------------------------
    RAM_smple_enA   <= RAM_smple_rdA OR RAM_smple_wrA(0);
    RAM_smple_enB   <= RAM_smple_rdB OR RAM_smple_wrB(0);
    RAM_FFTA_enA    <= RAM_FFTA_rdA OR RAM_FFTA_wrA(0);
    RAM_FFTA_enB    <= RAM_FFTA_rdB OR RAM_FFTA_wrB(0);
    RAM_FFTB_enA    <= RAM_FFTB_rdA OR RAM_FFTB_wrA(0);
    RAM_FFTB_enB    <= RAM_FFTB_rdB OR RAM_FFTB_wrB(0);

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM_Sample
    -- Description : Contains last 2048 Audio samples (always up-to-date)
    ----------------------------------------------------------------
    RAM0 : if G_BEHAVIOURAL=false generate
        U_RAM_Sample : BRAM_2048_16bit port map(
            clka    => clk,
            wea     => RAM_smple_wrA,
            ena     => RAM_smple_enA,
            addra   => RAM_smple_addrA,
            dina    => RAM_smple_dinA,
            douta   => RAM_smple_doutA,
            clkb    => clk,
            web     => RAM_smple_wrB,
            enb     => RAM_smple_enB,
            addrb   => RAM_smple_addrB,
            dinb    => RAM_smple_dinB,
            doutb   => RAM_smple_doutB);
    end generate;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_sample
    -- Description : RAM_sample port multiplexing
    --------------------------------------------------------------------------------
    P_sample : process(clk, reset_n)
    begin
        if(rising_edge(clk)) then
            RAM_smple_wrA   <= (0 downto 0 => FFT_new_sample);
            RAM_smple_dinA  <= FFT_din;
            RAM_smple_wrB   <= "0";
            RAM_smple_addrB <= std_logic_vector(addrB_map);
            RAM_smple_dinB  <= X"0000";
            if(FFT_new_sample='0') then
                RAM_smple_addrA <= std_logic_vector(addrA_map);
            else
                RAM_smple_addrA <= std_logic_vector(addr_counter);
            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM_FFTA
    -- Description : Contains 2048 complex numbers from FFT computations
    ----------------------------------------------------------------
    RAM1 : if G_BEHAVIOURAL=false generate
        U_RAM_FFTA : BRAM_2048_32bit port map(
            clka    => clk,
            wea     => RAM_FFTA_wrA,
            ena     => RAM_FFTA_enA,
            addra   => RAM_FFTA_addrA,
            dina    => RAM_FFTA_dinA,
            douta   => RAM_FFTA_doutA,
            clkb    => clk,
            web     => RAM_FFTA_wrB,
            enb     => RAM_FFTA_enB,
            addrb   => RAM_FFTA_addrB,
            dinb    => RAM_FFTA_dinB,
            doutb   => RAM_FFTA_doutB);
    end generate;

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM_FFTB
    -- Description : Contains 2048 complex numbers from FFT computations
    ----------------------------------------------------------------
    RAM2 : if G_BEHAVIOURAL=false generate
        U_RAM_FFTB : BRAM_2048_32bit port map(
            clka    => clk,
            wea     => RAM_FFTB_wrA,
            ena     => RAM_FFTB_enA,
            addra   => RAM_FFTB_addrA,
            dina    => RAM_FFTB_dinA,
            douta   => RAM_FFTB_doutA,
            clkb    => clk,
            web     => RAM_FFTB_wrB,
            enb     => RAM_FFTB_enB,
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
            if(FFT_start='1') then
                RAM_select  <= "10";
            elsif(FFT_write_d='1' and FFT_write='0') then
                RAM_select  <= '0' & (NOT RAM_select(0));
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_RAM
    -- Description : Register all RAM signals
    --------------------------------------------------------------------------------
    P_RAM : process(clk)
    begin
        if(rising_edge(clk)) then
            --- Port A - FFTA
            RAM_FFTA_dinA   <= RAM_dinA_r & RAM_dinA_i;
            if(RAM_select(0)='1') then
                RAM_FFTA_wrA    <= "0";
                RAM_FFTA_addrA  <= FFT_addrA_r;
            else
                RAM_FFTA_wrA    <= (others => FFT_write);
                RAM_FFTA_addrA  <= FFT_addrA_w;
            end if;

            --- Port B - FFTA
            RAM_FFTA_dinB   <= RAM_dinB_r & RAM_dinB_i;
            if(RAM_select(0)='1') then
                RAM_FFTA_wrB    <= "0";
                RAM_FFTA_addrB  <= FFT_addrB_r;
            else
                RAM_FFTA_wrB    <= (others => FFT_write);
                RAM_FFTA_addrB  <= FFT_addrB_w;
            end if;

            --- Port A - FFTB
            RAM_FFTB_dinA   <= RAM_dinA_r & RAM_dinA_i;
            if(RAM_select(0)='0') then
                RAM_FFTB_wrA    <= "0";
                RAM_FFTB_addrA  <= FFT_addrA_r;
            else
                RAM_FFTB_wrA    <= (others => FFT_write);
                RAM_FFTB_addrA  <= FFT_addrA_w;
            end if;

            --- Port B - FFTB
            RAM_FFTB_dinB   <= RAM_dinB_r & RAM_dinB_i;
            if(RAM_select(0)='0') then
                RAM_FFTB_wrB    <= "0";
                RAM_FFTB_addrB  <= FFT_addrB_r;
            else
                RAM_FFTB_wrB    <= (others => FFT_write);
                RAM_FFTB_addrB  <= FFT_addrB_w;
            end if;

            --- Outputs
            RAM_FFTA_doutA_d    <= RAM_FFTA_doutA;
            RAM_FFTA_doutB_d    <= RAM_FFTA_doutB;
            RAM_FFTB_doutA_d    <= RAM_FFTB_doutA;
            RAM_FFTB_doutB_d    <= RAM_FFTB_doutB;
            RAM_smple_doutA_d   <= RAM_smple_doutA;
            RAM_smple_doutB_d   <= RAM_smple_doutB;

            --- RAM enables
            if(RAM_select="10") then
                RAM_smple_rdA   <= FFT_addr_valid;
                RAM_smple_rdB   <= FFT_addr_valid;
                RAM_FFTA_rdA    <= '0';
                RAM_FFTA_rdB    <= '0';
                RAM_FFTB_rdA    <= '0';
                RAM_FFTB_rdB    <= '0';
            elsif(RAM_select="01") then
                RAM_smple_rdA   <= '0';
                RAM_smple_rdB   <= '0';
                RAM_FFTA_rdA    <= FFT_addr_valid;
                RAM_FFTA_rdB    <= FFT_addr_valid;
                RAM_FFTB_rdA    <= '0';
                RAM_FFTB_rdB    <= '0';
            else
                RAM_smple_rdA   <= '0';
                RAM_smple_rdB   <= '0';
                RAM_FFTA_rdA    <= '0';
                RAM_FFTA_rdB    <= '0';
                RAM_FFTB_rdA    <= FFT_addr_valid;
                RAM_FFTB_rdB    <= FFT_addr_valid;
            end if;

        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_Select_out
    -- Description : Select correct RAM output
    --------------------------------------------------------------------------------
    P_Select_out : process(clk)
    begin
        if(rising_edge(clk)) then
            if(RAM_select="01") then
                RAM_doutA_r <= RAM_FFTA_doutA_d(31 downto 16);
                RAM_doutA_i <= RAM_FFTA_doutA_d(15 downto 0);
                RAM_doutB_r <= RAM_FFTA_doutB_d(31 downto 16);
                RAM_doutB_i <= RAM_FFTA_doutB_d(15 downto 0);
            elsif(RAM_select="00") then
                RAM_doutA_r <= RAM_FFTB_doutA_d(31 downto 16);
                RAM_doutA_i <= RAM_FFTB_doutA_d(15 downto 0);
                RAM_doutB_r <= RAM_FFTB_doutB_d(31 downto 16);
                RAM_doutB_i <= RAM_FFTB_doutB_d(15 downto 0);
            else
                RAM_doutA_r <= RAM_smple_doutA_d;
                RAM_doutA_i <= (others => '0');
                RAM_doutB_r <= RAM_smple_doutB_d;
                RAM_doutB_i <= (others => '0');
            end if;

        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_ROM
    -- Description : Register all ROM signals
    --------------------------------------------------------------------------------
    P_ROM : process(clk)
    begin
        if(rising_edge(clk)) then
            ROM_addr    <= FFT_addrC_r;
            ROM_dout_d  <= ROM_dout;
            RAM_doutC_r <= ROM_dout_d(31 downto 16);
            RAM_doutC_i <= ROM_dout_d(15 downto 0);
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM_COEF
    -- Description : Contains 1024 complex numbers from FFT computations
    ----------------------------------------------------------------
    RAM3 : if G_BEHAVIOURAL=false generate
        U_RAM_COEF : ROM_1024_32bit port map(
            clka    => clk,
            addra   => ROM_addr,
            douta   => ROM_dout);
    end generate;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------