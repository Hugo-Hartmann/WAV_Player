-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : TOP.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-23
-- Last update: 2020-03-02
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
            UART_addr       : out std_logic_vector(7 downto 0);
            UART_write      : out std_logic;
            UART_dout       : out std_logic_vector(15 downto 0)
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
    signal reset_n          : std_logic;
    signal RCLK12MHZ        : std_logic;
    signal clk_112          : std_logic;
    signal clk_108          : std_logic;
    signal clk_216          : std_logic;
    signal locked_216       : std_logic;
    signal locked_112       : std_logic;
    signal UART_dout        : std_logic_vector(15 downto 0);
    signal UART_addr        : std_logic_vector(7 downto 0);
    signal UART_write       : std_logic;
    signal I2S_new_sample   : std_logic;
    signal VGA_read         : std_logic;
    signal VGA_address      : std_logic_vector(31 downto 0);
    signal VGA_v_add        : std_logic_vector(15 downto 0);
    signal VGA_h_add        : std_logic_vector(15 downto 0);
    signal VGA_din          : std_logic_vector(11 downto 0);
    signal VGA_din_top      : std_logic_vector(11 downto 0);
    signal VGA_din_bottom   : std_logic_vector(11 downto 0);
    signal VGA_new_frame    : std_logic;
    signal VU_dout_r        : std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
    signal VU_dout_l        : std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
    signal EQ_level_dout_r  : std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
    signal EQ_level_dout_l  : std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
    signal EQ_dout_r        : std_logic_vector((C_FIR_MAX+2)*16+15 downto 0);
    signal EQ_dout_l        : std_logic_vector((C_FIR_MAX+2)*16+15 downto 0);
    signal NRM_read_r       : std_logic;
    signal NRM_read_l       : std_logic;
    signal NRM_addr_r       : std_logic_vector(8 downto 0);
    signal NRM_addr_l       : std_logic_vector(8 downto 0);
    signal NRM_dout_r       : std_logic_vector(15 downto 0);
    signal NRM_dout_l       : std_logic_vector(15 downto 0);
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
        clk         => clk_216,
        reset_n     => reset_n,
        Tx          => TX,
        Rx          => RX,
        UART_dout   => UART_dout,
        UART_addr   => UART_addr,
        UART_write  => UART_write);

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

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : VGA_din
    --------------------------------------------------------------------------------
    VGA_din <= VGA_din_bottom OR VGA_din_top;

    ----------------------------------------------------------------
    -- INSTANCE : U_Audio_channel_right
    -- Description: Audio channel full treatment chain
    ----------------------------------------------------------------
    U_Audio_channel_right : Audio_channel generic map(
        G_VGA_TOP   => false)
    port map(
        clk_108         => clk_108,
        clk_216         => clk_216,
        reset_n         => reset_n,
        VOL_UP          => VOL_UP,
        VOL_DOWN        => VOL_DOWN,
        SW              => SW,
        New_sample      => New_sample_216,
        Audio_din       => MOSI_right_out,
        Audio_out       => MISO_right_in,
        VGA_new_frame   => VGA_new_frame,
        VGA_read        => VGA_read,
        VGA_address     => VGA_address,
        VGA_v_add       => VGA_v_add,
        VGA_h_add       => VGA_h_add,
        VGA_din         => VGA_din_bottom);

    ----------------------------------------------------------------
    -- INSTANCE : U_Audio_channel_left
    -- Description: Audio channel full treatment chain
    ----------------------------------------------------------------
    U_Audio_channel_left : Audio_channel generic map(
        G_VGA_TOP   => true)
    port map(
        clk_108         => clk_108,
        clk_216         => clk_216,
        reset_n         => reset_n,
        VOL_UP          => VOL_UP,
        VOL_DOWN        => VOL_DOWN,
        SW              => SW,
        New_sample      => New_sample_216,
        Audio_din       => MOSI_left_out,
        Audio_out       => MISO_left_in,
        VGA_new_frame   => VGA_new_frame,
        VGA_read        => VGA_read,
        VGA_address     => VGA_address,
        VGA_v_add       => VGA_v_add,
        VGA_h_add       => VGA_h_add,
        VGA_din         => VGA_din_top);

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
        MISO_right_in   => MISO_right_in,
        MISO_left_in    => MISO_left_in,
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