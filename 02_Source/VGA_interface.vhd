-------------------------------------------------------------------------------
--  This entire design, which includes all of the components and related files,
--  has been created and owned by : ELSYS DESIGN
--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : VGA_interface.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-24
-- Last update: 2019-11-05
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Interface between the RAM blocks and the VGA
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-10-24  1.0      Hugo HARTMANN   Creation
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
entity VGA_interface is
    generic(
        G_BEHAVIOURAL   : boolean := false
        );
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- Switch selection -----------------
        sw              : in  std_logic_vector(3 downto 0);

        ------- VGA interface --------------------
        VGA_new_frame   : in  std_logic;
        RAM_read_video  : in  std_logic;
        RAM_address     : in  std_logic_vector(31 downto 0);
        RAM_v_add       : in  std_logic_vector(15 downto 0);
        RAM_h_add       : in  std_logic_vector(15 downto 0);
        RGB_out         : out std_logic_vector(7 downto 0);     -- 3-bit Red and Green, 2-bit Blue

        ------- WAV control ----------------------
        RAM_read_audio  : in  std_logic;

        ------- EQ interface --------------------
        EQ_level_dout   : in  std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
        EQ_dout         : in  std_logic_vector((C_FIR_MAX+2)*8+7 downto 0);

        ------- VU interface --------------------
        VU_dout         : in  std_logic_vector((C_FIR_MAX+2)*6+5 downto 0)

        );
end VGA_interface;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of VGA_interface is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type VU_tab is array (C_FIR_MIN to C_FIR_MAX+2) of std_logic_vector(5 downto 0);

    --------------------------------------------------------------------------------
    -- CONSTANTS DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_VGA_HMAX : integer := 1280;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component BRAM_8bit
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
    signal addr_write   : unsigned(10 downto 0);
    signal addr_bottom  : unsigned(10 downto 0);
    signal addr_read    : unsigned(10 downto 0);
    signal addr_portA   : std_logic_vector(10 downto 0);
    signal addr_portB   : std_logic_vector(10 downto 0);
    signal dout_portB   : std_logic_vector(7 downto 0);
    signal pixel        : std_logic_vector(15 downto 0);
    signal din_portB    : std_logic_vector(7 downto 0);
    signal write_portA  : std_logic_vector(0 downto 0);
    signal write_portB  : std_logic_vector(0 downto 0);
    signal VU_data      : VU_tab;
    signal VU_inbound   : std_logic;
    signal red_color    : std_logic;
    signal yellow_color : std_logic;
    signal green_color  : std_logic;
    signal draw_box     : std_logic;
    signal draw_vol     : std_logic;
    signal Wave_in      : std_logic_vector(7 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Samples to display
    --------------------------------------------------------------------------------
    Wave_in <= EQ_dout(7 downto 0)        when(sw(2 downto 0)="000") else
               EQ_dout(15 downto 8)       when(sw(2 downto 0)="001") else
               EQ_dout(23 downto 16)      when(sw(2 downto 0)="010") else
               EQ_dout(31 downto 24)      when(sw(2 downto 0)="011") else
               EQ_dout(39 downto 32)      when(sw(2 downto 0)="100") else
               EQ_dout(47 downto 40)      when(sw(2 downto 0)="101") else
               EQ_dout(55 downto 48)      when(sw(2 downto 0)="110") else
               EQ_dout(63 downto 56);

    ----------------------------------------------------------------
    -- INSTANCE : U_BRAM
    -- Description : Contains the 2048 last samples read
    ----------------------------------------------------------------
    BRAM : if G_BEHAVIOURAL=false generate
        U_BRAM : BRAM_8bit port map(
            clka    => clk,
            ena     => '1',
            wea     => write_portA,
            addra   => addr_portA,
            dina    => Wave_in,
          --douta   => 
            clkb    => clk,
            enb     => RAM_read_video,
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
    pixel       <= X"00" & (NOT dout_portB); -- extend pixels size to match RAM_v_add and invert y-axis
    write_portA <= (0 downto 0 => RAM_read_audio);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_write
    -- Description : Generate address to write in BRAM
    --------------------------------------------------------------------------------
    P_write : process(clk, reset_n)
    begin
        if(reset_n='0') then
            addr_write  <= (others => '0');
        elsif(rising_edge(clk)) then
            if(RAM_read_audio='1') then
                addr_write  <= addr_write + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_bottom
    -- Description : keep bottom and address fixed while displaying
    --------------------------------------------------------------------------------
    P_bottom : process(clk, reset_n)
    begin
        if(reset_n='0') then
            addr_bottom <= (others => '0');
        elsif(rising_edge(clk)) then
            if(VGA_new_frame='1') then
                addr_bottom <= addr_write - to_unsigned(C_VGA_HMAX, addr_write'length);
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Generate read_addr
    --------------------------------------------------------------------------------
    addr_read   <= addr_bottom + unsigned(RAM_h_add(10 downto 0));

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_VU_metre
    -- Description : Register VU_metre data for display
    --------------------------------------------------------------------------------
    P_VU_metre : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in C_FIR_MIN to C_FIR_MAX+2 loop
                VU_data(i) <= (others => '0');
            end loop;
        elsif(rising_edge(clk)) then
            if(VGA_new_frame='1') then
                for i in C_FIR_MIN to C_FIR_MAX+2 loop
                    VU_data(i) <= VU_dout(i*6+5 downto i*6);
                end loop;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Display a 20-segment VU_metre
    --------------------------------------------------------------------------------
    process(VU_data, RAM_v_add, RAM_h_add)
    
    constant base_min   : integer := 272;
    constant base_max   : integer := 333;
    constant step       : integer := 75;
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

            if(unsigned(RAM_h_add)>base_min+k*step and unsigned(RAM_h_add)<base_max+k*step) then
                if(8*unsigned(VU_data(i))>1023-unsigned(RAM_v_add)) then
                    if(RAM_v_add(2 downto 0)/="000" and RAM_v_add(2 downto 0)/="111") then
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
    process(EQ_level_dout, RAM_v_add, RAM_h_add)
    
    variable h_min      : integer := 0;
    variable h_max      : integer := 0;
    constant base_min   : integer := 272-5;
    constant base_max   : integer := 333+5;
    constant step       : integer := 75;
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

            level := to_integer(unsigned(EQ_level_dout(i*5+4 downto i*5)));

            if(1023-unsigned(RAM_v_add)>21*to_unsigned(level, 16) and 1023-unsigned(RAM_v_add)<21*to_unsigned(level, 16)+5) then
                if(unsigned(RAM_h_add)>to_unsigned(h_min, 16) and unsigned(RAM_h_add)<to_unsigned(h_max, 16)) then
                    draw_vol    <= '1';
                end if;
            end if;
        end loop;

    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Display a box around selected frequency band
    --------------------------------------------------------------------------------
    process(sw, RAM_v_add, RAM_h_add)
    
    variable h_min      : integer := 0;
    variable h_max      : integer := 0;
    constant base_min   : integer := 272-7;
    constant base_max   : integer := 333+7;
    constant step       : integer := 75;
    
    begin
        draw_box    <= '0';
        case sw(2 downto 0) is
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

        if(unsigned(RAM_v_add)>511) then
            if(unsigned(RAM_h_add)>to_unsigned(h_min, 16) and unsigned(RAM_h_add)<to_unsigned(h_max, 16)) then
                draw_box    <= '1';
            end if;
        end if;

    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Pixel mapping
    --------------------------------------------------------------------------------
    green_color     <= '1' when(unsigned(RAM_v_add)>895) else '0';
    yellow_color    <= '1' when(unsigned(RAM_v_add)>639) else '0';
    red_color       <= '1' when(unsigned(RAM_v_add)>511) else '0';
    RGB_out         <= "11100000"   when(RAM_v_add=X"007F") else
                       "00000010"   when(draw_vol='1') else
                       "11111111"   when(pixel=RAM_v_add) else
                       "00011100"   when(green_color='1' and VU_inbound='1') else
                       "11111100"   when(yellow_color='1' and VU_inbound='1') else
                       "11100000"   when(red_color='1' and VU_inbound='1') else
                       "01001001"   when(draw_box='1') else
                       "00000000";

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------