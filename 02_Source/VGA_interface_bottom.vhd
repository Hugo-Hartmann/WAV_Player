-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : VGA_interface_bottom.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-12-21
-- Last update: 2019-12-21
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Interface between the RAM blocks and the VGA
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
entity VGA_interface_bottom is
    generic(
        G_BEHAVIOURAL   : boolean := false
        );
    port(
    
        ------- Clock and RESET ------------------
        clk_108         : in  std_logic;                        -- clock 108 MHz
        clk_216         : in  std_logic;                        -- clock 216 MHz
        reset_n         : in  std_logic;                        -- reset_n

        ------- Switch selection -----------------
        VGA_select      : in  std_logic_vector(3 downto 0);

        ------- VGA interface --------------------
        VGA_new_frame   : in  std_logic;
        VGA_read        : in  std_logic;
        VGA_address     : in  std_logic_vector(31 downto 0);
        VGA_v_add       : in  std_logic_vector(15 downto 0);
        VGA_h_add       : in  std_logic_vector(15 downto 0);
        VGA_din         : out std_logic_vector(11 downto 0);

        ------- WAV control ----------------------
        WAV_read        : in  std_logic;

        ------- EQ interface --------------------
        EQ_level_dout   : in  std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
        EQ_dout         : in  std_logic_vector((C_FIR_MAX+2)*16+15 downto 0);

        ------- VU interface --------------------
        VU_dout         : in  std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);

        ------- NRM interface -------------------
        NRM_addr        : out std_logic_vector(8 downto 0);
        NRM_read        : out std_logic;
        NRM_dout        : in  std_logic_vector(15 downto 0)

        );
end VGA_interface_bottom;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of VGA_interface_bottom is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type VU_tab is array (C_FIR_MIN to C_FIR_MAX+2) of std_logic_vector(4 downto 0);

    --------------------------------------------------------------------------------
    -- CONSTANTS DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_VGA_HMAX : integer := 1280;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component BRAM_2048_8bit
        port(
            clka    : in std_logic;
            ena     : in std_logic;
            wea     : in std_logic_vector(0 downto 0);
            addra   : in std_logic_vector(10 downto 0);
            dina    : in std_logic_vector(7 downto 0);
            douta   : out std_logic_vector(7 downto 0);
            clkb    : in std_logic;
            enb     : in std_logic;
            web     : in std_logic_vector(0 downto 0);
            addrb   : in std_logic_vector(10 downto 0);
            dinb    : in std_logic_vector(7 downto 0);
            doutb   : out std_logic_vector(7 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal addr_write       : unsigned(10 downto 0);
    signal addr_bottom      : unsigned(10 downto 0);
    signal addr_read        : unsigned(10 downto 0);
    signal addr_portA       : std_logic_vector(10 downto 0);
    signal addr_portB       : std_logic_vector(10 downto 0);
    signal dout_portB       : std_logic_vector(7 downto 0);
    signal pixel            : std_logic_vector(15 downto 0);
    signal din_portB        : std_logic_vector(7 downto 0);
    signal write_portA      : std_logic_vector(0 downto 0);
    signal write_portB      : std_logic_vector(0 downto 0);
    signal VU_data          : VU_tab;
    signal VU_inbound       : std_logic;
    signal VU_inbound_d     : std_logic;
    signal red_color        : std_logic;
    signal red_color_d      : std_logic;
    signal yellow_color     : std_logic;
    signal yellow_color_d   : std_logic;
    signal green_color      : std_logic;
    signal green_color_d    : std_logic;
    signal draw_box         : std_logic;
    signal draw_box_d       : std_logic;
    signal draw_vol         : std_logic;
    signal draw_vol_d       : std_logic;
    signal display_nrm      : std_logic;
    signal display_nrm_d    : std_logic;
    signal WAV_din          : std_logic_vector(7 downto 0);
    signal WAV_din_map      : std_logic_vector(7 downto 0);
    signal NRM_data         : std_logic_vector(15 downto 0);
    signal pixel_ok         : std_logic;
    signal pixel_ok_d       : std_logic;
    signal nrm_box          : std_logic;
    signal nrm_box_d        : std_logic;
    signal nrm_addr_map     : unsigned(15 downto 0);
    signal nrm_addr_final   : std_logic_vector(8 downto 0);
    signal WAV_read_d1      : std_logic;
    signal WAV_read_d2      : std_logic;
    signal EQ_level_dout_d1 : std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
    signal EQ_level_dout_d2 : std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_select
    -- Description : Select input data
    --------------------------------------------------------------------------------
    P_select : process(clk_216, reset_n)
    begin
        if(reset_n='0') then
            WAV_din <= (others => '0');
            WAV_din_map <= (others => '0');
            WAV_read_d1 <= '0';
            WAV_read_d2 <= '0';
        elsif(rising_edge(clk_216)) then
            case VGA_select(2 downto 0) is
                when "000" => WAV_din <= EQ_dout(15 downto 8);
                when "001" => WAV_din <= EQ_dout(31 downto 24);
                when "010" => WAV_din <= EQ_dout(47 downto 40);
                when "011" => WAV_din <= EQ_dout(63 downto 56);
                when "100" => WAV_din <= EQ_dout(79 downto 72);
                when "101" => WAV_din <= EQ_dout(95 downto 88);
                when "110" => WAV_din <= EQ_dout(111 downto 104);
                when others => WAV_din <= EQ_dout(127 downto 120);
            end case;
            WAV_din_map <= std_logic_vector(unsigned(WAV_din)+128);
            WAV_read_d1 <= WAV_read;
            WAV_read_d2 <= WAV_read_d1;
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_BRAM
    -- Description : Contains the 2048 last samples read
    ----------------------------------------------------------------
    BRAM : if G_BEHAVIOURAL=false generate
        U_BRAM : BRAM_2048_8bit port map(
            clka    => clk_216,
            ena     => '1',
            wea     => write_portA,
            addra   => addr_portA,
            dina    => WAV_din_map,
          --douta   => 
            clkb    => clk_108,
            enb     => VGA_read,
            web     => write_portB, -- always 0
            addrb   => addr_portB,
            dinb    => din_portB,
            doutb   => dout_portB);
    end generate;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : BRAM port mapping
    --------------------------------------------------------------------------------
    din_portB   <= (others => '0'); -- no intent to write on this port
    write_portB <= (others => '0');
    addr_portA  <= std_logic_vector(addr_write);
    addr_portB  <= std_logic_vector(addr_read);
    pixel       <= X"00" & dout_portB; -- extend pixels size to match VGA_v_add size
    write_portA <= (0 downto 0 => WAV_read_d2);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_write
    -- Description : Generate address to write in BRAM
    --------------------------------------------------------------------------------
    P_write : process(clk_216, reset_n)
    begin
        if(reset_n='0') then
            addr_write  <= (others => '0');
        elsif(rising_edge(clk_216)) then
            if(WAV_read_d2='1') then
                addr_write  <= addr_write + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_bottom
    -- Description : keep bottom and address fixed while displaying
    --------------------------------------------------------------------------------
    P_bottom : process(clk_108, reset_n)
    begin
        if(reset_n='0') then
            addr_bottom <= (others => '0');
        elsif(rising_edge(clk_108)) then
            if(VGA_new_frame='1') then
                addr_bottom <= addr_write - to_unsigned(C_VGA_HMAX, addr_write'length);
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Generate read_addr
    --------------------------------------------------------------------------------
    addr_read   <= addr_bottom + unsigned(VGA_h_add(10 downto 0));

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg_NRM
    -- Description : register NRM data for timing
    --------------------------------------------------------------------------------
    P_reg_NRM : process(clk_108, reset_n)
    begin
        if(reset_n='0') then
            NRM_data    <= (others => '0');
        elsif(rising_edge(clk_108)) then
            NRM_data    <= NRM_dout;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Display the FFT (normalized)
    --------------------------------------------------------------------------------
    NRM_read        <= VGA_read when(unsigned(VGA_v_add)>200) else '0';
    nrm_addr_map    <= unsigned(VGA_h_add) - 14;
    nrm_addr_final  <= std_logic_vector(nrm_addr_map(10 downto 2));
    
    process(nrm_addr_final)
    -- Invert address to fetch correct samples
    begin
        for i in nrm_addr_final'range loop
            NRM_addr(i) <= nrm_addr_final(nrm_addr_final'high-i);
        end loop;
    end process;

    process(NRM_data, VGA_v_add, VGA_h_add)
    
    variable hadd   : integer := 0;
    variable vadd   : integer := 0;
    variable data   : integer := 0;
    variable ceil   : integer := 0;

    begin

        hadd := to_integer(unsigned(VGA_h_add));
        vadd := to_integer(unsigned(VGA_v_add));
        data := to_integer(unsigned(NRM_data(15 downto 3)));
        if(data>255) then
            ceil := 255;
        else
            ceil := data;
        end if;

        display_nrm <= '0';
        if(hadd>15 and hadd<785) then
            if(vadd>767 and vadd<1023) then
                if(data>1023-vadd) then
                    display_nrm <= '1';
                end if;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Display a box around the FFT
    --------------------------------------------------------------------------------
    process(VGA_v_add, VGA_h_add)
    
    variable hadd   : integer := 0;
    variable vadd   : integer := 0;

    begin
    
        hadd := to_integer(unsigned(VGA_h_add));
        vadd := to_integer(unsigned(VGA_v_add));

        nrm_box <= '0';
        if(hadd>15 and hadd<785) then
            if(vadd=767 or vadd=1023) then
                nrm_box <= '1';
            end if;
        elsif(vadd>767 and vadd<1024) then
            if(hadd=15 or hadd=785) then
                nrm_box <= '1';
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_VU_metre
    -- Description : Register VU_metre data for display
    --------------------------------------------------------------------------------
    P_VU_metre : process(clk_108, reset_n)
    begin
        if(reset_n='0') then
            for i in C_FIR_MIN to C_FIR_MAX+2 loop
                VU_data(i) <= (others => '0');
            end loop;
        elsif(rising_edge(clk_108)) then
            if(VGA_new_frame='1') then
                for i in C_FIR_MIN to C_FIR_MAX+2 loop
                    VU_data(i) <= VU_dout(i*5+4 downto i*5);
                end loop;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Display a multi-segment VU_metre
    --------------------------------------------------------------------------------
    process(VU_data, VGA_v_add, VGA_h_add)
    
    constant base_min   : integer := 800;
    constant base_max   : integer := 840;
    constant step       : integer := 48;
    variable k          : integer := 0;
    
    begin
        VU_inbound  <= '0';
        for i in C_FIR_MIN to C_FIR_MAX+2 loop
            if(i=0) then
                k := 0;
            elsif(i=C_FIR_MAX+2) then
                k := i+2;
            else
                k := i+1;
            end if;

            if(unsigned(VGA_h_add)>base_min+k*step and unsigned(VGA_h_add)<base_max+k*step) then
                if(8*unsigned(VU_data(i))>1023-unsigned(VGA_v_add)) then
                    if(VGA_v_add(2 downto 0)/="000" and VGA_v_add(2 downto 0)/="111") then
                        VU_inbound  <= '1';
                    end if;
                end if;
            end if;
        end loop;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Display a box for each volume bar
    --------------------------------------------------------------------------------
    process(reset_n, clk_108)
    begin
        if(reset_n='0') then
            EQ_level_dout_d1    <= (others => '0');
            EQ_level_dout_d2    <= (others => '0');
        elsif(rising_edge(clk_108)) then
            EQ_level_dout_d1    <= EQ_level_dout;
            EQ_level_dout_d2    <= EQ_level_dout_d1;
        end if;
    end process;
    
    process(EQ_level_dout_d2, VGA_v_add, VGA_h_add)
    
    variable h_min      : integer := 0;
    variable h_max      : integer := 0;
    constant base_min   : integer := 800-2;
    constant base_max   : integer := 840+2;
    constant step       : integer := 48;
    variable level      : integer := 0;
    
    begin
        draw_vol    <= '0';
        for i in 0 to C_FIR_MAX+2 loop
            if(i=0) then
                h_min := base_min+i*step;
                h_max := base_max+i*step;
            elsif(i=C_FIR_MAX+2) then
                h_min := base_min+(i+2)*step;
                h_max := base_max+(i+2)*step;
            else
                h_min := base_min+(i+1)*step;
                h_max := base_max+(i+1)*step;
            end if;

            level := to_integer(unsigned(EQ_level_dout_d2(i*5+4 downto i*5)));

            if(1023-unsigned(VGA_v_add)>10*to_unsigned(level, 16) and 1023-unsigned(VGA_v_add)<10*to_unsigned(level, 16)+5) then
                if(unsigned(VGA_h_add)>to_unsigned(h_min, 16) and unsigned(VGA_h_add)<to_unsigned(h_max, 16)) then
                    draw_vol    <= '1';
                end if;
            end if;
        end loop;

    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Display a box around selected frequency band
    --------------------------------------------------------------------------------
    process(VGA_select, VGA_v_add, VGA_h_add)
    
    variable h_min      : integer := 0;
    variable h_max      : integer := 0;
    constant base_min   : integer := 800-5;
    constant base_max   : integer := 840+5;
    constant step       : integer := 48;
    
    begin
        draw_box    <= '0';
        case VGA_select(2 downto 0) is
            when "000" => h_min := base_min+0*step; h_max := base_max+0*step;
            when "001" => h_min := base_min+2*step; h_max := base_max+2*step;
            when "010" => h_min := base_min+3*step; h_max := base_max+3*step;
            when "011" => h_min := base_min+4*step; h_max := base_max+4*step;
            when "100" => h_min := base_min+5*step; h_max := base_max+5*step;
            when "101" => h_min := base_min+6*step; h_max := base_max+6*step;
            when "110" => h_min := base_min+7*step; h_max := base_max+7*step;
            when "111" => h_min := base_min+9*step; h_max := base_max+9*step;
            when others => h_min := base_min+0*step; h_max := base_max+0*step;
        end case;

        if(unsigned(VGA_v_add)>768) then
            if(unsigned(VGA_h_add)>to_unsigned(h_min, 16) and unsigned(VGA_h_add)<to_unsigned(h_max, 16)) then
                draw_box    <= '1';
            end if;
        end if;

    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Pixel mapping
    --------------------------------------------------------------------------------
    green_color     <= '1' when(unsigned(VGA_v_add)>960) else '0';
    yellow_color    <= '1' when(unsigned(VGA_v_add)>832) else '0';
    red_color       <= '1' when(unsigned(VGA_v_add)>768) else '0';

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Others
    --------------------------------------------------------------------------------
    pixel_ok        <= '1' when(256+unsigned(pixel)=1023-unsigned(VGA_v_add)) else '0'; -- Oscilloscope

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg_signal
    -- Description : register signals for timing
    --------------------------------------------------------------------------------
    P_reg_signal : process(clk_108, reset_n)
    begin
        if(reset_n='0') then
            display_nrm_d   <= '0';
            draw_vol_d      <= '0';
            pixel_ok_d      <= '0';
            VU_inbound_d    <= '0';
            green_color_d   <= '0';
            yellow_color_d  <= '0';
            red_color_d     <= '0';
            draw_box_d      <= '0';
            nrm_box_d       <= '0';
        elsif(rising_edge(clk_108)) then
            display_nrm_d   <= display_nrm;
            draw_vol_d      <= draw_vol;
            pixel_ok_d      <= pixel_ok;
            VU_inbound_d    <= VU_inbound;
            green_color_d   <= green_color;
            yellow_color_d  <= yellow_color;
            red_color_d     <= red_color;
            draw_box_d      <= draw_box;
            nrm_box_d       <= nrm_box;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Final pixel mapping
    --------------------------------------------------------------------------------
    VGA_din         <= X"F00"   when(nrm_box_d='1') else
                       X"FFF"   when(display_nrm_d='1') else
                       X"00A"   when(draw_vol_d='1') else
                       X"FFF"   when(pixel_ok_d='1') else
                       X"0F0"   when(green_color_d='1' and VU_inbound_d='1') else
                       X"FF0"   when(yellow_color_d='1' and VU_inbound_d='1') else
                       X"F00"   when(red_color_d='1' and VU_inbound_d='1') else
                       X"888"   when(draw_box_d='1') else
                       X"000";

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------