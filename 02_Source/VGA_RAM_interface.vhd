-------------------------------------------------------------------------------
--  This entire design, which includes all of the components and related files,
--  has been created and owned by : ELSYS DESIGN
--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : VGA_RAM_interface.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-24
-- Last update: 2019-10-31
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
entity VGA_RAM_interface is
    generic(
        G_BEHAVIOURAL   : boolean := false
        );
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- VGA interface --------------------
        VGA_new_frame   : in  std_logic;
        RAM_read_video  : in  std_logic;
        RAM_address     : in  std_logic_vector(31 downto 0);
        RAM_v_add       : in  std_logic_vector(15 downto 0);
        RAM_h_add       : in  std_logic_vector(15 downto 0);
        RGB_out         : out std_logic_vector(7 downto 0);     -- 3-bit Red and Green, 2-bit Blue

        ------- WAV control ----------------------
        RAM_read_audio  : in  std_logic;

        ------- RAM interface --------------------
        VU_dout         : in  std_logic_vector(C_FIR_MAX*5+4 downto 0);
        RAM_dout        : in  std_logic_vector(7 downto 0)

        );
end VGA_RAM_interface;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of VGA_RAM_interface is

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

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

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
            dina    => RAM_dout,
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
            for i in C_FIR_MIN to C_FIR_MAX loop
                VU_data(i) <= (others => '0');
            end loop;
        elsif(rising_edge(clk)) then
            if(VGA_new_frame='1') then
                for i in C_FIR_MIN to C_FIR_MAX loop
                    VU_data(i) <= VU_dout(i*5+4 downto i*5);
                end loop;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Display a 20-segment VU_metre
    --------------------------------------------------------------------------------
    process(VU_data, RAM_v_add, RAM_h_add)
    begin
        VU_inbound  <= '0';
        for i in C_FIR_MIN to C_FIR_MAX loop
            if(unsigned(RAM_h_add)>39+i*60 and unsigned(RAM_h_add)<100+i*60) then
                if(8*unsigned(VU_data(i))>1023-unsigned(RAM_v_add)) then
                    VU_inbound  <= '1';
                end if;
            end if;
        end loop;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Pixel mapping
    --------------------------------------------------------------------------------
    green_color     <= '1' when(unsigned(RAM_v_add)>895) else '0';
    yellow_color    <= '1' when(unsigned(RAM_v_add)>639) else '0';
    red_color       <= '1' when(unsigned(RAM_v_add)>511) else '0';
    RGB_out         <= "11111111"   when(pixel=RAM_v_add) else
                       "00011100"   when(green_color='1' and VU_inbound='1') else
                       "11111100"   when(yellow_color='1' and VU_inbound='1') else
                       "11100000"   when(red_color='1' and VU_inbound='1') else
                       "00000000";

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------