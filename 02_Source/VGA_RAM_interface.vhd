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
-- Last update: 2019-10-24
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


--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
entity VGA_RAM_interface is
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
        RAM_dout        : in  std_logic_vector(7 downto 0)

        );
end VGA_RAM_interface;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of VGA_RAM_interface is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type DELAY_LINE is array (0 to 1279) of std_logic_vector(7 downto 0);

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal ram_fifo : DELAY_LINE;
    signal vga_buff : DELAY_LINE;
    signal pixel    : std_logic_vector(15 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_FIFO
    -- Description : Register data read as audio
    --------------------------------------------------------------------------------
    P_FIFO : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in ram_fifo'range loop
                ram_fifo(i) <= (others => '0');
            end loop;
        elsif(rising_edge(clk)) then
            if(RAM_read_audio='1') then
                ram_fifo(0) <= RAM_dout;
                for i in 1 to ram_fifo'high loop
                    ram_fifo(i) <= ram_fifo(i-1);
                end loop;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_VGA_buff
    -- Description : keep buffer unchanged for display
    --------------------------------------------------------------------------------
    P_VGA_buff : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in vga_buff'range loop
                vga_buff(i) <= (others => '0');
            end loop;
        elsif(rising_edge(clk)) then
            if(VGA_new_frame='1') then
                for i in vga_buff'range loop
                    vga_buff(i) <= ram_fifo(i);
                end loop;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Read vga_buff
    --------------------------------------------------------------------------------
    pixel   <= X"00" & vga_buff(to_integer(unsigned(RAM_h_add)));
    RGB_out <= (others => '1') when(pixel=RAM_v_add) else (others => '0');

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------