-------------------------------------------------------------------------------
--  This entire design, which includes all of the components and related files,
--  has been created and owned by : ELSYS DESIGN
--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : FFT_Multiplier.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-21
-- Last update: 2019-11-21
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
    -- CONSTANT DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_SIZE : integer   := G_OPERAND_SIZE;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
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
    signal din_r            : std_logic_vector(C_SIZE-1 downto 0);
    signal din_i            : std_logic_vector(C_SIZE-1 downto 0);
    signal coef_r           : std_logic_vector(C_SIZE-1 downto 0);
    signal coef_i           : std_logic_vector(C_SIZE-1 downto 0);
    signal p_real           : std_logic_vector(2*C_SIZE-1 downto 0);
    signal p_imag           : std_logic_vector(2*C_SIZE-1 downto 0);
    signal p_imag_real      : std_logic_vector(2*C_SIZE-1 downto 0);
    signal p_real_imag      : std_logic_vector(2*C_SIZE-1 downto 0);
    signal FFT_en_d         : std_logic;
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
    -- COMBINATORY :
    -- Description : multipliers inputs assignation
    --------------------------------------------------------------------------------
    coef_r  <= FFT_coef_r;
    coef_i  <= FFT_coef_i;
    din_r   <= FFT_din_r;
    din_i   <= FFT_din_i;

    ----------------------------------------------------------------
    -- INSTANCE : U_Mult1
    -- Description : Signed multiplier (real x real parts)
    ----------------------------------------------------------------
    U_Mult1 : Multiplier generic map(
        G_OPERAND_A_SIZE    => C_SIZE,
        G_OPERAND_B_SIZE    => C_SIZE,
        G_MULT_OUT_SIZE     => 2*C_SIZE)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        enable      => '1',
        opA         => din_r,
        opB         => coef_r,
        mult_out    => p_real);

    ----------------------------------------------------------------
    -- INSTANCE : U_Mult2 
    -- Description : Signed multiplier (imag x imag parts)
    ----------------------------------------------------------------
    U_Mult2 : Multiplier generic map(
        G_OPERAND_A_SIZE    => C_SIZE,
        G_OPERAND_B_SIZE    => C_SIZE,
        G_MULT_OUT_SIZE     => 2*C_SIZE)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        enable      => '1',
        opA         => din_i,
        opB         => coef_i,
        mult_out    => p_imag);

    ----------------------------------------------------------------
    -- INSTANCE : U_Mult3
    -- Description : Signed multiplier (real x imag parts)
    ----------------------------------------------------------------
    U_Mult3 : Multiplier generic map(
        G_OPERAND_A_SIZE    => C_SIZE,
        G_OPERAND_B_SIZE    => C_SIZE,
        G_MULT_OUT_SIZE     => 2*C_SIZE)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        enable      => '1',
        opA         => din_r,
        opB         => coef_i,
        mult_out    => p_real_imag);

    ----------------------------------------------------------------
    -- INSTANCE : U_Mult4
    -- Description : Signed multiplier (imag x real parts)
    ----------------------------------------------------------------
    U_Mult4 : Multiplier generic map(
        G_OPERAND_A_SIZE    => C_SIZE,
        G_OPERAND_B_SIZE    => C_SIZE,
        G_MULT_OUT_SIZE     => 2*C_SIZE)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        enable      => '1',
        opA         => din_i,
        opB         => coef_r,
        mult_out    => p_imag_real);

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
            FFT_en_d        <= '0';
        elsif(rising_edge(clk)) then
            p_real_d        <= p_real;
            p_imag_d        <= p_imag;
            p_real_imag_d   <= p_real_imag;
            p_imag_real_d   <= p_imag_real;
            FFT_en_d        <= FFT_en;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Additions
    --------------------------------------------------------------------------------
    sum_real    <= unsigned(p_real_d) - unsigned(p_imag_d);
    sum_imag    <= unsigned(p_real_imag_d) + unsigned(p_imag_real_d);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Rounding
    --------------------------------------------------------------------------------
    round_Cin_r(C_SIZE downto 1)    <= (others => '0');
    round_Cin_r(0)                  <= sum_real(C_SIZE-2);
    round_real  <= sum_real(2*C_SIZE-1 downto C_SIZE-1) + round_Cin_r;

    round_Cin_i(C_SIZE downto 1)    <= (others => '0');
    round_Cin_i(0)                  <= sum_imag(C_SIZE-2);
    round_imag  <= sum_imag(2*C_SIZE-1 downto C_SIZE-1) + round_Cin_i;

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
            FFT_done    <= FFT_en_d;
        end if;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------