-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : Audio_channel.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-12-21
-- Last update: 2020-07-27
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
    generic(
        G_LEFT_CHANNEL : boolean := true
        );
    port(
        ------- Clock and reset -----------------
        clk_108         : in  std_logic;
        clk_216         : in  std_logic;
        reset_n         : in  std_logic;

        ------- Interface with UART -------------
        UART_addr       : in  std_logic_vector(7 downto 0);
        UART_write      : in  std_logic;
        UART_dout       : in  std_logic_vector(15 downto 0);

        ------- Switches ------------------------
        SW              : in  std_logic_vector(3 downto 0);

        ------- Audio interface -----------------
        New_sample      : in  std_logic;
        Audio_din       : in  std_logic_vector(15 downto 0);
        Audio_out       : out std_logic_vector(15 downto 0);

        ------- VGA interface -------------------
        VGA_new_frame   : in  std_logic;
        VGA_read        : in  std_logic;
        VGA_address     : in  std_logic_vector(31 downto 0);
        VGA_v_add       : in  std_logic_vector(15 downto 0);
        VGA_h_add       : in  std_logic_vector(15 downto 0);
        VGA_din         : out std_logic_vector(11 downto 0);

        -------- PUSH interface -----------------
        WAV_push        : out std_logic_vector(8 downto 0);
        FFT_push        : out std_logic_vector(16 downto 0);
        VU_push         : out std_logic_vector((C_FIR_MAX+2)*5+4 downto 0)

        );
end Audio_channel;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of Audio_channel is

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATION
    --------------------------------------------------------------------------------
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

    component EQ_Wrapper is
        generic(
            G_LEFT_CHANNEL : boolean := true
            );
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            EQ_addr         : in  std_logic_vector(7 downto 0);
            EQ_write        : in  std_logic;
            EQ_level_din    : in  std_logic_vector(15 downto 0);
            EQ_en           : in  std_logic;
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
            FFT_addrA       : out std_logic_vector(10 downto 0);
            FFT_addrB       : out std_logic_vector(10 downto 0);
            FFT_doutA_r     : out std_logic_vector(15 downto 0);
            FFT_doutA_i     : out std_logic_vector(15 downto 0);
            FFT_doutB_r     : out std_logic_vector(15 downto 0);
            FFT_doutB_i     : out std_logic_vector(15 downto 0);
            FFT_start       : in  std_logic;
            FFT_write       : out std_logic;
            FFT_done        : out std_logic
            );
    end component;

    component NRM_Wrapper is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            NRM_addrA_w     : in  std_logic_vector(10 downto 0);
            NRM_addrB_w     : in  std_logic_vector(10 downto 0);
            NRM_dinA_r      : in  std_logic_vector(15 downto 0);
            NRM_dinA_i      : in  std_logic_vector(15 downto 0);
            NRM_dinB_r      : in  std_logic_vector(15 downto 0);
            NRM_dinB_i      : in  std_logic_vector(15 downto 0);
            NRM_write       : in  std_logic;
            NRM_new_sample  : in  std_logic;
            NRM_loaded      : in  std_logic;
            NRM_start       : in  std_logic;
            NRM_addr_r      : in  std_logic_vector(10 downto 0);
            NRM_dout        : out std_logic_vector(15 downto 0)
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
            EQ_level_dout   : in  std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
            EQ_dout         : in  std_logic_vector((C_FIR_MAX+2)*16+15 downto 0);
            VU_dout         : in  std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
            NRM_addr        : out std_logic_vector(10 downto 0);
            NRM_dout        : in  std_logic_vector(15 downto 0);
            WAV_push        : out std_logic_vector(8 downto 0);
            FFT_push        : out std_logic_vector(16 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal New_sample_d     : std_logic;
    signal Audio_din_d      : std_logic_vector(15 downto 0);
    signal FIR_dout         : std_logic_vector(C_FIR_MAX*16+15 downto 0);
    signal SW_out           : std_logic_vector(15 downto 0);
    signal EQ_dout          : std_logic_vector((C_FIR_MAX+2)*16+15 downto 0);
    signal FFT_addrA        : std_logic_vector(10 downto 0);
    signal FFT_addrB        : std_logic_vector(10 downto 0);
    signal FFT_doutA_r      : std_logic_vector(15 downto 0);
    signal FFT_doutA_i      : std_logic_vector(15 downto 0);
    signal FFT_doutB_r      : std_logic_vector(15 downto 0);
    signal FFT_doutB_i      : std_logic_vector(15 downto 0);
    signal FFT_write        : std_logic;
    signal FFT_done         : std_logic;
    signal EQ_level_dout    : std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
    signal VU_dout          : std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
    signal NRM_addr_r       : std_logic_vector(10 downto 0);
    signal NRM_dout         : std_logic_vector(15 downto 0);
    signal VGA_v_add_map    : std_logic_vector(15 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg
    -- Description : Register input data
    --------------------------------------------------------------------------------
    P_reg : process(clk_216, reset_n)
    begin
        if(reset_n='0') then
            New_sample_d    <= '0';
            Audio_din_d     <= (others => '0');
        elsif(rising_edge(clk_216)) then
            New_sample_d    <= New_sample;
            Audio_din_d     <= Audio_din;
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_FIR_interface
    -- Description: FIR wrapper for multiple FIR filters working on same data
    ----------------------------------------------------------------
    U_FIR_interface : FIR_interface port map(
        clk             => clk_216,
        reset_n         => reset_n,
        FIR_dout        => FIR_dout,
        FIR_start       => New_sample_d,
        FIR_din         => Audio_din_d);

    ----------------------------------------------------------------
    -- INSTANCE : U_VU_metre
    -- Description: 2048 element VU-metre
    ----------------------------------------------------------------
    U_VU_metre : VU_metre port map(
        clk         => clk_216,
        reset_n     => reset_n,
        VU_start    => New_sample_d,
        VU_din      => EQ_dout,
        VU_dout     => VU_dout);

    ----------------------------------------------------------------
    -- INSTANCE : U_EQ_Wrapper
    -- Description: Wrapper for Equalizer bloc
    ----------------------------------------------------------------
    U_EQ_Wrapper : EQ_Wrapper generic map(
        G_LEFT_CHANNEL  => G_LEFT_CHANNEL)
    port map(
        clk             => clk_216,
        reset_n         => reset_n,
        EQ_addr         => UART_addr,
        EQ_write        => UART_write,
        EQ_level_din    => UART_dout,
        EQ_en           => New_sample_d,
        EQ_din_band     => FIR_dout,
        EQ_din          => Audio_din_d,
        EQ_dout         => EQ_dout,
        EQ_level_dout   => EQ_level_dout);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Audio selection
    --------------------------------------------------------------------------------
    SW_out   <= EQ_dout(15 downto 0)    when(SW="0000") else
                EQ_dout(31 downto 16)   when(SW="0001") else
                EQ_dout(47 downto 32)   when(SW="0010") else
                EQ_dout(63 downto 48)   when(SW="0011") else
                EQ_dout(79 downto 64)   when(SW="0100") else
                EQ_dout(95 downto 80)   when(SW="0101") else
                EQ_dout(111 downto 96)  when(SW="0110") else
                EQ_dout(127 downto 112);

    ----------------------------------------------------------------
    -- INSTANCE : U_FFT_Wrapper
    -- Description: FFT_Wrapper for custom FFT module
    ----------------------------------------------------------------
    U_FFT_Wrapper : FFT_Wrapper port map(
        clk             => clk_216,
        reset_n         => reset_n,
        FFT_din         => SW_out,
        FFT_new_sample  => New_sample_d,
        FFT_addrA       => FFT_addrA,
        FFT_addrB       => FFT_addrB,
        FFT_doutA_r     => FFT_doutA_r,
        FFT_doutA_i     => FFT_doutA_i,
        FFT_doutB_r     => FFT_doutB_r,
        FFT_doutB_i     => FFT_doutB_i,
        FFT_start       => VGA_new_frame,
        FFT_write       => FFT_write,
        FFT_done        => FFT_done);

    ----------------------------------------------------------------
    -- INSTANCE : U_NRM_Wrapper
    -- Description: NRM_Wrapper for custom NRM module
    ----------------------------------------------------------------
    U_NRM_Wrapper : NRM_Wrapper port map(
        clk             => clk_216,
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
        NRM_addr_r      => NRM_addr_r,
        NRM_dout        => NRM_dout);

    GEN_VGA_OFFSET : if(G_LEFT_CHANNEL=true) generate
        process(clk_108)
        begin
            if(rising_edge(clk_108)) then
                VGA_v_add_map   <= std_logic_vector(unsigned(VGA_v_add) - 512);
            end if;
        end process;
    end generate GEN_VGA_OFFSET;
    
    GEN_VGA_PASS : if(G_LEFT_CHANNEL=false) generate
        process(clk_108)
        begin
            if(rising_edge(clk_108)) then
                VGA_v_add_map   <= VGA_v_add;
            end if;
        end process;
    end generate GEN_VGA_PASS;

    ----------------------------------------------------------------
    -- INSTANCE : U_VGA_interface
    -- Description: Generate image for the VGA controller
    ----------------------------------------------------------------
    U_VGA_interface : VGA_interface port map(
        clk_108         => clk_108,
        clk_216         => clk_216,
        reset_n         => reset_n,
        VGA_new_frame   => VGA_new_frame,
        VGA_read        => VGA_read,
        VGA_address     => VGA_address,
        VGA_v_add       => VGA_v_add_map,
        VGA_h_add       => VGA_h_add,
        VGA_din         => VGA_din,
        WAV_read        => New_sample_d,
        VGA_select      => SW,
        VU_dout         => VU_dout,
        EQ_dout         => EQ_dout,
        EQ_level_dout   => EQ_level_dout,
        NRM_addr        => NRM_addr_r,
        NRM_dout        => NRM_dout,
        WAV_push        => WAV_push,
        FFT_push        => FFT_push);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Audio selection
    --------------------------------------------------------------------------------
    Audio_out   <= SW_out;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : VU_push forwarding
    --------------------------------------------------------------------------------
    VU_push <= VU_dout;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------