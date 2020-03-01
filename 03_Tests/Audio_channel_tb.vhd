-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : Audio_channel_tb.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2020-03-01
-- Last update: 2020-03-01
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Stimuli for Audio_channel
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2020-03-01  1.0      Hugo HARTMANN   Creation
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
entity Audio_channel_tb is
end Audio_channel_tb;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture A of Audio_channel_tb is

    --------------------------------------------------------------------------------
    -- CONSTANTS DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_DEMI_CLK_216     : time      := 2315 ps;
    constant C_DEMI_CLK_108     : time      := 4630 ps;
    constant C_TIMEOUT          : time      := 16 ms;

    component Audio_channel is
        generic(
            G_VGA_TOP       : boolean := true
            );
        port(
            clk_108         : in  std_logic;
            clk_216         : in  std_logic;
            reset_n         : in  std_logic;
            VOL_UP          : in  std_logic;
            VOL_DOWN        : in  std_logic;
            SW              : in  std_logic_vector(3 downto 0);
            New_sample      : in  std_logic;
            Audio_din       : in  std_logic_vector(15 downto 0);
            Audio_out       : out std_logic_vector(15 downto 0);
            VGA_new_frame   : in  std_logic;
            VGA_read        : in  std_logic;
            VGA_address     : in  std_logic_vector(31 downto 0);
            VGA_v_add       : in  std_logic_vector(15 downto 0);
            VGA_h_add       : in  std_logic_vector(15 downto 0);
            VGA_din         : out std_logic_vector(11 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal clk_108          : std_logic := '0';
    signal clk_216          : std_logic := '0';
    signal reset_n          : std_logic;
    signal VOL_UP           : std_logic;
    signal VOL_DOWN         : std_logic;
    signal SW               : std_logic_vector(3 downto 0);
    signal New_sample       : std_logic;
    signal Audio_din        : std_logic_vector(15 downto 0);
    signal Audio_out        : std_logic_vector(15 downto 0);
    signal VGA_new_frame    : std_logic;
    signal VGA_read         : std_logic;
    signal VGA_address      : std_logic_vector(31 downto 0);
    signal VGA_v_add        : std_logic_vector(15 downto 0);
    signal VGA_h_add        : std_logic_vector(15 downto 0);
    signal VGA_din          : std_logic_vector(11 downto 0);




--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_Audio_channel
    -- Description: Audio channel full treatment chain
    ----------------------------------------------------------------
    U_Audio_channel : Audio_channel port map(
        clk_108         => clk_108,
        clk_216         => clk_216,
        reset_n         => reset_n,
        VOL_UP          => VOL_UP,
        VOL_DOWN        => VOL_DOWN,
        SW              => SW,
        New_sample      => New_sample,
        Audio_din       => Audio_din,
        Audio_out       => Audio_out,
        VGA_new_frame   => VGA_new_frame,
        VGA_read        => VGA_read,
        VGA_address     => VGA_address,
        VGA_v_add       => VGA_v_add,
        VGA_h_add       => VGA_h_add,
        VGA_din         => VGA_din);

    --------------------------------------------------------------------------------
    -- PROCESS : P_new_frame
    -- Description : Launch new frame at 60 Hz
    --------------------------------------------------------------------------------
    P_new_frame : process
    begin
        wait for(1 us);
        VGA_new_frame   <= '1';
        wait for(2*C_DEMI_CLK_108);
        VGA_new_frame   <= '0';
        wait for(16667 us);
    end process;

    --------------------------------------------------------------------------------
    -- PROCESS : P_new_sample
    -- Description : Launch new frame at 44100 Hz
    --------------------------------------------------------------------------------
    P_new_sample : process
    begin
        New_sample  <= '1';
        wait for(2*C_DEMI_CLK_216);
        New_sample  <= '0';
        wait for(22675 ns);
    end process;

    --------------------------------------------------------------------------------
    -- PROCESS : P_h_addr
    -- Description : create VGA_h_add rotation
    --------------------------------------------------------------------------------
    P_h_addr : process(clk_216, reset_n)
    begin
        if(reset_n='0') then
            VGA_h_add   <= (others => '0');
        elsif(rising_edge(clk_216)) then
            VGA_h_add   <= std_logic_vector(unsigned(VGA_h_add) + 1);
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_clk_gen_216
    -- Description : 216 MHz clock generator process
    --------------------------------------------------------------------------------
    P_clk_gen_216 : process(clk_216)
    begin
        clk_216 <= not(clk_216) after C_DEMI_CLK_216;   -- Clock generation
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_clk_gen_108
    -- Description : 108 MHz clock generator process
    --------------------------------------------------------------------------------
    P_clk_gen_108: process(clk_108)
    begin
        clk_108 <= not(clk_108) after C_DEMI_CLK_108;   -- Clock generation
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Reset creation
    --------------------------------------------------------------------------------
    reset_n         <= '0' , '1'    after (3*C_DEMI_CLK_216);

    process
    
        procedure Wait_cycles(
            constant cycles : in  integer) is
        begin
            wait for (cycles*2*C_DEMI_CLK_216);
        end Wait_cycles;
    
    begin
        VOL_UP      <= '0';
        VOL_DOWN    <= '0';
        SW          <= (others => '0');
        Audio_din   <= X"7FFF";
        VGA_v_add   <= std_logic_vector(to_unsigned(400, VGA_v_add'length));
        Wait_cycles(4);
        wait until(rising_edge(clk_216));

        Wait_cycles(1000000);

        assert false severity failure;
    end process;

end A;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------