-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FIR_interface.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-28
-- Last update: 2019-12-20
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
    generic(
        G_BEHAVIOURAL   : boolean := false
        );
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- FIR out --------------------------
        FIR_dout        : out std_logic_vector(C_FIR_MAX*16+15 downto 0);

        ------- FIR control ----------------------
        FIR_start       : in  std_logic;

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
    type FIR_STATE is (FIR_RESET, FIR_IDLE, FIR_BEGIN, FIR_LOAD, FIR_PIPE,
                       FIR_ACC1, FIR_ACC2, FIR_END, FIR_STORE);
    type T_done is array (C_FIR_MIN to C_FIR_MAX) of std_logic;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component FIR_filter is
        generic(
            G_BEHAVIOURAL   : boolean := false;
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
    signal current_state    : FIR_STATE;
    signal next_state       : FIR_STATE;
    signal RAM_out          : std_logic_vector(15 downto 0);
    signal RAM_wea          : std_logic_vector(0 downto 0);
    signal RAM_write        : std_logic;
    signal RAM_enable       : std_logic;
    signal RAM_read         : std_logic;
    signal RAM_addr         : std_logic_vector(10 downto 0);
    signal RAM_addr_rd      : std_logic_vector(10 downto 0);
    signal RAM_addr_wr      : std_logic_vector(10 downto 0);
    signal FIR_clr          : std_logic;
    signal FIR_en           : std_logic;
    signal RAM_counter_wr   : unsigned(10 downto 0);
    signal RAM_counter_rd   : unsigned(10 downto 0);
    signal cnt_rd_load      : std_logic;
    signal cnt_rd_dec       : std_logic;
    signal coef_counter     : unsigned(9 downto 0);
    signal cnt_coef_clr     : std_logic;
    signal cnt_coef_dec     : std_logic;
    signal cnt_coef_inc     : std_logic;
    signal cnt_coef_end     : std_logic;
    signal cnt_coef_zero    : std_logic;
    signal FIR_addr         : std_logic_vector(9 downto 0);
    signal addr_select      : std_logic;
    signal dout_store       : std_logic;
    signal FIR_out_tab      : FIR_tab;
    signal FIR_done_tab     : T_done;
    signal FIR_done         : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM
    -- Description : Contains the 2048 last samples read
    ----------------------------------------------------------------
    RAM : if G_BEHAVIOURAL=false generate
        U_RAM : RAM_2048_16bit port map(
            clka    => clk,
            addra   => RAM_addr,
            wea     => RAM_wea,
            ena     => RAM_enable,
            dina    => FIR_din,
            douta   => RAM_out);
    end generate;

    ----------------------------------------------------------------
    -- INSTANCE : U_FIR_filter
    -- Description : 2047-tap FIR filter
    --               16-bit coefficients, 8-bit data
    ----------------------------------------------------------------
    GEN_FILTER : for i in C_FIR_MIN to C_FIR_MAX generate
        U_FIR_filter : FIR_filter generic map(
            G_BEHAVIOURAL   => G_BEHAVIOURAL,
            G_SELECT        => i)
        port map(
            clk         => clk,
            reset_n     => reset_n,
            FIR_clr     => FIR_clr,
            FIR_en      => FIR_en,
            FIR_done    => FIR_done_tab(i),
            FIR_din     => RAM_out,
            FIR_addr    => FIR_addr,
            FIR_dout    => FIR_out_tab(i));
    end generate GEN_FILTER;

    --------------------------------------------------------------------------------
    -- COMBINATORY : 
    -- Description : FIR_done
    --------------------------------------------------------------------------------
    FIR_done    <= FIR_done_tab(0);

    --------------------------------------------------------------------------------
    -- COMBINATORY : 
    -- Description : Address selection for RAM
    --------------------------------------------------------------------------------
    RAM_addr    <= RAM_addr_wr when(addr_select='0') else RAM_addr_rd;
    RAM_enable  <= RAM_read or RAM_write;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_RAM_counter_wr
    -- Description : Manage RAM write address
    --------------------------------------------------------------------------------
    P_RAM_counter_wr : process(clk, reset_n)
    begin
        if(reset_n='0') then
            RAM_counter_wr <= to_unsigned(0, RAM_counter_wr'length);
        elsif(rising_edge(clk)) then
            if(FIR_start='1') then
                RAM_counter_wr <= RAM_counter_wr + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Write to RAM
    --------------------------------------------------------------------------------
    RAM_wea     <= (0 downto 0 => RAM_write);
    RAM_addr_wr <= std_logic_vector(RAM_counter_wr);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_RAM_counter_rd
    -- Description : Manage RAM read address
    --------------------------------------------------------------------------------
    P_RAM_counter_rd : process(clk, reset_n)
    begin
        if(reset_n='0') then
            RAM_counter_rd  <= to_unsigned(0, RAM_counter_rd'length);
        elsif(rising_edge(clk)) then
            if(cnt_rd_load='1') then
                RAM_counter_rd  <= RAM_counter_wr - 1;
            elsif(cnt_rd_dec='1') then
                RAM_counter_rd  <= RAM_counter_rd - 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Read from RAM
    --------------------------------------------------------------------------------
    RAM_addr_rd <= std_logic_vector(RAM_counter_rd);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_coef_counter
    -- Description : Manage counter for coefficient addressing
    --------------------------------------------------------------------------------
    P_coef_counter : process(clk, reset_n)
    begin
        if(reset_n='0') then
            coef_counter <= to_unsigned(0, coef_counter'length);
        elsif(rising_edge(clk)) then
            if(cnt_coef_clr='1') then
                coef_counter <= to_unsigned(0, coef_counter'length);
            elsif(cnt_coef_dec='1') then
                coef_counter <= coef_counter - 1;
            elsif(cnt_coef_inc='1') then
                coef_counter <= coef_counter + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : coef counter control signals
    --------------------------------------------------------------------------------
    cnt_coef_end    <= '1' when(coef_counter=1022) else '0';
    cnt_coef_zero   <= '1' when(coef_counter=0) else '0';
    FIR_addr        <= std_logic_vector(coef_counter);

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
    P_FSM_FIR_comb : process(current_state, cnt_coef_zero, cnt_coef_end, FIR_start, FIR_done)
    begin
        cnt_coef_clr    <= '0';
        cnt_coef_inc    <= '0';
        cnt_coef_dec    <= '0';
        cnt_rd_load     <= '0';
        cnt_rd_dec      <= '0';
        addr_select     <= '0';
        FIR_en          <= '0';
        FIR_clr         <= '0';
        RAM_read        <= '0';
        dout_store      <= '0';
        RAM_write       <= '0';

        case current_state is
            when FIR_RESET =>
                next_state  <= FIR_IDLE;

            when FIR_IDLE =>
                if(FIR_start='1') then
                    next_state  <= FIR_BEGIN;
                else
                    next_state  <= FIR_IDLE;
                end if;

            when FIR_BEGIN =>
                RAM_write       <= '1';
                FIR_clr         <= '1';
                cnt_rd_load     <= '1';
                cnt_coef_clr    <= '1';
                next_state      <= FIR_LOAD;

            when FIR_LOAD =>
                RAM_read        <= '1';
                cnt_coef_inc    <= '1';
                cnt_rd_dec      <= '1';
                addr_select     <= '1';
                next_state      <= FIR_ACC1;

            when FIR_ACC1 =>
                RAM_read        <= '1';
                cnt_coef_inc    <= '1';
                cnt_rd_dec      <= '1';
                addr_select     <= '1';
                FIR_en          <= '1';
                if(cnt_coef_end='1') then
                    next_state  <= FIR_ACC2;
                else
                    next_state  <= FIR_ACC1;
                end if;

            when FIR_ACC2 =>
                RAM_read        <= '1';
                cnt_coef_dec    <= '1';
                cnt_rd_dec      <= '1';
                addr_select     <= '1';
                FIR_en          <= '1';
                if(cnt_coef_zero='1') then
                    next_state  <= FIR_PIPE;
                else
                    next_state  <= FIR_ACC2;
                end if;

            when FIR_PIPE =>
                FIR_en          <= '1';
                next_state      <= FIR_END;

            when FIR_END =>
                if(FIR_done='1') then
                    next_state      <= FIR_END;
                else
                    next_state      <= FIR_STORE;
                end if;

            when FIR_STORE =>
                dout_store      <= '1';
                next_state      <= FIR_IDLE;

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
            if(dout_store='1') then
                for i in C_FIR_MIN to C_FIR_MAX loop
                    FIR_dout(i*16+15 downto i*16) <= FIR_out_tab(i);
                end loop;
            end if;
        end if;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------