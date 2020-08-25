-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FIR_filter.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-28
-- Last update: 2020-08-25
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
    type T_EN is array (0 to 7) of std_logic;

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

    component ROM_1024_16bit_6
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_7
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_1024_16bit_8
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

    -- ROM
    signal ROM_addr         : std_logic_vector(9 downto 0);
    signal ROM_out          : std_logic_vector(15 downto 0);

    -- Arithmetic
    signal accu             : std_logic_vector(42 downto 0);
    signal mult_opA         : std_logic_vector(15 downto 0);
    signal mult_opB         : std_logic_vector(15 downto 0);
    signal mult_out         : std_logic_vector(31 downto 0);
    signal mult_out_d       : std_logic_vector(31 downto 0);
    signal sat_out          : std_logic_vector(15 downto 0);
    signal accu_en          : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_ROM
    -- Description : Contains coefficient for filtering
    ----------------------------------------------------------------
    ROM0 : if G_SELECT=0 generate
        U_ROM : ROM_1024_16bit_0 port map(
            clka    => clk,
            addra   => ROM_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM1 : if G_SELECT=1 generate
        U_ROM : ROM_1024_16bit_1 port map(
            clka    => clk,
            addra   => ROM_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM2 : if G_SELECT=2 generate
        U_ROM : ROM_1024_16bit_2 port map(
            clka    => clk,
            addra   => ROM_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM3 : if G_SELECT=3 generate
        U_ROM : ROM_1024_16bit_3 port map(
            clka    => clk,
            addra   => ROM_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM4 : if G_SELECT=4 generate
        U_ROM : ROM_1024_16bit_4 port map(
            clka    => clk,
            addra   => ROM_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM5 : if G_SELECT=5 generate
        U_ROM : ROM_1024_16bit_5 port map(
            clka    => clk,
            addra   => ROM_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM6 : if G_SELECT=6 generate
        U_ROM : ROM_1024_16bit_6 port map(
            clka    => clk,
            addra   => ROM_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM7 : if G_SELECT=7 generate
        U_ROM : ROM_1024_16bit_7 port map(
            clka    => clk,
            addra   => ROM_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ROM8 : if G_SELECT=8 generate
        U_ROM : ROM_1024_16bit_8 port map(
            clka    => clk,
            addra   => ROM_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_ROM
    -- Description : Register ROM inputs
    --------------------------------------------------------------------------------
    P_ROM : process(clk)
    begin
        if(rising_edge(clk)) then
            ROM_addr    <= FIR_addr;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_FIR_en_d
    -- Description : Enable pipeline
    --------------------------------------------------------------------------------
    P_FIR_en_d : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in 0 to FIR_en_d'high loop
                FIR_en_d(i) <= '0';
            end loop;
        elsif(rising_edge(clk)) then
            FIR_en_d(0) <= FIR_en;
            for i in 1 to FIR_en_d'high loop
                FIR_en_d(i) <= FIR_en_d(i-1);
            end loop;
            FIR_done <= FIR_en_d(FIR_en_d'high);
        end if;
    end process;

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
    -- SEQ PROCESS : P_Mult
    -- Description : Register rom data
    --------------------------------------------------------------------------------
    P_Mult : process(clk, reset_n)
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

    ----------------------------------------------------------------
    -- INSTANCE : U_Accu
    -- Description : 43 bit accumulator
    ----------------------------------------------------------------
    U_Accu : Accu_s43 port map(
        clk     => clk,
        b       => mult_out_d,
        ce      => accu_en,
        sclr    => FIR_clr,
        q       => accu);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : accu_en
    --------------------------------------------------------------------------------
    accu_en <= FIR_en_d(6) OR FIR_en_d(7);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Saturation
    --------------------------------------------------------------------------------
    SAT0 : if G_SELECT=0 generate
        process(clk, reset_n)
        begin
            if(reset_n='0') then
                sat_out    <= (others => '0');
            elsif(rising_edge(clk)) then
                if(accu(42 downto 38)="00000" or accu(42 downto 38)="11111") then
                    sat_out <= accu(38 downto 23);
                elsif(accu(42)='0') then
                    sat_out <= X"7FFF";
                else
                    sat_out <= X"8000";
                end if;
            end if;
        end process;
    end generate;

    SAT1 : if G_SELECT=1 generate
        process(clk, reset_n)
        begin
            if(reset_n='0') then
                sat_out    <= (others => '0');
            elsif(rising_edge(clk)) then
                if(accu(42 downto 38)="00000" or accu(42 downto 38)="11111") then
                    sat_out <= accu(38 downto 23);
                elsif(accu(42)='0') then
                    sat_out <= X"7FFF";
                else
                    sat_out <= X"8000";
                end if;
            end if;
        end process;
    end generate;

    SAT2 : if G_SELECT=2 generate
        process(clk, reset_n)
        begin
            if(reset_n='0') then
                sat_out    <= (others => '0');
            elsif(rising_edge(clk)) then
                if(accu(42 downto 37)="000000" or accu(42 downto 37)="111111") then
                    sat_out <= accu(37 downto 22);
                elsif(accu(42)='0') then
                    sat_out <= X"7FFF";
                else
                    sat_out <= X"8000";
                end if;
            end if;
        end process;
    end generate;

    SAT3 : if G_SELECT=3 generate
        process(clk, reset_n)
        begin
            if(reset_n='0') then
                sat_out    <= (others => '0');
            elsif(rising_edge(clk)) then
                if(accu(42 downto 36)="0000000" or accu(42 downto 36)="1111111") then
                    sat_out <= accu(36 downto 21);
                elsif(accu(42)='0') then
                    sat_out <= X"7FFF";
                else
                    sat_out <= X"8000";
                end if;
            end if;
        end process;
    end generate;

    SAT4 : if G_SELECT=4 generate
        process(clk, reset_n)
        begin
            if(reset_n='0') then
                sat_out    <= (others => '0');
            elsif(rising_edge(clk)) then
                if(accu(42 downto 35)="00000000" or accu(42 downto 35)="11111111") then
                    sat_out <= accu(35 downto 20);
                elsif(accu(42)='0') then
                    sat_out <= X"7FFF";
                else
                    sat_out <= X"8000";
                end if;
            end if;
        end process;
    end generate;

    SAT5 : if G_SELECT=5 generate
        process(clk, reset_n)
        begin
            if(reset_n='0') then
                sat_out    <= (others => '0');
            elsif(rising_edge(clk)) then
                if(accu(42 downto 34)="000000000" or accu(42 downto 34)="111111111") then
                    sat_out <= accu(34 downto 19);
                elsif(accu(42)='0') then
                    sat_out <= X"7FFF";
                else
                    sat_out <= X"8000";
                end if;
            end if;
        end process;
    end generate;

    SAT6 : if G_SELECT=6 generate
        process(clk, reset_n)
        begin
            if(reset_n='0') then
                sat_out    <= (others => '0');
            elsif(rising_edge(clk)) then
                if(accu(42 downto 33)="0000000000" or accu(42 downto 33)="1111111111") then
                    sat_out <= accu(33 downto 18);
                elsif(accu(42)='0') then
                    sat_out <= X"7FFF";
                else
                    sat_out <= X"8000";
                end if;
            end if;
        end process;
    end generate;

    SAT7 : if G_SELECT=7 generate
        process(clk, reset_n)
        begin
            if(reset_n='0') then
                sat_out    <= (others => '0');
            elsif(rising_edge(clk)) then
                if(accu(42 downto 32)="00000000000" or accu(42 downto 32)="11111111111") then
                    sat_out <= accu(32 downto 17);
                elsif(accu(42)='0') then
                    sat_out <= X"7FFF";
                else
                    sat_out <= X"8000";
                end if;
            end if;
        end process;
    end generate;

    SAT8 : if G_SELECT=8 generate
        process(clk, reset_n)
        begin
            if(reset_n='0') then
                sat_out    <= (others => '0');
            elsif(rising_edge(clk)) then
                if(accu(42 downto 31)="000000000000" or accu(42 downto 31)="111111111111") then
                    sat_out <= accu(31 downto 16);
                elsif(accu(42)='0') then
                    sat_out <= X"7FFF";
                else
                    sat_out <= X"8000";
                end if;
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