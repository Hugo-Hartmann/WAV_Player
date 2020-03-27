-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : NRM_RAM_Wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-12-09
-- Last update: 2019-03-27
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Custom RAM wrapper for NRM module
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
entity NRM_RAM_Wrapper is
    generic(
        G_BEHAVIOURAL   : boolean := false
        );
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- RAM in ---------------------------
        RAM_dinA_r      : in  std_logic_vector(15 downto 0);
        RAM_dinA_i      : in  std_logic_vector(15 downto 0);
        RAM_dinB_r      : in  std_logic_vector(15 downto 0);
        RAM_dinB_i      : in  std_logic_vector(15 downto 0);

        ------- RAM control ----------------------
        NRM_addrA_r     : in  std_logic_vector(10 downto 0);
        NRM_addrB_r     : in  std_logic_vector(10 downto 0);
        NRM_addrA_w     : in  std_logic_vector(10 downto 0);
        NRM_addrB_w     : in  std_logic_vector(10 downto 0);
        NRM_write_A     : in  std_logic;
        NRM_write_B     : in  std_logic;

        ------- RAM out --------------------------
        RAM_doutA_r     : out std_logic_vector(15 downto 0);
        RAM_doutA_i     : out std_logic_vector(15 downto 0);
        RAM_doutB_r     : out std_logic_vector(15 downto 0);
        RAM_doutB_i     : out std_logic_vector(15 downto 0)

        );
end NRM_RAM_Wrapper;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of NRM_RAM_Wrapper is

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component BRAM_2048_32bit
        port(
            clka    : in  std_logic;
            wea     : in  std_logic_vector(0 downto 0);
            ena     : in  std_logic;
            addra   : in  std_logic_vector(10 downto 0);
            dina    : in  std_logic_vector(31 downto 0);
            douta   : out std_logic_vector(31 downto 0);
            clkb    : in  std_logic;
            web     : in  std_logic_vector(0 downto 0);
            enb     : in  std_logic;
            addrb   : in  std_logic_vector(10 downto 0);
            dinb    : in  std_logic_vector(31 downto 0);
            doutb   : out std_logic_vector(31 downto 0)
        );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal RAM_NRM_wrA      : std_logic_vector(0 downto 0);
    signal RAM_NRM_addrA    : std_logic_vector(10 downto 0);
    signal RAM_NRM_dinA     : std_logic_vector(31 downto 0);
    signal RAM_NRM_doutA    : std_logic_vector(31 downto 0);
    signal RAM_NRM_wrB      : std_logic_vector(0 downto 0);
    signal RAM_NRM_addrB    : std_logic_vector(10 downto 0);
    signal RAM_NRM_dinB     : std_logic_vector(31 downto 0);
    signal RAM_NRM_doutB    : std_logic_vector(31 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM_NRM
    -- Description : Contains 2048 complex numbers from NRM computations
    ----------------------------------------------------------------
    RAM : if G_BEHAVIOURAL=false generate
        U_RAM_NRM : BRAM_2048_32bit port map(
            clka    => clk,
            wea     => RAM_NRM_wrA,
            ena     => '1',
            addra   => RAM_NRM_addrA,
            dina    => RAM_NRM_dinA,
            douta   => RAM_NRM_doutA,
            clkb    => clk,
            web     => RAM_NRM_wrB,
            enb     => '1',
            addrb   => RAM_NRM_addrB,
            dinb    => RAM_NRM_dinB,
            doutb   => RAM_NRM_doutB);
    end generate;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : RAM_NRM port multiplexing
    --------------------------------------------------------------------------------
    
    --- Port A
    RAM_NRM_wrA     <= (others => NRM_write_A);
    RAM_NRM_addrA   <= NRM_addrA_r  when(NRM_write_A='0') else NRM_addrA_w;
    RAM_NRM_dinA    <= RAM_dinA_r & RAM_dinA_i;

    --- Port B
    RAM_NRM_wrB     <= (others => NRM_write_B);
    RAM_NRM_addrB   <= NRM_addrB_r  when(NRM_write_B='0') else NRM_addrB_w;
    RAM_NRM_dinB    <= RAM_dinB_r & RAM_dinB_i;

    --- Outputs
    RAM_doutA_r     <= RAM_NRM_doutA(31 downto 16);
    RAM_doutA_i     <= RAM_NRM_doutA(15 downto 0);

    RAM_doutB_r     <= RAM_NRM_doutB(31 downto 16);
    RAM_doutB_i     <= RAM_NRM_doutB(15 downto 0);


end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------