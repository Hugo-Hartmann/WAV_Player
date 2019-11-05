-------------------------------------------------------------------------------
--  This entire design, which includes all of the components and related files,
--  has been created and owned by : ELSYS DESIGN
--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : VU_metre.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-28
-- Last update: 2019-11-05
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
    component SRAM_2048_8bit
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
    signal SRAM_out         : DAT_tab;
    signal SRAM_in          : DAT_tab;
    signal din_conv         : DAT_tab;
    signal accu             : accu_tab;
    signal SRAM_counter     : unsigned(10 downto 0);
    signal SRAM_write       : std_logic_vector(0 downto 0);
    signal SRAM_addr        : std_logic_vector(10 downto 0);
    signal SRAM_counter_clr : unsigned(10 downto 0);
    signal cnt_clr_end      : std_logic;
    signal SRAM_clr         : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_SRAM
    -- Description : Contains the 2048 last samples read
    ----------------------------------------------------------------
    GEN_SRAM : for i in C_FIR_MIN to C_FIR_MAX+2 generate
        U_SRAM : SRAM_2048_8bit port map(
            clka    => clk,
            addra   => SRAM_addr,
            wea     => SRAM_write,
            ena     => '1',
            dina    => SRAM_in(i),
            douta   => SRAM_out(i));
    end generate GEN_SRAM;

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
    process(SRAM_clr, din_conv)
    begin
        if(SRAM_clr='1') then
            for i in C_FIR_MIN to C_FIR_MAX+2 loop
                SRAM_in(i)  <= (others => '0');
            end loop;
        else
            for i in C_FIR_MIN to C_FIR_MAX+2 loop
                SRAM_in(i)  <= din_conv(i);
            end loop;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_SRAM_counter
    -- Description : Manage SRAM address
    --------------------------------------------------------------------------------
    P_SRAM_counter : process(clk, reset_n)
    begin
        if(reset_n='0') then
            SRAM_counter <= to_unsigned(0, SRAM_counter'length);
        elsif(rising_edge(clk)) then
            if(VU_en='1' and SRAM_clr='0') then
                SRAM_counter <= SRAM_counter + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_SRAM_counter_clr
    -- Description : Manage SRAM address for clearing SRAM
    --------------------------------------------------------------------------------
    P_SRAM_counter_clr : process(clk, reset_n)
    begin
        if(reset_n='0') then
            SRAM_counter_clr <= (others => '1');
        elsif(rising_edge(clk)) then
            if(SRAM_clr='1') then
                SRAM_counter_clr <= SRAM_counter_clr - 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Write to SRAM
    --------------------------------------------------------------------------------
    SRAM_write      <= (others => VU_en OR SRAM_clr);
    SRAM_addr       <= std_logic_vector(SRAM_counter) when(SRAM_clr='0') else std_logic_vector(SRAM_counter_clr);
    cnt_clr_end     <= '1' when(SRAM_counter_clr=0) else '0';

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
            if(VU_en='1' and SRAM_clr='0') then
                for i in C_FIR_MIN to C_FIR_MAX+2 loop
                    accu(i) <= accu(i) + resize(unsigned(din_conv(i)), accu(i)'length) - resize(unsigned(SRAM_out(i)), accu(i)'length);
                end loop;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : VU_metre out
    --------------------------------------------------------------------------------
    process(accu)
    begin
        for i in C_FIR_MIN to C_FIR_MAX+2 loop
            if(accu(i)>262143) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(63, 6));
            elsif(accu(i)>240386) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(62, 6));
            elsif(accu(i)>220435) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(61, 6));
            elsif(accu(i)>202139) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(60, 6));
            elsif(accu(i)>185363) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(59, 6));
            elsif(accu(i)>169978) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(58, 6));
            elsif(accu(i)>155871) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(57, 6));
            elsif(accu(i)>142934) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(56, 6));
            elsif(accu(i)>131071) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(55, 6));
            elsif(accu(i)>120193) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(54, 6));
            elsif(accu(i)>110217) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(53, 6));
            elsif(accu(i)>101069) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(52, 6));
            elsif(accu(i)>92681) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(51, 6));
            elsif(accu(i)>84989) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(50, 6));
            elsif(accu(i)>77935) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(49, 6));
            elsif(accu(i)>71467) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(48, 6));
            elsif(accu(i)>65535) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(47, 6));
            elsif(accu(i)>60096) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(46, 6));
            elsif(accu(i)>55108) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(45, 6));
            elsif(accu(i)>50534) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(44, 6));
            elsif(accu(i)>46340) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(43, 6));
            elsif(accu(i)>42494) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(42, 6));
            elsif(accu(i)>38967) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(41, 6));
            elsif(accu(i)>35733) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(40, 6));
            elsif(accu(i)>32767) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(39, 6));
            elsif(accu(i)>30048) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(38, 6));
            elsif(accu(i)>27554) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(37, 6));
            elsif(accu(i)>25267) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(36, 6));
            elsif(accu(i)>23170) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(35, 6));
            elsif(accu(i)>21247) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(34, 6));
            elsif(accu(i)>19483) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(33, 6));
            elsif(accu(i)>17866) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(32, 6));
            elsif(accu(i)>16383) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(31, 6));
            elsif(accu(i)>15024) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(30, 6));
            elsif(accu(i)>13777) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(29, 6));
            elsif(accu(i)>12633) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(28, 6));
            elsif(accu(i)>11585) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(27, 6));
            elsif(accu(i)>10623) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(26, 6));
            elsif(accu(i)>9741) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(25, 6));
            elsif(accu(i)>8933) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(24, 6));
            elsif(accu(i)>8191) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(23, 6));
            elsif(accu(i)>7512) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(22, 6));
            elsif(accu(i)>6888) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(21, 6));
            elsif(accu(i)>6316) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(20, 6));
            elsif(accu(i)>5792) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(19, 6));
            elsif(accu(i)>5311) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(18, 6));
            elsif(accu(i)>4870) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(17, 6));
            elsif(accu(i)>4466) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(16, 6));
            elsif(accu(i)>4095) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(15, 6));
            elsif(accu(i)>3756) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(14, 6));
            elsif(accu(i)>3444) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(13, 6));
            elsif(accu(i)>3158) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(12, 6));
            elsif(accu(i)>2896) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(11, 6));
            elsif(accu(i)>2655) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(10, 6));
            elsif(accu(i)>2435) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(9, 6));
            elsif(accu(i)>2233) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(8, 6));
            elsif(accu(i)>2047) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(7, 6));
            elsif(accu(i)>1878) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(6, 6));
            elsif(accu(i)>1722) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(5, 6));
            elsif(accu(i)>1579) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(4, 6));
            elsif(accu(i)>1448) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(3, 6));
            elsif(accu(i)>1327) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(2, 6));
            elsif(accu(i)>1217) then
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(1, 6));
            else
                VU_dout(i*6+5 downto i*6)   <= std_logic_vector(to_unsigned(0, 6));
            end if;
        end loop;
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
    SRAM_clr    <= '0';

        case current_state is
            when VU_RESET =>
                next_state  <= VU_CLEAN;

            when VU_CLEAN =>
                SRAM_clr    <= '1';
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