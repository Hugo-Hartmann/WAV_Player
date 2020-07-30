-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : PSH_Driver.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2020-07-22
-- Last update: 2020-07-30
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Forward data from FFT, WAV and VU-metre to UART
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2020-07-22  1.0      Hugo HARTMANN   Creation
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
entity PSH_Driver is
    port(
    
        ------- Clock and RESET ------------------
        clk_108         : in  std_logic;                        -- clock 108 MHz
        clk_216         : in  std_logic;                        -- clock 216 MHz
        reset_n         : in  std_logic;                        -- reset_n

        ------- VGA interface --------------------
        VGA_new_frame   : in  std_logic;

        ------- PUSH interface -------------------
        WAV_push        : in  std_logic_vector(8 downto 0);
        FFT_push        : in  std_logic_vector(16 downto 0);
        VU_push         : in  std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);

        ------- Interface VGA to UART ------------
        UART_send       : out std_logic;
        UART_busy       : in  std_logic;
        UART_din        : out std_logic_vector(7 downto 0);

        ------- Debug ----------------------------
        PSH_done        : out std_logic

        );
end PSH_Driver;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of PSH_Driver is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type PSH_STATE is (PSH_RESET0, PSH_RESET1, PSH_IDLE, PSH_WAIT_SAMPLE, PSH_LOAD_SAMPLE,
                       PSH_SEND_UART, PSH_WAIT_WAV, PSH_WAIT_FFT_B0, PSH_WAIT_FFT_B1,
                       PSH_WAIT_HEADER, PSH_END, PSH_WAIT_UART, PSH_WAIT_VU);

    --------------------------------------------------------------------------------
    -- CONSTANTS DECLARATIONS
    --------------------------------------------------------------------------------

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component FIFO_8bit_2048
        port(
            rst     : in  std_logic;
            wr_clk  : in  std_logic;
            rd_clk  : in  std_logic;
            din     : in  std_logic_vector(7 downto 0);
            wr_en   : in  std_logic;
            rd_en   : in  std_logic;
            dout    : out std_logic_vector(7 downto 0);
            full    : out std_logic;
            empty   : out std_logic
            );
    end component;

    component FIFO_16bit_1024
        port(
            rst     : in  std_logic;
            wr_clk  : in  std_logic;
            rd_clk  : in  std_logic;
            din     : in std_logic_vector(15 downto 0);
            wr_en   : in std_logic;
            rd_en   : in std_logic;
            dout    : out std_logic_vector(15 downto 0);
            full    : out std_logic;
            empty   : out std_logic
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal clk              : std_logic;
    signal current_state    : PSH_STATE;
    signal next_state       : PSH_STATE;
    signal mem_state        : PSH_STATE;
    signal return_state     : PSH_STATE;
    signal PSH_start        : std_logic;
    signal WAV_write        : std_logic;
    signal FFT_write        : std_logic;
    signal WAV_rst          : std_logic;
    signal WAV_din          : std_logic_vector(7 downto 0);
    signal WAV_wr_en        : std_logic;
    signal WAV_rd_en        : std_logic;
    signal WAV_dout         : std_logic_vector(7 downto 0);
    signal WAV_full         : std_logic;
    signal WAV_empty        : std_logic;
    signal FFT_rst          : std_logic;
    signal FFT_din          : std_logic_vector(15 downto 0);
    signal FFT_wr_en        : std_logic;
    signal FFT_rd_en        : std_logic;
    signal FFT_dout         : std_logic_vector(15 downto 0);
    signal FFT_full         : std_logic;
    signal FFT_empty        : std_logic;
    signal FIFO_read        : std_logic;
    signal FIFO_read_d      : std_logic;
    signal FIFO_dout        : std_logic_vector(7 downto 0);
    signal FIFO_dout_d      : std_logic_vector(7 downto 0);
    signal FIFO_select      : std_logic_vector(4 downto 0);
    signal FIFO_select_d    : std_logic_vector(4 downto 0);
    --  0 => WAV Byte 0
    --  1 => FFT Byte 0
    --  2 => FFT Byte 1
    --  3 => VU Byte 0
    -- High => Header frame
    signal cnt_header       : unsigned(2 downto 0);
    signal cnt_header_zero  : std_logic;
    signal cnt_header_dec   : std_logic;
    signal cnt_header_set   : std_logic;
    signal cnt_vu           : unsigned(3 downto 0);
    signal cnt_vu_end       : std_logic;
    signal cnt_vu_dec       : std_logic;
    signal cnt_vu_set       : std_logic;
    signal FIFO_open        : std_logic;
    signal VU_dout          : std_logic_vector(7 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Name mapping
    --------------------------------------------------------------------------------
    clk <= clk_216;

    ----------------------------------------------------------------
    -- INSTANCE : U_FIFO_WAV
    -- Description : Contains the 1280 last samples read
    ----------------------------------------------------------------
    U_FIFO_WAV : FIFO_8bit_2048 port map(
        rst     => WAV_rst,
        wr_clk  => clk_108,
        rd_clk  => clk,
        din     => WAV_din,
        wr_en   => WAV_wr_en,
        rd_en   => WAV_rd_en,
        dout    => WAV_dout,
        full    => WAV_full,
        empty   => WAV_empty);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : FIFOs signal mapping
    --------------------------------------------------------------------------------
    WAV_rst     <= NOT reset_n;
    WAV_din     <= WAV_push(WAV_push'high-1 downto 0);
    WAV_wr_en   <= WAV_write AND FIFO_open;
    WAV_rd_en   <= FIFO_read AND FIFO_select_d(0);

    ----------------------------------------------------------------
    -- INSTANCE : U_FIFO_WAV
    -- Description : Contains the 1024 last samples read
    ----------------------------------------------------------------
    U_FIFO_FFT : FIFO_16bit_1024 port map(
        rst     => FFT_rst,
        wr_clk  => clk_108,
        rd_clk  => clk,
        din     => FFT_din,
        wr_en   => FFT_wr_en,
        rd_en   => FFT_rd_en,
        dout    => FFT_dout,
        full    => FFT_full,
        empty   => FFT_empty);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : FIFOs signal mapping
    --------------------------------------------------------------------------------
    FFT_rst     <= NOT reset_n;
    FFT_din     <= FFT_push(FFT_push'high-1 downto 0);
    FFT_wr_en   <= FFT_write AND FIFO_open;
    FFT_rd_en   <= FIFO_read AND FIFO_select_d(2);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Enable signal mapping
    --------------------------------------------------------------------------------
    WAV_write   <= WAV_push(WAV_push'high);
    FFT_write   <= FFT_push(FFT_push'high);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_VU_dout
    -- Description : Register input signal
    --------------------------------------------------------------------------------
    P_VU_dout : process(clk, reset_n)
    begin
        if(reset_n='0') then
            VU_dout <= (others => '0');
        elsif(rising_edge(clk)) then
            VU_dout <= "000" & VU_push(to_integer(cnt_vu(2 downto 0))*5+4 downto to_integer(cnt_vu(2 downto 0))*5);
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg_input
    -- Description : Register input signal
    --------------------------------------------------------------------------------
    P_reg_input : process(clk, reset_n)
    begin
        if(reset_n='0') then
            PSH_start   <= '0';
        elsif(rising_edge(clk)) then
            PSH_start   <= VGA_new_frame;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg_FIFO_select
    -- Description : Register FIFO_select selection signal
    --------------------------------------------------------------------------------
    P_reg_FIFO_select : process(clk, reset_n)
    begin
        if(reset_n='0') then
            FIFO_select_d <= (others => '0');
        elsif(rising_edge(clk)) then
            FIFO_select_d <= FIFO_select;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : FIFO output selection
    --------------------------------------------------------------------------------
     FIFO_dout  <= WAV_dout                 when(FIFO_select_d(0)='1') else
                   FFT_dout(7 downto 0)     when(FIFO_select_d(1)='1') else
                   FFT_dout(15 downto 8)    when(FIFO_select_d(2)='1') else
                   VU_dout                  when(FIFO_select_d(3)='1') else
                   X"AA"                    when(FIFO_select_d(FIFO_select_d'high)='1') else
                   X"00";

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg_output
    -- Description : Register FIFO output and UART_send
    --------------------------------------------------------------------------------
    P_reg_output : process(clk, reset_n)
    begin
        if(reset_n='0') then
            FIFO_dout_d <= (others => '0');
            UART_din    <= (others => '0');
            FIFO_read_d <= '0';
            UART_send   <= '0';
        elsif(rising_edge(clk)) then
            FIFO_dout_d <= FIFO_dout;
            UART_din    <= FIFO_dout_d;
            FIFO_read_d <= FIFO_read;
            UART_send   <= FIFO_read_d;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_cnt_header
    -- Description : Counter 3->0
    --------------------------------------------------------------------------------
    P_cnt_header : process(clk, reset_n)
    begin
        if(reset_n='0') then
            cnt_header  <= (others => '1');
        elsif(rising_edge(clk)) then
            if(cnt_header_set='1') then
                cnt_header  <= (others => '1');
            elsif(cnt_header_dec='1') then
                cnt_header  <= cnt_header - 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : FIFOs cnt_header_dec
    --------------------------------------------------------------------------------
    cnt_header_dec  <= FIFO_read AND FIFO_select_d(FIFO_select_d'high);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_cnt_header_zero
    -- Description : Counter is zero
    --------------------------------------------------------------------------------
    P_cnt_header_zero : process(clk, reset_n)
    begin
        if(reset_n='0') then
            cnt_header_zero <= '0';
        elsif(rising_edge(clk)) then
            if(cnt_header=0) then
                cnt_header_zero <= '1';
            else
                cnt_header_zero <= '0';
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_cnt_vu
    -- Description : Counter 3->0
    --------------------------------------------------------------------------------
    P_cnt_vu : process(clk, reset_n)
    begin
        if(reset_n='0') then
            cnt_vu  <= (others => '1');
        elsif(rising_edge(clk)) then
            if(cnt_vu_set='1') then
                cnt_vu  <= "0111";
            elsif(cnt_vu_dec='1') then
                cnt_vu  <= cnt_vu - 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : FIFOs cnt_vu_dec
    --------------------------------------------------------------------------------
    cnt_vu_dec  <= FIFO_read AND FIFO_select_d(3);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_cnt_vu_end
    -- Description : Counter is zero
    --------------------------------------------------------------------------------
    P_cnt_vu_end : process(clk, reset_n)
    begin
        if(reset_n='0') then
            cnt_vu_end  <= '0';
        elsif(rising_edge(clk)) then
            if(cnt_vu(cnt_vu'high)='1') then
                cnt_vu_end  <= '1';
            else
                cnt_vu_end  <= '0';
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_FSM_PSH_sync
    -- Description : FSM_PSH sequential part (current_state logic)
    --------------------------------------------------------------------------------
    P_FSM_PSH_sync : process(clk, reset_n)
    begin
        if(reset_n='0') then
            current_state   <= PSH_RESET0;
            mem_state       <= PSH_RESET0;
        elsif(rising_edge(clk)) then
            current_state   <= next_state;
            mem_state       <= return_state;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMB PROCESS : P_FSM_PSH_comb
    -- Description : FSM_PSH combinatorial part (next_state logic)
    --------------------------------------------------------------------------------
    P_FSM_PSH_comb : process(current_state, mem_state, PSH_start, UART_busy, WAV_write, WAV_empty, FFT_empty, cnt_header_zero, cnt_vu_end)
    begin
        FIFO_read       <= '0';
        FIFO_select     <= (others => '0');
        return_state    <= mem_state;
        PSH_done        <= '0';
        FIFO_open       <= '0';
        cnt_header_set  <= '0';
        cnt_vu_set      <= '0';

        case current_state is
            when PSH_RESET0 =>
                if(PSH_start='1') then
                    next_state  <= PSH_RESET1;
                else
                    next_state  <= PSH_RESET0;
                end if;

            when PSH_RESET1 =>
                if(PSH_start='1') then
                    next_state  <= PSH_IDLE;
                else
                    next_state  <= PSH_RESET1;
                end if;

            when PSH_IDLE =>
                cnt_header_set  <= '1';
                cnt_vu_set      <= '1';
                if(PSH_start='1') then
                    next_state  <= PSH_WAIT_SAMPLE;
                else
                    next_state  <= PSH_IDLE;
                end if;

            when PSH_WAIT_SAMPLE =>     -- Wait for samples to start coming
                FIFO_open   <= '1';
                if(WAV_write='1') then
                    next_state  <= PSH_LOAD_SAMPLE;
                else
                    next_state  <= PSH_WAIT_SAMPLE;
                end if;

            when PSH_LOAD_SAMPLE =>     -- Wait for samples to end coming
                FIFO_open   <= '1';
                if(WAV_write='0') then
                    next_state  <= PSH_WAIT_WAV;
                else
                    next_state  <= PSH_LOAD_SAMPLE;
                end if;

            when PSH_SEND_UART =>
                FIFO_read   <= '1';
                next_state  <= PSH_WAIT_UART;

            when PSH_WAIT_UART =>
                if(UART_busy='1') then
                    next_state  <= mem_state;
                else
                    next_state  <= PSH_WAIT_UART;
                end if;

            when PSH_WAIT_WAV =>
                FIFO_select <= (0 => '1', others => '0');
                if(WAV_empty='1') then
                    next_state      <= PSH_WAIT_FFT_B0;
                elsif(UART_busy='0') then
                    next_state      <= PSH_SEND_UART;
                    return_state    <= PSH_WAIT_WAV;
                else
                    next_state      <= PSH_WAIT_WAV;
                end if;

            when PSH_WAIT_FFT_B0 =>
                FIFO_select <= (1 => '1', others => '0');
                if(FFT_empty='1') then
                    next_state      <= PSH_WAIT_VU;
                elsif(UART_busy='0') then
                    next_state      <= PSH_SEND_UART;
                    return_state    <= PSH_WAIT_FFT_B1;
                else
                    next_state      <= PSH_WAIT_FFT_B0;
                end if;

            when PSH_WAIT_FFT_B1 =>
                FIFO_select <= (2 => '1', others => '0');
                if(UART_busy='0') then
                    next_state      <= PSH_SEND_UART;
                    return_state    <= PSH_WAIT_FFT_B0;
                else
                    next_state      <= PSH_WAIT_FFT_B1;
                end if;

            when PSH_WAIT_VU =>
                FIFO_select <= (3 => '1', others => '0');
                if(cnt_vu_end='1') then
                    next_state      <= PSH_WAIT_HEADER;
                elsif(UART_busy='0') then
                    next_state      <= PSH_SEND_UART;
                    return_state    <= PSH_WAIT_VU;
                else
                    next_state      <= PSH_WAIT_VU;
                end if;

            when PSH_WAIT_HEADER =>
                FIFO_select <= (FIFO_select'high => '1', others => '0');
                if(cnt_header_zero='1') then
                    next_state      <= PSH_END;
                elsif(UART_busy='0') then
                    next_state      <= PSH_SEND_UART;
                    return_state    <= PSH_WAIT_HEADER;
                else
                    next_state      <= PSH_WAIT_HEADER;
                end if;

            when PSH_END =>
                PSH_done    <= '1';
                next_state  <= PSH_IDLE;

        end case;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------