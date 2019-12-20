-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : Audio_Interface.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-12-11
-- Last update: 2019-12-17
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Audio interface between two different clock domains
--              I2S interface is master, rest of design is slave
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-12-11  1.0      Hugo HARTMANN   Creation
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
entity Audio_Interface is
    port(

        ------- Clock and RESET ------------------
        clk_112         : in  std_logic;                        -- clock 112 MHz
        clk_216         : in  std_logic;                        -- clock 216 MHz
        reset_n         : in  std_logic;                        -- reset_n

        ------- Audio Control --------------------
        New_sample_112  : in  std_logic;
        New_sample_216  : out std_logic;

        ------- Audio MISO -----------------------
        MISO_right_in   : in  std_logic_vector(15 downto 0);
        MISO_left_in    : in  std_logic_vector(15 downto 0);
        MISO_right_out  : out std_logic_vector(15 downto 0);
        MISO_left_out   : out std_logic_vector(15 downto 0);

        ------- Audio MOSI -----------------------
        MOSI_right_in   : in  std_logic_vector(15 downto 0);
        MOSI_left_in    : in  std_logic_vector(15 downto 0);
        MOSI_right_out  : out std_logic_vector(15 downto 0);
        MOSI_left_out   : out std_logic_vector(15 downto 0)

        );
end Audio_Interface;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of Audio_Interface is

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component FIFO_32bit is
        port(
            wr_clk  : in std_logic;
            rd_clk  : in std_logic;
            din     : in std_logic_vector(31 downto 0);
            wr_en   : in std_logic;
            rd_en   : in std_logic;
            dout    : out std_logic_vector(31 downto 0);
            full    : out std_logic;
            empty   : out std_logic
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal din_MOSI     : std_logic_vector(31 downto 0);
    signal din_MISO     : std_logic_vector(31 downto 0);
    signal dout_MOSI    : std_logic_vector(31 downto 0);
    signal dout_MISO    : std_logic_vector(31 downto 0);
    signal empty_MOSI   : std_logic;
    signal New_sample   : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_FIFO_32bit_MISO
    -- Description :
    ----------------------------------------------------------------
    U_FIFO_32bit_MISO : FIFO_32bit port map(
        wr_clk  => clk_216,
        rd_clk  => clk_112,
        din     => din_MISO,
        wr_en   => New_sample,
        rd_en   => New_sample_112,
        dout    => dout_MISO);
        --full    => 
        --empty   => 

    ----------------------------------------------------------------
    -- INSTANCE : U_FIFO_32bit_MOSI
    -- Description :
    ----------------------------------------------------------------
    U_FIFO_32bit_MOSI : FIFO_32bit port map(
        wr_clk  => clk_112,
        rd_clk  => clk_216,
        din     => din_MOSI,
        wr_en   => New_sample_112,
        rd_en   => New_sample,
        dout    => dout_MOSI,
        --full    => 
        empty   => empty_MOSI);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Signals mapping
    --------------------------------------------------------------------------------
    New_sample      <= NOT empty_MOSI;
    New_sample_216  <= New_sample;
    din_MISO        <= MISO_left_in & MISO_right_in;
    din_MOSI        <= MOSI_left_in & MOSI_right_in;
    MOSI_left_out   <= dout_MOSI(31 downto 16);
    MOSI_right_out  <= dout_MOSI(15 downto 0);
    MISO_left_out   <= dout_MISO(31 downto 16);
    MISO_right_out  <= dout_MISO(15 downto 0);

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------