-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FIR_interface.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-28
-- Last update: 2020-08-25
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: FIR interface for multiple FIR filters working on same data
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
entity FIR_interface is
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- FIR out --------------------------
        FIR_dout        : out std_logic_vector(C_FIR_MAX*16+15 downto 0);

        ------- FIR control ----------------------
        FIR_start       : in  std_logic;
        FIR_done        : out std_logic;

        ------- FIR in ---------------------------
        FIR_din         : in  std_logic_vector(15 downto 0)

        );
end FIR_interface;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of FIR_interface is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type FIR_tab is array (C_FIR_MIN to C_FIR_MAX) of std_logic_vector(15 downto 0);
    type FIR_STATE is (FIR_RESET, FIR_IDLE, FIR_BEGIN,
                       FIR_ACC1, FIR_ACC2, FIR_END, FIR_STORE);
    type T_done is array (C_FIR_MIN to C_FIR_MAX) of std_logic;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component FIR_filter is
        generic(
            G_SELECT        : integer := 0
            );
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            FIR_clr         : in  std_logic;
            FIR_en          : in  std_logic;
            FIR_done        : out std_logic;
            FIR_din         : in  std_logic_vector(15 downto 0);
            FIR_addr        : in  std_logic_vector(9 downto 0);
            FIR_dout        : out std_logic_vector(15 downto 0)
            );
    end component;

    component RAM_2048_16bit
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            wea     : in  std_logic_vector(0 downto 0);
            addra   : in  std_logic_vector(10 downto 0);
            dina    : in  std_logic_vector(15 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    -- FSM
    signal current_state    : FIR_STATE;
    signal next_state       : FIR_STATE;
    signal FSM_clr          : std_logic;
    signal FSM_en           : std_logic;
    signal FSM_addr_sel     : std_logic;
    signal FSM_store        : std_logic;
    signal FSM_done         : std_logic;
    signal FSM_start        : std_logic;

    -- RAM
    signal RAM_out          : std_logic_vector(15 downto 0);
    signal RAM_in           : std_logic_vector(15 downto 0);
    signal RAM_wea          : std_logic_vector(0 downto 0);
    signal RAM_write        : std_logic;
    signal RAM_enable       : std_logic;
    signal RAM_read         : std_logic;
    signal RAM_addr         : std_logic_vector(10 downto 0);

    -- Counter coef
    signal cnt_coef         : unsigned(9 downto 0);
    signal cnt_coef_clr     : std_logic;
    signal cnt_coef_dec     : std_logic;
    signal cnt_coef_inc     : std_logic;
    signal cnt_coef_end     : std_logic;
    signal cnt_coef_zero    : std_logic;

    -- Counter data
    signal cnt_wr           : unsigned(10 downto 0);
    signal cnt_rd           : unsigned(10 downto 0);
    signal cnt_rd_load      : std_logic;
    signal cnt_rd_inc       : std_logic;

    -- Instances
    signal FIR_out_tab      : FIR_tab;
    signal FIR_done_tab     : T_done;
    signal FIR_addr         : std_logic_vector(9 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_START
    -- Description : Register Start signal
    --------------------------------------------------------------------------------
    P_START : process(clk, reset_n)
    begin
        if(reset_n='0') then
            FSM_start   <= '0';
        elsif(rising_edge(clk)) then
            FSM_start   <= FIR_start;
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM
    -- Description : Contains the 2048 last samples read
    ----------------------------------------------------------------
    U_RAM : RAM_2048_16bit port map(
        clka    => clk,
        addra   => RAM_addr,
        wea     => RAM_wea,
        ena     => RAM_enable,
        dina    => RAM_in,
        douta   => RAM_out);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_RAM
    -- Description : Register RAM inputs
    --------------------------------------------------------------------------------
    P_RAM : process(clk)
    begin
        if(rising_edge(clk)) then
            if(FSM_addr_sel='0') then
                RAM_addr    <= std_logic_vector(cnt_wr);
            else
                RAM_addr    <= std_logic_vector(cnt_rd);
            end if;
            RAM_wea     <= (0 downto 0 => RAM_write);
            RAM_enable  <= RAM_read or RAM_write;
            RAM_in      <= FIR_din;
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_FIR_filter
    -- Description : 2047-tap FIR filter
    --               16-bit coefficients, 8-bit data
    ----------------------------------------------------------------
    GEN_FILTER : for i in C_FIR_MIN to C_FIR_MAX generate
        U_FIR_filter : FIR_filter generic map(
            G_SELECT        => i)
        port map(
            clk         => clk,
            reset_n     => reset_n,
            FIR_clr     => FSM_clr,
            FIR_en      => FSM_en,
            FIR_done    => FIR_done_tab(i),
            FIR_din     => RAM_out,
            FIR_addr    => FIR_addr,
            FIR_dout    => FIR_out_tab(i));
    end generate GEN_FILTER;

    --------------------------------------------------------------------------------
    -- COMBINATORY : 
    -- Description : FSM_done
    --------------------------------------------------------------------------------
    FSM_done    <= FIR_done_tab(0);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_cnt_wr
    -- Description : Manage RAM write address
    --------------------------------------------------------------------------------
    P_cnt_wr : process(clk, reset_n)
    begin
        if(reset_n='0') then
            cnt_wr  <= to_unsigned(0, cnt_wr'length);
        elsif(rising_edge(clk)) then
            if(FSM_start='1') then
                cnt_wr  <= cnt_wr + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_cnt_rd
    -- Description : Manage RAM read address
    --------------------------------------------------------------------------------
    P_cnt_rd : process(clk, reset_n)
    begin
        if(reset_n='0') then
            cnt_rd  <= to_unsigned(0, cnt_rd'length);
        elsif(rising_edge(clk)) then
            if(cnt_rd_load='1') then
                cnt_rd  <= cnt_wr + 3;
            elsif(cnt_rd_inc='1') then
                cnt_rd  <= cnt_rd + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_cnt_coef
    -- Description : Manage counter for coefficient addressing
    --------------------------------------------------------------------------------
    P_cnt_coef : process(clk, reset_n)
    begin
        if(reset_n='0') then
            cnt_coef    <= to_unsigned(0, cnt_coef'length);
        elsif(rising_edge(clk)) then
            if(cnt_coef_clr='1') then
                cnt_coef    <= to_unsigned(0, cnt_coef'length);
            elsif(cnt_coef_dec='1') then
                cnt_coef    <= cnt_coef - 1;
            elsif(cnt_coef_inc='1') then
                cnt_coef    <= cnt_coef + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : coef counter control signals
    --------------------------------------------------------------------------------
    cnt_coef_end    <= '1' when(cnt_coef=1022) else '0';
    cnt_coef_zero   <= '1' when(cnt_coef=0) else '0';
    FIR_addr        <= std_logic_vector(cnt_coef);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_FSM_FIR_sync
    -- Description : FSM_FIR sequential part (current_state logic)
    --------------------------------------------------------------------------------
    P_FSM_FIR_sync : process(clk, reset_n)
    begin
        if(reset_n='0') then
            current_state   <= FIR_RESET;
        elsif(rising_edge(clk)) then
            current_state   <= next_state;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMB PROCESS : P_FSM_FIR_comb
    -- Description : FSM_FIR combinatorial part (next_state logic)
    --------------------------------------------------------------------------------
    P_FSM_FIR_comb : process(current_state, cnt_coef_zero, cnt_coef_end, FSM_start, FSM_done)
    begin
        cnt_coef_clr    <= '0';
        cnt_coef_inc    <= '0';
        cnt_coef_dec    <= '0';
        cnt_rd_load     <= '0';
        cnt_rd_inc      <= '0';
        FSM_addr_sel    <= '0';
        FSM_en          <= '0';
        FSM_clr         <= '0';
        RAM_read        <= '0';
        FSM_store       <= '0';
        RAM_write       <= '0';

        case current_state is
            when FIR_RESET =>
                next_state  <= FIR_IDLE;

            when FIR_IDLE =>
                cnt_rd_load     <= '1';
                cnt_coef_clr    <= '1';
                if(FSM_start='1') then
                    next_state  <= FIR_BEGIN;
                else
                    next_state  <= FIR_IDLE;
                end if;

            when FIR_BEGIN =>
                RAM_write       <= '1';
                FSM_clr         <= '1';
                next_state      <= FIR_ACC1;

            when FIR_ACC1 =>
                RAM_read        <= '1';
                cnt_coef_inc    <= '1';
                cnt_rd_inc      <= '1';
                FSM_addr_sel    <= '1';
                FSM_en          <= '1';
                if(cnt_coef_end='1') then
                    next_state  <= FIR_ACC2;
                else
                    next_state  <= FIR_ACC1;
                end if;

            when FIR_ACC2 =>
                RAM_read        <= '1';
                cnt_coef_dec    <= '1';
                cnt_rd_inc      <= '1';
                FSM_addr_sel    <= '1';
                FSM_en          <= '1';
                if(cnt_coef_zero='1') then
                    next_state  <= FIR_END;
                else
                    next_state  <= FIR_ACC2;
                end if;

            when FIR_END =>
                if(FSM_done='1') then
                    next_state      <= FIR_END;
                else
                    next_state      <= FIR_STORE;
                end if;

            when FIR_STORE =>
                FSM_store   <= '1';
                next_state  <= FIR_IDLE;

        end case;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_dout
    -- Description : Register dout
    --------------------------------------------------------------------------------
    P_dout : process(clk, reset_n)
    begin
        if(reset_n='0') then
            FIR_dout    <= (others => '0');
        elsif(rising_edge(clk)) then
            if(FSM_store='1') then
                for i in C_FIR_MIN to C_FIR_MAX loop
                    FIR_dout(i*16+15 downto i*16) <= FIR_out_tab(i);
                end loop;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : FIR_done
    --------------------------------------------------------------------------------
    FIR_done    <= FSM_store;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------