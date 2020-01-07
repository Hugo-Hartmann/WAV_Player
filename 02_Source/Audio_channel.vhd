-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : Audio_channel.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-12-21
-- Last update: 2020-01-07
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Audio channel full treatment chain
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-12-21  1.0      Hugo HARTMANN   Creation
-------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- LIBRARIES DECLARATION
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_VHDL;
use lib_VHDL.TYPE_Pkg.all;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
entity Audio_channel is
    port(
        ------- Clock and reset -----------------
        clk             : in  std_logic;
        reset_n         : in  std_logic;

        ------- Buttons -------------------------
        VOL_UP          : in  std_logic;
        VOL_DOWN        : in  std_logic;

        ------- Switches ------------------------
        SW              : in  std_logic_vector(3 downto 0);

        ------- Config --------------------------
        FFT_sample_rate : in  std_logic_vector(7 downto 0);

        ------- Audio interface -----------------
        New_sample      : in  std_logic;
        Audio_din       : in  std_logic_vector(15 downto 0);
        Audio_out       : out std_logic_vector(15 downto 0);

        ------- VGA interface -------------------
        EQ_dout         : out std_logic_vector((C_FIR_MAX+2)*16+15 downto 0);
        EQ_level_dout   : out std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
        VU_dout         : out std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
        VGA_new_frame   : in  std_logic;
        NRM_read        : in  std_logic;
        NRM_addr_r      : in  std_logic_vector(8 downto 0);
        NRM_dout        : out std_logic_vector(15 downto 0)

        );
end Audio_channel;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of Audio_channel is

    component FIR_interface is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            FIR_dout        : out std_logic_vector(C_FIR_MAX*16+15 downto 0);
            FIR_start       : in  std_logic;
            FIR_din         : in  std_logic_vector(15 downto 0)
            );
    end component;

    component VU_metre is
        port(
            clk         : in  std_logic;
            reset_n     : in  std_logic;
            VU_start    : in  std_logic;
            VU_din      : in  std_logic_vector((C_FIR_MAX+2)*16+15 downto 0);
            VU_dout     : out std_logic_vector((C_FIR_MAX+2)*5+4 downto 0)
            );
    end component;

    component EQ_stage is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            EQ_en           : in  std_logic;
            EQ_select       : in  std_logic_vector(3 downto 0);
            EQ_vol_up       : in  std_logic;
            EQ_vol_down     : in  std_logic;
            EQ_din_band     : in  std_logic_vector(C_FIR_MAX*16+15 downto 0);
            EQ_din          : in  std_logic_vector(15 downto 0);
            EQ_dout         : out std_logic_vector((C_FIR_MAX+2)*16+15 downto 0);
            EQ_level_dout   : out std_logic_vector((C_FIR_MAX+2)*5+4 downto 0)
            );
    end component;

    component FFT_Wrapper is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            FFT_din         : in  std_logic_vector(15 downto 0);
            FFT_new_sample  : in  std_logic;
            FFT_addrA       : out std_logic_vector(8 downto 0);
            FFT_addrB       : out std_logic_vector(8 downto 0);
            FFT_doutA_r     : out std_logic_vector(15 downto 0);
            FFT_doutA_i     : out std_logic_vector(15 downto 0);
            FFT_doutB_r     : out std_logic_vector(15 downto 0);
            FFT_doutB_i     : out std_logic_vector(15 downto 0);
            FFT_sample_rate : in  std_logic_vector(7 downto 0);
            FFT_write       : out std_logic;
            FFT_done        : out std_logic
            );
    end component;

    component NRM_Wrapper is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            NRM_addrA_w     : in  std_logic_vector(8 downto 0);
            NRM_addrB_w     : in  std_logic_vector(8 downto 0);
            NRM_dinA_r      : in  std_logic_vector(15 downto 0);
            NRM_dinA_i      : in  std_logic_vector(15 downto 0);
            NRM_dinB_r      : in  std_logic_vector(15 downto 0);
            NRM_dinB_i      : in  std_logic_vector(15 downto 0);
            NRM_write       : in  std_logic;
            NRM_new_sample  : in  std_logic;
            NRM_loaded      : in  std_logic;
            NRM_start       : in  std_logic;
            NRM_read        : in  std_logic;
            NRM_addr_r      : in  std_logic_vector(8 downto 0);
            NRM_dout        : out std_logic_vector(15 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal New_sample_d     : std_logic;
    signal Audio_din_d      : std_logic_vector(15 downto 0);
    signal FIR_dout         : std_logic_vector(C_FIR_MAX*16+15 downto 0);
    signal SW_out           : std_logic_vector(15 downto 0);
    signal EQ_dout_net      : std_logic_vector((C_FIR_MAX+2)*16+15 downto 0);
    signal FFT_addrA        : std_logic_vector(8 downto 0);
    signal FFT_addrB        : std_logic_vector(8 downto 0);
    signal FFT_doutA_r      : std_logic_vector(15 downto 0);
    signal FFT_doutA_i      : std_logic_vector(15 downto 0);
    signal FFT_doutB_r      : std_logic_vector(15 downto 0);
    signal FFT_doutB_i      : std_logic_vector(15 downto 0);
    signal FFT_write        : std_logic;
    signal FFT_done         : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg
    -- Description : Register input data
    --------------------------------------------------------------------------------
    P_reg : process(clk, reset_n)
    begin
        if(reset_n='0') then
            New_sample_d    <= '0';
            Audio_din_d     <= (others => '0');
        elsif(rising_edge(clk)) then
            New_sample_d    <= New_sample;
            Audio_din_d     <= Audio_din;
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_FIR_interface
    -- Description: FIR wrapper for multiple FIR filters working on same data
    ----------------------------------------------------------------
    U_FIR_interface : FIR_interface port map(
        clk             => clk,
        reset_n         => reset_n,
        FIR_dout        => FIR_dout,
        FIR_start       => New_sample_d,
        FIR_din         => Audio_din_d);

    ----------------------------------------------------------------
    -- INSTANCE : U_VU_metre
    -- Description: 2048 element VU-metre
    ----------------------------------------------------------------
    U_VU_metre : VU_metre port map(
        clk         => clk,
        reset_n     => reset_n,
        VU_start    => New_sample_d,
        VU_din      => EQ_dout_net,
        VU_dout     => VU_dout);

    ----------------------------------------------------------------
    -- INSTANCE : U_EQ_stage
    -- Description: 6 Channel audio equalizer
    ----------------------------------------------------------------
    U_EQ_stage : EQ_stage port map(
        clk             => clk,
        reset_n         => reset_n,
        EQ_en           => New_sample_d,
        EQ_select       => SW,
        EQ_vol_up       => VOL_UP,
        EQ_vol_down     => VOL_DOWN,
        EQ_din_band     => FIR_dout,
        EQ_din          => Audio_din_d,
        EQ_dout         => EQ_dout_net,
        EQ_level_dout   => EQ_level_dout);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Audio selection
    --------------------------------------------------------------------------------
    SW_out   <= EQ_dout_net(15 downto 0)    when(SW="0000") else
                EQ_dout_net(31 downto 16)   when(SW="0001") else
                EQ_dout_net(47 downto 32)   when(SW="0010") else
                EQ_dout_net(63 downto 48)   when(SW="0011") else
                EQ_dout_net(79 downto 64)   when(SW="0100") else
                EQ_dout_net(95 downto 80)   when(SW="0101") else
                EQ_dout_net(111 downto 96)  when(SW="0110") else
                EQ_dout_net(127 downto 112);

    ----------------------------------------------------------------
    -- INSTANCE : U_FFT_Wrapper
    -- Description: FFT_Wrapper for custom FFT module
    ----------------------------------------------------------------
    U_FFT_Wrapper : FFT_Wrapper port map(
        clk             => clk,
        reset_n         => reset_n,
        FFT_din         => SW_out,
        FFT_new_sample  => New_sample_d,
        FFT_addrA       => FFT_addrA,
        FFT_addrB       => FFT_addrB,
        FFT_doutA_r     => FFT_doutA_r,
        FFT_doutA_i     => FFT_doutA_i,
        FFT_doutB_r     => FFT_doutB_r,
        FFT_doutB_i     => FFT_doutB_i,
        FFT_sample_rate => FFT_sample_rate,
        FFT_write       => FFT_write,
        FFT_done        => FFT_done);

    ----------------------------------------------------------------
    -- INSTANCE : U_NRM_Wrapper
    -- Description: NRM_Wrapper for custom NRM module
    ----------------------------------------------------------------
    U_NRM_Wrapper : NRM_Wrapper port map(
        clk             => clk,
        reset_n         => reset_n,
        NRM_addrA_w     => FFT_addrA,
        NRM_addrB_w     => FFT_addrB,
        NRM_dinA_r      => FFT_doutA_r,
        NRM_dinA_i      => FFT_doutA_i,
        NRM_dinB_r      => FFT_doutB_r,
        NRM_dinB_i      => FFT_doutB_i,
        NRM_write       => FFT_write,
        NRM_new_sample  => New_sample_d,
        NRM_loaded      => FFT_done,
        NRM_start       => VGA_new_frame,
        NRM_read        => NRM_read,
        NRM_addr_r      => NRM_addr_r,
        NRM_dout        => NRM_dout);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Audio selection
    --------------------------------------------------------------------------------
    Audio_out   <= SW_out;
    EQ_dout     <= EQ_dout_net;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------