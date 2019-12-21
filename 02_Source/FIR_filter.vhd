-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FIR_filter.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-28
-- Last update: 2019-12-20
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
        FIR_done        : out std_logic;

        ------- FIR in ---------------------------
        FIR_din         : in  std_logic_vector(15 downto 0);
        FIR_addr        : in  std_logic_vector(9 downto 0);

        ------- FIR out --------------------------
        FIR_dout        : out std_logic_vector(15 downto 0)

        );
end FIR_filter;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of FIR_filter is

--------------------------------------------------------------------------------
    -- TYPE DECLARATIONS
    --------------------------------------------------------------------------------
    type T_EN is array (0 to 5) of std_logic;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component ROM_1024_16bit_0
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_1
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_2
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_3
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_4
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_5
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component Multiplier_s16_s16
        port(
            clk : in  std_logic;
            a   : in  std_logic_vector(15 downto 0);
            b   : in  std_logic_vector(15 downto 0);
            p   : out std_logic_vector(31 downto 0)
            );
    end component;

    component Accu_s43
        port(
            b       : in  std_logic_vector(31 downto 0);
            clk     : in  std_logic;
            ce      : in  std_logic;
            sclr    : in  std_logic;
            q       : out std_logic_vector(42 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal FIR_en_d         : T_EN;
    signal ROM_out          : std_logic_vector(15 downto 0);
    signal accu             : std_logic_vector(42 downto 0);
    signal mult_opA         : std_logic_vector(15 downto 0);
    signal mult_opB         : std_logic_vector(15 downto 0);
    signal mult_out         : std_logic_vector(31 downto 0);
    signal mult_out_d       : std_logic_vector(31 downto 0);
    signal sat_out          : std_logic_vector(15 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_ROM
    -- Description : Contains coefficient for filtering
    ----------------------------------------------------------------
    ROM0 : if G_BEHAVIOURAL=false and G_SELECT=0 generate
        U_ROM : ROM_1024_16bit_0 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM1 : if G_BEHAVIOURAL=false and G_SELECT=1 generate
        U_ROM : ROM_1024_16bit_1 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM2 : if G_BEHAVIOURAL=false and G_SELECT=2 generate
        U_ROM : ROM_1024_16bit_2 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM3 : if G_BEHAVIOURAL=false and G_SELECT=3 generate
        U_ROM : ROM_1024_16bit_3 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM4 : if G_BEHAVIOURAL=false and G_SELECT=4 generate
        U_ROM : ROM_1024_16bit_4 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM5 : if G_BEHAVIOURAL=false and G_SELECT=5 generate
        U_ROM : ROM_1024_16bit_5 port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;


    ----------------------------------------------------------------
    -- INSTANCE : U_Mult
    -- Description : 16x16 multiplier
    ----------------------------------------------------------------
    U_Mult : Multiplier_s16_s16 port map(
        clk => clk,
        a   => mult_opA,
        b   => mult_opB,
        p   => mult_out);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_ROM
    -- Description : Register rom data
    --------------------------------------------------------------------------------
    P_ROM : process(clk, reset_n)
    begin
        if(reset_n='0') then
            -- mult_opA    <= (others => '0'); -- Merge reg with DSP block
            -- mult_opB    <= (others => '0');
            -- mult_out_d  <= (others => '0');
        elsif(rising_edge(clk)) then
            mult_opA    <= FIR_din;
            mult_opB    <= ROM_out;
            mult_out_d  <= mult_out;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_delay
    -- Description : Register delay
    --------------------------------------------------------------------------------
    P_delay : process(clk, reset_n)
    begin
        if(reset_n='0') then
            FIR_en_d(0) <= '0';
            FIR_en_d(1) <= '0';
            FIR_en_d(2) <= '0';
            FIR_en_d(3) <= '0';
            FIR_en_d(4) <= '0';
        elsif(rising_edge(clk)) then
            FIR_en_d(0) <= FIR_en;
            FIR_en_d(1) <= FIR_en_d(0);
            FIR_en_d(2) <= FIR_en_d(1);
            FIR_en_d(3) <= FIR_en_d(2);
            FIR_en_d(4) <= FIR_en_d(3);
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_Accu
    -- Description : 43 bit accumulator
    ----------------------------------------------------------------
    U_Accu : Accu_s43 port map(
        clk     => clk,
        b       => mult_out_d,
        ce      => FIR_en_d(4) OR FIR_en_d(5),
        sclr    => FIR_clr,
        q       => accu);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_delay_add
    -- Description : Register delay
    --------------------------------------------------------------------------------
    P_delay_add : process(clk, reset_n)
    begin
        if(reset_n='0') then
            FIR_en_d(5) <= '0';
            FIR_done    <= '0';
        elsif(rising_edge(clk)) then
            FIR_en_d(5) <= FIR_en_d(4);
            FIR_done    <= FIR_en_d(5);
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Saturation
    --------------------------------------------------------------------------------
    SAT0 : if G_SELECT=0 generate
        process(accu)
        begin
            if(accu(42 downto 38)="00000" or accu(42 downto 38)="11111") then
                sat_out <= accu(38 downto 23);
            elsif(accu(42)='0') then
                sat_out <= X"7FFF";
            else
                sat_out <= X"8000";
            end if;
        end process;
    end generate;

    SAT1 : if G_SELECT=1 generate
        process(accu)
        begin
            if(accu(42 downto 36)="0000000" or accu(42 downto 36)="1111111") then
                sat_out <= accu(36 downto 21);
            elsif(accu(42)='0') then
                sat_out <= X"7FFF";
            else
                sat_out <= X"8000";
            end if;
        end process;
    end generate;

    SAT2 : if G_SELECT=2 generate
        process(accu)
        begin
            if(accu(42 downto 34)="000000000" or accu(42 downto 34)="111111111") then
                sat_out <= accu(34 downto 19);
            elsif(accu(42)='0') then
                sat_out <= X"7FFF";
            else
                sat_out <= X"8000";
            end if;
        end process;
    end generate;

    SAT3 : if G_SELECT=3 generate
        process(accu)
        begin
            if(accu(42 downto 33)="0000000000" or accu(42 downto 33)="1111111111") then
                sat_out <= accu(33 downto 18);
            elsif(accu(42)='0') then
                sat_out <= X"7FFF";
            else
                sat_out <= X"8000";
            end if;
        end process;
    end generate;

    SAT4 : if G_SELECT=4 generate
        process(accu)
        begin
            if(accu(42 downto 32)="00000000000" or accu(42 downto 32)="11111111111") then
                sat_out <= accu(32 downto 17);
            elsif(accu(42)='0') then
                sat_out <= X"7FFF";
            else
                sat_out <= X"8000";
            end if;
        end process;
    end generate;

    SAT5 : if G_SELECT=5 generate
        process(accu)
        begin
            if(accu(42 downto 31)="000000000000" or accu(42 downto 31)="111111111111") then
                sat_out <= accu(31 downto 16);
            elsif(accu(42)='0') then
                sat_out <= X"7FFF";
            else
                sat_out <= X"8000";
            end if;
        end process;
    end generate;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Output
    --------------------------------------------------------------------------------
    FIR_dout <= sat_out;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------