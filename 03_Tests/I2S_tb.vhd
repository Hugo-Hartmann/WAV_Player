-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : I2S_tb.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-12-16
-- Last update: 2019-12-16
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Stimuli for TOP_I2S
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-12-16  1.0      Hugo HARTMANN   Creation
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
entity I2S_tb is
end I2S_tb;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture A of I2S_tb is

    --------------------------------------------------------------------------------
    -- CONSTANTS DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_DEMI_CLK_112     : time      := 4444 ps;
    constant C_DEMI_CLK_108     : time      := 4630 ps;
    constant C_TIMEOUT          : time      := 100 ms;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component I2S_Wrapper is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            I2S_new_sample  : out std_logic;
            MISO_right      : in  std_logic_vector(15 downto 0);
            MISO_left       : in  std_logic_vector(15 downto 0);
            MOSI_right      : out std_logic_vector(15 downto 0);
            MOSI_left       : out std_logic_vector(15 downto 0);
            DIN             : in  std_logic;
            DOUT            : out std_logic;
            MCLK            : out std_logic;
            SCLK            : out std_logic;
            LRCK            : out std_logic
            );
    end component;

    component Audio_Interface is
        port(
            clk_112         : in  std_logic;
            clk_108         : in  std_logic;
            reset_n         : in  std_logic;
            New_sample_112  : in  std_logic;
            New_sample_108  : out std_logic;
            MISO_right_in   : in  std_logic_vector(15 downto 0);
            MISO_left_in    : in  std_logic_vector(15 downto 0);
            MISO_right_out  : out std_logic_vector(15 downto 0);
            MISO_left_out   : out std_logic_vector(15 downto 0);
            MOSI_right_in   : in  std_logic_vector(15 downto 0);
            MOSI_left_in    : in  std_logic_vector(15 downto 0);
            MOSI_right_out  : out std_logic_vector(15 downto 0);
            MOSI_left_out   : out std_logic_vector(15 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal clk_108          : std_logic := '0';
    signal clk_112          : std_logic := '0';
    signal reset_n          : std_logic;
    signal MISO_right_in    : std_logic_vector(15 downto 0);
    signal MISO_left_in     : std_logic_vector(15 downto 0);
    signal MISO_right_out   : std_logic_vector(15 downto 0);
    signal MISO_left_out    : std_logic_vector(15 downto 0);
    signal MOSI_right_in    : std_logic_vector(15 downto 0);
    signal MOSI_left_in     : std_logic_vector(15 downto 0);
    signal MOSI_right_out   : std_logic_vector(15 downto 0);
    signal MOSI_left_out    : std_logic_vector(15 downto 0);
    signal New_sample_108   : std_logic;
    signal New_sample_112   : std_logic;
    signal MCLK             : std_logic;
    signal SCLK             : std_logic;
    signal LRCK             : std_logic;
    signal DOUT             : std_logic;
    signal DIN              : std_logic := '0';
    signal test_value1      : std_logic_vector(15 downto 0) := X"ABCD";
    signal test_value2      : std_logic_vector(15 downto 0) := X"F0FA";

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_I2S_Wrapper
    -- Description: I2S wrapper for interface with Pmod module
    ----------------------------------------------------------------
    U_I2S_Wrapper : I2S_Wrapper port map(
        clk             => clk_112,
        reset_n         => reset_n,
        I2S_new_sample  => New_sample_112,
        MISO_right      => MISO_right_out,
        MISO_left       => MISO_left_out,
        MOSI_right      => MOSI_right_in,
        MOSI_left       => MOSI_left_in,
        DIN             => DIN,
        DOUT            => DOUT,
        MCLK            => MCLK,
        SCLK            => SCLK,
        LRCK            => LRCK);

    ----------------------------------------------------------------
    -- INSTANCE : U_Audio_Interface
    -- Description: Audio interface between two different clock domains
    --              I2S interface is master, rest of design is slave
    ----------------------------------------------------------------
    U_Audio_Interface : Audio_Interface port map(
        clk_112         => clk_112,
        clk_108         => clk_108,
        reset_n         => reset_n,
        New_sample_112  => New_sample_112,
        New_sample_108  => New_sample_108,
        MISO_right_in   => MOSI_right_out,
        MISO_left_in    => MOSI_left_out,
        MISO_right_out  => MISO_right_out,
        MISO_left_out   => MISO_left_out,
        MOSI_right_in   => MOSI_right_in,
        MOSI_left_in    => MOSI_left_in,
        MOSI_right_out  => MOSI_right_out,
        MOSI_left_out   => MOSI_left_out);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_clock_gen
    -- Description : 108 MHz clock generator process
    --------------------------------------------------------------------------------
    P_clk_108_gen : process(clk_108)
    begin
        clk_108 <= not(clk_108) after C_DEMI_CLK_108;   -- Clock generation
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_clock_gen
    -- Description : 112 MHz clock generator process
    --------------------------------------------------------------------------------
    P_clk_112_gen : process(clk_112)
    begin
        clk_112 <= not(clk_112) after C_DEMI_CLK_112;   -- Clock generation
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_DIN
    -- Description : 
    --------------------------------------------------------------------------------
    P_DIN : process(DIN)
    begin
        DIN <= not(DIN) after 100000 ps;   -- Clock generation
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Reset creation
    --------------------------------------------------------------------------------
    reset_n         <= '0' , '1'    after (3*C_DEMI_CLK_108);


    process
    begin

        wait for (100000*C_DEMI_CLK_108);

        assert false severity failure;
    end process;

end A;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------