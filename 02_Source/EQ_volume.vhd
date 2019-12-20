-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : EQ_volume.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-12-18
-- Last update: 2019-12-19
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 1 Channel audio volume controller
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-12-18 1.0      Hugo HARTMANN   Creation
-------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- LIBRARIES DECLARATION
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_VHDL;
use lib_VHDL.TYPE_Pkg.all;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
entity EQ_volume is
    generic(
        G_BEHAVIOURAL   : boolean := false
        );
    port(
    
        ------- Clock and RESET ------------------
        clk         : in  std_logic;                        -- clock
        reset_n     : in  std_logic;                        -- reset_n

        ------- EQ control ----------------------
        EQ_en       : in  std_logic;
        EQ_sum_en   : in  std_logic;
        EQ_level    : in  std_logic_vector(4 downto 0);
        EQ_done     : out std_logic;
        EQ_sum_done : out std_logic;

        ------- EQ in --------------------------
        EQ_din      : in  std_logic_vector(15 downto 0);
        EQ_sum_din  : in  std_logic_vector(18 downto 0);

        ------- EQ out --------------------------
        EQ_dout     : out std_logic_vector(15 downto 0);
        EQ_sum_dout : out std_logic_vector(18 downto 0)

        );
end EQ_volume;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of EQ_volume is

--------------------------------------------------------------------------------
    -- TYPE DECLARATIONS
    --------------------------------------------------------------------------------
    type T_EN is array (0 to 4) of std_logic;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component ROM_32_16bit
        port (
            a   : in std_logic_vector(4 downto 0);
            spo : out std_logic_vector(15 downto 0)
            );
    end component;

    component Multiplier_u16_s16
        port(
            clk : in  std_logic;
            a   : in  std_logic_vector(15 downto 0);
            b   : in  std_logic_vector(15 downto 0);
            p   : out std_logic_vector(31 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal EQ_en_d              : T_EN;
    signal ROM_out              : std_logic_vector(15 downto 0);
    signal EQ_din_d             : std_logic_vector(15 downto 0);
    signal Volume_coef          : std_logic_vector(15 downto 0);
    signal Volume_data          : std_logic_vector(15 downto 0);
    signal EQ_addr              : std_logic_vector(4 downto 0);
    signal mult_out             : std_logic_vector(31 downto 0);
    signal accu_din             : std_logic_vector(18 downto 0);
    signal accu                 : unsigned(18 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg
    -- Description : Register inputs
    --------------------------------------------------------------------------------
    P_reg : process(clk, reset_n)
    begin
        if(reset_n='0') then
            EQ_addr     <= (others => '0');
            EQ_din_d    <= (others => '0');
            EQ_en_d(0)  <= '0';
        elsif(rising_edge(clk)) then
            if(EQ_en='1') then
                EQ_din_d    <= EQ_din;
                EQ_addr     <= EQ_level;
            end if;
            EQ_en_d(0)  <= EQ_en;
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_ROM
    -- Description : Contains coefficient for volume control
    ----------------------------------------------------------------
    ROM0 : if G_BEHAVIOURAL=false generate
        U_ROM : ROM_32_16bit port map(
            a   => EQ_addr,
            spo => ROM_out);
    end generate;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_fetch
    -- Description : Fetch coefficient from ROM
    --------------------------------------------------------------------------------
    P_fetch : process(clk, reset_n)
    begin
        if(reset_n='0') then
            Volume_data <= (others => '0');
            Volume_coef <= (others => '0');
            EQ_en_d(1)  <= '0';
        elsif(rising_edge(clk)) then
            Volume_data <= EQ_din_d;
            Volume_coef <= ROM_out;
            EQ_en_d(1)  <= EQ_en_d(0);
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_Mult
    -- Description : 16x16 multiplier
    ----------------------------------------------------------------
    U_Mult : Multiplier_u16_s16 port map(
        clk => clk,
        a   => Volume_coef,
        b   => Volume_data,
        p   => mult_out);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_mult
    -- Description : Associated mult delay
    --------------------------------------------------------------------------------
    P_mult : process(clk, reset_n)
    begin
        if(reset_n='0') then
            EQ_en_d(2)  <= '0';
            EQ_en_d(3)  <= '0';
            EQ_en_d(4)  <= '0';
        elsif(rising_edge(clk)) then
            EQ_en_d(2)  <= EQ_en_d(1);
            EQ_en_d(3)  <= EQ_en_d(2);
            EQ_en_d(4)  <= EQ_en_d(3);
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Saturation
    --------------------------------------------------------------------------------
    process(reset_n, clk)
    begin
        if(reset_n='0') then
            EQ_dout <= (others => '0');
            EQ_done <= '0';
        elsif(rising_edge(clk)) then
            if(mult_out(31 downto 28)="0000" or mult_out(31 downto 28)="1111") then
                EQ_dout <= mult_out(28 downto 13);
            elsif(mult_out(31)='0') then
                EQ_dout <= X"7FFF";
            else
                EQ_dout <= X"8000";
            end if;

            EQ_done <= EQ_en_d(4);

        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Accumulator data in
    --------------------------------------------------------------------------------
    accu_din    <= mult_out(31 downto 13);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_accu
    -- Description : Store results
    --------------------------------------------------------------------------------
    P_accu : process(clk, reset_n)
    begin
        if(reset_n='0') then
            accu        <= to_unsigned(0, accu'length);
            EQ_sum_done <= '0';
        elsif(rising_edge(clk)) then
            if(EQ_sum_en='1') then
                accu        <= unsigned(accu_din) + unsigned(EQ_sum_din);
            end if;
            EQ_sum_done <= EQ_sum_en;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Accumulator data out
    --------------------------------------------------------------------------------
    EQ_sum_dout <= std_logic_vector(accu);

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------