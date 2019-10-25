-------------------------------------------------------------------------------
--  This entire design, which includes all of the components and related files,
--  has been created and owned by : ELSYS DESIGN
--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : VGA_RAM_wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-25
-- Last update: 2019-10-25
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
    constant C_DEMI_CLK         : time      := 4630 ps;
    constant C_TIMEOUT          : time      := 100 ms;

    component VGA_Controller is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            VGA_new_frame   : out std_logic;
            RAM_read        : out std_logic;
            RAM_address     : out std_logic_vector(31 downto 0);
            RAM_v_add       : out std_logic_vector(15 downto 0);
            RAM_h_add       : out std_logic_vector(15 downto 0);
            RGB_in          : in  std_logic_vector(7 downto 0);
            vga_hsync       : out std_logic;
            vga_vsync       : out std_logic;
            vga_r           : out std_logic_vector(2 downto 0);
            vga_g           : out std_logic_vector(2 downto 0);
            vga_b           : out std_logic_vector(1 downto 0)
            );
    end component;

    component VGA_RAM_interface is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            VGA_new_frame   : in  std_logic;
            RAM_read_video  : in  std_logic;
            RAM_address     : in  std_logic_vector(31 downto 0);
            RAM_v_add       : in  std_logic_vector(15 downto 0);
            RAM_h_add       : in  std_logic_vector(15 downto 0);
            RGB_out         : out std_logic_vector(7 downto 0);
            RAM_read_audio  : in  std_logic;
            RAM_dout        : in  std_logic_vector(7 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal clk                  : std_logic := '0';
    signal reset_n              : std_logic;
    signal locked           : std_logic;
    signal UART_dout        : std_logic_vector(7 downto 0);
    signal UART_read        : std_logic;
    signal UART_write       : std_logic;
    signal RAM_read         : std_logic;
    signal RAM_read_video   : std_logic;
    signal RAM_dout         : std_logic_vector(7 downto 0);
    signal RAM_address      : std_logic_vector(31 downto 0);
    signal RAM_v_add        : std_logic_vector(15 downto 0);
    signal RAM_h_add        : std_logic_vector(15 downto 0);
    signal RGB_VGA          : std_logic_vector(7 downto 0);
    signal VGA_new_frame    : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_VGA_controller
    -- Description: VGA controller, fetch image from memory and outputs VGA format
    ----------------------------------------------------------------
    U_VGA_controller : VGA_Controller port map(
        clk             => clk,
        reset_n         => reset_n,
        VGA_new_frame   => VGA_new_frame,
        RAM_read        => RAM_read_video,
        RAM_address     => RAM_address,
        RAM_v_add       => RAM_v_add,
        RAM_h_add       => RAM_h_add,
        RGB_in          => RGB_VGA);

    ----------------------------------------------------------------
    -- INSTANCE : U_VGA_RAM_interface
    -- Description: VGA controller, fetch image from memory and outputs VGA format
    ----------------------------------------------------------------
    U_VGA_RAM_interface : VGA_RAM_interface port map(
        clk             => clk,
        reset_n         => reset_n,
        VGA_new_frame   => VGA_new_frame,
        RAM_read_video  => RAM_read_video,
        RAM_address     => RAM_address,
        RAM_v_add       => RAM_v_add,
        RAM_h_add       => RAM_h_add,
        RGB_out         => RGB_VGA,
        RAM_read_audio  => RAM_read,
        RAM_dout        => RAM_dout);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_clock_gen
    -- Description : 108 MHz clock generator process
    --------------------------------------------------------------------------------
    P_clk_gen : process(clk)
    begin
        clk <= not(clk) after C_DEMI_CLK;   -- Clock generation
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Reset creation
    --------------------------------------------------------------------------------
    reset_n         <= '0' , '1'    after (3*C_DEMI_CLK);


end A;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------