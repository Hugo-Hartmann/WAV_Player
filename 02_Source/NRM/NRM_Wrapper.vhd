-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : NRM_Wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-12-09
-- Last update: 2020-08-04
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
    port(

        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- Config interface -------------
        CFG_addr        : in  std_logic_vector(7 downto 0);
        CFG_write       : in  std_logic;
        CFG_din         : in  std_logic_vector(15 downto 0);

        ------- NRM interface --------------------
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
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            RAM_spl_dinA_r  : in  std_logic_vector(15 downto 0);
            RAM_spl_dinA_i  : in  std_logic_vector(15 downto 0);
            RAM_spl_dinB_r  : in  std_logic_vector(15 downto 0);
            RAM_spl_dinB_i  : in  std_logic_vector(15 downto 0);
            NRM_spl_addrA_r : in  std_logic_vector(10 downto 0);
            NRM_spl_addrB_r : in  std_logic_vector(10 downto 0);
            NRM_spl_addrA_w : in  std_logic_vector(10 downto 0);
            NRM_spl_addrB_w : in  std_logic_vector(10 downto 0);
            NRM_spl_write_A : in  std_logic;
            NRM_spl_write_B : in  std_logic;
            RAM_spl_doutA_r : out std_logic_vector(15 downto 0);
            RAM_spl_doutA_i : out std_logic_vector(15 downto 0);
            RAM_spl_doutB_r : out std_logic_vector(15 downto 0);
            RAM_spl_doutB_i : out std_logic_vector(15 downto 0);
            RAM_mdl_din_r   : in  std_logic_vector(15 downto 0);
            NRM_mdl_addr_r  : in  std_logic_vector(10 downto 0);
            NRM_mdl_addr_w  : in  std_logic_vector(10 downto 0);
            NRM_mdl_write   : in  std_logic;
            RAM_mdl_dout_r  : out std_logic_vector(15 downto 0);
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

    component NRM_Config_RAM is
        port(
            clk                 : in  std_logic;
            reset_n             : in  std_logic;
            CFG_addr            : in  std_logic_vector(7 downto 0);
            CFG_write           : in  std_logic;
            CFG_din             : in  std_logic_vector(15 downto 0);
            NRM_rounds_nb       : out std_logic_vector(3 downto 0)
            );
    end component;

    component NRM_Mapper is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            NRM_rounds_nb   : in  std_logic_vector(3 downto 0);
            NRM_en          : in  std_logic;
            NRM_din         : in  std_logic_vector(15 downto 0);
            NRM_dout        : out std_logic_vector(15 downto 0);
            NRM_addr_map    : out std_logic_vector(10 downto 0);
            NRM_addr_valid  : out std_logic
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
    signal NRM_UAL_done     : std_logic;
    signal NRM_norm_dout    : std_logic_vector(15 downto 0);
    signal NRM_map_dout     : std_logic_vector(15 downto 0);
    signal NRM_addr_map     : std_logic_vector(10 downto 0);
    signal NRM_rounds_nb    : std_logic_vector(3 downto 0);
    signal NRM_addr_valid   : std_logic;


--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ---- Write address
    RAM_addrA_w <= NRM_addrA_w;
    RAM_addrB_w <= NRM_addrB_w;

    ---- Read address
    RAM_addrA_r <= NRM_addr_r;
    RAM_addrB_r <= NRM_addr;

    ---- Input data
    RAM_dinA_r  <= NRM_dinA_r;
    RAM_dinA_i  <= NRM_dinA_i;
    RAM_dinB_r  <= NRM_dinB_r;
    RAM_dinB_i  <= NRM_dinB_i;

    ---- Control signals
    RAM_write_A <= NRM_open AND NRM_write;
    RAM_write_B <= NRM_open AND NRM_write;

    ----------------------------------------------------------------
    -- INSTANCE : U_NRM_RAM_Wrapper
    -- Description : Custom RAM wrapper for NRM module
    ----------------------------------------------------------------
    U_NRM_RAM_Wrapper : NRM_RAM_Wrapper port map(
        clk             => clk,
        reset_n         => reset_n,
        RAM_spl_dinA_r  => RAM_dinA_r,
        RAM_spl_dinA_i  => RAM_dinA_i,
        RAM_spl_dinB_r  => RAM_dinB_r,
        RAM_spl_dinB_i  => RAM_dinB_i,
        NRM_spl_addrA_r => RAM_addrA_r,
        NRM_spl_addrB_r => RAM_addrB_r,
        NRM_spl_addrA_w => RAM_addrA_w,
        NRM_spl_addrB_w => RAM_addrB_w,
        NRM_spl_write_A => RAM_write_A,
        NRM_spl_write_B => RAM_write_B,
        RAM_spl_doutA_r => RAM_doutA_r,
        RAM_spl_doutA_i => RAM_doutA_i,
        RAM_spl_doutB_r => RAM_doutB_r,
        RAM_spl_doutB_i => RAM_doutB_i,
        RAM_mdl_din_r   => NRM_map_dout,
        NRM_mdl_addr_r  => NRM_addr_r,
        NRM_mdl_addr_w  => NRM_addr_map,
        NRM_mdl_write   => NRM_addr_valid,
        RAM_mdl_dout_r  => NRM_dout,
        RAM_en          => NRM_en_out_FSM,
        RAM_rdy         => NRM_en_out_RAM);

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
        clk             => clk,
        reset_n         => reset_n,
        NRM_dout        => NRM_norm_dout,
        NRM_en          => NRM_en_out_RAM,
        NRM_done        => NRM_UAL_done,
        NRM_din_r       => RAM_doutB_r,
        NRM_din_i       => RAM_doutB_i);

    ----------------------------------------------------------------
    -- INSTANCE : U_NRM_Config_RAM
    -- Description : Manage sampling for NRM module
    ----------------------------------------------------------------
    U_NRM_Config_RAM : NRM_Config_RAM port map(
        clk                 => clk,
        reset_n             => reset_n,
        CFG_addr            => CFG_addr,
        CFG_write           => CFG_write,
        CFG_din             => CFG_din,
        NRM_rounds_nb       => NRM_rounds_nb);

    ----------------------------------------------------------------
    -- INSTANCE : U_NRM_Mapper
    -- Description: Correctly maps FFT addresses based on FFT number of points
    ----------------------------------------------------------------
    U_NRM_Mapper : NRM_Mapper port map(
        clk             => clk,
        reset_n         => reset_n,
        NRM_rounds_nb   => NRM_rounds_nb,
        NRM_en          => NRM_UAL_done,
        NRM_din         => NRM_norm_dout,
        NRM_dout        => NRM_map_dout,
        NRM_addr_map    => NRM_addr_map,
        NRM_addr_valid  => NRM_addr_valid);


end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------