-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : NRM_Wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-12-09
-- Last update: 2020-03-01
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: NRM_Wrapper for custom NRM module
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
entity NRM_Wrapper is
    generic(
        G_BEHAVIOURAL   : boolean := false
        );
    port(

        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- FFT interface --------------------
        NRM_addrA_w     : in  std_logic_vector(10 downto 0);
        NRM_addrB_w     : in  std_logic_vector(10 downto 0);
        NRM_dinA_r      : in  std_logic_vector(15 downto 0);
        NRM_dinA_i      : in  std_logic_vector(15 downto 0);
        NRM_dinB_r      : in  std_logic_vector(15 downto 0);
        NRM_dinB_i      : in  std_logic_vector(15 downto 0);
        NRM_write       : in  std_logic;
        NRM_loaded      : in  std_logic;

        ------- Audio interface ------------------
        NRM_new_sample  : in  std_logic;

        ------- VGA interface --------------------
        NRM_start       : in  std_logic;
        NRM_addr_r      : in  std_logic_vector(10 downto 0);
        NRM_dout        : out std_logic_vector(15 downto 0)

        );
end NRM_Wrapper;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of NRM_Wrapper is

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component NRM_FSM is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            NRM_addr        : out std_logic_vector(10 downto 0);
            NRM_start       : in  std_logic;
            NRM_new_sample  : in  std_logic;
            NRM_loaded      : in  std_logic;
            NRM_open        : out std_logic;
            NRM_en          : out std_logic
            );
    end component;

    component NRM_RAM_Wrapper is
        generic(
            G_BEHAVIOURAL   : boolean := false
            );
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            RAM_dinA_r      : in  std_logic_vector(15 downto 0);
            RAM_dinA_i      : in  std_logic_vector(15 downto 0);
            RAM_dinB_r      : in  std_logic_vector(15 downto 0);
            RAM_dinB_i      : in  std_logic_vector(15 downto 0);
            NRM_addrA_r     : in  std_logic_vector(10 downto 0);
            NRM_addrB_r     : in  std_logic_vector(10 downto 0);
            NRM_addrA_w     : in  std_logic_vector(10 downto 0);
            NRM_addrB_w     : in  std_logic_vector(10 downto 0);
            NRM_write_A     : in  std_logic;
            NRM_write_B     : in  std_logic;
            RAM_doutA_r     : out std_logic_vector(15 downto 0);
            RAM_doutA_i     : out std_logic_vector(15 downto 0);
            RAM_doutB_r     : out std_logic_vector(15 downto 0);
            RAM_doutB_i     : out std_logic_vector(15 downto 0);
            RAM_en          : in  std_logic;
            RAM_rdy         : out std_logic
            );
    end component;

    component NRM_Normalizer is
        generic(
            G_OPERAND_SIZE  : integer := 16
            );
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            NRM_dout        : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            NRM_en          : in  std_logic;
            NRM_done        : out std_logic;
            NRM_din_r       : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
            NRM_din_i       : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal RAM_dinA_r       : std_logic_vector(15 downto 0);
    signal RAM_dinA_i       : std_logic_vector(15 downto 0);
    signal RAM_dinB_r       : std_logic_vector(15 downto 0);
    signal RAM_dinB_i       : std_logic_vector(15 downto 0);
    signal RAM_addrA_r      : std_logic_vector(10 downto 0);
    signal RAM_addrB_r      : std_logic_vector(10 downto 0);
    signal RAM_addrA_w      : std_logic_vector(10 downto 0);
    signal RAM_addrB_w      : std_logic_vector(10 downto 0);
    signal RAM_write_A      : std_logic;
    signal RAM_write_B      : std_logic;
    signal RAM_doutA_r      : std_logic_vector(15 downto 0);
    signal RAM_doutA_i      : std_logic_vector(15 downto 0);
    signal RAM_doutB_r      : std_logic_vector(15 downto 0);
    signal RAM_doutB_i      : std_logic_vector(15 downto 0);
    signal NRM_addr         : std_logic_vector(10 downto 0);
    signal NRM_open         : std_logic;
    signal NRM_en_out_FSM   : std_logic;
    signal NRM_en_out_RAM   : std_logic;
    signal NRM_done         : std_logic;
    signal NRM_norm_dout    : std_logic_vector(15 downto 0);
    signal addr_counter     : unsigned(10 downto 0);
    signal addrA_norm       : std_logic_vector(10 downto 0);


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
            if(NRM_done='0') then
                addr_counter    <= to_unsigned(0, addr_counter'length);
            else
                addr_counter    <= addr_counter + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Multiplexing of addresses and data
    --------------------------------------------------------------------------------
    addrA_norm  <= std_logic_vector(addr_counter);
    
    ---- Write address
    RAM_addrA_w <= addrA_norm when(NRM_open='0') else NRM_addrA_w;
    RAM_addrB_w <= NRM_addrB_w;

    ---- Read address
    RAM_addrA_r <= NRM_addr_r;
    RAM_addrB_r <= NRM_addr;

    ---- Input data
    RAM_dinA_r  <= NRM_norm_dout when(NRM_open='0') else NRM_dinA_r;
    RAM_dinA_i  <= NRM_dinA_i;
    RAM_dinB_r  <= NRM_dinB_r;
    RAM_dinB_i  <= NRM_dinB_i;

    ---- Control signals
    RAM_write_A <= NRM_done when(NRM_open='0') else NRM_write;
    RAM_write_B <= '0'      when(NRM_open='0') else NRM_write;

    ----------------------------------------------------------------
    -- INSTANCE : U_NRM_RAM_Wrapper
    -- Description : Custom RAM wrapper for NRM module
    ----------------------------------------------------------------
    U_NRM_RAM_Wrapper : NRM_RAM_Wrapper generic map(
        G_BEHAVIOURAL   => G_BEHAVIOURAL)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        RAM_dinA_r  => RAM_dinA_r,
        RAM_dinA_i  => RAM_dinA_i,
        RAM_dinB_r  => RAM_dinB_r,
        RAM_dinB_i  => RAM_dinB_i,
        NRM_addrA_r => RAM_addrA_r,
        NRM_addrB_r => RAM_addrB_r,
        NRM_addrA_w => RAM_addrA_w,
        NRM_addrB_w => RAM_addrB_w,
        NRM_write_A => RAM_write_A,
        NRM_write_B => RAM_write_B,
        RAM_doutA_r => RAM_doutA_r,
        RAM_doutA_i => RAM_doutA_i,
        RAM_doutB_r => RAM_doutB_r,
        RAM_doutB_i => RAM_doutB_i,
        RAM_en      => NRM_en_out_FSM,
        RAM_rdy     => NRM_en_out_RAM);

    ----------------------------------------------------------------
    -- INSTANCE : U_NRM_FSM
    -- Description : FSM to execute NRM computations
    ----------------------------------------------------------------
    U_NRM_FSM : NRM_FSM port map(
        clk             => clk,
        reset_n         => reset_n,
        NRM_addr        => NRM_addr,
        NRM_start       => NRM_start,
        NRM_new_sample  => NRM_new_sample,
        NRM_loaded      => NRM_loaded,
        NRM_open        => NRM_open,
        NRM_en          => NRM_en_out_FSM);

    ----------------------------------------------------------------
    -- INSTANCE : U_NRM_Normalizer
    -- Description : Computation of the module of a complex number
    ----------------------------------------------------------------
    U_NRM_Normalizer : NRM_Normalizer generic map(
        G_OPERAND_SIZE   => 16)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        NRM_dout    => NRM_norm_dout,
        NRM_en      => NRM_en_out_RAM,
        NRM_done    => NRM_done,
        NRM_din_r   => RAM_doutB_r,
        NRM_din_i   => RAM_doutB_i);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Output
    --------------------------------------------------------------------------------
    NRM_dout    <= RAM_doutA_r;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------