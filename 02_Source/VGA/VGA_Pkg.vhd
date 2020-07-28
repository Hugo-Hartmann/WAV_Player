-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : VGA_Pkg.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-24
-- Last update: 2019-10-24
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: VGA constant package to easily switch resolution
--              Adapt input clock based on selected resolution
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-10-24  1.0      Hugo HARTMANN   Creation
-------------------------------------------------------------------------------

-- Based on VGA signal timings at http://tinyvga.com/vga-timing

-- VGA_Pkg_VVVVxHHHH_Hz_MHz
--  VVVV : Number of pixel (vertical)
--  HHHH : Number of pixel (horizontal)
--  Hz   : screen refresh rate
--  MHz  : required input clk : 100_16MHz => 100,16 MHz

-- tested
package VGA_Pkg_640x480_60Hz_25_175MHz is
    constant C_HCNT_MAX     : integer := 799;
    constant C_HSYNC_THRES  : integer := 95;
    constant C_HBLK_MIN_N   : integer := 143;
    constant C_HBLK_MAX_N   : integer := 784;

    constant C_VCNT_MAX     : integer := 524;
    constant C_VSYNC_THRES  : integer := 1;
    constant C_VBLK_MIN_N   : integer := 34;
    constant C_VBLK_MAX_N   : integer := 515;
end VGA_Pkg_640x480_60Hz_25_175MHz;

-- tested
package VGA_Pkg_800x600_60Hz_40_00MHz is
    constant C_HCNT_MAX     : integer := 1055;
    constant C_HSYNC_THRES  : integer := 127;
    constant C_HBLK_MIN_N   : integer := 215;
    constant C_HBLK_MAX_N   : integer := 1016;

    constant C_VCNT_MAX     : integer := 627;
    constant C_VSYNC_THRES  : integer := 3;
    constant C_VBLK_MIN_N   : integer := 26;
    constant C_VBLK_MAX_N   : integer := 627;
end VGA_Pkg_800x600_60Hz_40_00MHz;

-- untested
package VGA_Pkg_1024x768_60Hz_65_00MHz is
    constant C_HCNT_MAX     : integer := 1343;
    constant C_HSYNC_THRES  : integer := 135;
    constant C_HBLK_MIN_N   : integer := 296;
    constant C_HBLK_MAX_N   : integer := 1320;

    constant C_VCNT_MAX     : integer := 805;
    constant C_VSYNC_THRES  : integer := 5;
    constant C_VBLK_MIN_N   : integer := 34;
    constant C_VBLK_MAX_N   : integer := 803;
end VGA_Pkg_1024x768_60Hz_65_00MHz;

-- tested
package VGA_Pkg_1152x864_75Hz_108_00MHz is
    constant C_HCNT_MAX     : integer := 1599;
    constant C_HSYNC_THRES  : integer := 127;
    constant C_HBLK_MIN_N   : integer := 383;
    constant C_HBLK_MAX_N   : integer := 1536;

    constant C_VCNT_MAX     : integer := 899;
    constant C_VSYNC_THRES  : integer := 2;
    constant C_VBLK_MIN_N   : integer := 34;
    constant C_VBLK_MAX_N   : integer := 899;
end VGA_Pkg_1152x864_75Hz_108_00MHz;

-- tested
package VGA_Pkg_1280x1024_60Hz_108_00MHz is
    constant C_HCNT_MAX     : integer := 1687;
    constant C_HSYNC_THRES  : integer := 111;
    constant C_HBLK_MIN_N   : integer := 359;
    constant C_HBLK_MAX_N   : integer := 1640;

    constant C_VCNT_MAX     : integer := 1065;
    constant C_VSYNC_THRES  : integer := 2;
    constant C_VBLK_MIN_N   : integer := 40;
    constant C_VBLK_MAX_N   : integer := 1065;
end VGA_Pkg_1280x1024_60Hz_108_00MHz;

-- untested
package VGA_Pkg_1600x1200_60Hz_162_00MHz is
    constant C_HCNT_MAX     : integer := 2159;
    constant C_HSYNC_THRES  : integer := 191;
    constant C_HBLK_MIN_N   : integer := 495;
    constant C_HBLK_MAX_N   : integer := 2096;

    constant C_VCNT_MAX     : integer := 1249;
    constant C_VSYNC_THRES  : integer := 2;
    constant C_VBLK_MIN_N   : integer := 47;
    constant C_VBLK_MAX_N   : integer := 1249;
end VGA_Pkg_1600x1200_60Hz_162_00MHz;

-- untested
package VGA_Pkg_1920x1200_60Hz_193_16MHz is
    constant C_HCNT_MAX     : integer := 2591;
    constant C_HSYNC_THRES  : integer := 207;
    constant C_HBLK_MIN_N   : integer := 543;
    constant C_HBLK_MAX_N   : integer := 2464;

    constant C_VCNT_MAX     : integer := 1241;
    constant C_VSYNC_THRES  : integer := 2;
    constant C_VBLK_MIN_N   : integer := 40;
    constant C_VBLK_MAX_N   : integer := 1241;
end VGA_Pkg_1920x1200_60Hz_193_16MHz;

-- untested
package VGA_Pkg_1920x1440_60Hz_234_00MHz is
    constant C_HCNT_MAX     : integer := 2599;
    constant C_HSYNC_THRES  : integer := 207;
    constant C_HBLK_MIN_N   : integer := 551;
    constant C_HBLK_MAX_N   : integer := 2472;

    constant C_VCNT_MAX     : integer := 1499;
    constant C_VSYNC_THRES  : integer := 2;
    constant C_VBLK_MIN_N   : integer := 58;
    constant C_VBLK_MAX_N   : integer := 1499;
end VGA_Pkg_1920x1440_60Hz_234_00MHz;