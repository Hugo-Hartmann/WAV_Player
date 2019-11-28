-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FIR_Single.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-06
-- Last update: 2019-11-06
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Single FIR filter
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-11-06  1.0      Hugo HARTMANN   Creation
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
entity FIR_Single is
    generic(
        G_BEHAVIOURAL   : boolean := false
        );
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- FIR out --------------------------
        FIR_dout        : out std_logic_vector(7 downto 0);

        ------- FIR control ----------------------
        FIR_en          : in  std_logic;

        ------- FIR in ---------------------------
        FIR_din         : in  std_logic_vector(7 downto 0)

        );
end FIR_Single;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of FIR_Single is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type FIR_STATE is (FIR_RESET, FIR_IDLE, FIR_START, FIR_LOAD,
                       FIR_ACC1, FIR_ACC2, FIR_END1, FIR_END2, FIR_END3, FIR_STORE);

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

    component ROM_1024_16bit
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(9 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component Multiplier is
        generic(
            G_OPERAND_A_SIZE    : INTEGER := 5;
            G_OPERAND_B_SIZE    : INTEGER := 5;
            G_MULT_OUT_SIZE     : INTEGER := 10
            );
        port(
            clk          : in  std_logic;
            reset_n      : in  std_logic;
            enable       : in  std_logic;
            opA          : in  std_logic_vector(G_OPERAND_A_SIZE-1 downto 0);
            opB          : in  std_logic_vector(G_OPERAND_B_SIZE-1 downto 0);
            mult_out     : out std_logic_vector(G_MULT_OUT_SIZE-1 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal current_state    : FIR_STATE;
    signal next_state       : FIR_STATE;
    signal RAM_out          : std_logic_vector(7 downto 0);
    signal RAM_write        : std_logic_vector(0 downto 0);
    signal RAM_enable       : std_logic;
    signal RAM_read         : std_logic;
    signal RAM_addr         : std_logic_vector(10 downto 0);
    signal RAM_addr_rd      : std_logic_vector(10 downto 0);
    signal RAM_addr_wr      : std_logic_vector(10 downto 0);
    signal FIR_din_d        : std_logic_vector(7 downto 0);
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
    signal FIR_out          : std_logic_vector(7 downto 0);
    signal ROM_out          : std_logic_vector(15 downto 0);
    signal accu_din         : unsigned(34 downto 0);
    signal accu             : unsigned(34 downto 0);
    signal mult_opA         : std_logic_vector(7 downto 0);
    signal mult_opB         : std_logic_vector(15 downto 0);
    signal mult_out         : std_logic_vector(23 downto 0);
    signal mult_out_d       : std_logic_vector(23 downto 0);
    signal sat_out          : unsigned(7 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_ROM
    -- Description : Contains coefficient for filtering
    ----------------------------------------------------------------
    ROM : if G_BEHAVIOURAL=false generate
        U_ROM : ROM_1024_16bit port map(
            clka    => clk,
            addra   => FIR_addr,
            ena     => '1',
            douta   => ROM_out);
    end generate;

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM
    -- Description : Contains the 2048 last samples read
    ----------------------------------------------------------------
    RAM : if G_BEHAVIOURAL=false generate
        U_RAM : RAM_2048_8bit port map(
            clka    => clk,
            addra   => RAM_addr,
            wea     => RAM_write,
            ena     => RAM_enable,
            dina    => FIR_din,
            douta   => RAM_out);
    end generate;

    ----------------------------------------------------------------
    -- INSTANCE : U_Mult
    -- Description : 8x16 Signed multiplier
    ----------------------------------------------------------------
    U_Mult : Multiplier generic map(
        G_OPERAND_A_SIZE    => 8,
        G_OPERAND_B_SIZE    => 16,
        G_MULT_OUT_SIZE     => 24)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        enable      => '1',
        opA         => mult_opA,
        opB         => mult_opB,
        mult_out    => mult_out);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_ROM
    -- Description : Register rom data
    --------------------------------------------------------------------------------
    P_ROM : process(clk, reset_n)
    begin
        if(reset_n='0') then
            -- mult_opA    <= (others => '0'); -- Merge reg with DSP block
            -- mult_opB    <= (others => '0');
            -- mult_out_d  <= (others => '0');
        elsif(rising_edge(clk)) then
            if(FIR_clr='1') then
                mult_opA    <= (others => '0');
                mult_opB    <= (others => '0');
                mult_out_d  <= (others => '0');
            elsif(FIR_en='1') then
                mult_opA    <= std_logic_vector(unsigned(FIR_din_d) - 128);
                mult_opB    <= ROM_out;
                mult_out_d  <= mult_out;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Accumulator
    --------------------------------------------------------------------------------
    accu_din    <= (34 downto 24 => mult_out_d(23)) & unsigned(mult_out_d);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_acc
    -- Description : Enable accumulation
    --------------------------------------------------------------------------------
    P_acc : process(clk, reset_n)
    begin
        if(reset_n='0') then
            -- accu    <= to_unsigned(0, accu'length); -- Merge reg with DSP block
        elsif(rising_edge(clk)) then
            if(FIR_clr='1') then
                accu    <= to_unsigned(0, accu'length);
            elsif(FIR_en='1') then
                accu    <= accu + accu_din;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Saturation
    --------------------------------------------------------------------------------
    process(accu)
    begin
        if(accu(34 downto 32)="000" or accu(34 downto 32)="111") then
            sat_out <= accu(32 downto 25);
        elsif(accu(32)='0') then
            sat_out <= X"7F";
        else
            sat_out <= X"80";
        end if;
    end process;


    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Output
    --------------------------------------------------------------------------------
    FIR_out <= std_logic_vector(sat_out + 128);

    --------------------------------------------------------------------------------
    -- COMBINATORY : 
    -- Description : Address selection for RAM
    --------------------------------------------------------------------------------
    RAM_addr    <= RAM_addr_wr when(addr_select='0') else RAM_addr_rd;
    RAM_enable  <= RAM_read OR FIR_start;

    --------------------------------------------------------------------------------
    -- COMBINATORY : 
    -- Description : FIR input data
    --------------------------------------------------------------------------------
    FIR_din_d   <= RAM_out when(FIR_en='1') else (others => '0');

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
    RAM_write   <= (others => FIR_start);
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
    P_FSM_FIR_comb : process(current_state, cnt_coef_zero, cnt_coef_end, FIR_start)
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
                    next_state  <= FIR_END1;
                else
                    next_state  <= FIR_ACC2;
                end if;

            when FIR_END1 =>
                FIR_en          <= '1';
                next_state      <= FIR_END2;

            when FIR_END2 =>
                FIR_en          <= '1';
                next_state      <= FIR_END3;

            when FIR_END3 =>
                FIR_en          <= '1';
                next_state      <= FIR_STORE;

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
                FIR_dout <= FIR_out;
            end if;
        end if;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------