-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : VU_metre.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-28
-- Last update: 2019-12-20
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
        VU_din  : in  std_logic_vector((C_FIR_MAX+2)*16+15 downto 0);

        ------- VU out --------------------------
        VU_dout : out std_logic_vector((C_FIR_MAX+2)*5+4 downto 0)

        );
end VU_metre;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of VU_metre is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type accu_tab is array (C_FIR_MIN to C_FIR_MAX+2) of unsigned(27 downto 0);
    type conv_tab is array (C_FIR_MIN to C_FIR_MAX+2) of unsigned(16 downto 0);
    type VU_tab is array (C_FIR_MIN to C_FIR_MAX+2) of std_logic_vector(4 downto 0);
    type DAT_tab is array (C_FIR_MIN to C_FIR_MAX+2) of std_logic_vector(15 downto 0);
    type VU_STATE is (VU_RESET, VU_IDLE, VU_CLEAN, VU_STORE, VU_ACCU);
    type T_en is array(C_FIR_MIN to C_FIR_MAX+2) of std_logic;
    type T_level

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component VU_stage is
        port(
            clk         : in  std_logic;
            reset_n     : in  std_logic;
            VU_clr      : in  std_logic;
            VU_en       : in  std_logic;
            VU_done     : out std_logic;
            VU_write    : in  std_logic;
            VU_addr     : in  std_logic_vector(10 downto 0);
            VU_din      : in  std_logic_vector(15 downto 0);
            VU_dout     : out std_logic_vector(4 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal current_state        : VU_STATE;
    signal next_state           : VU_STATE;
    signal RAM_out              : DAT_tab;
    signal RAM_out_d            : DAT_tab;
    signal RAM_in               : DAT_tab;
    signal RAM_in_d             : DAT_tab;
    signal din_conv             : DAT_tab;
    signal accu                 : accu_tab;
    signal RAM_counter          : unsigned(10 downto 0);
    signal RAM_write            : std_logic_vector(0 downto 0);
    signal RAM_write_d          : std_logic_vector(0 downto 0);
    signal RAM_addr             : std_logic_vector(10 downto 0);
    signal RAM_addr_d           : std_logic_vector(10 downto 0);
    signal RAM_counter_clr      : unsigned(10 downto 0);
    signal cnt_clr_end          : std_logic;
    signal RAM_clr              : std_logic;
    signal conv_in              : conv_tab;
    signal conv_out             : VU_tab;
    signal VU_write             : std_logic;
    signal cnt_RAM_inc          : std_logic;
    signal diff                 : accu_tab;
    signal diff_en              : T_en;
    signal accu_en              : T_en;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_SRAM
    -- Description : Contains the 2048 last samples read
    ----------------------------------------------------------------
    GEN_RAM : for i in C_FIR_MIN to C_FIR_MAX+2 generate
        U_RAM : RAM_2048_16bit port map(
            clka    => clk,
            addra   => RAM_addr_d,
            wea     => RAM_write_d,
            ena     => '1',
            dina    => RAM_in_d(i),
            douta   => RAM_out(i));
    end generate GEN_RAM;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_RAM_reg
    -- Description : Register RAM input and outputs
    --------------------------------------------------------------------------------
    P_RAM_reg : process(clk, reset_n)
    begin
        if(rising_edge(clk)) then
            RAM_addr_d  <= RAM_addr;
            RAM_write_d <= RAM_write;
            for i in C_FIR_MIN to C_FIR_MAX+2 loop
                RAM_in_d(i)     <= RAM_in(i);
                RAM_out_d(i)    <= RAM_out(i);
            end loop;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : din_conv
    --------------------------------------------------------------------------------
    process(reset_n, clk)
    begin
        if(reset_n='0') then
            for i in C_FIR_MIN to C_FIR_MAX+2 loop
                din_conv(i)  <= (others => '0');
            end loop;
        elsif(rising_edge(clk)) then
            for i in C_FIR_MIN to C_FIR_MAX+2 loop
                if(VU_din(i*16+15)='0') then
                    din_conv(i)  <= VU_din(i*16+15 downto i*16);
                else
                    din_conv(i)  <= std_logic_vector(0 - unsigned(VU_din(i*16+15 downto i*16)));
                end if;
            end loop;
        end if;
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
            if(cnt_RAM_inc='1') then
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
    cnt_clr_end <= '1' when(RAM_counter_clr=0) else '0';
    RAM_addr    <= std_logic_vector(RAM_counter_clr) when(RAM_clr='1') else std_logic_vector(RAM_counter);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_diff
    -- Description : Compute diffence of RAM input and output
    --------------------------------------------------------------------------------
    P_diff : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in C_FIR_MIN to C_FIR_MAX+2 loop
                diff(i) <= to_unsigned(0, diff(i)'length);
            end loop;
        elsif(rising_edge(clk)) then
            for i in C_FIR_MIN to C_FIR_MAX+2 loop
                if(diff_en(i)='1') then
                    diff(i) <= resize(unsigned(din_conv(i)), diff(i)'length) - resize(unsigned(RAM_out_d(i)), diff(i)'length);
                end if;
            end loop;
        end if;
    end process;

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
            for i in C_FIR_MIN to C_FIR_MAX+2 loop
                if(accu_en(i)='1') then
                    accu(i) <= accu(i) + diff(i);
                end if;
            end loop;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_conv_in
    -- Description : Register conv_in
    --------------------------------------------------------------------------------
    P_conv_in : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in conv_in'range loop
                conv_in(i)  <= (others => '0');
            end loop;
        elsif(rising_edge(clk)) then
            for i in conv_in'range loop
                conv_in(i)  <= accu(i)(26 downto 10);
            end loop;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : VU_metre out
    --------------------------------------------------------------------------------
    process(reset_n, clk)
    begin
        if(reset_n='0') then
            for i in conv_out'range loop
                conv_out(i) <= (others => '0');
            end loop;
        elsif(rising_edge(clk)) then
            for i in conv_out'range loop
                if(conv_in(i)>65535) then
                    conv_out(i) <= std_logic_vector(to_unsigned(31, 5));
                elsif(conv_in(i)>46340) then
                    conv_out(i) <= std_logic_vector(to_unsigned(30, 5));
                elsif(conv_in(i)>32767) then
                    conv_out(i) <= std_logic_vector(to_unsigned(29, 5));
                elsif(conv_in(i)>23170) then
                    conv_out(i) <= std_logic_vector(to_unsigned(28, 5));
                elsif(conv_in(i)>16383) then
                    conv_out(i) <= std_logic_vector(to_unsigned(27, 5));
                elsif(conv_in(i)>11585) then
                    conv_out(i) <= std_logic_vector(to_unsigned(26, 5));
                elsif(conv_in(i)>8191) then
                    conv_out(i) <= std_logic_vector(to_unsigned(25, 5));
                elsif(conv_in(i)>5792) then
                    conv_out(i) <= std_logic_vector(to_unsigned(24, 5));
                elsif(conv_in(i)>4095) then
                    conv_out(i) <= std_logic_vector(to_unsigned(23, 5));
                elsif(conv_in(i)>2896) then
                    conv_out(i) <= std_logic_vector(to_unsigned(22, 5));
                elsif(conv_in(i)>2047) then
                    conv_out(i) <= std_logic_vector(to_unsigned(21, 5));
                elsif(conv_in(i)>1448) then
                    conv_out(i) <= std_logic_vector(to_unsigned(20, 5));
                elsif(conv_in(i)>1023) then
                    conv_out(i) <= std_logic_vector(to_unsigned(19, 5));
                elsif(conv_in(i)>724) then
                    conv_out(i) <= std_logic_vector(to_unsigned(18, 5));
                elsif(conv_in(i)>511) then
                    conv_out(i) <= std_logic_vector(to_unsigned(17, 5));
                elsif(conv_in(i)>362) then
                    conv_out(i) <= std_logic_vector(to_unsigned(16, 5));
                elsif(conv_in(i)>255) then
                    conv_out(i) <= std_logic_vector(to_unsigned(15, 5));
                elsif(conv_in(i)>181) then
                    conv_out(i) <= std_logic_vector(to_unsigned(14, 5));
                elsif(conv_in(i)>127) then
                    conv_out(i) <= std_logic_vector(to_unsigned(13, 5));
                elsif(conv_in(i)>90) then
                    conv_out(i) <= std_logic_vector(to_unsigned(12, 5));
                elsif(conv_in(i)>63) then
                    conv_out(i) <= std_logic_vector(to_unsigned(11, 5));
                elsif(conv_in(i)>45) then
                    conv_out(i) <= std_logic_vector(to_unsigned(10, 5));
                elsif(conv_in(i)>31) then
                    conv_out(i) <= std_logic_vector(to_unsigned(9, 5));
                elsif(conv_in(i)>22) then
                    conv_out(i) <= std_logic_vector(to_unsigned(8, 5));
                elsif(conv_in(i)>15) then
                    conv_out(i) <= std_logic_vector(to_unsigned(7, 5));
                elsif(conv_in(i)>11) then
                    conv_out(i) <= std_logic_vector(to_unsigned(6, 5));
                elsif(conv_in(i)>7) then
                    conv_out(i) <= std_logic_vector(to_unsigned(5, 5));
                elsif(conv_in(i)>5) then
                    conv_out(i) <= std_logic_vector(to_unsigned(4, 5));
                elsif(conv_in(i)>3) then
                    conv_out(i) <= std_logic_vector(to_unsigned(3, 5));
                elsif(conv_in(i)>2) then
                    conv_out(i) <= std_logic_vector(to_unsigned(2, 5));
                elsif(conv_in(i)>1) then
                    conv_out(i) <= std_logic_vector(to_unsigned(1, 5));
                else
                    conv_out(i) <= std_logic_vector(to_unsigned(0, 5));
                end if;
            end loop;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg_map
    -- Description : Register VU levels on output
    --------------------------------------------------------------------------------
    P_reg_map : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in C_FIR_MIN to C_FIR_MAX+2 loop
                VU_dout(i*5+4 downto i*5)  <= (others => '0');
            end loop;
        elsif(rising_edge(clk)) then
            for i in C_FIR_MIN to C_FIR_MAX+2 loop
                VU_dout(i*5+4 downto i*5) <= conv_out(i);
            end loop;
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
    RAM_clr     <= '0';
    RAM_write   <= "0";
    cnt_RAM_inc <= '0';
    for i in C_FIR_MIN to C_FIR_MAX+2 loop
        diff_en(i)  <= '0';
        accu_en(i)  <= '0';
    end loop;

        case current_state is
            when VU_RESET =>
                next_state  <= VU_CLEAN;

            when VU_CLEAN =>
                RAM_clr     <= '1';
                RAM_write   <= "1";
                if(cnt_clr_end='1') then
                    next_state  <= VU_IDLE;
                else
                    next_state  <= VU_CLEAN;
                end if;

            when VU_IDLE =>
                if(VU_en='1') then
                    next_state  <= VU_STORE;
                else
                    next_state  <= VU_IDLE;
                end if;

            when VU_STORE =>
                RAM_write   <= "1";
                cnt_RAM_inc <= '1';
                for i in C_FIR_MIN to C_FIR_MAX+2 loop
                    diff_en(i)  <= '1';
                end loop;
                next_state  <= VU_ACCU;

            when VU_ACCU =>
                for i in C_FIR_MIN to C_FIR_MAX+2 loop
                    accu_en(i)  <= '1';
                end loop;
                next_state  <= VU_IDLE;

        end case;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------