-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FFT_Wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-26
-- Last update: 2019-11-27
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

        ------- FFT interface --------------------
        FFT_din         : in  std_logic_vector(7 downto 0);
        FFT_addr        : in  std_logic_vector(8 downto 0);
        FFT_new_sample  : in  std_logic;
        FFT_start       : in  std_logic;
        FFT_read        : in  std_logic;
        FFT_dout        : out std_logic_vector(15 downto 0)

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
            FFT_addr_A      : out std_logic_vector(8 downto 0);
            FFT_addr_B      : out std_logic_vector(8 downto 0);
            FFT_addr_coef   : out std_logic_vector(7 downto 0);
            FFT_start       : in  std_logic;
            FFT_new_sample  : in  std_logic;
            FFT_stage_busy  : in  std_logic;
            FFT_en_btfly    : out std_logic;
            FFT_en_norm     : out std_logic
            );
    end component;

    component FFT_RAM_Wrapper is
        generic(
            G_BEHAVIOURAL   : boolean := false
            );
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            FFT_din         : in  std_logic_vector(7 downto 0);
            RAM_dinA_r      : in  std_logic_vector(15 downto 0);
            RAM_dinA_i      : in  std_logic_vector(15 downto 0);
            RAM_dinB_r      : in  std_logic_vector(15 downto 0);
            RAM_dinB_i      : in  std_logic_vector(15 downto 0);
            FFT_btfly_done  : in  std_logic;
            FFT_norm_done   : in  std_logic;
            FFT_addrA_r     : in  std_logic_vector(8 downto 0);
            FFT_addrB_r     : in  std_logic_vector(8 downto 0);
            FFT_addrC_r     : in  std_logic_vector(7 downto 0);
            FFT_addrA_w     : in  std_logic_vector(8 downto 0);
            FFT_addrB_w     : in  std_logic_vector(8 downto 0);
            FFT_addr        : in  std_logic_vector(8 downto 0);
            FFT_new_sample  : in  std_logic;
            FFT_start       : in  std_logic;
            FFT_read        : in  std_logic;
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
            FFT_en_btfly    : in  std_logic;
            FFT_en_norm     : in  std_logic;
            FFT_btfly_done  : out std_logic;
            FFT_norm_done   : out std_logic;
            FFT_dinA_r      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_dinA_i      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_dinB_r      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            FFT_dinB_i      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
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
    signal RAM_dinA_r       : std_logic_vector(15 downto 0);
    signal RAM_dinA_i       : std_logic_vector(15 downto 0);
    signal RAM_dinB_r       : std_logic_vector(15 downto 0);
    signal RAM_dinB_i       : std_logic_vector(15 downto 0);
    signal FFT_btfly_done   : std_logic;
    signal FFT_norm_done    : std_logic;
    signal FFT_addrA_r      : std_logic_vector(8 downto 0);
    signal FFT_addrB_r      : std_logic_vector(8 downto 0);
    signal FFT_addrC_r      : std_logic_vector(7 downto 0);
    signal FFT_addrA_w      : std_logic_vector(8 downto 0);
    signal FFT_addrB_w      : std_logic_vector(8 downto 0);
    signal RAM_doutA_r      : std_logic_vector(15 downto 0);
    signal RAM_doutA_i      : std_logic_vector(15 downto 0);
    signal RAM_doutB_r      : std_logic_vector(15 downto 0);
    signal RAM_doutB_i      : std_logic_vector(15 downto 0);
    signal RAM_doutC_r      : std_logic_vector(15 downto 0);
    signal RAM_doutC_i      : std_logic_vector(15 downto 0);
    signal FFT_en_btfly     : std_logic;
    signal FFT_en_norm      : std_logic;
    signal FFT_stage_busy   : std_logic;
    signal addrA_btfly      : std_logic_vector(8 downto 0);
    signal addrB_btfly      : std_logic_vector(8 downto 0);
    signal addrA_norm       : std_logic_vector(8 downto 0);
    signal addr_counter     : unsigned(8 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_count
    -- Description : Generate address for Normalizer output
    --------------------------------------------------------------------------------
    P_count : process(clk, reset_n)
    begin
        if(reset_n='0') then
            addr_counter    <= to_unsigned(0, addr_counter'length);
        elsif(rising_edge(clk)) then
            if(FFT_en_btfly='1') then
                addr_counter    <= to_unsigned(0, addr_counter'length);
            elsif(FFT_norm_done='1') then
                addr_counter    <= addr_counter + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Multiplexing of write addresses
    --------------------------------------------------------------------------------
    addrA_norm  <= std_logic_vector(addr_counter);
    FFT_addrA_w <= addrA_norm when(FFT_norm_done='1') else addrA_btfly;
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
        FFT_din         => FFT_din,
        RAM_dinA_r      => RAM_dinA_r,
        RAM_dinA_i      => RAM_dinA_i,
        RAM_dinB_r      => RAM_dinB_r,
        RAM_dinB_i      => RAM_dinB_i,
        FFT_btfly_done  => FFT_btfly_done,
        FFT_norm_done   => FFT_norm_done,
        FFT_addrA_r     => FFT_addrA_r,
        FFT_addrB_r     => FFT_addrB_r,
        FFT_addrC_r     => FFT_addrC_r,
        FFT_addrA_w     => FFT_addrA_w,
        FFT_addrB_w     => FFT_addrB_w,
        FFT_addr        => FFT_addr,
        FFT_new_sample  => FFT_new_sample,
        FFT_start       => FFT_start,
        FFT_read        => FFT_read,
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
        FFT_start       => FFT_start,
        FFT_new_sample  => FFT_new_sample,
        FFT_stage_busy  => FFT_stage_busy,
        FFT_en_btfly    => FFT_en_btfly,
        FFT_en_norm     => FFT_en_norm);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : FFT_stage_busy
    --------------------------------------------------------------------------------
    FFT_stage_busy  <= FFT_btfly_done OR FFT_norm_done;

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
        FFT_en_btfly    => FFT_en_btfly,
        FFT_en_norm     => FFT_en_norm,
        FFT_btfly_done  => FFT_btfly_done,
        FFT_norm_done   => FFT_norm_done,
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
    U_FIFO_addrA : FFT_FIFO generic map(
        G_OPERAND_SIZE  => 9,
        G_FIFO_SIZE     => 5)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        FFT_dout    => addrA_btfly,
        FFT_din     => FFT_addrA_r);

    ----------------------------------------------------------------
    -- INSTANCE : U_FIFO_addrA
    -- Description : Simple FIFO
    ----------------------------------------------------------------
    U_FIFO_addrB : FFT_FIFO generic map(
        G_OPERAND_SIZE  => 9,
        G_FIFO_SIZE     => 5)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        FFT_dout    => addrB_btfly,
        FFT_din     => FFT_addrB_r);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Output
    --------------------------------------------------------------------------------
    FFT_dout    <= RAM_doutA_r;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------