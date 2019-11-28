-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FFT_Normalizer.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-26
-- Last update: 2019-11-28
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Computation of the module of a complex number
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-11-26  1.0      Hugo HARTMANN   Creation
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
entity FFT_Normalizer is
    generic(
        G_OPERAND_SIZE  : integer := 16
        );
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- FFT out --------------------------
        FFT_dout        : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);

        ------- FFT control ----------------------
        FFT_en          : in  std_logic;
        FFT_done        : out std_logic;

        ------- FFT in ---------------------------
        FFT_din_r       : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
        FFT_din_i       : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0)

        );
end FFT_Normalizer;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of FFT_Normalizer is

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

    component FFT_SQRT
        port(
            aclk                    : in std_logic;
            s_axis_cartesian_tvalid : in  std_logic;
            s_axis_cartesian_tdata  : in  std_logic_vector(31 downto 0);
            m_axis_dout_tvalid      : out std_logic;
            m_axis_dout_tdata       : out std_logic_vector(23 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal din_r_d          : std_logic_vector(C_SIZE-1 downto 0);
    signal din_i_d          : std_logic_vector(C_SIZE-1 downto 0);
    signal FFT_en_d         : std_logic;
    signal p_real           : std_logic_vector(2*C_SIZE-1 downto 0);
    signal p_imag           : std_logic_vector(2*C_SIZE-1 downto 0);
    signal p_real_d         : std_logic_vector(2*C_SIZE-1 downto 0);
    signal p_imag_d         : std_logic_vector(2*C_SIZE-1 downto 0);
    signal sum_real         : unsigned(2*C_SIZE-1 downto 0);
    signal FFT_en_dd        : std_logic;
    signal sqrt_in          : std_logic_vector(31 downto 0);
    signal FFT_en_ddd       : std_logic;
    signal sqrt_out         : std_logic_vector(23 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_mult_input
    -- Description : Register multipliers inputs
    --------------------------------------------------------------------------------
    P_mult_input : process(clk, reset_n)
    begin
        if(reset_n='0') then
            din_r_d     <= (others => '0');
            din_i_d     <= (others => '0');
            FFT_en_d    <= '0';
        elsif(rising_edge(clk)) then
            din_r_d     <= FFT_din_r;
            din_i_d     <= FFT_din_i;
            FFT_en_d    <= FFT_en;
        end if;
    end process;

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
        opA         => din_r_d,
        opB         => din_r_d,
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
        opA         => din_i_d,
        opB         => din_i_d,
        mult_out    => p_imag);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_mult_output
    -- Description : Register multipliers outputs
    --------------------------------------------------------------------------------
    P_mult_output : process(clk, reset_n)
    begin
        if(reset_n='0') then
            p_real_d        <= (others => '0');
            p_imag_d        <= (others => '0');
            FFT_en_dd       <= '0';
        elsif(rising_edge(clk)) then
            p_real_d        <= p_real;
            p_imag_d        <= p_imag;
            FFT_en_dd       <= FFT_en_d;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Additions
    --------------------------------------------------------------------------------
    sum_real    <= unsigned(p_real_d) + unsigned(p_imag_d);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_sum
    -- Description : Register sum outputs
    --------------------------------------------------------------------------------
    P_sum : process(clk, reset_n)
    begin
        if(reset_n='0') then
            sqrt_in     <= (others => '0');
            FFT_en_ddd  <= '0';
        elsif(rising_edge(clk)) then
            sqrt_in     <= std_logic_vector(sum_real);
            FFT_en_ddd  <= FFT_en_dd;
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_Sqrt
    -- Description : Squareroot module
    ----------------------------------------------------------------
    U_Sqrt : FFT_SQRT port map(
        aclk                    => clk,
        s_axis_cartesian_tvalid => FFT_en_ddd,
        s_axis_cartesian_tdata  => sqrt_in,
        m_axis_dout_tvalid      => FFT_done,
        m_axis_dout_tdata       => sqrt_out);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Output mapping
    --------------------------------------------------------------------------------
    FFT_dout    <= sqrt_out(15 downto 0);

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------