-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : VU_metre.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-28
-- Last update: 2019-12-31
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Multi channel VU-metre
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
        clk         : in  std_logic;                        -- clock
        reset_n     : in  std_logic;                        -- reset_n

        ------- VU control ----------------------
        VU_start    : in  std_logic;

        ------- VU in ---------------------------
        VU_din      : in  std_logic_vector((C_FIR_MAX+2)*16+15 downto 0);

        ------- VU out --------------------------
        VU_dout     : out std_logic_vector((C_FIR_MAX+2)*5+4 downto 0)

        );
end VU_metre;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of VU_metre is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type VU_STATE is (VU_RESET, VU_CLEAN, VU_IDLE, VU_STORE, VU_ACCU);
    type T_RAM is array (0 to 7) of std_logic_vector(7 downto 0);
    type T_EN is array (0 to 3) of std_logic;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component RAM_4096_8bit
        port (
            clka    : in  std_logic;
            ena     : in  std_logic;
            wea     : in  std_logic_vector(0 downto 0);
            addra   : in  std_logic_vector(11 downto 0);
            dina    : in  std_logic_vector(7 downto 0);
            douta   : out std_logic_vector(7 downto 0)
            );
    end component;

    component VU_stage is
        port(
            clk         : in  std_logic;
            reset_n     : in  std_logic;
            VU_clr      : in  std_logic;
            VU_en       : in  std_logic;
            VU_done     : out std_logic;
            VU_din      : in  std_logic_vector(7 downto 0);
            VU_dout     : out std_logic_vector(4 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal current_state    : VU_STATE;
    signal next_state       : VU_STATE;
    signal counter_select   : unsigned(2 downto 0);
    signal cnt_select_inc   : std_logic;
    signal counter_write    : unsigned(11 downto 0);
    signal cnt_write_dec    : std_logic;
    signal cnt_write_end    : std_logic;
    signal counter_read     : unsigned(11 downto 0);
    signal cnt_read_dec     : std_logic;
    signal cnt_read_end     : std_logic;
    signal VU_din_d         : std_logic_vector((C_FIR_MAX+2)*16+15 downto 0);
    signal VU_clr           : std_logic;
    signal VU_zero          : std_logic;
    signal VU_en            : std_logic;
    signal VU_done          : std_logic;
    signal VU_write         : std_logic;
    signal VU_addr          : std_logic_vector(11 downto 0);
    signal VU_din_stage     : std_logic_vector(7 downto 0);
    signal VU_dout_stage    : std_logic_vector(4 downto 0);
    signal RAM_write        : std_logic_vector(0 downto 0);
    signal RAM_addr         : std_logic_vector(11 downto 0);
    signal RAM_out          : T_RAM;
    signal VU_en_d          : T_EN;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM
    -- Description : 4096 8-bit elements RAM
    ----------------------------------------------------------------
    GEN_RAM : for i in C_FIR_MIN to C_FIR_MAX+2 generate
        U_RAM : RAM_4096_8bit port map(
            clka    => clk,
            addra   => RAM_addr,
            wea     => RAM_write,
            ena     => '1',
            dina    => VU_din_d(i*16+15 downto i*16+8),
            douta   => RAM_out(i));
    end generate GEN_RAM;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_RAM
    -- Description : Register RAM signals
    --------------------------------------------------------------------------------
    P_RAM : process(clk, reset_n)
    begin
        if(rising_edge(clk)) then
            RAM_write       <= (0 downto 0 => VU_write);
            RAM_addr        <= VU_addr;
            VU_din_stage    <= RAM_out(to_integer(counter_select));
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_delay
    -- Description : delay enable signal for sync with RAM delay
    --------------------------------------------------------------------------------
    P_delay : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in VU_en_d'range loop
                VU_en_d(i)  <= '0';
            end loop;
        elsif(rising_edge(clk)) then
            VU_en_d(0)  <= VU_en;
            for i in 0 to VU_en_d'high-1 loop
                VU_en_d(i+1)  <= VU_en_d(i);
            end loop;
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_VU_stage
    -- Description : 4096 element VU-metre
    ----------------------------------------------------------------
    U_VU_stage : VU_stage port map(
        clk         => clk,
        reset_n     => reset_n,
        VU_clr      => VU_clr,
        VU_en       => VU_en_d(VU_en_d'high),
        VU_done     => VU_done,
        VU_din      => VU_din_stage,
        VU_dout     => VU_dout_stage);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter_select
    -- Description : Counter for selecting channel
    --------------------------------------------------------------------------------
    P_counter_select : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter_select  <= (others => '1');
        elsif(rising_edge(clk)) then
            if(cnt_select_inc='1') then
                counter_select  <= counter_select + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter_write
    -- Description : Counter for writing in RAM blocks
    --------------------------------------------------------------------------------
    P_counter_write : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter_write   <= (others => '1');
        elsif(rising_edge(clk)) then
            if(cnt_write_dec='1') then
                counter_write   <= counter_write - 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter_write_end
    -- Description :
    --------------------------------------------------------------------------------
    P_counter_write_end : process(clk, reset_n)
    begin
        if(reset_n='0') then
            cnt_write_end   <= '0';
        elsif(rising_edge(clk)) then
            if(counter_write=1) then
                cnt_write_end   <= '1';
            else
                cnt_write_end   <= '0';
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter_read
    -- Description : Counter for reading in RAM blocks
    --------------------------------------------------------------------------------
    P_counter_read : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter_read    <= (others => '1');
        elsif(rising_edge(clk)) then
            if(cnt_read_dec='1') then
                counter_read    <= counter_read - 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter_read_end
    -- Description :
    --------------------------------------------------------------------------------
    P_counter_read_end : process(clk, reset_n)
    begin
        if(reset_n='0') then
            cnt_read_end    <= '0';
        elsif(rising_edge(clk)) then
            if(counter_read=1) then
                cnt_read_end    <= '1';
            else
                cnt_read_end    <= '0';
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_din
    -- Description : Multiplex data input
    --------------------------------------------------------------------------------
    P_din : process(clk, reset_n)
    begin
        if(reset_n='0') then
            VU_din_d    <= (others => '0');
        elsif(rising_edge(clk)) then
            if(VU_zero='1') then
                VU_din_d    <= (others => '0');
            elsif(VU_start='1') then
                VU_din_d    <= VU_din;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Select VU_addr
    --------------------------------------------------------------------------------
    VU_addr <= std_logic_vector(counter_write) when(VU_write='1') else std_logic_vector(counter_read);

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
    P_FSM_VU_comb : process(current_state, VU_start, cnt_write_end, cnt_read_end)
    begin
        VU_clr          <= '0';
        VU_zero         <= '0';
        VU_en           <= '0';
        VU_write        <= '0';
        cnt_write_dec   <= '0';
        cnt_read_dec    <= '0';
        cnt_select_inc  <= '0';

        case current_state is
            when VU_RESET =>
                VU_zero     <= '1';
                next_state  <= VU_CLEAN;

            when VU_CLEAN =>
                VU_zero         <= '1';
                VU_write        <= '1';
                cnt_write_dec   <= '1';
                if(cnt_write_end='1') then
                    next_state  <= VU_IDLE;
                else
                    next_state  <= VU_CLEAN;
                end if;

            when VU_IDLE =>
                if(VU_start='1') then
                    next_state  <= VU_STORE;
                else
                    next_state  <= VU_IDLE;
                end if;

            when VU_STORE =>
                VU_clr          <= '1';
                VU_write        <= '1';
                cnt_write_dec   <= '1';
                cnt_select_inc  <= '1';
                next_state      <= VU_ACCU;

            when VU_ACCU =>
                cnt_read_dec    <= '1';
                VU_en           <= '1';
                if(cnt_read_end='1') then
                    next_state  <= VU_IDLE;
                else
                    next_state  <= VU_ACCU;
                end if;

        end case;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_dout
    -- Description : Store current VU_level to output
    --------------------------------------------------------------------------------
    P_dout : process(clk, reset_n)
    begin
        if(reset_n='0') then
            VU_dout <= (others => '0');
        elsif(rising_edge(clk)) then
            if(VU_done='1') then
                for i in C_FIR_MIN to C_FIR_MAX+2 loop
                    if(i=to_integer(counter_select)) then
                        VU_dout(5*i+4 downto 5*i) <= VU_dout_stage;
                    end if;
                end loop;
            end if;
        end if;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------