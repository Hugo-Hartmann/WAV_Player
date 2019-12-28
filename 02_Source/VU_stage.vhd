-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : VU_stage.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-12-20
-- Last update: 2019-12-28
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 2048 element VU-metre
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-12-20  1.0      Hugo HARTMANN   Creation
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
entity VU_stage is
    port(
    
        ------- Clock and RESET ------------------
        clk         : in  std_logic;                        -- clock
        reset_n     : in  std_logic;                        -- reset_n

        ------- VU control ----------------------
        VU_clr      : in  std_logic;
        VU_en       : in  std_logic;
        VU_done     : out std_logic;
        VU_write    : in  std_logic;
        VU_addr     : in  std_logic_vector(11 downto 0);

        ------- VU in ---------------------------
        VU_din      : in  std_logic_vector(15 downto 0);

        ------- VU out --------------------------
        VU_dout     : out std_logic_vector(4 downto 0)

        );
end VU_stage;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of VU_stage is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type T_ENABLE is array(0 to 5) of std_logic;
    type T_LEVEL is array(0 to 31) of std_logic;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component RAM_4096_16bit
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            wea     : in  std_logic_vector(0 downto 0);
            addra   : in  std_logic_vector(11 downto 0);
            dina    : in  std_logic_vector(15 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component Accu_u27
        port(
            b       : in  std_logic_vector(15 downto 0);
            clk     : in  std_logic;
            ce      : in  std_logic;
            sclr    : in  std_logic;
            q       : out std_logic_vector(26 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal RAM_in       : std_logic_vector(15 downto 0);
    signal RAM_out      : std_logic_vector(15 downto 0);
    signal RAM_write    : std_logic_vector(0 downto 0);
    signal RAM_addr     : std_logic_vector(11 downto 0);
    signal VU_en_d      : T_ENABLE;
    signal VU_level     : T_LEVEL;
    signal VU_din_map   : std_logic_vector(15 downto 0);
    signal accu_din     : std_logic_vector(15 downto 0);
    signal accu         : std_logic_vector(26 downto 0);
    signal accu_sat     : std_logic_vector(9 downto 0);
    signal accu_map     : unsigned(9 downto 0);


--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM
    -- Description : Contains the 4096 last samples read
    ----------------------------------------------------------------
    U_RAM : RAM_4096_16bit port map(
        clka    => clk,
        addra   => RAM_addr,
        wea     => RAM_write,
        ena     => '1',
        dina    => RAM_in,
        douta   => RAM_out);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : VU_din_map
    --------------------------------------------------------------------------------
    VU_din_map  <= VU_din when(VU_din(VU_din'high)='0') else (NOT VU_din);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_delay_RAM
    -- Description : Register delay
    --------------------------------------------------------------------------------
    P_delay_RAM : process(clk, reset_n)
    begin
        if(reset_n='0') then
            VU_en_d(0)  <= '0';
            VU_en_d(1)  <= '0';
        elsif(rising_edge(clk)) then
            VU_en_d(0)  <= VU_en;
            VU_en_d(1)  <= VU_en_d(0);
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_RAM
    -- Description : Register RAM signals
    --------------------------------------------------------------------------------
    P_RAM : process(clk, reset_n)
    begin
        if(rising_edge(clk)) then
            RAM_addr    <= VU_addr;
            RAM_write   <= (0 downto 0 => VU_write);
            RAM_in      <= VU_din_map;
            Accu_din    <= RAM_out;
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_Accu
    -- Description : 27 bit accumulator
    ----------------------------------------------------------------
    U_Accu : Accu_u27 port map(
        clk     => clk,
        b       => Accu_din,
        ce      => VU_en_d(1) OR VU_en_d(2),
        sclr    => VU_clr,
        q       => accu);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_delay_accu
    -- Description : Register delay
    --------------------------------------------------------------------------------
    P_delay_accu : process(clk, reset_n)
    begin
        if(reset_n='0') then
            VU_en_d(2)  <= '0';
            VU_en_d(3)  <= '0';
        elsif(rising_edge(clk)) then
            VU_en_d(2)  <= VU_en_d(1);
            VU_en_d(3)  <= VU_en_d(2);
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_sat
    -- Description : Saturation
    --------------------------------------------------------------------------------
    P_sat : process(clk, reset_n)
    begin
        if(reset_n='0') then
            VU_en_d(4)  <= '0';
            accu_sat    <= (others => '0');
        elsif(rising_edge(clk)) then
            if(accu(26)='0') then
                accu_sat    <= accu(25 downto 16);
            else
                accu_sat    <= std_logic_vector(to_unsigned(1023, accu_sat'length));
            end if;

            VU_en_d(4)  <= VU_en_d(3);
        end if;
    end process;

    accu_map    <= unsigned(accu_sat);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : VU_level
    --------------------------------------------------------------------------------
    process(reset_n, clk)
    begin
        if(reset_n='0') then
            VU_en_d(5)  <= '0';
            for i in VU_level'range loop
                VU_level(i) <= '0';
            end loop;
        elsif(rising_edge(clk)) then
            for i in VU_level'range loop
                VU_level(i) <= '0';
            end loop;

            VU_en_d(5)  <= VU_en_d(4);

            if(accu_map=1023) then
                VU_level(31) <= '1';
            elsif(accu_map>861) then
                VU_level(30) <= '1';
            elsif(accu_map>724) then
                VU_level(29) <= '1';
            elsif(accu_map>608) then
                VU_level(28) <= '1';
            elsif(accu_map>512) then
                VU_level(27) <= '1';
            elsif(accu_map>430) then
                VU_level(26) <= '1';
            elsif(accu_map>362) then
                VU_level(25) <= '1';
            elsif(accu_map>304) then
                VU_level(24) <= '1';
            elsif(accu_map>256) then
                VU_level(23) <= '1';
            elsif(accu_map>215) then
                VU_level(22) <= '1';
            elsif(accu_map>181) then
                VU_level(21) <= '1';
            elsif(accu_map>152) then
                VU_level(20) <= '1';
            elsif(accu_map>128) then
                VU_level(19) <= '1';
            elsif(accu_map>107) then
                VU_level(18) <= '1';
            elsif(accu_map>90) then
                VU_level(17) <= '1';
            elsif(accu_map>76) then
                VU_level(16) <= '1';
            elsif(accu_map>64) then
                VU_level(15) <= '1';
            elsif(accu_map>53) then
                VU_level(14) <= '1';
            elsif(accu_map>45) then
                VU_level(13) <= '1';
            elsif(accu_map>38) then
                VU_level(12) <= '1';
            elsif(accu_map>32) then
                VU_level(11) <= '1';
            elsif(accu_map>26) then
                VU_level(10) <= '1';
            elsif(accu_map>22) then
                VU_level(9) <= '1';
            elsif(accu_map>19) then
                VU_level(8) <= '1';
            elsif(accu_map>16) then
                VU_level(7) <= '1';
            elsif(accu_map>13) then
                VU_level(6) <= '1';
            elsif(accu_map>11) then
                VU_level(5) <= '1';
            elsif(accu_map>9) then
                VU_level(4) <= '1';
            elsif(accu_map>8) then
                VU_level(3) <= '1';
            elsif(accu_map>6) then
                VU_level(2) <= '1';
            elsif(accu_map>5) then
                VU_level(1) <= '1';
            else
                VU_level(0) <= '1';
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg_map
    -- Description : Register VU levels on output
    --------------------------------------------------------------------------------
    P_reg_map : process(clk, reset_n)
    begin
        if(reset_n='0') then
            VU_dout <= (others => '0');
            VU_done <= '0';
        elsif(rising_edge(clk)) then
            VU_dout <= (others => '0');

            for i in VU_level'range loop
                if(VU_level(i)='1') then
                    VU_dout <= std_logic_vector(to_unsigned(i, VU_dout'length));
                end if;
            end loop;

            VU_done <= VU_en_d(5);
        end if;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------