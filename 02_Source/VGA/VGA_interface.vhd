-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : VGA_interface.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-24
-- Last update: 2020-08-03
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Generate image for the VGA controller
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
        clk_108         : in  std_logic;                        -- clock 108 MHz
        clk_216         : in  std_logic;                        -- clock 216 MHz
        reset_n         : in  std_logic;                        -- reset_n

        ------- SW_in ---------------------------
        SW_in           : in  std_logic_vector(3 downto 0);

        ------- WAV_din --------------------------
        WAV_din         : in  std_logic_vector(7 downto 0);

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
        EQ_level_dout   : in  std_logic_vector(C_FIR_TOT*5+4 downto 0);
        EQ_dout         : in  std_logic_vector(C_FIR_TOT*16+15 downto 0);

        ------- VU interface --------------------
        VU_dout         : in  std_logic_vector(C_FIR_TOT*5+4 downto 0);

        ------- NRM interface -------------------
        NRM_addr        : out std_logic_vector(10 downto 0);
        NRM_dout        : in  std_logic_vector(15 downto 0);

        ------- PUSH interface ------------------
        WAV_push        : out std_logic_vector(8 downto 0);     -- push => enable + data (to UART FIFO)
        FFT_push        : out std_logic_vector(16 downto 0)     -- push => enable + data (to UART FIFO)

        );
end VGA_interface;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of VGA_interface is

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
    signal addr_base        : unsigned(10 downto 0);
    signal addr_read        : unsigned(10 downto 0);
    signal addr_portA       : std_logic_vector(10 downto 0);
    signal addr_portB       : std_logic_vector(10 downto 0);
    signal dout_portB       : std_logic_vector(7 downto 0);
    signal pixel            : std_logic_vector(15 downto 0);
    signal din_portB        : std_logic_vector(7 downto 0);
    signal write_portA      : std_logic_vector(0 downto 0);
    signal write_portB      : std_logic_vector(0 downto 0);
    signal WAV_din_d        : std_logic_vector(7 downto 0);
    signal WAV_din_map      : std_logic_vector(7 downto 0);
    signal NRM_data         : std_logic_vector(15 downto 0);
    signal nrm_addr_map     : unsigned(15 downto 0);
    signal nrm_addr_final   : std_logic_vector(10 downto 0);
    signal WAV_read_d1      : std_logic;
    signal WAV_read_d2      : std_logic;
    signal WAV_en_push      : std_logic;
    signal FFT_en_push      : std_logic;

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
            WAV_din_d   <= (others => '0');
            WAV_din_map <= (others => '0');
            WAV_read_d1 <= '0';
            WAV_read_d2 <= '0';
        elsif(rising_edge(clk_216)) then
            WAV_din_d   <= WAV_din;
            WAV_din_map <= std_logic_vector(unsigned(WAV_din_d)+128);
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
            douta   => open,
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
    pixel       <= X"00" & (NOT dout_portB); -- extend pixels size to match VGA_v_add size and invert y-axis
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
    -- Description : keep base address fixed while displaying
    --------------------------------------------------------------------------------
    P_bottom : process(clk_108, reset_n)
    begin
        if(reset_n='0') then
            addr_base   <= (others => '0');
        elsif(rising_edge(clk_108)) then
            if(VGA_new_frame='1') then
                addr_base   <= addr_write - to_unsigned(C_VGA_HMAX, addr_write'length);
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Generate read_addr
    --------------------------------------------------------------------------------
    addr_read   <= addr_base + unsigned(VGA_h_add(10 downto 0));

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
    nrm_addr_map    <= unsigned(VGA_h_add) - 12;
    nrm_addr_final  <= std_logic_vector(nrm_addr_map(10 downto 0));
    
    process(nrm_addr_final)
    -- Invert address to fetch correct samples
    begin
        for i in nrm_addr_final'range loop
            NRM_addr(i) <= nrm_addr_final(nrm_addr_final'high-i);
        end loop;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Final pixel mapping
    --------------------------------------------------------------------------------
    VGA_din <= X"FFF";

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_push_UART_WAV
    -- Description : format enable and data to fill UART FIFO with WAV samples
    --------------------------------------------------------------------------------
    P_push_UART_WAV : process(clk_108, reset_n)
    begin
        if(reset_n='0') then
            WAV_push    <= (others => '0');
            WAV_en_push <= '0';
        elsif(rising_edge(clk_108)) then
            WAV_en_push <= VGA_read;
            if(WAV_en_push='1' and unsigned(VGA_v_add)=0) then
                WAV_push    <= '1' & dout_portB; -- Data out from WAV samples BRAM
            else
                WAV_push    <= (others => '0');
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_push_UART_FFT
    -- Description : format enable and data to fill UART FIFO with FFT samples
    --------------------------------------------------------------------------------
    P_push_UART_FFT : process(clk_108, reset_n)
    begin
        if(reset_n='0') then
            FFT_push    <= (others => '0');
            FFT_en_push <= '0';
        elsif(rising_edge(clk_108)) then
            if(unsigned(nrm_addr_final)<1024) then
                FFT_en_push <= '1';
            else
                FFT_en_push <= '0';
            end if;
            if(FFT_en_push='1' and unsigned(VGA_v_add)=0) then
                FFT_push    <= '1' & NRM_dout; -- Data out from FFT samples BRAM
            else
                FFT_push    <= (others => '0');
            end if;
        end if;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------