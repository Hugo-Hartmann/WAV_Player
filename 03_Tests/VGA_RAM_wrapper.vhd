-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : VGA_RAM_wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-25
-- Last update: 2020-07-23
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Stimuli of VGA-RAM interface
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-10-25  1.0      Hugo HARTMANN   Creation
-------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- LIBRARIES DECLARATION
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_VHDL;
use lib_VHDL.all;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
entity VGA_RAM_wrapper is
end VGA_RAM_wrapper;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture A of VGA_RAM_wrapper is

    --------------------------------------------------------------------------------
    -- CONSTANTS DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_DEMI_CLK_108     : time      := 4630 ps;
    constant C_DEMI_CLK_216     : time      := 2315 ps;
    constant C_TIMEOUT          : time      := 100 ms;

    component VGA_controller is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            VGA_new_frame   : out std_logic;
            VGA_read        : out std_logic;
            VGA_address     : out std_logic_vector(31 downto 0);
            VGA_v_add       : out std_logic_vector(15 downto 0);
            VGA_h_add       : out std_logic_vector(15 downto 0);
            VGA_din         : in  std_logic_vector(11 downto 0);
            VGA_hsync       : out std_logic;
            VGA_vsync       : out std_logic;
            VGA_r           : out std_logic_vector(3 downto 0);
            VGA_g           : out std_logic_vector(3 downto 0);
            VGA_b           : out std_logic_vector(3 downto 0)
            );
    end component;

    component VGA_interface is
        port(
            clk_108         : in  std_logic;
            clk_216         : in  std_logic;
            reset_n         : in  std_logic;
            VGA_new_frame   : in  std_logic;
            VGA_read        : in  std_logic;
            VGA_address     : in  std_logic_vector(31 downto 0);
            VGA_v_add       : in  std_logic_vector(15 downto 0);
            VGA_h_add       : in  std_logic_vector(15 downto 0);
            VGA_din         : out std_logic_vector(11 downto 0);
            WAV_read        : in  std_logic;
            VGA_select      : in  std_logic_vector(3 downto 0);
            EQ_level_dout   : in  std_logic_vector((5+2)*5+4 downto 0);
            EQ_dout         : in  std_logic_vector((5+2)*16+15 downto 0);
            VU_dout         : in  std_logic_vector((5+2)*5+4 downto 0);
            NRM_addr        : out std_logic_vector(10 downto 0);
            NRM_dout        : in  std_logic_vector(15 downto 0);
            WAV_push        : out std_logic_vector(8 downto 0);
            FFT_push        : out std_logic_vector(16 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal clk_108          : std_logic := '0';
    signal clk_216          : std_logic := '0';
    signal reset_n          : std_logic;
    signal VGA_new_frame    : std_logic;
    signal VGA_read         : std_logic;
    signal VGA_address      : std_logic_vector(31 downto 0);
    signal VGA_v_add        : std_logic_vector(15 downto 0);
    signal VGA_h_add        : std_logic_vector(15 downto 0);
    signal VGA_din          : std_logic_vector(11 downto 0);
    signal VGA_hsync        : std_logic;
    signal VGA_vsync        : std_logic;
    signal VGA_r            : std_logic_vector(3 downto 0);
    signal VGA_g            : std_logic_vector(3 downto 0);
    signal VGA_b            : std_logic_vector(3 downto 0);
    signal WAV_read         : std_logic := '0';
    signal VGA_select       : std_logic_vector(3 downto 0) := "0000";
    signal EQ_level_dout    : std_logic_vector((5+2)*5+4 downto 0);
    signal EQ_dout          : std_logic_vector((5+2)*16+15 downto 0);
    signal VU_dout          : std_logic_vector((5+2)*5+4 downto 0);
    signal NRM_addr         : std_logic_vector(10 downto 0);
    signal NRM_dout         : std_logic_vector(15 downto 0);
    signal WAV_push         : std_logic_vector(8 downto 0);
    signal FFT_push         : std_logic_vector(16 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_VGA_controller
    -- Description: VGA controller, fetch image from memory and outputs VGA format
    ----------------------------------------------------------------
    U_VGA_controller : VGA_controller port map(
        clk             => clk_108,
        reset_n         => reset_n,
        VGA_new_frame   => VGA_new_frame,
        VGA_read        => VGA_read,
        VGA_address     => VGA_address,
        VGA_v_add       => VGA_v_add,
        VGA_h_add       => VGA_h_add,
        VGA_din         => VGA_din,
        VGA_hsync       => VGA_hsync,
        VGA_vsync       => VGA_vsync,
        VGA_r           => VGA_r,
        VGA_g           => VGA_g,
        VGA_b           => VGA_b);

    ----------------------------------------------------------------
    -- INSTANCE : U_VGA_interface
    -- Description: VGA controller, fetch image from memory and outputs VGA format
    ----------------------------------------------------------------
    U_VGA_interface : VGA_interface port map(
        clk_108         => clk_108,
        clk_216         => clk_216,
        reset_n         => reset_n,
        VGA_new_frame   => VGA_new_frame,
        VGA_read        => VGA_read,
        VGA_address     => VGA_address,
        VGA_v_add       => VGA_v_add,
        VGA_h_add       => VGA_h_add,
        VGA_din         => VGA_din,
        WAV_read        => WAV_read,
        VGA_select      => VGA_select,
        VU_dout         => VU_dout,
        EQ_dout         => EQ_dout,
        EQ_level_dout   => EQ_level_dout,
        NRM_addr        => NRM_addr,
        NRM_dout        => NRM_dout,
        WAV_push        => WAV_push,
        FFT_push        => FFT_push);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_clock_gen_108
    -- Description : 108 MHz clock generator process
    --------------------------------------------------------------------------------
    P_clock_gen_108 : process(clk_108)
    begin
        clk_108 <= not(clk_108) after C_DEMI_CLK_108;   -- Clock generation
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_clock_gen_216
    -- Description : 216 MHz clock generator process
    --------------------------------------------------------------------------------
    P_clock_gen_216 : process(clk_216)
    begin
        clk_216 <= not(clk_216) after C_DEMI_CLK_216;   -- Clock generation
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Reset creation
    --------------------------------------------------------------------------------
    reset_n         <= '0' , '1'    after (3*C_DEMI_CLK_108);

    EQ_level_dout   <= (others => '0');
    EQ_dout         <= (others => '0');
    VU_dout         <= (others => '1');
    NRM_dout        <= (others => '0');

end A;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------