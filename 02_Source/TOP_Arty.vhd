-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : TOP.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-23
-- Last update: 2019-12-20
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: TOP level
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-10-23  1.0      Hugo HARTMANN   Creation
-------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- LIBRARIES DECLARATION
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_VHDL;
use lib_VHDL.TYPE_Pkg.all;
Library UNISIM;
use UNISIM.vcomponents.all;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
entity TOP is
    generic(
        G_BEHAVIOURAL   : boolean := false
        );
    port(
        ------- Clock and reset -----------------
        CLK12MHZ    : in  std_logic;
        RESET       : in  std_logic;

        ------- Buttons -------------------------
        VOL_UP      : in  std_logic;
        VOL_DOWN    : in  std_logic;

        ------- Switches ------------------------
        SW          : in  std_logic_vector(3 downto 0);

        ------- AUDIO interface -----------------
        DIN         : in  std_logic;
        MCLK_IN     : out std_logic;
        SCLK_IN     : out std_logic;
        LRCK_IN     : out std_logic;
        DOUT        : out std_logic;
        MCLK_OUT    : out std_logic;
        SCLK_OUT    : out std_logic;
        LRCK_OUT    : out std_logic;

        ------- VGA interface -------------------
        HSYNC_OUT   : out std_logic;
        VSYNC_OUT   : out std_logic;
        RED_OUT     : out std_logic_vector(3 downto 0);
        GREEN_OUT   : out std_logic_vector(3 downto 0);
        BLUE_OUT    : out std_logic_vector(3 downto 0);

        ------- UART interface ------------------
        RX          : in  std_logic;
        TX          : out std_logic;

        ------- LEDs -----------------------------
        LED0        : out std_logic
        );
end TOP;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of TOP is

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component Hearbeat is
        port(
            clk          : in  std_logic;
            reset_n      : in  std_logic;
            LED          : out std_logic
            );
    end component;

    component MMCM_112
        port(
            clk_112     : out std_logic;
            locked      : out std_logic;
            reset       : in  std_logic;
            CLK12MHZ    : in  std_logic
            );
    end component;

    component MMCM
        port(
            clk_216     : out std_logic;
            clk_108     : out std_logic;
            locked      : out std_logic;
            reset       : in  std_logic;
            CLK12MHZ    : in  std_logic
            );
    end component;

    component UART_Wrapper is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            Tx              : out std_logic;
            Rx              : in  std_logic;
            UART_din        : in std_logic_vector(15 downto 0);
            UART_write      : in std_logic
            );
    end component;

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
            EQ_level_dout   : in  std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
            EQ_dout         : in  std_logic_vector((C_FIR_MAX+2)*16+15 downto 0);
            VU_dout         : in  std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
            NRM_addr        : out std_logic_vector(8 downto 0);
            NRM_read        : out std_logic;
            NRM_dout        : in  std_logic_vector(15 downto 0)
            );
    end component;

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
            clk     : in  std_logic;
            reset_n : in  std_logic;
            VU_en   : in  std_logic;
            VU_din  : in  std_logic_vector((C_FIR_MAX+2)*16+15 downto 0);
            VU_dout : out std_logic_vector((C_FIR_MAX+2)*5+4 downto 0)
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
            NRM_start       : in  std_logic;
            NRM_read        : in  std_logic;
            NRM_addr_r      : in  std_logic_vector(8 downto 0);
            NRM_dout        : out std_logic_vector(15 downto 0)
            );
    end component;

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
            clk_216         : in  std_logic;
            reset_n         : in  std_logic;
            New_sample_112  : in  std_logic;
            New_sample_216  : out std_logic;
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
    attribute keep : string;
    signal reset_n : std_logic;
    attribute keep of reset_n : signal is "true";

    signal RCLK12MHZ        : std_logic;
    signal clk_112          : std_logic;
    signal clk_108          : std_logic;
    signal clk_216          : std_logic;
    signal locked_216       : std_logic;
    signal locked_112       : std_logic;
    signal UART_dout        : std_logic_vector(7 downto 0);
    signal UART_read        : std_logic;
    signal UART_write       : std_logic;
    signal I2S_new_sample   : std_logic;
    signal VGA_read         : std_logic;
    signal VGA_address      : std_logic_vector(31 downto 0);
    signal VGA_v_add        : std_logic_vector(15 downto 0);
    signal VGA_h_add        : std_logic_vector(15 downto 0);
    signal VGA_din          : std_logic_vector(11 downto 0);
    signal VGA_new_frame    : std_logic;
    signal FIR_dout         : std_logic_vector(C_FIR_MAX*16+15 downto 0);
    signal VU_dout          : std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
    signal SW_out           : std_logic_vector(15 downto 0);
    signal EQ_level_dout    : std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
    signal EQ_dout          : std_logic_vector((C_FIR_MAX+2)*16+15 downto 0);
    signal FFT_addrA        : std_logic_vector(8 downto 0);
    signal FFT_addrB        : std_logic_vector(8 downto 0);
    signal FFT_doutA_r      : std_logic_vector(15 downto 0);
    signal FFT_doutA_i      : std_logic_vector(15 downto 0);
    signal FFT_doutB_r      : std_logic_vector(15 downto 0);
    signal FFT_doutB_i      : std_logic_vector(15 downto 0);
    signal FFT_write        : std_logic;
    signal FFT_done         : std_logic;
    signal NRM_read         : std_logic;
    signal NRM_addr_r       : std_logic_vector(8 downto 0);
    signal NRM_dout         : std_logic_vector(15 downto 0);
    signal MISO_right_in    : std_logic_vector(15 downto 0);
    signal MISO_left_in     : std_logic_vector(15 downto 0);
    signal MISO_right_out   : std_logic_vector(15 downto 0);
    signal MISO_left_out    : std_logic_vector(15 downto 0);
    signal MOSI_right_in    : std_logic_vector(15 downto 0);
    signal MOSI_left_in     : std_logic_vector(15 downto 0);
    signal MOSI_right_out   : std_logic_vector(15 downto 0);
    signal MOSI_left_out    : std_logic_vector(15 downto 0);
    signal New_sample_216   : std_logic;
    signal New_sample_112   : std_logic;
    signal MCLK             : std_logic;
    signal SCLK             : std_logic;
    signal LRCK             : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

   IBUF_inst : IBUF
   generic map (
      IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
      IOSTANDARD => "DEFAULT")
   port map (
      O => RCLK12MHZ,     -- Buffer output
      I => CLK12MHZ      -- Buffer input (connect directly to top-level port)
   );

    ----------------------------------------------------------------
    -- INSTANCE : U_MMCM
    -- Description : Frequency synthesis
    ----------------------------------------------------------------
    MMCM_GEN : if G_BEHAVIOURAL=false generate
        U_MMCM : MMCM port map(
            clk_108     => clk_108,
            clk_216     => clk_216,
            reset       => RESET,
            locked      => locked_216,
            CLK12MHZ    => RCLK12MHZ);
    end generate MMCM_GEN;
    
    MMCM_BYPASS : if G_BEHAVIOURAL=true generate
        locked_216  <= '1';
        clk_216     <= RCLK12MHZ;
        clk_108     <= RCLK12MHZ;
    end generate MMCM_BYPASS;

    ----------------------------------------------------------------
    -- INSTANCE : U_MMCM
    -- Description : Frequency synthesis
    ----------------------------------------------------------------
    MMCM_GEN_112 : if G_BEHAVIOURAL=false generate
        U_MMCM_112 : MMCM_112 port map(
            clk_112     => clk_112,
            reset       => RESET,
            locked      => locked_112,
            CLK12MHZ    => RCLK12MHZ);
    end generate MMCM_GEN_112;
    
    MMCM_BYPASS_112 : if G_BEHAVIOURAL=true generate
        clk_112     <= RCLK12MHZ;
        locked_112  <= '1';
    end generate MMCM_BYPASS_112;

    ----------------------------------------------------------------
    -- INSTANCE : U_Hearbeat
    -- Description : Blink a LED at 1Hz
    ----------------------------------------------------------------
    U_Hearbeat : Hearbeat port map(
        clk         => clk_216,
        reset_n     => reset_n,
        LED         => LED0);

    ----------------------------------------------------------------
    -- INSTANCE : U_UART_Wrapper
    -- Description: Wrapper of an UART clocked at 216 MHz
    ----------------------------------------------------------------
    U_UART_Wrapper : UART_Wrapper port map(
        clk             => clk_216,
        reset_n         => reset_n,
        Tx              => TX,
        Rx              => RX,
        UART_din        => MOSI_right_out,
        UART_write      => New_sample_216);

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
        VGA_hsync       => HSYNC_OUT,
        VGA_vsync       => VSYNC_OUT,
        VGA_r           => RED_OUT,
        VGA_g           => GREEN_OUT,
        VGA_b           => BLUE_OUT);

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
        WAV_read        => New_sample_216,
        VGA_select      => SW,
        VU_dout         => VU_dout,
        EQ_dout         => EQ_dout,
        EQ_level_dout   => EQ_level_dout,
        NRM_addr        => NRM_addr_r,
        NRM_read        => NRM_read,
        NRM_dout        => NRM_dout);

    ----------------------------------------------------------------
    -- INSTANCE : U_FIR_interface
    -- Description: FIR wrapper for multiple FIR filters working on same data
    ----------------------------------------------------------------
    U_FIR_interface : FIR_interface port map(
        clk             => clk_216,
        reset_n         => reset_n,
        FIR_dout        => FIR_dout,
        FIR_start       => New_sample_216,
        FIR_din         => MOSI_right_out);

    ----------------------------------------------------------------
    -- INSTANCE : U_VU_metre
    -- Description: 2048 element VU-metre
    ----------------------------------------------------------------
    U_VU_metre : VU_metre port map(
        clk     => clk_216,
        reset_n => reset_n,
        VU_en   => New_sample_216,
        VU_din  => EQ_dout,
        VU_dout => VU_dout);

    ----------------------------------------------------------------
    -- INSTANCE : U_EQ_stage
    -- Description: 6 Channel audio equalizer
    ----------------------------------------------------------------
    U_EQ_stage : EQ_stage port map(
        clk             => clk_216,
        reset_n         => reset_n,
        EQ_en           => New_sample_216,
        EQ_select       => SW,
        EQ_vol_up       => VOL_UP,
        EQ_vol_down     => VOL_DOWN,
        EQ_din_band     => FIR_dout,
        EQ_din          => MOSI_right_out,
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
        FFT_new_sample  => New_sample_216,
        FFT_addrA       => FFT_addrA,
        FFT_addrB       => FFT_addrB,
        FFT_doutA_r     => FFT_doutA_r,
        FFT_doutA_i     => FFT_doutA_i,
        FFT_doutB_r     => FFT_doutB_r,
        FFT_doutB_i     => FFT_doutB_i,
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
        NRM_new_sample  => New_sample_216,
        NRM_start       => VGA_new_frame,
        NRM_read        => NRM_read,
        NRM_addr_r      => NRM_addr_r,
        NRM_dout        => NRM_dout);

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

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : port mapping
    --------------------------------------------------------------------------------
    MCLK_IN     <= MCLK;
    SCLK_IN     <= NOT SCLK;
    LRCK_IN     <= LRCK;
    MCLK_OUT    <= MCLK;
    SCLK_OUT    <= NOT SCLK;
    LRCK_OUT    <= LRCK;

    ----------------------------------------------------------------
    -- INSTANCE : U_Audio_Interface
    -- Description: Audio interface between two different clock domains
    --              I2S interface is master, rest of design is slave
    ----------------------------------------------------------------
    U_Audio_Interface : Audio_Interface port map(
        clk_112         => clk_112,
        clk_216         => clk_216,
        reset_n         => reset_n,
        New_sample_112  => New_sample_112,
        New_sample_216  => New_sample_216,
        MISO_right_in   => SW_out,
        MISO_left_in    => SW_out,
        MISO_right_out  => MISO_right_out,
        MISO_left_out   => MISO_left_out,
        MOSI_right_in   => MOSI_right_in,
        MOSI_left_in    => MOSI_left_in,
        MOSI_right_out  => MOSI_right_out,
        MOSI_left_out   => MOSI_left_out);


    --------------------------------------------------------------------------------
    -- SEQ PROCESS : 
    -- Description : reset
    --------------------------------------------------------------------------------
    reset_n <= locked_216 and locked_112;


end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------