-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : NRM_Normalizer.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-12-09
-- Last update: 2019-12-19
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Computation of the module of a complex number
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-12-09  1.0      Hugo HARTMANN   Creation
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
entity NRM_Normalizer is
    generic(
        G_OPERAND_SIZE  : integer := 16
        );
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- NRM out --------------------------
        NRM_dout        : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);

        ------- NRM control ----------------------
        NRM_en          : in  std_logic;
        NRM_done        : out std_logic;

        ------- NRM in ---------------------------
        NRM_din_r       : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
        NRM_din_i       : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0)

        );
end NRM_Normalizer;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of NRM_Normalizer is

    --------------------------------------------------------------------------------
    -- TYPE DECLARATIONS
    --------------------------------------------------------------------------------
    type T_EN is array (0 to 5) of std_logic;

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

    component NRM_SQRT
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
    signal NRM_en_d         : T_EN;
    signal din_r_d          : std_logic_vector(C_SIZE-1 downto 0);
    signal din_i_d          : std_logic_vector(C_SIZE-1 downto 0);
    signal p_real           : std_logic_vector(2*C_SIZE-1 downto 0);
    signal p_imag           : std_logic_vector(2*C_SIZE-1 downto 0);
    signal p_real_d         : std_logic_vector(2*C_SIZE-1 downto 0);
    signal p_imag_d         : std_logic_vector(2*C_SIZE-1 downto 0);
    signal sum_real         : unsigned(2*C_SIZE-1 downto 0);
    signal sqrt_in          : std_logic_vector(31 downto 0);
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
            din_r_d     <= (others => '0'); -- Merge register with DSP block by commenting
            din_i_d     <= (others => '0');
            NRM_en_d(0) <= '0';
        elsif(rising_edge(clk)) then
            din_r_d     <= NRM_din_r;
            din_i_d     <= NRM_din_i;
            NRM_en_d(0) <= NRM_en;
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_Mult1
    -- Description : Signed multiplier (real x real parts)
    ----------------------------------------------------------------
    U_Mult1 : Multiplier_s16_s16 port map(
        clk => clk,
        a   => din_r_d,
        b   => din_r_d,
        p   => p_real);

    ----------------------------------------------------------------
    -- INSTANCE : U_Mult2 
    -- Description : Signed multiplier (imag x imag parts)
    ----------------------------------------------------------------
    U_Mult2 : Multiplier_s16_s16 port map(
        clk => clk,
        a   => din_i_d,
        b   => din_i_d,
        p   => p_imag);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_delay
    -- Description : Register delay
    --------------------------------------------------------------------------------
    P_delay : process(clk, reset_n)
    begin
        if(reset_n='0') then
            NRM_en_d(1) <= '0';
            NRM_en_d(2) <= '0';
            NRM_en_d(3) <= '0';
        elsif(rising_edge(clk)) then
            NRM_en_d(1) <= NRM_en_d(0);
            NRM_en_d(2) <= NRM_en_d(1);
            NRM_en_d(3) <= NRM_en_d(2);
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_mult_output
    -- Description : Register multipliers outputs
    --------------------------------------------------------------------------------
    P_mult_output : process(clk, reset_n)
    begin
        if(reset_n='0') then
            p_real_d    <= (others => '0');
            p_imag_d    <= (others => '0');
            NRM_en_d(4) <= '0';
        elsif(rising_edge(clk)) then
            p_real_d    <= p_real;
            p_imag_d    <= p_imag;
            NRM_en_d(4) <= NRM_en_d(3);
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
            NRM_en_d(5) <= '0';
        elsif(rising_edge(clk)) then
            sqrt_in     <= std_logic_vector(sum_real);
            NRM_en_d(5) <= NRM_en_d(4);
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_Sqrt
    -- Description : Squareroot module
    ----------------------------------------------------------------
    U_Sqrt : NRM_SQRT port map(
        aclk                    => clk,
        s_axis_cartesian_tvalid => NRM_en_d(5),
        s_axis_cartesian_tdata  => sqrt_in,
        m_axis_dout_tvalid      => NRM_done,
        m_axis_dout_tdata       => sqrt_out);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Output mapping
    --------------------------------------------------------------------------------
    NRM_dout    <= sqrt_out(15 downto 0);

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------