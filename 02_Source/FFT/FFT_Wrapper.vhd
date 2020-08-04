-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FFT_Wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-26
-- Last update: 2020-08-04
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: FFT_Wrapper for custom FFT module
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
entity FFT_Wrapper is
    generic(
        G_BEHAVIOURAL   : boolean := false
        );
    port(

        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- Config interface -------------
        CFG_addr        : in  std_logic_vector(7 downto 0);
        CFG_write       : in  std_logic;
        CFG_din         : in  std_logic_vector(15 downto 0);

        ------- Audio interface ------------------
        FFT_din         : in  std_logic_vector(15 downto 0);
        FFT_new_sample  : in  std_logic;

        ------- VGA interface --------------------
        FFT_start       : in  std_logic;

        ------- FFT interface --------------------
        FFT_addrA       : out std_logic_vector(10 downto 0);
        FFT_addrB       : out std_logic_vector(10 downto 0);
        FFT_doutA_r     : out std_logic_vector(15 downto 0);
        FFT_doutA_i     : out std_logic_vector(15 downto 0);
        FFT_doutB_r     : out std_logic_vector(15 downto 0);
        FFT_doutB_i     : out std_logic_vector(15 downto 0);
        FFT_write       : out std_logic;
        FFT_done        : out std_logic

        );
end FFT_Wrapper;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of FFT_Wrapper is

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component FFT_FSM is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            FFT_addr_A      : out std_logic_vector(10 downto 0);
            FFT_addr_B      : out std_logic_vector(10 downto 0);
            FFT_addr_coef   : out std_logic_vector(9 downto 0);
            FFT_addr_valid  : out std_logic;
            FFT_rounds_nb   : in  std_logic_vector(3 downto 0);
            FFT_new_sample  : in  std_logic;
            FFT_start       : in  std_logic;
            FFT_stage_busy  : in  std_logic;
            FFT_done        : out std_logic
            );
    end component;

    component FFT_RAM_Wrapper is
        generic(
            G_BEHAVIOURAL   : boolean := false
            );
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            FFT_din         : in  std_logic_vector(15 downto 0);
            RAM_dinA_r      : in  std_logic_vector(15 downto 0);
            RAM_dinA_i      : in  std_logic_vector(15 downto 0);
            RAM_dinB_r      : in  std_logic_vector(15 downto 0);
            RAM_dinB_i      : in  std_logic_vector(15 downto 0);
            FFT_done        : in  std_logic;
            FFT_addrA_r     : in  std_logic_vector(10 downto 0);
            FFT_addrB_r     : in  std_logic_vector(10 downto 0);
            FFT_addrC_r     : in  std_logic_vector(9 downto 0);
            FFT_addrA_w     : in  std_logic_vector(10 downto 0);
            FFT_addrB_w     : in  std_logic_vector(10 downto 0);
            FFT_addr_valid  : in  std_logic;
            FFT_data_valid  : out std_logic;
            FFT_new_sample  : in  std_logic;
            FFT_start       : in  std_logic;
            RAM_doutA_r     : out std_logic_vector(15 downto 0);
            RAM_doutA_i     : out std_logic_vector(15 downto 0);
            RAM_doutB_r     : out std_logic_vector(15 downto 0);
            RAM_doutB_i     : out std_logic_vector(15 downto 0);
            RAM_doutC_r     : out std_logic_vector(15 downto 0);
            RAM_doutC_i     : out std_logic_vector(15 downto 0)
            );
    end component;

    component FFT_UAL is
        generic(
            G_OPERAND_SIZE  : integer := 16
            );
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            FFT_doutA_r     : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_doutA_i     : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_doutB_r     : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_doutB_i     : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_en          : in  std_logic;
            FFT_done        : out std_logic;
            FFT_dinA_r      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_dinA_i      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_dinB_r      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_dinB_i      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_coef_r      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_coef_i      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0)
            );
    end component;

    component FFT_FIFO is
        port(
            clk     : in  std_logic;
            rst     : in  std_logic;
            din     : in  std_logic_vector(10 downto 0);
            wr_en   : in  std_logic;
            rd_en   : in  std_logic;
            dout    : out std_logic_vector(10 downto 0);
            full    : out std_logic;
            empty   : out std_logic
        );
    end component;

    component FFT_Sampler is
        port(
            clk             : in  std_logic;
            reset_n             : in  std_logic;
            FFT_din             : in  std_logic_vector(15 downto 0);
            FFT_new_sample      : in  std_logic;
            FFT_sample_point    : in  std_logic_vector(3 downto 0);
            FFT_end_point       : in  std_logic_vector(3 downto 0);
            FFT_sample          : out std_logic_vector(15 downto 0);
            FFT_sample_valid    : out std_logic
            );
    end component;

    component FFT_Config_RAM is
        port(
            clk                 : in  std_logic;
            reset_n             : in  std_logic;
            CFG_addr            : in  std_logic_vector(7 downto 0);
            CFG_write           : in  std_logic;
            CFG_din             : in  std_logic_vector(15 downto 0);
            FFT_rounds_nb       : out std_logic_vector(3 downto 0);
            FFT_sample_point    : out std_logic_vector(3 downto 0);
            FFT_end_point       : out std_logic_vector(3 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal RAM_dinA_r           : std_logic_vector(15 downto 0);
    signal RAM_dinA_i           : std_logic_vector(15 downto 0);
    signal RAM_dinB_r           : std_logic_vector(15 downto 0);
    signal RAM_dinB_i           : std_logic_vector(15 downto 0);
    signal FFT_btfly_done       : std_logic;
    signal FFT_addrA_r          : std_logic_vector(10 downto 0);
    signal FFT_addrB_r          : std_logic_vector(10 downto 0);
    signal FFT_addrC_r          : std_logic_vector(9 downto 0);
    signal FFT_addrA_w          : std_logic_vector(10 downto 0);
    signal FFT_addrB_w          : std_logic_vector(10 downto 0);
    signal RAM_doutA_r          : std_logic_vector(15 downto 0);
    signal RAM_doutA_i          : std_logic_vector(15 downto 0);
    signal RAM_doutB_r          : std_logic_vector(15 downto 0);
    signal RAM_doutB_i          : std_logic_vector(15 downto 0);
    signal RAM_doutC_r          : std_logic_vector(15 downto 0);
    signal RAM_doutC_i          : std_logic_vector(15 downto 0);
    signal FFT_stage_busy       : std_logic;
    signal addrA_btfly          : std_logic_vector(10 downto 0);
    signal addrB_btfly          : std_logic_vector(10 downto 0);
    signal reset                : std_logic;
    signal FFT_sample           : std_logic_vector(15 downto 0);
    signal FFT_sample_valid     : std_logic;
    signal FFT_sample_point     : std_logic_vector(3 downto 0);
    signal FFT_end_point        : std_logic_vector(3 downto 0);
    signal FFT_rounds_nb        : std_logic_vector(3 downto 0);
    signal FFT_addr_valid       : std_logic;
    signal FFT_data_valid       : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Multiplexing of write addresses
    --------------------------------------------------------------------------------
    FFT_addrA_w <= addrA_btfly;
    FFT_addrB_w <= addrB_btfly;

    ----------------------------------------------------------------
    -- INSTANCE : U_FFT_RAM_Wrapper
    -- Description : Custom RAM wrapper for FFT module
    ----------------------------------------------------------------
    U_FFT_RAM_Wrapper : FFT_RAM_Wrapper generic map(
        G_BEHAVIOURAL   => G_BEHAVIOURAL)
    port map(
        clk             => clk,
        reset_n         => reset_n,
        FFT_din         => FFT_sample,
        RAM_dinA_r      => RAM_dinA_r,
        RAM_dinA_i      => RAM_dinA_i,
        RAM_dinB_r      => RAM_dinB_r,
        RAM_dinB_i      => RAM_dinB_i,
        FFT_done        => FFT_btfly_done,
        FFT_addrA_r     => FFT_addrA_r,
        FFT_addrB_r     => FFT_addrB_r,
        FFT_addrC_r     => FFT_addrC_r,
        FFT_addrA_w     => FFT_addrA_w,
        FFT_addrB_w     => FFT_addrB_w,
        FFT_addr_valid  => FFT_addr_valid,
        FFT_data_valid  => FFT_data_valid,
        FFT_new_sample  => FFT_sample_valid,
        FFT_start       => FFT_start,
        RAM_doutA_r     => RAM_doutA_r,
        RAM_doutA_i     => RAM_doutA_i,
        RAM_doutB_r     => RAM_doutB_r,
        RAM_doutB_i     => RAM_doutB_i,
        RAM_doutC_r     => RAM_doutC_r,
        RAM_doutC_i     => RAM_doutC_i);

    ----------------------------------------------------------------
    -- INSTANCE : U_FFT_FSM
    -- Description : FSM to execute FFT computations
    ----------------------------------------------------------------
    U_FFT_FSM : FFT_FSM port map(
        clk             => clk,
        reset_n         => reset_n,
        FFT_addr_A      => FFT_addrA_r,
        FFT_addr_B      => FFT_addrB_r,
        FFT_addr_coef   => FFT_addrC_r,
        FFT_addr_valid  => FFT_addr_valid,
        FFT_start       => FFT_start,
        FFT_rounds_nb   => FFT_rounds_nb,
        FFT_new_sample  => FFT_sample_valid,
        FFT_stage_busy  => FFT_stage_busy,
        FFT_done        => FFT_done);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : FFT_stage_busy
    --------------------------------------------------------------------------------
    FFT_stage_busy  <= FFT_btfly_done;

    ----------------------------------------------------------------
    -- INSTANCE : U_FFT_UAL
    -- Description : UAL for FFT 2x2 computation
    ----------------------------------------------------------------
    U_FFT_UAL : FFT_UAL generic map(
        G_OPERAND_SIZE   => 16)
    port map(
        clk             => clk,
        reset_n         => reset_n,
        FFT_doutA_r     => RAM_dinA_r,
        FFT_doutA_i     => RAM_dinA_i,
        FFT_doutB_r     => RAM_dinB_r,
        FFT_doutB_i     => RAM_dinB_i,
        FFT_en          => FFT_data_valid,
        FFT_done        => FFT_btfly_done,
        FFT_dinA_r      => RAM_doutA_r,
        FFT_dinA_i      => RAM_doutA_i,
        FFT_dinB_r      => RAM_doutB_r,
        FFT_dinB_i      => RAM_doutB_i,
        FFT_coef_r      => RAM_doutC_r,
        FFT_coef_i      => RAM_doutC_i);

    ----------------------------------------------------------------
    -- INSTANCE : U_FIFO_addrA
    -- Description : Simple FIFO
    ----------------------------------------------------------------
    U_FIFO_addrA : FFT_FIFO port map(
        clk     => clk,
        rst     => reset,
        din     => FFT_addrA_r,
        wr_en   => FFT_addr_valid,
        rd_en   => FFT_btfly_done,
        dout    => addrA_btfly,
        full    => open,
        empty   => open);

    ----------------------------------------------------------------
    -- INSTANCE : U_FIFO_addrB
    -- Description : Simple FIFO
    ----------------------------------------------------------------
    U_FIFO_addrB : FFT_FIFO port map(
        clk     => clk,
        rst     => reset,
        din     => FFT_addrB_r,
        wr_en   => FFT_addr_valid,
        rd_en   => FFT_btfly_done,
        dout    => addrB_btfly,
        full    => open,
        empty   => open);

    ----------------------------------------------------------------
    -- INSTANCE : U_FFT_Sampler
    -- Description : Manage sampling for FFT module
    ----------------------------------------------------------------
    U_FFT_Sampler : FFT_Sampler port map(
        clk                 => clk,
        reset_n             => reset_n,
        FFT_din             => FFT_din,
        FFT_new_sample      => FFT_new_sample,
        FFT_sample_point    => FFT_sample_point,
        FFT_end_point       => FFT_end_point,
        FFT_sample          => FFT_sample,
        FFT_sample_valid    => FFT_sample_valid);

    ----------------------------------------------------------------
    -- INSTANCE : U_FFT_Config_RAM
    -- Description : Manage sampling for FFT module
    ----------------------------------------------------------------
    U_FFT_Config_RAM : FFT_Config_RAM port map(
        clk                 => clk,
        reset_n             => reset_n,
        CFG_addr            => CFG_addr,
        CFG_write           => CFG_write,
        CFG_din             => CFG_din,
        FFT_rounds_nb       => FFT_rounds_nb,
        FFT_sample_point    => FFT_sample_point,
        FFT_end_point       => FFT_end_point);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : reset
    --------------------------------------------------------------------------------
    reset   <= NOT reset_n;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Output
    --------------------------------------------------------------------------------
    FFT_addrA   <= FFT_addrA_w;
    FFT_addrB   <= FFT_addrB_w;
    FFT_doutA_r <= RAM_dinA_r;
    FFT_doutA_i <= RAM_dinA_i;
    FFT_doutB_r <= RAM_dinB_r;
    FFT_doutB_i <= RAM_dinB_i;
    FFT_write   <= FFT_btfly_done;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------