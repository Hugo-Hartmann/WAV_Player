-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : VU_metre.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-28
-- Last update: 2019-12-03
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 2048 element VU-metre
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-10-28  1.0      Hugo HARTMANN   Creation
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
entity VU_metre is
    port(
    
        ------- Clock and RESET ------------------
        clk     : in  std_logic;                        -- clock
        reset_n : in  std_logic;                        -- reset_n

        ------- VU control ----------------------
        VU_en   : in  std_logic;

        ------- VU in ---------------------------
        VU_din  : in  std_logic_vector((C_FIR_MAX+2)*8+7 downto 0);

        ------- VU out --------------------------
        VU_dout : out std_logic_vector((C_FIR_MAX+2)*6+5 downto 0)

        );
end VU_metre;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of VU_metre is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type accu_tab is array (C_FIR_MIN to C_FIR_MAX+2) of unsigned(19 downto 0);
    type VU_tab is array (C_FIR_MIN to C_FIR_MAX+2) of std_logic_vector(5 downto 0);
    type DAT_tab is array (C_FIR_MIN to C_FIR_MAX+2) of std_logic_vector(7 downto 0);
    type VU_STATE is (VU_RESET, VU_IDLE, VU_CLEAN);

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component RAM_2048_8bit
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            wea     : in  std_logic_vector(0 downto 0);
            addra   : in  std_logic_vector(10 downto 0);
            dina    : in  std_logic_vector(7 downto 0);
            douta   : out std_logic_vector(7 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal current_state    : VU_STATE;
    signal next_state       : VU_STATE;
    signal RAM_out          : DAT_tab;
    signal RAM_in           : DAT_tab;
    signal din_conv         : DAT_tab;
    signal accu             : accu_tab;
    signal RAM_counter      : unsigned(10 downto 0);
    signal RAM_write        : std_logic_vector(0 downto 0);
    signal RAM_addr         : std_logic_vector(10 downto 0);
    signal RAM_counter_clr  : unsigned(10 downto 0);
    signal cnt_clr_end      : std_logic;
    signal RAM_clr          : std_logic;
    signal counter_select   : unsigned(3 downto 0);
    signal counter_select_d : unsigned(3 downto 0);
    signal cnt_select_clr   : std_logic;
    signal conv_in          : unsigned(19 downto 0);
    signal conv_out         : std_logic_vector(5 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_SRAM
    -- Description : Contains the 2048 last samples read
    ----------------------------------------------------------------
    GEN_RAM : for i in C_FIR_MIN to C_FIR_MAX+2 generate
        U_RAM : RAM_2048_8bit port map(
            clka    => clk,
            addra   => RAM_addr,
            wea     => RAM_write,
            ena     => '1',
            dina    => RAM_in(i),
            douta   => RAM_out(i));
    end generate GEN_RAM;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : din_conv
    --------------------------------------------------------------------------------
    process(VU_din)
    begin
        for i in C_FIR_MIN to C_FIR_MAX+2 loop
            if(unsigned(VU_din(i*8+7 downto i*8))>128) then
                din_conv(i)  <= std_logic_vector(unsigned(VU_din(i*8+7 downto i*8)) - 128);
            else
                din_conv(i)  <= std_logic_vector(128 - unsigned(VU_din(i*8+7 downto i*8)));
            end if;
        end loop;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : SRAM_in
    --------------------------------------------------------------------------------
    process(RAM_clr, din_conv)
    begin
        if(RAM_clr='1') then
            for i in C_FIR_MIN to C_FIR_MAX+2 loop
                RAM_in(i)   <= (others => '0');
            end loop;
        else
            for i in C_FIR_MIN to C_FIR_MAX+2 loop
                RAM_in(i)   <= din_conv(i);
            end loop;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_RAM_counter
    -- Description : Manage RAM address
    --------------------------------------------------------------------------------
    P_RAM_counter : process(clk, reset_n)
    begin
        if(reset_n='0') then
            RAM_counter  <= to_unsigned(0, RAM_counter'length);
        elsif(rising_edge(clk)) then
            if(VU_en='1' and RAM_clr='0') then
                RAM_counter  <= RAM_counter + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_RAM_counter_clr
    -- Description : Manage RAM address for clearing RAM
    --------------------------------------------------------------------------------
    P_RAM_counter_clr : process(clk, reset_n)
    begin
        if(reset_n='0') then
            RAM_counter_clr  <= (others => '1');
        elsif(rising_edge(clk)) then
            if(RAM_clr='1') then
                RAM_counter_clr  <= RAM_counter_clr - 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Write to RAM
    --------------------------------------------------------------------------------
    RAM_write       <= (others => VU_en OR RAM_clr);
    RAM_addr        <= std_logic_vector(RAM_counter) when(RAM_clr='0') else std_logic_vector(RAM_counter_clr);
    cnt_clr_end     <= '1' when(RAM_counter_clr=0) else '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_Accu
    -- Description : Accumulator for averaging
    --------------------------------------------------------------------------------
    P_Accu : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in C_FIR_MIN to C_FIR_MAX+2 loop
                accu(i) <= to_unsigned(0, accu(i)'length);
            end loop;
        elsif(rising_edge(clk)) then
            if(VU_en='1' and RAM_clr='0') then
                for i in C_FIR_MIN to C_FIR_MAX+2 loop
                    accu(i) <= accu(i) + resize(unsigned(din_conv(i)), accu(i)'length) - resize(unsigned(RAM_out(i)), accu(i)'length);
                end loop;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter_select
    -- Description : Create rotation for VU-level mapping hardware
    --------------------------------------------------------------------------------
    P_counter_select : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter_select      <= to_unsigned(0, counter_select'length);
            counter_select_d    <= to_unsigned(0, counter_select_d'length);
        elsif(rising_edge(clk)) then

            counter_select_d    <= counter_select;

            if(cnt_select_clr='1') then
                counter_select  <= to_unsigned(0, counter_select'length);
            else
                counter_select  <= counter_select + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : cnt_select_clr
    --------------------------------------------------------------------------------
    cnt_select_clr  <= '1' when(counter_select=C_FIR_MAX+2) else '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_conv_in
    -- Description : Register conv_in
    --------------------------------------------------------------------------------
    P_conv_in : process(clk, reset_n)
    begin
        if(reset_n='0') then
            conv_in <= (others => '0');
        elsif(rising_edge(clk)) then
            conv_in <= accu(to_integer(counter_select));
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : VU_metre out
    --------------------------------------------------------------------------------
    process(conv_in)
    begin
        for i in C_FIR_MIN to C_FIR_MAX+2 loop
            if(conv_in>262143) then
                conv_out    <= std_logic_vector(to_unsigned(63, 6));
            elsif(conv_in>240386) then
                conv_out    <= std_logic_vector(to_unsigned(62, 6));
            elsif(conv_in>220435) then
                conv_out    <= std_logic_vector(to_unsigned(61, 6));
            elsif(conv_in>202139) then
                conv_out    <= std_logic_vector(to_unsigned(60, 6));
            elsif(conv_in>185363) then
                conv_out    <= std_logic_vector(to_unsigned(59, 6));
            elsif(conv_in>169978) then
                conv_out    <= std_logic_vector(to_unsigned(58, 6));
            elsif(conv_in>155871) then
                conv_out    <= std_logic_vector(to_unsigned(57, 6));
            elsif(conv_in>142934) then
                conv_out    <= std_logic_vector(to_unsigned(56, 6));
            elsif(conv_in>131071) then
                conv_out    <= std_logic_vector(to_unsigned(55, 6));
            elsif(conv_in>120193) then
                conv_out    <= std_logic_vector(to_unsigned(54, 6));
            elsif(conv_in>110217) then
                conv_out    <= std_logic_vector(to_unsigned(53, 6));
            elsif(conv_in>101069) then
                conv_out    <= std_logic_vector(to_unsigned(52, 6));
            elsif(conv_in>92681) then
                conv_out    <= std_logic_vector(to_unsigned(51, 6));
            elsif(conv_in>84989) then
                conv_out    <= std_logic_vector(to_unsigned(50, 6));
            elsif(conv_in>77935) then
                conv_out    <= std_logic_vector(to_unsigned(49, 6));
            elsif(conv_in>71467) then
                conv_out    <= std_logic_vector(to_unsigned(48, 6));
            elsif(conv_in>65535) then
                conv_out    <= std_logic_vector(to_unsigned(47, 6));
            elsif(conv_in>60096) then
                conv_out    <= std_logic_vector(to_unsigned(46, 6));
            elsif(conv_in>55108) then
                conv_out    <= std_logic_vector(to_unsigned(45, 6));
            elsif(conv_in>50534) then
                conv_out    <= std_logic_vector(to_unsigned(44, 6));
            elsif(conv_in>46340) then
                conv_out    <= std_logic_vector(to_unsigned(43, 6));
            elsif(conv_in>42494) then
                conv_out    <= std_logic_vector(to_unsigned(42, 6));
            elsif(conv_in>38967) then
                conv_out    <= std_logic_vector(to_unsigned(41, 6));
            elsif(conv_in>35733) then
                conv_out    <= std_logic_vector(to_unsigned(40, 6));
            elsif(conv_in>32767) then
                conv_out    <= std_logic_vector(to_unsigned(39, 6));
            elsif(conv_in>30048) then
                conv_out    <= std_logic_vector(to_unsigned(38, 6));
            elsif(conv_in>27554) then
                conv_out    <= std_logic_vector(to_unsigned(37, 6));
            elsif(conv_in>25267) then
                conv_out    <= std_logic_vector(to_unsigned(36, 6));
            elsif(conv_in>23170) then
                conv_out    <= std_logic_vector(to_unsigned(35, 6));
            elsif(conv_in>21247) then
                conv_out    <= std_logic_vector(to_unsigned(34, 6));
            elsif(conv_in>19483) then
                conv_out    <= std_logic_vector(to_unsigned(33, 6));
            elsif(conv_in>17866) then
                conv_out    <= std_logic_vector(to_unsigned(32, 6));
            elsif(conv_in>16383) then
                conv_out    <= std_logic_vector(to_unsigned(31, 6));
            elsif(conv_in>15024) then
                conv_out    <= std_logic_vector(to_unsigned(30, 6));
            elsif(conv_in>13777) then
                conv_out    <= std_logic_vector(to_unsigned(29, 6));
            elsif(conv_in>12633) then
                conv_out    <= std_logic_vector(to_unsigned(28, 6));
            elsif(conv_in>11585) then
                conv_out    <= std_logic_vector(to_unsigned(27, 6));
            elsif(conv_in>10623) then
                conv_out    <= std_logic_vector(to_unsigned(26, 6));
            elsif(conv_in>9741) then
                conv_out    <= std_logic_vector(to_unsigned(25, 6));
            elsif(conv_in>8933) then
                conv_out    <= std_logic_vector(to_unsigned(24, 6));
            elsif(conv_in>8191) then
                conv_out    <= std_logic_vector(to_unsigned(23, 6));
            elsif(conv_in>7512) then
                conv_out    <= std_logic_vector(to_unsigned(22, 6));
            elsif(conv_in>6888) then
                conv_out    <= std_logic_vector(to_unsigned(21, 6));
            elsif(conv_in>6316) then
                conv_out    <= std_logic_vector(to_unsigned(20, 6));
            elsif(conv_in>5792) then
                conv_out    <= std_logic_vector(to_unsigned(19, 6));
            elsif(conv_in>5311) then
                conv_out    <= std_logic_vector(to_unsigned(18, 6));
            elsif(conv_in>4870) then
                conv_out    <= std_logic_vector(to_unsigned(17, 6));
            elsif(conv_in>4466) then
                conv_out    <= std_logic_vector(to_unsigned(16, 6));
            elsif(conv_in>4095) then
                conv_out    <= std_logic_vector(to_unsigned(15, 6));
            elsif(conv_in>3756) then
                conv_out    <= std_logic_vector(to_unsigned(14, 6));
            elsif(conv_in>3444) then
                conv_out    <= std_logic_vector(to_unsigned(13, 6));
            elsif(conv_in>3158) then
                conv_out    <= std_logic_vector(to_unsigned(12, 6));
            elsif(conv_in>2896) then
                conv_out    <= std_logic_vector(to_unsigned(11, 6));
            elsif(conv_in>2655) then
                conv_out    <= std_logic_vector(to_unsigned(10, 6));
            elsif(conv_in>2435) then
                conv_out    <= std_logic_vector(to_unsigned(9, 6));
            elsif(conv_in>2233) then
                conv_out    <= std_logic_vector(to_unsigned(8, 6));
            elsif(conv_in>2047) then
                conv_out    <= std_logic_vector(to_unsigned(7, 6));
            elsif(conv_in>1878) then
                conv_out    <= std_logic_vector(to_unsigned(6, 6));
            elsif(conv_in>1722) then
                conv_out    <= std_logic_vector(to_unsigned(5, 6));
            elsif(conv_in>1579) then
                conv_out    <= std_logic_vector(to_unsigned(4, 6));
            elsif(conv_in>1448) then
                conv_out    <= std_logic_vector(to_unsigned(3, 6));
            elsif(conv_in>1327) then
                conv_out    <= std_logic_vector(to_unsigned(2, 6));
            elsif(conv_in>1217) then
                conv_out    <= std_logic_vector(to_unsigned(1, 6));
            else
                conv_out    <= std_logic_vector(to_unsigned(0, 6));
            end if;
        end loop;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg_map
    -- Description : Register VU levels on output
    --------------------------------------------------------------------------------
    P_reg_map : process(clk, reset_n, counter_select_d)
    
    variable index : integer := 0;
    
    begin
    
        index   := to_integer(counter_select_d);
    
        if(reset_n='0') then
            for i in C_FIR_MIN to C_FIR_MAX+2 loop
                VU_dout(i*6+5 downto i*6)  <= (others => '0');
            end loop;
        elsif(rising_edge(clk)) then
            VU_dout(index*6+5 downto index*6) <= conv_out;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_FSM_VU_sync
    -- Description : FSM_VU sequential part (current_state logic)
    --------------------------------------------------------------------------------
    P_FSM_VU_sync : process(clk, reset_n)
    begin
        if(reset_n='0') then
            current_state   <= VU_RESET;
        elsif(rising_edge(clk)) then
            current_state   <= next_state;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMB PROCESS : P_FSM_VU_comb
    -- Description : FSM_VU combinatorial part (next_state logic)
    --------------------------------------------------------------------------------
    P_FSM_VU_comb : process(current_state, cnt_clr_end)
    begin
    RAM_clr <= '0';

        case current_state is
            when VU_RESET =>
                next_state  <= VU_CLEAN;

            when VU_CLEAN =>
                RAM_clr <= '1';
                if(cnt_clr_end='1') then
                    next_state  <= VU_IDLE;
                else
                    next_state  <= VU_CLEAN;
                end if;

            when VU_IDLE =>
                next_state  <= VU_IDLE;

        end case;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------