-------------------------------------------------------------------------------
--  This entire design, which includes all of the components and related files,
--  has been created and owned by : ELSYS DESIGN
--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : FIR_filter.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-28
-- Last update: 2019-10-30
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 2047-tap FIR filter
--              16-bit coefficients, 8-bit data
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-10-28  1.0      Hugo HARTMANN   Creation
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
entity FIR_filter is
    generic(
        G_BEHAVIOURAL   : boolean := false;
        G_SELECT        : integer := 0
        );
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- FIR control ----------------------
        FIR_clr         : in  std_logic;
        FIR_en          : in  std_logic;

        ------- FIR in ---------------------------
        FIR_din         : in  std_logic_vector(7 downto 0);
        FIR_addr        : in  std_logic_vector(9 downto 0);

        ------- FIR out --------------------------
        FIR_dout        : out std_logic_vector(7 downto 0)

        );
end FIR_filter;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of FIR_filter is

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component ROM_1024_16bit
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_500
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_1000
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_1500
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_2000
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_2500
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_3000
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_3500
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_4000
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_4500
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_5000
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_5500
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_6000
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_6500
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_7000
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_7500
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_8000
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_8500
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_9000
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_9500
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;


    component Multiplier is
        generic(
            G_OPERAND_A_SIZE    : INTEGER := 5;
            G_OPERAND_B_SIZE    : INTEGER := 5;
            G_MULT_OUT_SIZE     : INTEGER := 10
            );
        port(
            clk          : in  std_logic;
            reset_n      : in  std_logic;
            enable       : in  std_logic;
            opA          : in  std_logic_vector(G_OPERAND_A_SIZE-1 downto 0);
            opB          : in  std_logic_vector(G_OPERAND_B_SIZE-1 downto 0);
            mult_out     : out std_logic_vector(G_MULT_OUT_SIZE-1 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal ROM_out      : std_logic_vector(15 downto 0);
    signal accu_din     : unsigned(34 downto 0);
    signal accu         : unsigned(34 downto 0);
    signal mult_opA     : std_logic_vector(7 downto 0);
    signal mult_opB     : std_logic_vector(15 downto 0);
    signal mult_out     : std_logic_vector(23 downto 0);
    signal sat_out      : unsigned(7 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_ROM
    -- Description : Contains coefficient for filtering
    ----------------------------------------------------------------
    ROM0 : if G_BEHAVIOURAL=false and G_SELECT=0 generate
        U_ROM : ROM_1024_16bit port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM1 : if G_BEHAVIOURAL=false and G_SELECT=1 generate
        U_ROM : ROM_1024_16bit_500 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM2 : if G_BEHAVIOURAL=false and G_SELECT=2 generate
        U_ROM : ROM_1024_16bit_1000 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM3 : if G_BEHAVIOURAL=false and G_SELECT=3 generate
        U_ROM : ROM_1024_16bit_1500 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM4 : if G_BEHAVIOURAL=false and G_SELECT=4 generate
        U_ROM : ROM_1024_16bit_2000 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM5 : if G_BEHAVIOURAL=false and G_SELECT=5 generate
        U_ROM : ROM_1024_16bit_2500 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM6 : if G_BEHAVIOURAL=false and G_SELECT=6 generate
        U_ROM : ROM_1024_16bit_3000 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM7 : if G_BEHAVIOURAL=false and G_SELECT=7 generate
        U_ROM : ROM_1024_16bit_3500 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM8 : if G_BEHAVIOURAL=false and G_SELECT=8 generate
        U_ROM : ROM_1024_16bit_4000 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM9 : if G_BEHAVIOURAL=false and G_SELECT=9 generate
        U_ROM : ROM_1024_16bit_4500 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM10 : if G_BEHAVIOURAL=false and G_SELECT=10 generate
        U_ROM : ROM_1024_16bit_5000 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM11 : if G_BEHAVIOURAL=false and G_SELECT=11 generate
        U_ROM : ROM_1024_16bit_5500 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM12 : if G_BEHAVIOURAL=false and G_SELECT=12 generate
        U_ROM : ROM_1024_16bit_6000 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM13 : if G_BEHAVIOURAL=false and G_SELECT=13 generate
        U_ROM : ROM_1024_16bit_6500 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM14 : if G_BEHAVIOURAL=false and G_SELECT=14 generate
        U_ROM : ROM_1024_16bit_7000 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM15 : if G_BEHAVIOURAL=false and G_SELECT=15 generate
        U_ROM : ROM_1024_16bit_7500 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM16 : if G_BEHAVIOURAL=false and G_SELECT=16 generate
        U_ROM : ROM_1024_16bit_8000 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM17 : if G_BEHAVIOURAL=false and G_SELECT=17 generate
        U_ROM : ROM_1024_16bit_8500 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM18 : if G_BEHAVIOURAL=false and G_SELECT=18 generate
        U_ROM : ROM_1024_16bit_9000 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM19 : if G_BEHAVIOURAL=false and G_SELECT=19 generate
        U_ROM : ROM_1024_16bit_9500 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ----------------------------------------------------------------
    -- INSTANCE : U_Mult
    -- Description : 8x16 Signed multiplier
    ----------------------------------------------------------------
    U_Mult : Multiplier generic map(
        G_OPERAND_A_SIZE    => 8,
        G_OPERAND_B_SIZE    => 16,
        G_MULT_OUT_SIZE     => 24)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        enable      => '1',
        opA         => mult_opA,
        opB         => mult_opB,
        mult_out    => mult_out);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_RAM
    -- Description : Register rom data
    --------------------------------------------------------------------------------
    P_RAM : process(clk, reset_n)
    begin
        if(reset_n='0') then
            mult_opA    <= (others => '0');
            mult_opB    <= (others => '0');
        elsif(rising_edge(clk)) then
            if(FIR_clr='1') then
                mult_opA    <= (others => '0');
                mult_opB    <= (others => '0');
            else
                mult_opA    <= std_logic_vector(unsigned(FIR_din)-128);
                mult_opB    <= ROM_out;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Accumulator
    --------------------------------------------------------------------------------
    accu_din    <= (34 downto 24 => mult_out(23)) & unsigned(mult_out);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_acc
    -- Description : Enable accumulation
    --------------------------------------------------------------------------------
    P_acc : process(clk, reset_n)
    begin
        if(reset_n='0') then
            accu    <= to_unsigned(0, accu'length);
        elsif(rising_edge(clk)) then
            if(FIR_clr='1') then
                accu    <= to_unsigned(0, accu'length);
            elsif(FIR_en='1') then
                accu    <= accu + accu_din;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Saturation
    --------------------------------------------------------------------------------
    process(accu)
    begin
        if(accu(34 downto 26)="000000000" or accu(34 downto 26)="111111111") then
            sat_out <= accu(26 downto 19);
        elsif(accu(34)='0') then
            sat_out <= X"7F";
        else
            sat_out <= X"80";
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Output
    --------------------------------------------------------------------------------
    FIR_dout <= std_logic_vector(sat_out + 128);

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------