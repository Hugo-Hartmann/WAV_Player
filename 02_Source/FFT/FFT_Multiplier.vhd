-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FFT_Multiplier.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-21
-- Last update: 2019-12-19
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Complex Multiplication for FFT module
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-11-21  1.0      Hugo HARTMANN   Creation
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
entity FFT_Multiplier is
    generic(
        G_OPERAND_SIZE  : integer := 16
        );
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- FFT out --------------------------
        FFT_dout_r      : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
        FFT_dout_i      : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);

        ------- FFT control ----------------------
        FFT_en          : in  std_logic;
        FFT_done        : out std_logic;

        ------- FFT in ---------------------------
        FFT_din_r       : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
        FFT_din_i       : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
        FFT_coef_r      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
        FFT_coef_i      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0)

        );
end FFT_Multiplier;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of FFT_Multiplier is

    --------------------------------------------------------------------------------
    -- TYPE DECLARATIONS
    --------------------------------------------------------------------------------
    type T_EN is array (0 to 6) of std_logic;

    --------------------------------------------------------------------------------
    -- CONSTANT DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_SIZE : integer   := G_OPERAND_SIZE;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component Multiplier_s16_s16
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
    signal din_r            : std_logic_vector(C_SIZE-1 downto 0);
    signal din_i            : std_logic_vector(C_SIZE-1 downto 0);
    signal coef_r           : std_logic_vector(C_SIZE-1 downto 0);
    signal coef_i           : std_logic_vector(C_SIZE-1 downto 0);
    signal p_real           : std_logic_vector(2*C_SIZE-1 downto 0);
    signal p_imag           : std_logic_vector(2*C_SIZE-1 downto 0);
    signal p_imag_real      : std_logic_vector(2*C_SIZE-1 downto 0);
    signal p_real_imag      : std_logic_vector(2*C_SIZE-1 downto 0);
    signal FFT_en_d         : T_EN;
    signal p_real_d         : std_logic_vector(2*C_SIZE-1 downto 0);
    signal p_imag_d         : std_logic_vector(2*C_SIZE-1 downto 0);
    signal p_imag_real_d    : std_logic_vector(2*C_SIZE-1 downto 0);
    signal p_real_imag_d    : std_logic_vector(2*C_SIZE-1 downto 0);
    signal sum_real         : unsigned(2*C_SIZE-1 downto 0);
    signal sum_imag         : unsigned(2*C_SIZE-1 downto 0);
    signal round_real       : unsigned(C_SIZE downto 0);
    signal round_Cin_r      : unsigned(C_SIZE downto 0);
    signal round_imag       : unsigned(C_SIZE downto 0);
    signal round_Cin_i      : unsigned(C_SIZE downto 0);
    signal sat_real         : unsigned(C_SIZE-1 downto 0);
    signal sat_imag         : unsigned(C_SIZE-1 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_input
    -- Description : Register multipliers inputs
    --------------------------------------------------------------------------------
    P_input : process(clk, reset_n)
    begin
        if(reset_n='0') then
            --coef_r      <= (others => '0');   -- Merge register with DSP block by commenting
            --coef_i      <= (others => '0');
            --din_r       <= (others => '0');
            --din_i       <= (others => '0');
            FFT_en_d(0) <= '0';
        elsif(rising_edge(clk)) then
            coef_r      <= FFT_coef_r;
            coef_i      <= FFT_coef_i;
            din_r       <= FFT_din_r;
            din_i       <= FFT_din_i;
            FFT_en_d(0) <= FFT_en;
        end if;
    end process;


    ----------------------------------------------------------------
    -- INSTANCE : U_Mult1
    -- Description : Signed multiplier (real x real parts)
    ----------------------------------------------------------------
    U_Mult1 : Multiplier_s16_s16 port map(
        clk => clk,
        a   => din_r,
        b   => coef_r,
        p   => p_real);

    ----------------------------------------------------------------
    -- INSTANCE : U_Mult2 
    -- Description : Signed multiplier (imag x imag parts)
    ----------------------------------------------------------------
    U_Mult2 : Multiplier_s16_s16 port map(
        clk => clk,
        a   => din_i,
        b   => coef_i,
        p   => p_imag);

    ----------------------------------------------------------------
    -- INSTANCE : U_Mult3
    -- Description : Signed multiplier (real x imag parts)
    ----------------------------------------------------------------
    U_Mult3 : Multiplier_s16_s16 port map(
        clk => clk,
        a   => din_r,
        b   => coef_i,
        p   => p_real_imag);

    ----------------------------------------------------------------
    -- INSTANCE : U_Mult4
    -- Description : Signed multiplier (imag x real parts)
    ----------------------------------------------------------------
    U_Mult4 : Multiplier_s16_s16 port map(
        clk => clk,
        a   => din_i,
        b   => coef_r,
        p   => p_imag_real);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_delay
    -- Description : Register delay
    --------------------------------------------------------------------------------
    P_delay : process(clk, reset_n)
    begin
        if(reset_n='0') then
            FFT_en_d(1) <= '0';
            FFT_en_d(2) <= '0';
            FFT_en_d(3) <= '0';
        elsif(rising_edge(clk)) then
            FFT_en_d(1) <= FFT_en_d(0);
            FFT_en_d(2) <= FFT_en_d(1);
            FFT_en_d(3) <= FFT_en_d(2);
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_mult
    -- Description : Register multipliers outputs
    --------------------------------------------------------------------------------
    P_mult : process(clk, reset_n)
    begin
        if(reset_n='0') then
            p_real_d        <= (others => '0');
            p_imag_d        <= (others => '0');
            p_real_imag_d   <= (others => '0');
            p_imag_real_d   <= (others => '0');
            FFT_en_d(4)     <= '0';
        elsif(rising_edge(clk)) then
            p_real_d        <= p_real;
            p_imag_d        <= p_imag;
            p_real_imag_d   <= p_real_imag;
            p_imag_real_d   <= p_imag_real;
            FFT_en_d(4)     <= FFT_en_d(3);
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_add
    -- Description : Register adder outputs
    --------------------------------------------------------------------------------
    P_add : process(clk, reset_n)
    begin
        if(reset_n='0') then
            sum_real    <= to_unsigned(0, sum_real'length);
            sum_imag    <= to_unsigned(0, sum_imag'length);
            FFT_en_d(5) <= '0';
        elsif(rising_edge(clk)) then
            sum_real    <= unsigned(p_real_d) - unsigned(p_imag_d);
            sum_imag    <= unsigned(p_real_imag_d) + unsigned(p_imag_real_d);
            FFT_en_d(5) <= FFT_en_d(4);
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_round
    -- Description : Register adder outputs
    --------------------------------------------------------------------------------
    P_round : process(clk, reset_n)
    begin
        if(reset_n='0') then
            round_Cin_r <= (others => '0');
            round_real  <= (others => '0');
            round_Cin_i <= (others => '0');
            round_imag  <= (others => '0');
            FFT_en_d(6) <= '0';
        elsif(rising_edge(clk)) then
            round_Cin_r(C_SIZE downto 1)    <= (others => '0');
            round_Cin_r(0)                  <= sum_real(C_SIZE-2);
            round_real                      <= sum_real(2*C_SIZE-1 downto C_SIZE-1) + round_Cin_r;

            round_Cin_i(C_SIZE downto 1)    <= (others => '0');
            round_Cin_i(0)                  <= sum_imag(C_SIZE-2);
            round_imag                      <= sum_imag(2*C_SIZE-1 downto C_SIZE-1) + round_Cin_i;

            FFT_en_d(6) <= FFT_en_d(5);
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Saturation
    --------------------------------------------------------------------------------
    sat_real    <= round_real(C_SIZE-1 downto 0) when(round_real(C_SIZE)=round_real(C_SIZE-1)) else
                   (C_SIZE-1 => '0', others => '1') when(round_real(C_SIZE)='0') else
                   (C_SIZE-1 => '1', others => '0');
    sat_imag    <= round_imag(C_SIZE-1 downto 0) when(round_imag(C_SIZE)=round_imag(C_SIZE-1)) else
                   (C_SIZE-1 => '0', others => '1') when(round_imag(C_SIZE)='0') else
                   (C_SIZE-1 => '1', others => '0');

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_output
    -- Description : Register outputs
    --------------------------------------------------------------------------------
    P_output : process(clk, reset_n)
    begin
        if(reset_n='0') then
            FFT_dout_r  <= (others => '0');
            FFT_dout_i  <= (others => '0');
            FFT_done    <= '0';
        elsif(rising_edge(clk)) then
            FFT_dout_r  <= std_logic_vector(sat_real);
            FFT_dout_i  <= std_logic_vector(sat_imag);
            FFT_done    <= FFT_en_d(6);
        end if;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------