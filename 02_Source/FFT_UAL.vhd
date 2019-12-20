-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FFT_UAL.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-21
-- Last update: 2019-12-19
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: UAL for FFT 2x2 computation
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
entity FFT_UAL is
    generic(
        G_OPERAND_SIZE  : integer := 16
        );
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- FFT out --------------------------
        FFT_doutA_r     : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
        FFT_doutA_i     : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
        FFT_doutB_r     : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
        FFT_doutB_i     : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);

        ------- FFT control ----------------------
        FFT_en          : in  std_logic;
        FFT_done        : out std_logic;

        ------- FFT in ---------------------------
        FFT_dinA_r      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
        FFT_dinA_i      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
        FFT_dinB_r      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
        FFT_dinB_i      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
        FFT_coef_r      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
        FFT_coef_i      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0)

        );
end FFT_UAL;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of FFT_UAL is

    --------------------------------------------------------------------------------
    -- CONSTANT DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_SIZE : integer   := G_OPERAND_SIZE;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component FFT_Adder is
        generic(
            G_OPERAND_SIZE  : integer := 16;
            G_SUB_EN        : boolean := false
            );
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            FFT_dout_r      : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_dout_i      : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_en          : in  std_logic;
            FFT_done        : out std_logic;
            FFT_dinA_r      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_dinA_i      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_dinB_r      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_dinB_i      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0)
            );
    end component;

    component FFT_Multiplier is
        generic(
            G_OPERAND_SIZE  : integer := 16
            );
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            FFT_dout_r      : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_dout_i      : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_en          : in  std_logic;
            FFT_done        : out std_logic;
            FFT_din_r       : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_din_i       : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_coef_r      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_coef_i      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0)
            );
    end component;

    component FFT_FIFO is
        generic(
            G_OPERAND_SIZE  : integer := 16;
            G_FIFO_SIZE     : integer := 2
            );
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            FFT_dout        : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_din         : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal Adder_out_r  : std_logic_vector(G_OPERAND_SIZE-1 downto 0);
    signal Adder_out_i  : std_logic_vector(G_OPERAND_SIZE-1 downto 0);
    signal Sub_out_r    : std_logic_vector(G_OPERAND_SIZE-1 downto 0);
    signal Sub_out_i    : std_logic_vector(G_OPERAND_SIZE-1 downto 0);
    signal Sub_done     : std_logic;
    signal Mult_coef_r  : std_logic_vector(G_OPERAND_SIZE-1 downto 0);
    signal Mult_coef_i  : std_logic_vector(G_OPERAND_SIZE-1 downto 0);
    signal Btfly_out_r  : std_logic_vector(G_OPERAND_SIZE-1 downto 0);
    signal Btfly_out_i  : std_logic_vector(G_OPERAND_SIZE-1 downto 0);
    signal Mult_done    : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_Adder
    -- Description : Complex Add/Sub for FFT module
    ----------------------------------------------------------------
    U_Adder : FFT_Adder generic map(
        G_OPERAND_SIZE  => G_OPERAND_SIZE,
        G_SUB_EN        => false)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        FFT_dout_r  => Adder_out_r,
        FFT_dout_i  => Adder_out_i,
        FFT_en      => FFT_en,
        --FFT_done    => FFT_done,
        FFT_dinA_r  => FFT_dinA_r,
        FFT_dinA_i  => FFT_dinA_i,
        FFT_dinB_r  => FFT_dinB_r,
        FFT_dinB_i  => FFT_dinB_i);

    ----------------------------------------------------------------
    -- INSTANCE : U_FIFO_A_r
    -- Description : Simple FIFO
    ----------------------------------------------------------------
    U_FIFO_A_r : FFT_FIFO generic map(
        G_OPERAND_SIZE  => G_OPERAND_SIZE,
        G_FIFO_SIZE     => 8)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        FFT_dout    => Btfly_out_r,
        FFT_din     => Adder_out_r);

    ----------------------------------------------------------------
    -- INSTANCE : U_FIFO_A_i
    -- Description : Simple FIFO
    ----------------------------------------------------------------
    U_FIFO_A_i : FFT_FIFO generic map(
        G_OPERAND_SIZE  => G_OPERAND_SIZE,
        G_FIFO_SIZE     => 8)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        FFT_dout    => Btfly_out_i,
        FFT_din     => Adder_out_i);

    ----------------------------------------------------------------
    -- INSTANCE : U_Sub
    -- Description : Complex Add/Sub for FFT module
    ----------------------------------------------------------------
    U_Sub : FFT_Adder generic map(
        G_OPERAND_SIZE  => G_OPERAND_SIZE,
        G_SUB_EN        => true)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        FFT_dout_r  => Sub_out_r,
        FFT_dout_i  => Sub_out_i,
        FFT_en      => FFT_en,
        FFT_done    => Sub_done,
        FFT_dinA_r  => FFT_dinA_r,
        FFT_dinA_i  => FFT_dinA_i,
        FFT_dinB_r  => FFT_dinB_r,
        FFT_dinB_i  => FFT_dinB_i);

    ----------------------------------------------------------------
    -- INSTANCE : U_FIFO_coef_r
    -- Description : Simple FIFO
    ----------------------------------------------------------------
    U_FIFO_coef_r : FFT_FIFO generic map(
        G_OPERAND_SIZE  => G_OPERAND_SIZE,
        G_FIFO_SIZE     => 2)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        FFT_dout    => Mult_coef_r,
        FFT_din     => FFT_coef_r);

    ----------------------------------------------------------------
    -- INSTANCE : U_FIFO_coef_i
    -- Description : Simple FIFO
    ----------------------------------------------------------------
    U_FIFO_coef_i : FFT_FIFO generic map(
        G_OPERAND_SIZE  => G_OPERAND_SIZE,
        G_FIFO_SIZE     => 2)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        FFT_dout    => Mult_coef_i,
        FFT_din     => FFT_coef_i);

    ----------------------------------------------------------------
    -- INSTANCE : U_Multiplier
    -- Description : Complex Multiplication for FFT module
    ----------------------------------------------------------------
    U_Multiplier : FFT_Multiplier generic map(
        G_OPERAND_SIZE  => G_OPERAND_SIZE)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        FFT_dout_r  => FFT_doutB_r,
        FFT_dout_i  => FFT_doutB_i,
        FFT_en      => Sub_done,
        FFT_done    => Mult_done,
        FFT_din_r   => Sub_out_r,
        FFT_din_i   => Sub_out_i,
        FFT_coef_r  => Mult_coef_r,
        FFT_coef_i  => Mult_coef_i);


    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Output multiplexing
    --------------------------------------------------------------------------------
    FFT_doutA_r <= Btfly_out_r;
    FFT_doutA_i <= Btfly_out_i;
    FFT_done    <= Mult_done;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------