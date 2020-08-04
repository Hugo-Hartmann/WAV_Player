-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FFT_FSM.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-21
-- Last update: 2020-08-04
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
        FFT_addr_A      : out std_logic_vector(10 downto 0);
        FFT_addr_B      : out std_logic_vector(10 downto 0);
        FFT_addr_coef   : out std_logic_vector(9 downto 0);

        ------- FFT control ----------------------
        FFT_addr_valid  : out std_logic;
        FFT_rounds_nb   : in  std_logic_vector(3 downto 0);
        FFT_new_sample  : in  std_logic;
        FFT_start       : in  std_logic;
        FFT_stage_busy  : in  std_logic;
        FFT_en          : out std_logic;
        FFT_done        : out std_logic

        );
end FFT_FSM;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of FFT_FSM is

    --------------------------------------------------------------------------------
    -- TYPE DECLARATIONS
    --------------------------------------------------------------------------------
    type FFT_STATE is (FFT_RESET, FFT_IDLE, FFT_WAIT_SAMPLE, FFT_NEW_STAGE, FFT_WAIT_PIPE,
                       FFT_ADDR_LOOP, FFT_PIPE_UNLOAD, FFT_END);

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component Accu10 is
        port(
            b       : in  std_logic_vector(9 downto 0);
            clk     : in  std_logic;
            ce      : in  std_logic;
            sclr    : in  std_logic;
            q       : out std_logic_vector(9 downto 0)
        );
    end component;

    component Accu11 is
        port(
            b       : in  std_logic_vector(10 downto 0);
            clk     : in  std_logic;
            ce      : in  std_logic;
            sclr    : in  std_logic;
            q       : out std_logic_vector(10 downto 0)
        );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal current_state    : FFT_STATE;
    signal next_state       : FFT_STATE;
    signal counter_addr     : unsigned(10 downto 0);
    signal counter_addr_l   : std_logic_vector(10 downto 0);
    signal counter_coef     : unsigned(9 downto 0);
    signal counter_coef_l   : std_logic_vector(9 downto 0);
    signal cnt_addr_clr     : std_logic;
    signal cnt_addr_inc     : std_logic;
    signal counter_stage    : unsigned(3 downto 0);
    signal cnt_stage_set    : std_logic;
    signal cnt_stage_dec    : std_logic;
    signal cnt_stage_end    : std_logic;
    signal addrA            : unsigned(10 downto 0);
    signal addrB            : unsigned(10 downto 0);
    signal addrC            : unsigned(9 downto 0);
    signal addrA_d          : std_logic_vector(10 downto 0);
    signal addrB_d          : std_logic_vector(10 downto 0);
    signal addrC_d          : std_logic_vector(9 downto 0);
    signal addrA_acc_din    : unsigned(10 downto 0);
    signal addrB_add_din    : unsigned(10 downto 0);
    signal addrC_acc_din    : unsigned(9 downto 0);
    signal addrA_acc_clr    : std_logic;
    signal addrC_acc_clr    : std_logic;
    signal addrA_acc_din_d  : unsigned(10 downto 0);
    signal addrB_add_din_d  : unsigned(10 downto 0);
    signal addrC_acc_din_d  : unsigned(9 downto 0);
    signal addrA_acc_clr_d  : std_logic;
    signal addrC_acc_clr_d  : std_logic;
    signal addr_valid       : std_logic;
    signal cnt_data_clr     : std_logic;
    signal cnt_data_inc     : std_logic;
    signal cnt_data_end     : std_logic;
    signal cnt_data         : unsigned(9 downto 0);
    signal cnt_jump_clr     : std_logic;
    signal cnt_jump_inc     : std_logic;
    signal cnt_jump_end     : std_logic;
    signal counter_jump     : unsigned(9 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_Coef_Accu
    -- Description : Accumulator for Coef address
    ----------------------------------------------------------------
    U_Coef_Accu : Accu10 port map(
        b       => std_logic_vector(addrC_acc_din_d),
        clk     => clk,
        ce      => cnt_addr_inc,
        sclr    => addrC_acc_clr_d,
        q       => counter_coef_l);

    ----------------------------------------------------------------
    -- INSTANCE : U_AddrA_Accu
    -- Description : Accumulator for AddrA address
    ----------------------------------------------------------------
    U_AddrA_Accu : Accu11 port map(
        b       => std_logic_vector(addrA_acc_din_d),
        clk     => clk,
        ce      => cnt_addr_inc,
        sclr    => addrA_acc_clr_d,
        q       => counter_addr_l);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Mapping std_logic_vector to unsigned
    --------------------------------------------------------------------------------
    counter_coef    <= unsigned(counter_coef_l);
    counter_addr    <= unsigned(counter_addr_l);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter_jump
    -- Description : Counter to determine jump addresses
    --------------------------------------------------------------------------------
    P_counter_jump : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter_jump    <= to_unsigned(0, counter_jump'length);
        elsif(rising_edge(clk)) then
            if(cnt_jump_clr='1') then
                counter_jump    <= to_unsigned(0, counter_jump'length);
            elsif(cnt_jump_inc='1') then
                if(cnt_jump_end='1' and counter_stage>1) then -- counter_stage>1 : Special case to create oscillating cnt_jump_end
                    counter_jump    <= to_unsigned(0, counter_jump'length);
                else
                    counter_jump    <= counter_jump + 1;
                end if;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_cnt_jump_end
    -- Description : Counter to determine cnt_jump end
    --------------------------------------------------------------------------------
    P_cnt_jump_end : process(clk, reset_n)
    begin
        if(reset_n='0') then
            cnt_jump_end    <= '0';
        elsif(rising_edge(clk)) then
            if(counter_stage=9 and counter_jump=510) then
                cnt_jump_end    <= '1';
            elsif(counter_stage=8 and counter_jump=254) then
                cnt_jump_end    <= '1';
            elsif(counter_stage=7 and counter_jump=126) then
                cnt_jump_end    <= '1';
            elsif(counter_stage=6 and counter_jump=62) then
                cnt_jump_end    <= '1';
            elsif(counter_stage=5 and counter_jump=30) then
                cnt_jump_end    <= '1';
            elsif(counter_stage=4 and counter_jump=14) then
                cnt_jump_end    <= '1';
            elsif(counter_stage=3 and counter_jump=6) then
                cnt_jump_end    <= '1';
            elsif(counter_stage=2 and counter_jump=2) then
                cnt_jump_end    <= '1';
            elsif(counter_stage=1 and counter_jump(0)='0') then -- Special case to create oscillating cnt_jump_end
                cnt_jump_end    <= '1';
            elsif(counter_stage=0) then
                cnt_jump_end    <= '1';
            else
                cnt_jump_end    <= '0';
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Logic to choose accumulators input values and clear signal
    --------------------------------------------------------------------------------
    addrA_acc_din   <= to_unsigned(1  , addrA_acc_din'length)  when(counter_stage=10)  else
                       to_unsigned(513, addrA_acc_din'length)  when(counter_stage=9 and cnt_jump_end='1')   else
                       to_unsigned(257, addrA_acc_din'length)  when(counter_stage=8 and cnt_jump_end='1')   else
                       to_unsigned(129, addrA_acc_din'length)  when(counter_stage=7 and cnt_jump_end='1')   else
                       to_unsigned(65 , addrA_acc_din'length)  when(counter_stage=6 and cnt_jump_end='1')   else
                       to_unsigned(33 , addrA_acc_din'length)  when(counter_stage=5 and cnt_jump_end='1')   else
                       to_unsigned(17 , addrA_acc_din'length)  when(counter_stage=4 and cnt_jump_end='1')   else
                       to_unsigned(9  , addrA_acc_din'length)  when(counter_stage=3 and cnt_jump_end='1')   else
                       to_unsigned(5  , addrA_acc_din'length)  when(counter_stage=2 and cnt_jump_end='1')   else
                       to_unsigned(3  , addrA_acc_din'length)  when(counter_stage=1 and cnt_jump_end='1')   else
                       to_unsigned(2  , addrA_acc_din'length)  when(counter_stage=0)   else
                       to_unsigned(1  , addrA_acc_din'length);

    addrB_add_din   <= to_unsigned(1024, addrB_add_din'length) when(counter_stage=10) else
                       to_unsigned(512 , addrB_add_din'length) when(counter_stage=9) else
                       to_unsigned(256 , addrB_add_din'length) when(counter_stage=8) else
                       to_unsigned(128 , addrB_add_din'length) when(counter_stage=7) else
                       to_unsigned(64  , addrB_add_din'length) when(counter_stage=6) else
                       to_unsigned(32  , addrB_add_din'length) when(counter_stage=5) else
                       to_unsigned(16  , addrB_add_din'length) when(counter_stage=4) else
                       to_unsigned(8   , addrB_add_din'length) when(counter_stage=3) else
                       to_unsigned(4   , addrB_add_din'length) when(counter_stage=2) else
                       to_unsigned(2   , addrB_add_din'length) when(counter_stage=1) else
                       to_unsigned(1   , addrB_add_din'length) when(counter_stage=0) else
                       to_unsigned(0   , addrB_add_din'length);

    addrC_acc_din   <= to_unsigned(1  , addrC_acc_din'length)  when(counter_stage=10)  else
                       to_unsigned(2  , addrC_acc_din'length)  when(counter_stage=9)   else
                       to_unsigned(4  , addrC_acc_din'length)  when(counter_stage=8)   else
                       to_unsigned(8  , addrC_acc_din'length)  when(counter_stage=7)   else
                       to_unsigned(16 , addrC_acc_din'length)  when(counter_stage=6)   else
                       to_unsigned(32 , addrC_acc_din'length)  when(counter_stage=5)   else
                       to_unsigned(64 , addrC_acc_din'length)  when(counter_stage=4)   else
                       to_unsigned(128, addrC_acc_din'length)  when(counter_stage=3)   else
                       to_unsigned(256, addrC_acc_din'length)  when(counter_stage=2)   else
                       to_unsigned(512, addrC_acc_din'length)  when(counter_stage=1)   else
                       to_unsigned(0  , addrC_acc_din'length)  when(counter_stage=0)   else
                       to_unsigned(0  , addrC_acc_din'length);

    addrA_acc_clr   <= '1'  when(cnt_addr_clr='1')  else
                       '0';

    addrC_acc_clr   <= '1'  when(cnt_addr_clr='1')  else
                       '1'  when(counter_stage=9 and cnt_jump_end='1')  else
                       '1'  when(counter_stage=8 and cnt_jump_end='1')  else
                       '1'  when(counter_stage=7 and cnt_jump_end='1')  else
                       '1'  when(counter_stage=6 and cnt_jump_end='1')  else
                       '1'  when(counter_stage=5 and cnt_jump_end='1')  else
                       '1'  when(counter_stage=4 and cnt_jump_end='1')  else
                       '1'  when(counter_stage=3 and cnt_jump_end='1')  else
                       '1'  when(counter_stage=2 and cnt_jump_end='1')  else
                       '1'  when(counter_stage=1 and cnt_jump_end='1')  else
                       '1'  when(counter_stage=0)   else
                       '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_addr_inputs
    -- Description : Register adders inputs
    --------------------------------------------------------------------------------
    P_addr_inputs : process(clk, reset_n)
    begin
        if(reset_n='0') then
            addrA_acc_din_d <= (others => '0');
            addrB_add_din_d <= (others => '0');
            addrC_acc_din_d <= (others => '0');
            addrA_acc_clr_d <= '1';
            addrC_acc_clr_d <= '1';
        elsif(rising_edge(clk)) then
            addrA_acc_din_d <= addrA_acc_din;
            addrB_add_din_d <= addrB_add_din;
            addrC_acc_din_d <= addrC_acc_din;
            addrA_acc_clr_d <= addrA_acc_clr;
            addrC_acc_clr_d <= addrC_acc_clr;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Address assignation for the 2x2 butterfly
    --------------------------------------------------------------------------------
    AddrA   <= counter_addr;
    AddrB   <= counter_addr + addrB_add_din_d;
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
    FFT_addr_A      <= AddrA_d;
    FFT_addr_B      <= AddrB_d;
    FFT_addr_coef   <= AddrC_d;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter_data
    -- Description : Counter for number of data treated
    --------------------------------------------------------------------------------
    P_counter_data : process(clk, reset_n)
    begin
        if(reset_n='0') then
            cnt_data    <= to_unsigned(0, cnt_data'length);
        elsif(rising_edge(clk)) then
            if(cnt_data_clr='1') then
                cnt_data <= to_unsigned(0, cnt_data'length);
            elsif(cnt_data_inc='1') then
                cnt_data    <= cnt_data + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : End cnt_data signaling
    --------------------------------------------------------------------------------
    cnt_data_end  <= '1' when(cnt_data=1023) else '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter_stage
    -- Description : Counter for current stage
    --------------------------------------------------------------------------------
    P_counter_stage : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter_stage   <= to_unsigned(11, counter_stage'length);
        elsif(rising_edge(clk)) then
            if(cnt_stage_set='1') then
                counter_stage   <= unsigned(FFT_rounds_nb);
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
    P_FSM_FFT_comb : process(current_state, FFT_start, FFT_new_sample, cnt_data_end, cnt_stage_end, FFT_stage_busy)
    begin
        addr_valid      <= '0';
        cnt_addr_clr    <= '0';
        cnt_addr_inc    <= '0';
        cnt_stage_set   <= '0';
        cnt_stage_dec   <= '0';
        cnt_data_clr    <= '0';
        cnt_data_inc    <= '0';
        cnt_jump_clr    <= '0';
        cnt_jump_inc    <= '0';
        FFT_done        <= '0';

        case current_state is
            when FFT_RESET =>
                next_state  <= FFT_IDLE;

            when FFT_IDLE =>
                cnt_stage_set   <= '1';
                if(FFT_start='1') then
                    next_state  <= FFT_WAIT_SAMPLE;
                else
                    next_state  <= FFT_IDLE;
                end if;

            when FFT_WAIT_SAMPLE =>
                if(FFT_new_sample='1') then
                    next_state  <= FFT_NEW_STAGE;
                else
                    next_state  <= FFT_WAIT_SAMPLE;
                end if;

            when FFT_NEW_STAGE =>
                cnt_addr_clr    <= '1';
                cnt_data_clr    <= '1';
                cnt_jump_clr    <= '1';
                cnt_stage_dec   <= '1';
                next_state      <= FFT_WAIT_PIPE;

            when FFT_WAIT_PIPE =>
                cnt_jump_inc    <= '1';
                next_state      <= FFT_ADDR_LOOP;

            when FFT_ADDR_LOOP =>
                addr_valid      <= '1';
                cnt_addr_inc    <= '1';
                cnt_data_inc    <= '1';
                cnt_jump_inc    <= '1';
                if(cnt_data_end='1') then
                    next_state  <= FFT_PIPE_UNLOAD;
                else
                    next_state  <= FFT_ADDR_LOOP;
                end if;

            when FFT_PIPE_UNLOAD =>
                if(FFT_stage_busy='0' and cnt_stage_end='1') then
                    next_state  <= FFT_END;
                elsif(FFT_stage_busy='0') then
                    next_state  <= FFT_NEW_STAGE;
                else
                    next_state  <= FFT_PIPE_UNLOAD;
                end if;

            when FFT_END =>
                FFT_done    <= '1';
                next_state  <= FFT_IDLE;

        end case;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg_addr_valid
    -- Description : register addr_valid signal
    --------------------------------------------------------------------------------
    P_reg_addr_valid : process(clk, reset_n)
    begin
        if(reset_n='0') then
            FFT_addr_valid  <= '0';
        elsif(rising_edge(clk)) then
            FFT_addr_valid  <= addr_valid;
        end if;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------