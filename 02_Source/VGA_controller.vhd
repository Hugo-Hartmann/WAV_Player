-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : VGA_controller.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-24
-- Last update: 2019-11-27
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: VGA controller, fetch image from memory and outputs VGA format
--              Current version : See Package for available formats
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-10-24  1.0      Hugo HARTMANN   Creation
-------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- /!\   RESOLUTION   /!\
--------------------------------------------------------------------------------
-- Change resolution by selecting the correct package in VGA_Pkg

--------------------------------------------------------------------------------
-- LIBRARIES DECLARATION
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_VHDL;
use lib_VHDL.VGA_Pkg_1280x1024_60Hz_108_00MHz.all;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
entity VGA_Controller is
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- Custom signaling -----------------
        VGA_new_frame   : out std_logic;                        -- signal new frame display

        ------- Memory control -------------------
        VGA_read        : out std_logic;
        VGA_address     : out std_logic_vector(31 downto 0);
        VGA_v_add       : out std_logic_vector(15 downto 0);
        VGA_h_add       : out std_logic_vector(15 downto 0);

        ------- Pixel data -----------------------
        VGA_din         : in  std_logic_vector(7 downto 0);     -- 3-bit Red and Green, 2-bit Blue

        ------- Output signals VGA--------------------
        VGA_hsync       : out std_logic;
        VGA_vsync       : out std_logic;
        VGA_r           : out std_logic_vector(2 downto 0);
        VGA_g           : out std_logic_vector(2 downto 0);
        VGA_b           : out std_logic_vector(1 downto 0)
        );
end VGA_Controller;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of VGA_Controller is

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal v_counter        : unsigned(15 downto 0);
    signal v_addr_counter   : unsigned(15 downto 0);
    signal v_blank          : std_logic;
    signal v_sync           : std_logic;
    signal v_sync_d         : std_logic;
    signal v_sync_dd        : std_logic;
    signal v_inc            : std_logic;
    signal h_counter        : unsigned(15 downto 0);
    signal h_addr_counter   : unsigned(15 downto 0);
    signal h_blank          : std_logic;
    signal h_sync           : std_logic;
    signal h_sync_d         : std_logic;
    signal h_sync_dd        : std_logic;
    signal RGB_blank        : std_logic;
    signal RGB_blank_d      : std_logic;
    signal RGB_blank_dd     : std_logic;
    signal mem_read         : std_logic;
    signal mem_add_inc      : std_logic;
    signal mem_add_clr      : std_logic;
    signal mem_h_add_clr    : std_logic;
    signal mem_v_add_clr    : std_logic;
    signal mem_counter      : unsigned(31 downto 0);


--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_h_count
    -- Description : Horizontal counter for display
    --------------------------------------------------------------------------------
    P_h_count : process(clk, reset_n)
    begin
        if(reset_n='0') then
            h_counter   <= (others => '0');
        elsif(rising_edge(clk)) then
            if(h_counter=to_unsigned(C_HCNT_MAX, h_counter'length)) then
                h_counter   <= (others => '0');
            else
                h_counter   <= h_counter+1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : h_blank, v_inc and h_sync
    --------------------------------------------------------------------------------
    h_blank <= '0' when(to_unsigned(C_HBLK_MIN_N, h_counter'length)<h_counter and
                        h_counter<to_unsigned(C_HBLK_MAX_N, h_counter'length)) else '1';
    h_sync  <= '1' when(to_unsigned(C_HSYNC_THRES, h_counter'length)<h_counter) else '0';
    v_inc   <= '1' when(h_counter=to_unsigned(C_HCNT_MAX, h_counter'length)) else '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_v_count
    -- Description : Vertical counter for display
    --------------------------------------------------------------------------------
    P_v_count : process(clk, reset_n)
    begin
        if(reset_n='0') then
            v_counter   <= (others => '0');
        elsif(rising_edge(clk)) then
            if(v_inc='1') then
                if(v_counter=to_unsigned(C_VCNT_MAX, v_counter'length)) then
                    v_counter   <= (others => '0');
                else
                    v_counter   <= v_counter+1;
                end if;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : v_blank and v_sync
    --------------------------------------------------------------------------------
    v_blank         <= '0' when(to_unsigned(C_VBLK_MIN_N, v_counter'length)<v_counter and
                                v_counter<to_unsigned(C_VBLK_MAX_N, v_counter'length)) else '1';
    v_sync          <= '1' when(to_unsigned(C_VSYNC_THRES, v_counter'length)<v_counter) else '0';

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Custom new frame signal
    --------------------------------------------------------------------------------
    VGA_new_frame   <= '1' when(v_counter=0 and h_counter=0) else '0';

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : blanking and memory read
    --------------------------------------------------------------------------------
    RGB_blank       <= v_blank OR h_blank;
    mem_read        <= NOT RGB_blank;       -- read pixel when we are not blanking
    mem_add_inc     <= mem_read;            -- increase memory address as we read it
    mem_add_clr     <= NOT v_sync;          -- clear memory address
    mem_h_add_clr   <= h_blank;
    mem_v_add_clr   <= v_blank;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_mem_count
    -- Description : Memory address generation counter for display
    --------------------------------------------------------------------------------
    P_mem_count : process(clk, reset_n)
    begin
        if(reset_n='0') then
            mem_counter   <= (others => '0');
        elsif(rising_edge(clk)) then
            if(mem_add_clr='1') then
                mem_counter   <= (others => '0');
            elsif(mem_add_inc='1') then
                mem_counter   <= mem_counter+1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : RAM_address
    --------------------------------------------------------------------------------
    VGA_address <= std_logic_vector(mem_counter);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_h_mem_count
    -- Description : Memory address generation counter for display based on horizontal counter
    --------------------------------------------------------------------------------
    P_h_mem_count : process(clk, reset_n)
    begin
        if(reset_n='0') then
            h_addr_counter  <= (others => '0');
        elsif(rising_edge(clk)) then
            if(mem_h_add_clr='1') then
                h_addr_counter  <= (others => '0');
            else
                h_addr_counter  <= h_addr_counter+1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : RAM_address based on counters
    --------------------------------------------------------------------------------
    VGA_h_add   <= std_logic_vector(h_addr_counter);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_v_mem_count
    -- Description : Memory address generation counter for display based on vertical counter
    --------------------------------------------------------------------------------
    P_v_mem_count : process(clk, reset_n)
    begin
        if(reset_n='0') then
            v_addr_counter  <= (others => '0');
        elsif(rising_edge(clk)) then
            if(mem_v_add_clr='1') then
                v_addr_counter  <= (others => '0');
            elsif(v_inc='1') then
                v_addr_counter  <= v_addr_counter+1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : RAM_address based on counters
    --------------------------------------------------------------------------------
    VGA_v_add   <= std_logic_vector(v_addr_counter);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_output_delay
    -- Description : Delay control signals to sync with SRAM access
    --------------------------------------------------------------------------------
    P_output_delay : process(clk, reset_n)
    begin
        if(reset_n='0') then
            VGA_hsync       <= '1';
            h_sync_d        <= '1';
            VGA_vsync       <= '1';
            v_sync_d        <= '1';
            RGB_blank_d     <= '1';
        elsif(rising_edge(clk)) then
            h_sync_d        <= h_sync;
            h_sync_dd       <= h_sync_d;
            VGA_hsync       <= h_sync_dd;
            v_sync_d        <= v_sync;
            v_sync_dd       <= v_sync_d;
            VGA_vsync       <= v_sync_dd;
            RGB_blank_d     <= RGB_blank;
            RGB_blank_dd    <= RGB_blank_d;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : SRAM read signal
    --------------------------------------------------------------------------------
    VGA_read    <= mem_read;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_SRAM_Pixels
    -- Description : Delay control signals to sync with SRAM access
    --------------------------------------------------------------------------------
    P_SRAM_Pixels : process(clk, reset_n)
    begin
        if(reset_n='0') then
            VGA_r       <= (others => '0');
            VGA_g       <= (others => '0');
            VGA_b       <= (others => '0');
        elsif(rising_edge(clk)) then
            if(RGB_blank_dd='1') then
                VGA_r       <= (others => '0');
                VGA_g       <= (others => '0');
                VGA_b       <= (others => '0');
            else
                VGA_r   <= VGA_din(7 downto 5);
                VGA_g   <= VGA_din(4 downto 2);
                VGA_b   <= VGA_din(1 downto 0);
            end if;
        end if;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------