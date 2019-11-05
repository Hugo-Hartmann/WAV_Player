-------------------------------------------------------------------------------
--  This entire design, which includes all of the components and related files,
--  has been created and owned by : ELSYS DESIGN
--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : TOP.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-23
-- Last update: 2019-11-05
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
        AUDIO_OUT   : out std_logic;

        ------- VGA interface -------------------
        HSYNC_OUT   : out std_logic;
        VSYNC_OUT   : out std_logic;
        RED_OUT     : out std_logic_vector(2 downto 0);
        GREEN_OUT   : out std_logic_vector(2 downto 0);
        BLUE_OUT    : out std_logic_vector(1 downto 0);

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

    component MMCM_108MHZ
        port(
            clk         : out std_logic;
            locked      : out std_logic;
            reset       : in  std_logic;
            CLK12MHZ    : in  std_logic
            );
    end component;

    component UART_Wrapper is
        generic(
            G_SPEED         : INTEGER := 115200;
            G_PARITY_BIT    : INTEGER := 1;
            G_PARIY_EVEN    : INTEGER := 1
            );
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            Tx              : out std_logic;
            Rx              : in  std_logic;
            UART_dout       : out std_logic_vector(7 downto 0);
            UART_write      : out std_logic;
            UART_read       : in  std_logic
            );
    end component;

    component SRAM_Wrapper is
        generic(
            G_BEHAVIOURAL   : boolean := false
            );
        port(
            clk         : in  std_logic;
            reset_n     : in  std_logic;
            UART_dout   : in  std_logic_vector(7 downto 0);
            UART_write  : in  std_logic;
            UART_read   : out std_logic;
            RAM_dout    : out std_logic_vector(7 downto 0);
            RAM_read    : in  std_logic
            );
    end component;

    component WAV_Player is
        port(
            clk         : in  std_logic;
            reset_n     : in  std_logic;
            Audio_out   : out std_logic;
            RAM_dout    : in  std_logic_vector(7 downto 0);
            RAM_read    : out std_logic
            );
    end component;

    component VGA_controller is
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

    component VGA_interface is
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
            sw              : in  std_logic_vector(3 downto 0);
            EQ_level_dout   : in  std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
            EQ_dout         : in  std_logic_vector((C_FIR_MAX+2)*8+7 downto 0);
            VU_dout         : in  std_logic_vector((C_FIR_MAX+2)*6+5 downto 0)
            );
    end component;

    component FIR_wrapper is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            FIR_dout        : out std_logic_vector(C_FIR_MAX*8+7 downto 0);
            RAM_read_audio  : in  std_logic;
            RAM_dout        : in  std_logic_vector(7 downto 0)
            );
    end component;

    component VU_metre is
        port(
            clk     : in  std_logic;
            reset_n : in  std_logic;
            VU_en   : in  std_logic;
            VU_din  : in  std_logic_vector((C_FIR_MAX+2)*8+7 downto 0);
            VU_dout : out std_logic_vector((C_FIR_MAX+2)*6+5 downto 0)
            );
    end component;

    component EQ_wrapper is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            EQ_en           : in  std_logic;
            sw              : in  std_logic_vector(3 downto 0);
            EQ_vol_up       : in  std_logic;
            EQ_vol_down     : in  std_logic;
            FIR_dout        : in  std_logic_vector(C_FIR_MAX*8+7 downto 0);
            RAM_dout        : in  std_logic_vector(7 downto 0);
            EQ_dout         : out std_logic_vector((C_FIR_MAX+2)*8+7 downto 0);
            EQ_level_dout   : out std_logic_vector((C_FIR_MAX+2)*6+5 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal clk              : std_logic;
    signal reset_n          : std_logic;
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
    signal FIR_dout         : std_logic_vector(C_FIR_MAX*8+7 downto 0);
    signal VU_dout          : std_logic_vector((C_FIR_MAX+2)*6+5 downto 0);
    signal SW_out           : std_logic_vector(7 downto 0);
    signal EQ_level_dout    : std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
    signal EQ_dout          : std_logic_vector((C_FIR_MAX+2)*8+7 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_MMCM
    -- Description : Frequency synthesis
    ----------------------------------------------------------------
    MMCM : if G_BEHAVIOURAL=false generate
        U_MMCM : MMCM_108MHZ port map(
            clk         => clk,
            reset       => RESET,
            locked      => locked,
            CLK12MHZ    => CLK12MHZ);
    end generate MMCM;
    
    MMCM_BYPASS : if G_BEHAVIOURAL=true generate
        locked  <= '1';
        clk     <= CLK12MHZ;
    end generate MMCM_BYPASS;

    ----------------------------------------------------------------
    -- INSTANCE : U_Hearbeat
    -- Description : Blink a LED at 1Hz
    ----------------------------------------------------------------
    U_Hearbeat : Hearbeat port map(
        clk         => clk,
        reset_n     => reset_n,
        LED         => LED0);

    ----------------------------------------------------------------
    -- INSTANCE : U_UART_Wrapper
    -- Description: Wrapper of an UART clocked at 108 MHz
    ----------------------------------------------------------------
    U_UART_Wrapper : UART_Wrapper generic map(
        G_SPEED         => 3686400,
        G_PARITY_BIT    => 1,
        G_PARIY_EVEN    => 1)
    port map(
        clk             => clk,
        reset_n         => reset_n,
        Tx              => TX,
        Rx              => RX,
        UART_dout       => UART_dout,
        UART_write      => UART_write,
        UART_read       => UART_read);

    ----------------------------------------------------------------
    -- INSTANCE : U_SRAM_Wrapper
    -- Description: SRAM wrapper
    ----------------------------------------------------------------
    U_SRAM_Wrapper : SRAM_Wrapper port map(
        clk             => clk,
        reset_n         => reset_n,
        UART_dout       => UART_dout,
        UART_write      => UART_write,
        UART_read       => UART_read,
        RAM_dout        => RAM_dout,
        RAM_read        => RAM_read);

    ----------------------------------------------------------------
    -- INSTANCE : U_WAV_Player
    -- Description: 8-bit Audio player (Fs = 22050 kHz) clocked @108MHz
    ----------------------------------------------------------------
    U_WAV_Player : WAV_Player port map(
        clk             => clk,
        reset_n         => reset_n,
        Audio_out       => AUDIO_OUT,
        RAM_dout        => SW_out,
        RAM_read        => RAM_read);

    ----------------------------------------------------------------
    -- INSTANCE : U_VGA_controller
    -- Description: VGA controller, fetch image from memory and outputs VGA format
    ----------------------------------------------------------------
    U_VGA_controller : VGA_controller port map(
        clk             => clk,
        reset_n         => reset_n,
        VGA_new_frame   => VGA_new_frame,
        RAM_read        => RAM_read_video,
        RAM_address     => RAM_address,
        RAM_v_add       => RAM_v_add,
        RAM_h_add       => RAM_h_add,
        RGB_in          => RGB_VGA,
        vga_hsync       => HSYNC_OUT,
        vga_vsync       => VSYNC_OUT,
        vga_r           => RED_OUT,
        vga_g           => GREEN_OUT,
        vga_b           => BLUE_OUT);

    ----------------------------------------------------------------
    -- INSTANCE : U_VGA_interface
    -- Description: VGA controller, fetch image from memory and outputs VGA format
    ----------------------------------------------------------------
    U_VGA_interface : VGA_interface port map(
        clk             => clk,
        reset_n         => reset_n,
        VGA_new_frame   => VGA_new_frame,
        RAM_read_video  => RAM_read_video,
        RAM_address     => RAM_address,
        RAM_v_add       => RAM_v_add,
        RAM_h_add       => RAM_h_add,
        RGB_out         => RGB_VGA,
        RAM_read_audio  => RAM_read,
        sw              => SW,
        VU_dout         => VU_dout,
        EQ_dout         => EQ_dout,
        EQ_level_dout   => EQ_level_dout);

    ----------------------------------------------------------------
    -- INSTANCE : U_FIR_interface
    -- Description: FIR wrapper for multiple FIR filters working on same data
    ----------------------------------------------------------------
    U_FIR_interface : FIR_wrapper port map(
        clk             => clk,
        reset_n         => reset_n,
        FIR_dout        => FIR_dout,
        RAM_read_audio  => RAM_read,
        RAM_dout        => RAM_dout);

    ----------------------------------------------------------------
    -- INSTANCE : U_VU_metre
    -- Description: 2048 element VU-metre
    ----------------------------------------------------------------
    U_VU_metre : VU_metre port map(
        clk     => clk,
        reset_n => reset_n,
        VU_en   => RAM_read,
        VU_din  => EQ_dout,
        VU_dout => VU_dout);

    ----------------------------------------------------------------
    -- INSTANCE : U_EQ_stage
    -- Description: 6 Channel audio equalizer
    ----------------------------------------------------------------
    U_EQ_stage : EQ_wrapper port map(
        clk             => clk,
        reset_n         => reset_n,
        EQ_en           => RAM_read,
        sw              => SW,
        EQ_vol_up       => VOL_UP,
        EQ_vol_down     => VOL_DOWN,
        FIR_dout        => FIR_dout,
        RAM_dout        => RAM_dout,
        EQ_dout         => EQ_dout,
        EQ_level_dout   => EQ_level_dout);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Audio selection
    --------------------------------------------------------------------------------
    SW_out   <= EQ_dout(7 downto 0)        when(SW(2 downto 0)="000") else
                EQ_dout(15 downto 8)       when(SW(2 downto 0)="001") else
                EQ_dout(23 downto 16)      when(SW(2 downto 0)="010") else
                EQ_dout(31 downto 24)      when(SW(2 downto 0)="011") else
                EQ_dout(39 downto 32)      when(SW(2 downto 0)="100") else
                EQ_dout(47 downto 40)      when(SW(2 downto 0)="101") else
                EQ_dout(55 downto 48)      when(SW(2 downto 0)="110") else
                EQ_dout(63 downto 56);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : others
    --------------------------------------------------------------------------------
    reset_n <= locked;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------