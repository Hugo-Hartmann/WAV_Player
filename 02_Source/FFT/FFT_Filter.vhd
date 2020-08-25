-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FFT_Filter.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2020-08-24
-- Last update: 2020-08-25
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: FFT filter to cut unwanted frequencies before undersampling
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2020-08-24  1.0      Hugo HARTMANN   Creation
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
entity FFT_Filter is
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- FFT out --------------------------
        FFT_dout        : out std_logic_vector(15 downto 0);

        ------- FFT control ----------------------
        FFT_start       : in  std_logic;
        FFT_selection   : in  std_logic_vector(3 downto 0);
        FFT_done        : out std_logic;

        ------- FFT in ---------------------------
        FFT_din         : in  std_logic_vector(15 downto 0)

        );
end FFT_Filter;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of FFT_Filter is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type FFT_STATE is (FFT_RESET, FFT_IDLE, FFT_BEGIN,
                       FFT_ACC1, FFT_ACC2, FFT_END, FFT_STORE);
    type T_EN is array (0 to 7) of std_logic;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component RAM_512_16bit
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            wea     : in  std_logic_vector(0 downto 0);
            addra   : in  std_logic_vector(8 downto 0);
            dina    : in  std_logic_vector(15 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component ROM_16x256_16bit
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            addra   : in  std_logic_vector(11 downto 0);
            douta   : out std_logic_vector(15 downto 0)
            );
    end component;

    component Multiplier_s16_s16
        port(
            clk : in  std_logic;
            a   : in  std_logic_vector(15 downto 0);
            b   : in  std_logic_vector(15 downto 0);
            p   : out std_logic_vector(31 downto 0)
            );
    end component;

    component Accu_s41
        port(
            b       : in  std_logic_vector(31 downto 0);
            clk     : in  std_logic;
            ce      : in  std_logic;
            sclr    : in  std_logic;
            q       : out std_logic_vector(40 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    -- FSM
    signal current_state    : FFT_STATE;
    signal next_state       : FFT_STATE;
    signal FSM_clr          : std_logic;
    signal FSM_en           : std_logic;
    signal FSM_addr_sel     : std_logic;
    signal FSM_store        : std_logic;
    signal FSM_done         : std_logic;
    signal FSM_en_d         : T_EN;
    signal FSM_start        : std_logic;

    -- RAM
    signal RAM_out          : std_logic_vector(15 downto 0);
    signal RAM_in           : std_logic_vector(15 downto 0);
    signal RAM_wea          : std_logic_vector(0 downto 0);
    signal RAM_write        : std_logic;
    signal RAM_enable       : std_logic;
    signal RAM_read         : std_logic;
    signal RAM_addr         : std_logic_vector(8 downto 0);

    -- ROM
    signal ROM_addr         : std_logic_vector(11 downto 0);
    signal ROM_out          : std_logic_vector(15 downto 0);

    -- Counter coef
    signal cnt_coef         : unsigned(7 downto 0);
    signal cnt_coef_clr     : std_logic;
    signal cnt_coef_dec     : std_logic;
    signal cnt_coef_inc     : std_logic;
    signal cnt_coef_end     : std_logic;
    signal cnt_coef_zero    : std_logic;

    -- Counter data
    signal cnt_wr           : unsigned(8 downto 0);
    signal cnt_rd           : unsigned(8 downto 0);
    signal cnt_rd_load      : std_logic;
    signal cnt_rd_inc       : std_logic;

    -- Arithmetic
    signal accu             : std_logic_vector(40 downto 0);
    signal mult_opA         : std_logic_vector(15 downto 0);
    signal mult_opB         : std_logic_vector(15 downto 0);
    signal mult_out         : std_logic_vector(31 downto 0);
    signal mult_out_d       : std_logic_vector(31 downto 0);
    signal sat0_out         : std_logic_vector(15 downto 0);
    signal sat1_out         : std_logic_vector(15 downto 0);
    signal sat2_out         : std_logic_vector(15 downto 0);
    signal sat3_out         : std_logic_vector(15 downto 0);
    signal sat4_out         : std_logic_vector(15 downto 0);
    signal accu_en          : std_logic;

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
            FSM_start   <= FFT_start;
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_ROM
    -- Description : Contains coefficient for filtering
    ----------------------------------------------------------------
    U_ROM : ROM_16x256_16bit port map(
        clka    => clk,
        addra   => ROM_addr,
        ena     => '1',
        douta   => ROM_out);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_ROM
    -- Description : Register ROM inputs
    --------------------------------------------------------------------------------
    P_ROM : process(clk)
    begin
        if(rising_edge(clk)) then
            ROM_addr    <= FFT_selection & std_logic_vector(cnt_coef);
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM
    -- Description : Contains the 512 last samples read
    ----------------------------------------------------------------
    U_RAM : RAM_512_16bit port map(
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
            RAM_in      <= FFT_din;
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_Mult
    -- Description : 16x16 multiplier
    ----------------------------------------------------------------
    U_Mult : Multiplier_s16_s16 port map(
        clk => clk,
        a   => mult_opA,
        b   => mult_opB,
        p   => mult_out);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_FSM_en_d
    -- Description : Enable pipeline
    --------------------------------------------------------------------------------
    P_FSM_en_d : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in 0 to FSM_en_d'high loop
                FSM_en_d(i) <= '0';
            end loop;
        elsif(rising_edge(clk)) then
            FSM_en_d(0) <= FSM_en;
            for i in 1 to FSM_en_d'high loop
                FSM_en_d(i) <= FSM_en_d(i-1);
            end loop;
            FSM_done <= FSM_en_d(FSM_en_d'high);
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_Mult
    -- Description : Register multiplier inputs
    --------------------------------------------------------------------------------
    P_Mult : process(clk, reset_n)
    begin
        if(reset_n='0') then
            -- mult_opA    <= (others => '0'); -- Merge reg with DSP block
            -- mult_opB    <= (others => '0');
            -- mult_out_d  <= (others => '0');
        elsif(rising_edge(clk)) then
            mult_opA    <= RAM_out;
            mult_opB    <= ROM_out;
            mult_out_d  <= mult_out;
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_Accu
    -- Description : 41 bit accumulator
    ----------------------------------------------------------------
    U_Accu : Accu_s41 port map(
        clk     => clk,
        b       => mult_out_d,
        ce      => accu_en,
        sclr    => FSM_clr,
        q       => accu);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : accu_en
    --------------------------------------------------------------------------------
    accu_en <= FSM_en_d(6) OR FSM_en_d(7);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_SAT0
    -- Description : Saturation interval 0
    --------------------------------------------------------------------------------
    P_SAT0 : process(clk, reset_n)
    begin
        if(reset_n='0') then
            sat0_out    <= (others => '0');
        elsif(rising_edge(clk)) then
            if(accu(40 downto 29)="000000000000" or accu(40 downto 29)="111111111111") then
                sat0_out    <= accu(29 downto 14);
            elsif(accu(40)='0') then
                sat0_out    <= X"7FFF";
            else
                sat0_out    <= X"8000";
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_SAT1
    -- Description : Saturation interval 1
    --------------------------------------------------------------------------------
    P_SAT1 : process(clk, reset_n)
    begin
        if(reset_n='0') then
            sat1_out    <= (others => '0');
        elsif(rising_edge(clk)) then
            if(accu(40 downto 30)="00000000000" or accu(40 downto 30)="11111111111") then
                sat1_out    <= accu(30 downto 15);
            elsif(accu(40)='0') then
                sat1_out    <= X"7FFF";
            else
                sat1_out    <= X"8000";
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_SAT2
    -- Description : Saturation interval 2
    --------------------------------------------------------------------------------
    P_SAT2 : process(clk, reset_n)
    begin
        if(reset_n='0') then
            sat2_out    <= (others => '0');
        elsif(rising_edge(clk)) then
            if(accu(40 downto 31)="0000000000" or accu(40 downto 31)="1111111111") then
                sat2_out    <= accu(31 downto 16);
            elsif(accu(40)='0') then
                sat2_out    <= X"7FFF";
            else
                sat2_out    <= X"8000";
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_SAT3
    -- Description : Saturation interval 3
    --------------------------------------------------------------------------------
    P_SAT3 : process(clk, reset_n)
    begin
        if(reset_n='0') then
            sat3_out    <= (others => '0');
        elsif(rising_edge(clk)) then
            if(accu(40 downto 32)="000000000" or accu(40 downto 32)="111111111") then
                sat3_out    <= accu(32 downto 17);
            elsif(accu(40)='0') then
                sat3_out    <= X"7FFF";
            else
                sat3_out    <= X"8000";
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_SAT4
    -- Description : Saturation interval 4
    --------------------------------------------------------------------------------
    P_SAT4 : process(clk, reset_n)
    begin
        if(reset_n='0') then
            sat4_out    <= (others => '0');
        elsif(rising_edge(clk)) then
            if(accu(40 downto 33)="00000000" or accu(40 downto 33)="11111111") then
                sat4_out    <= accu(33 downto 18);
            elsif(accu(40)='0') then
                sat4_out    <= X"7FFF";
            else
                sat4_out    <= X"8000";
            end if;
        end if;
    end process;

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
    cnt_coef_end    <= '1' when(cnt_coef=254) else '0';
    cnt_coef_zero   <= '1' when(cnt_coef=0) else '0';

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
    P_FSM_FFT_comb : process(current_state, cnt_coef_zero, cnt_coef_end, FSM_start, FSM_done)
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
            when FFT_RESET =>
                next_state  <= FFT_IDLE;

            when FFT_IDLE =>
                cnt_rd_load     <= '1';
                cnt_coef_clr    <= '1';
                if(FSM_start='1') then
                    next_state  <= FFT_BEGIN;
                else
                    next_state  <= FFT_IDLE;
                end if;

            when FFT_BEGIN =>
                RAM_write       <= '1';
                FSM_clr         <= '1';
                next_state      <= FFT_ACC1;

            when FFT_ACC1 =>
                RAM_read        <= '1';
                cnt_coef_inc    <= '1';
                cnt_rd_inc      <= '1';
                FSM_addr_sel    <= '1';
                FSM_en          <= '1';
                if(cnt_coef_end='1') then
                    next_state  <= FFT_ACC2;
                else
                    next_state  <= FFT_ACC1;
                end if;

            when FFT_ACC2 =>
                RAM_read        <= '1';
                cnt_coef_dec    <= '1';
                cnt_rd_inc      <= '1';
                FSM_addr_sel    <= '1';
                FSM_en          <= '1';
                if(cnt_coef_zero='1') then
                    next_state  <= FFT_END;
                else
                    next_state  <= FFT_ACC2;
                end if;

            when FFT_END =>
                if(FSM_done='1') then
                    next_state      <= FFT_END;
                else
                    next_state      <= FFT_STORE;
                end if;

            when FFT_STORE =>
                FSM_store   <= '1';
                next_state  <= FFT_IDLE;

        end case;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_dout
    -- Description : Register dout
    --------------------------------------------------------------------------------
    P_dout : process(clk, reset_n)
    begin
        if(reset_n='0') then
            FFT_dout    <= (others => '0');
        elsif(rising_edge(clk)) then
            if(FSM_store='1') then
                if(FFT_selection="0000") then
                    FFT_dout    <= sat0_out;
                elsif(FFT_selection="0001") then
                    FFT_dout    <= sat1_out;
                elsif(FFT_selection="0010" or FFT_selection="0011") then
                    FFT_dout    <= sat2_out;
                elsif(FFT_selection="0100" or FFT_selection="0101" or FFT_selection="0110" or FFT_selection="0111") then
                    FFT_dout    <= sat3_out;
                else
                    FFT_dout    <= sat4_out;
                end if;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : FFT_done
    --------------------------------------------------------------------------------
    FFT_done    <= FSM_store;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------