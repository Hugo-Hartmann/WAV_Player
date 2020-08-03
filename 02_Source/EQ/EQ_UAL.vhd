-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : EQ_volume.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2020-07-28
-- Last update: 2020-08-03
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: UAL for equalizer (Multiplier + Accumulator)
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2020-07-28 1.0      Hugo HARTMANN   Creation
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
entity EQ_UAL is
    port(

        ------- Clock and RESET ------------------
        clk         : in  std_logic;                        -- clock
        reset_n     : in  std_logic;                        -- reset_n

        ------- EQ control ----------------------
        EQ_en       : in  std_logic;
        EQ_select   : in  std_logic_vector(3 downto 0);
        EQ_clear    : in  std_logic;
        EQ_UAL_done : out std_logic;

        ------- EQ in --------------------------
        EQ_din_band : in  std_logic_vector(C_FIR_MAX*16+15 downto 0);
        EQ_din      : in  std_logic_vector(15 downto 0);
        EQ_level    : in  std_logic_vector(C_FIR_TOT*5+4 downto 0);
        EQ_chan_sel : in  std_logic_vector(C_FIR_TOT downto 0);

        ------- EQ out --------------------------
        EQ_dout     : out std_logic_vector(C_FIR_TOT*16+15 downto 0)

        );
end EQ_UAL;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of EQ_UAL is

--------------------------------------------------------------------------------
    -- TYPE DECLARATIONS
    --------------------------------------------------------------------------------
    type T_EN is array (0 to 7) of std_logic;
    type T_SELECT is array (0 to 7) of std_logic_vector(3 downto 0);
    type T_LEVEL_TAB is array (0 to C_FIR_TOT) of std_logic_vector(4 downto 0);
    type T_DATA_TAB is array (0 to C_FIR_TOT) of std_logic_vector(18 downto 0);

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component ROM_32_16bit
        port (
            clk     : in  std_logic;
            a       : in  std_logic_vector(4 downto 0);
            qspo    : out std_logic_vector(15 downto 0)
            );
    end component;

    component Multiplier_u16_s19
        port(
            clk : in  std_logic;
            a   : in  std_logic_vector(15 downto 0);
            b   : in  std_logic_vector(18 downto 0);
            p   : out std_logic_vector(34 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal EQ_en_d          : T_EN;
    signal EQ_select_d      : T_SELECT;
    signal EQ_level_inputs  : T_LEVEL_TAB;
    signal EQ_data_inputs   : T_DATA_TAB;
    signal ROM_out          : std_logic_vector(15 downto 0);
    signal EQ_din_d         : std_logic_vector(15 downto 0);
    signal EQ_vol_coef_addr : std_logic_vector(4 downto 0);
    signal EQ_vol_coef      : std_logic_vector(15 downto 0);
    signal EQ_vol_data      : std_logic_vector(18 downto 0);
    signal EQ_vol_data_ex   : std_logic_vector(18 downto 0);
    signal mult_out         : std_logic_vector(34 downto 0);
    signal EQ_accu_din      : std_logic_vector(18 downto 0);
    signal EQ_accu          : unsigned(18 downto 0);
    signal EQ_sat           : std_logic_vector(15 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Data mapping
    --------------------------------------------------------------------------------
    process(EQ_din_d, EQ_din_band, EQ_accu, EQ_level)
    begin
        for i in EQ_level_inputs'range loop
            EQ_level_inputs(i)  <= EQ_level(i*5+4 downto i*5);
        end loop;
        EQ_data_inputs(0)                   <= "000" & EQ_din_d;
        EQ_data_inputs(EQ_data_inputs'high) <= std_logic_vector(EQ_accu);
        for i in 1 to EQ_data_inputs'high-1 loop
            EQ_data_inputs(i)   <= "000" & EQ_din_band((i-1)*16+15 downto (i-1)*16);
        end loop;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_EQ_en_d
    -- Description : Enable pipeline
    --------------------------------------------------------------------------------
    P_EQ_en_d : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in 0 to EQ_en_d'high loop
                EQ_en_d(i) <= '0';
            end loop;
        elsif(rising_edge(clk)) then
            EQ_en_d(0) <= EQ_en;
            for i in 1 to EQ_en_d'high loop
                EQ_en_d(i) <= EQ_en_d(i-1);
            end loop;
            EQ_UAL_done <= EQ_en_d(EQ_en_d'high);
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_EQ_select_d
    -- Description : Select pipeline
    --------------------------------------------------------------------------------
    P_EQ_select_d : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in 0 to EQ_select_d'high loop
                EQ_select_d(i) <= (others => '0');
            end loop;
        elsif(rising_edge(clk)) then
            EQ_select_d(0) <= EQ_select;
            for i in 1 to EQ_select_d'high loop
                EQ_select_d(i) <= EQ_select_d(i-1);
            end loop;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg
    -- Description : Register input data
    --------------------------------------------------------------------------------
    P_reg : process(clk, reset_n)
    begin
        if(reset_n='0') then
            EQ_din_d    <= (others => '0');
        elsif(rising_edge(clk)) then
            EQ_din_d    <= EQ_din;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_select
    -- Description : select address for volume coef and volume data
    --------------------------------------------------------------------------------
    P_select : process(clk, reset_n)
    begin
        if(reset_n='0') then
            EQ_vol_coef_addr    <= (others => '0');
            EQ_vol_data         <= (others => '0');
        elsif(rising_edge(clk)) then
            EQ_vol_coef_addr    <= EQ_level_inputs(to_integer(unsigned(EQ_select_d(0))));
            EQ_vol_data         <= EQ_data_inputs(to_integer(unsigned(EQ_select_d(1))));
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_ROM
    -- Description : Contains coefficient for volume control
    ----------------------------------------------------------------
    U_ROM : ROM_32_16bit port map(
        clk     => clk,
        a       => EQ_vol_coef_addr,
        qspo    => ROM_out);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_fetch
    -- Description : Fetch coefficient from ROM and extend data to 19 bits
    --------------------------------------------------------------------------------
    P_fetch : process(clk, reset_n)
    begin
        if(reset_n='0') then
            EQ_vol_data_ex  <= (others => '0');
            EQ_vol_coef     <= (others => '0');
        elsif(rising_edge(clk)) then
            EQ_vol_coef <= ROM_out;
            if(unsigned(EQ_select_d(2))<C_FIR_MAX+2 and EQ_vol_data(15)='1') then
                EQ_vol_data_ex  <= "111" & EQ_vol_data(15 downto 0);
            else
                EQ_vol_data_ex  <= EQ_vol_data;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_Mult
    -- Description : 16x19 multiplier
    ----------------------------------------------------------------
    U_Mult : Multiplier_u16_s19 port map(
        clk => clk,
        a   => EQ_vol_coef,
        b   => EQ_vol_data_ex,
        p   => mult_out);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_sat
    -- Description : Saturation
    --------------------------------------------------------------------------------
    P_sat : process(reset_n, clk)
    begin
        if(reset_n='0') then
            EQ_sat  <= (others => '0');
        elsif(rising_edge(clk)) then
            if(mult_out(34 downto 28)="0000000" or mult_out(34 downto 28)="1111111") then
                EQ_sat  <= mult_out(28 downto 13);
            elsif(mult_out(34)='0') then
                EQ_sat  <= X"7FFF";
            else
                EQ_sat  <= X"8000";
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Accumulator data in
    --------------------------------------------------------------------------------
    EQ_accu_din <= mult_out(31 downto 13);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_accu
    -- Description : Store results
    --------------------------------------------------------------------------------
    P_accu : process(clk, reset_n)
    begin
        if(reset_n='0') then
            EQ_accu <= to_unsigned(0, EQ_accu'length);
        elsif(rising_edge(clk)) then
            if(EQ_clear='1') then
                EQ_accu <= to_unsigned(0, EQ_accu'length);
            elsif(EQ_en_d(6)='1' and EQ_chan_sel(to_integer(unsigned(EQ_select_d(6))))='1') then
                EQ_accu <= EQ_accu + unsigned(EQ_accu_din) ;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_store
    -- Description : Store result in correct data segment
    --------------------------------------------------------------------------------
    P_store : process(reset_n, clk)
    begin
        if(reset_n='0') then
            EQ_dout <= (others => '0');
        elsif(rising_edge(clk)) then
            if(EQ_en_d(7)='1') then
                EQ_dout(to_integer(unsigned(EQ_select_d(7)))*16+15 downto to_integer(unsigned(EQ_select_d(7)))*16) <= EQ_sat;
            end if;
        end if;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------