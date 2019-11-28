-------------------------------------------------------------------------------
--  This entire design, which includes all of the components and related files,
--  has been created and owned by : ELSYS DESIGN
--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : FFT_FSM.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-21
-- Last update: 2019-11-27
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: FSM to execute FFT computations
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-11-21  1.0      Hugo HARTMANN   Creation
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
entity FFT_FSM is
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- FFT out --------------------------
        FFT_addr_A      : out std_logic_vector(8 downto 0);
        FFT_addr_B      : out std_logic_vector(8 downto 0);
        FFT_addr_coef   : out std_logic_vector(7 downto 0);

        ------- FFT control ----------------------
        FFT_start       : in  std_logic;
        FFT_new_sample  : in  std_logic;
        FFT_stage_busy  : in  std_logic;
        FFT_en_btfly    : out std_logic;
        FFT_en_norm     : out std_logic

        );
end FFT_FSM;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of FFT_FSM is

    --------------------------------------------------------------------------------
    -- TYPE DECLARATIONS
    --------------------------------------------------------------------------------
    type FFT_STATE is (FFT_RESET, FFT_IDLE, FFT_WAIT_SAMPLE, FFT_NEW_STAGE, FFT_ADDR_START1,
                       FFT_ADDR_START2, FFT_ADDR_LOOP, FFT_ADDR_END, FFT_PIPE_UNLOAD, FFT_END_BTFLY,
                       FFT_NORM_START1, FFT_NORM_START2, FFT_NORM_LOOP, FFT_NORM_LAST, FFT_NORM_END);

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal current_state    : FFT_STATE;
    signal next_state       : FFT_STATE;
    signal counter_addr     : unsigned(8 downto 0);
    signal counter_coef     : unsigned(7 downto 0);
    signal cnt_addr_clr     : std_logic;
    signal cnt_addr_inc     : std_logic;
    signal cnt_addr_end     : std_logic;
    signal counter_stage    : unsigned(7 downto 0);
    signal cnt_stage_set    : std_logic;
    signal cnt_stage_dec    : std_logic;
    signal cnt_stage_end    : std_logic;
    signal addrA            : unsigned(8 downto 0);
    signal addrB            : unsigned(8 downto 0);
    signal addrC            : unsigned(7 downto 0);
    signal addrA_d          : std_logic_vector(8 downto 0);
    signal addrB_d          : std_logic_vector(8 downto 0);
    signal addrC_d          : std_logic_vector(7 downto 0);
    signal invert_addr      : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter_addr
    -- Description : Counter to generate addresses
    --------------------------------------------------------------------------------
    P_counter_addr : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter_addr    <= to_unsigned(0, counter_addr'length);
            counter_coef    <= to_unsigned(0, counter_coef'length);
        elsif(rising_edge(clk)) then
            if(cnt_addr_clr='1') then
                counter_addr    <= to_unsigned(0, counter_addr'length);
                counter_coef    <= to_unsigned(0, counter_coef'length);
            elsif(cnt_addr_inc='1') then
                if(counter_stage=8) then
                    counter_addr    <= counter_addr + 1;
                    counter_coef    <= counter_coef + 1;
                elsif(counter_stage=7) then
                    if(counter_addr(6 downto 0)=127) then
                        counter_addr    <= counter_addr + 129;
                        counter_coef    <= to_unsigned(0, counter_coef'length);
                    else
                        counter_coef    <= counter_coef + 2;
                        counter_addr    <= counter_addr + 1;
                    end if;
                elsif(counter_stage=6) then
                    if(counter_addr(5 downto 0)=63) then
                        counter_addr    <= counter_addr + 65;
                        counter_coef    <= to_unsigned(0, counter_coef'length);
                    else
                        counter_coef    <= counter_coef + 4;
                        counter_addr    <= counter_addr + 1;
                    end if;
                elsif(counter_stage=5) then
                    if(counter_addr(4 downto 0)=31) then
                        counter_addr    <= counter_addr + 33;
                        counter_coef    <= to_unsigned(0, counter_coef'length);
                    else
                        counter_coef    <= counter_coef + 8;
                        counter_addr    <= counter_addr + 1;
                    end if;
                elsif(counter_stage=4) then
                    if(counter_addr(3 downto 0)=15) then
                        counter_addr    <= counter_addr + 17;
                        counter_coef    <= to_unsigned(0, counter_coef'length);
                    else
                        counter_coef    <= counter_coef + 16;
                        counter_addr    <= counter_addr + 1;
                    end if;
                elsif(counter_stage=3) then
                    if(counter_addr(2 downto 0)=7) then
                        counter_addr    <= counter_addr + 9;
                        counter_coef    <= to_unsigned(0, counter_coef'length);
                    else
                        counter_coef    <= counter_coef + 32;
                        counter_addr    <= counter_addr + 1;
                    end if;
                elsif(counter_stage=2) then
                    if(counter_addr(1 downto 0)=3) then
                        counter_addr    <= counter_addr + 5;
                        counter_coef    <= to_unsigned(0, counter_coef'length);
                    else
                        counter_coef    <= counter_coef + 64;
                        counter_addr    <= counter_addr + 1;
                    end if;
                elsif(counter_stage=1) then
                    if(counter_addr(0 downto 0)=1) then
                        counter_addr    <= counter_addr + 3;
                        counter_coef    <= to_unsigned(0, counter_coef'length);
                    else
                        counter_coef    <= counter_coef + 128;
                        counter_addr    <= counter_addr + 1;
                    end if;
                elsif(counter_stage=0) then
                    counter_coef    <= to_unsigned(0, counter_coef'length);
                    counter_addr    <= counter_addr + 2;
                else     -- case for normalization
                    counter_addr    <= counter_addr + 1;
                end if;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Address assignation for the 2x2 butterfly
    --------------------------------------------------------------------------------
    AddrA   <= counter_addr;
    AddrB   <= counter_addr + 256   when(counter_stage=8) else
               counter_addr + 128   when(counter_stage=7) else
               counter_addr + 64    when(counter_stage=6) else
               counter_addr + 32    when(counter_stage=5) else
               counter_addr + 16    when(counter_stage=4) else
               counter_addr + 8     when(counter_stage=3) else
               counter_addr + 4     when(counter_stage=2) else
               counter_addr + 2     when(counter_stage=1) else
               counter_addr + 1     when(counter_stage=0) else
               counter_addr + 256; -- case for normalization
    AddrC   <= counter_coef;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg
    -- Description : Register addresses
    --------------------------------------------------------------------------------
    P_reg : process(clk, reset_n)
    begin
        if(reset_n='0') then
            AddrA_d <= (others => '0');
            AddrB_d <= (others => '0');
            AddrC_d <= (others => '0');
        elsif(rising_edge(clk)) then
            AddrA_d <= std_logic_vector(AddrA);
            AddrB_d <= std_logic_vector(AddrB);
            AddrC_d <= std_logic_vector(AddrC);
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Output address assignation
    --------------------------------------------------------------------------------
    P_invert : process(AddrA_d, invert_addr)
    begin
        if(invert_addr='0') then
            FFT_addr_A  <= AddrA_d;
        else
            for i in AddrA_d'range loop
                FFT_addr_A(i)   <= AddrA_d(AddrA_d'high - i);
            end loop;
        end if;
    end process;

    FFT_addr_B      <= AddrB_d;
    FFT_addr_coef   <= AddrC_d;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : End address signaling
    --------------------------------------------------------------------------------
    cnt_addr_end    <= '1' when(AddrB_d=std_logic_vector(to_unsigned(511, AddrB_d'length))) else '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter_stage
    -- Description : Counter for current stage
    --------------------------------------------------------------------------------
    P_v : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter_stage   <= to_unsigned(8+1, counter_stage'length);
        elsif(rising_edge(clk)) then
            if(cnt_stage_set='1') then
                counter_stage   <= to_unsigned(8+1, counter_stage'length); -- case for normalization
            elsif(cnt_stage_dec='1') then
                counter_stage   <= counter_stage - 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : End stage signaling
    --------------------------------------------------------------------------------
    cnt_stage_end  <= '1' when(counter_stage=0) else '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_FSM_FFT_sync
    -- Description : FSM_FFT sequential part (current_state logic)
    --------------------------------------------------------------------------------
    P_FSM_FFT_sync : process(clk, reset_n)
    begin
        if(reset_n='0') then
            current_state   <= FFT_RESET;
        elsif(rising_edge(clk)) then
            current_state   <= next_state;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMB PROCESS : P_FSM_FFT_comb
    -- Description : FSM_FFT combinatorial part (next_state logic)
    --------------------------------------------------------------------------------
    P_FSM_FFT_comb : process(current_state, FFT_start, FFT_new_sample, cnt_addr_end, cnt_stage_end, FFT_stage_busy)
    begin
        FFT_en_btfly    <= '0';
        FFT_en_norm     <= '0';
        cnt_addr_clr    <= '0';
        cnt_addr_inc    <= '0';
        cnt_stage_set   <= '0';
        cnt_stage_dec   <= '0';
        invert_addr     <= '0';

        case current_state is
            when FFT_RESET =>
                next_state  <= FFT_IDLE;

            when FFT_IDLE =>
                if(FFT_start='1') then
                    next_state  <= FFT_WAIT_SAMPLE;
                else
                    next_state  <= FFT_IDLE;
                end if;

            when FFT_WAIT_SAMPLE =>
                cnt_stage_set   <= '1';
                if(FFT_new_sample='1') then
                    next_state  <= FFT_NEW_STAGE;
                else
                    next_state  <= FFT_WAIT_SAMPLE;
                end if;

            when FFT_NEW_STAGE =>
                cnt_addr_clr    <= '1';
                cnt_stage_dec   <= '1';
                next_state      <= FFT_ADDR_START1;

            when FFT_ADDR_START1 =>
                cnt_addr_inc    <= '1';
                next_state      <= FFT_ADDR_START2;

            when FFT_ADDR_START2 =>
                cnt_addr_inc    <= '1';
                next_state      <= FFT_ADDR_LOOP;

            when FFT_ADDR_LOOP =>
                cnt_addr_inc    <= '1';
                FFT_en_btfly    <= '1';
                if(cnt_addr_end='1') then
                    next_state  <= FFT_ADDR_END;
                else
                    next_state  <= FFT_ADDR_LOOP;
                end if;

            when FFT_ADDR_END =>
                FFT_en_btfly    <= '1';
                next_state      <= FFT_PIPE_UNLOAD;

            when FFT_PIPE_UNLOAD =>
                if(FFT_stage_busy='0' and cnt_stage_end='1') then
                    next_state  <= FFT_END_BTFLY;
                elsif(FFT_stage_busy='0') then
                    next_state  <= FFT_NEW_STAGE;
                else
                    next_state  <= FFT_PIPE_UNLOAD;
                end if;

            when FFT_END_BTFLY =>
                cnt_addr_clr    <= '1';
                cnt_stage_set   <= '1';
                next_state      <= FFT_NORM_START1;

            when FFT_NORM_START1 =>
                invert_addr     <= '1';
                cnt_addr_inc    <= '1';
                next_state      <= FFT_NORM_START2;

            when FFT_NORM_START2 =>
                invert_addr     <= '1';
                cnt_addr_inc    <= '1';
                next_state      <= FFT_NORM_LOOP;

            when FFT_NORM_LOOP =>
                invert_addr     <= '1';
                cnt_addr_inc    <= '1';
                FFT_en_norm     <= '1';
                if(cnt_addr_end='1') then
                    next_state  <= FFT_NORM_LAST;
                else
                    next_state  <= FFT_NORM_LOOP;
                end if;

            when FFT_NORM_LAST =>
                invert_addr     <= '1';
                cnt_addr_inc    <= '1';
                FFT_en_norm     <= '1';
                next_state      <= FFT_NORM_END;

            when FFT_NORM_END =>
                FFT_en_norm     <= '1';
                next_state      <= FFT_IDLE;

        end case;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------