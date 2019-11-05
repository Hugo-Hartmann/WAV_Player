-------------------------------------------------------------------------------
--  This entire design, which includes all of the components and related files,
--  has been created and owned by : ELSYS DESIGN
--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : EQ_stage.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-05
-- Last update: 2019-11-05
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 6 Channel audio equalizer
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-11-05 1.0      Hugo HARTMANN   Creation
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
entity EQ_stage is
    generic(
        G_BEHAVIOURAL   : boolean := false
        );
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- EQ control ----------------------
        EQ_en           : in  std_logic;
        sw              : in  std_logic_vector(3 downto 0);
        EQ_vol_up       : in  std_logic;
        EQ_vol_down     : in  std_logic;

        ------- EQ in --------------------------
        FIR_dout        : in  std_logic_vector(C_FIR_MAX*8+7 downto 0);
        RAM_dout        : in  std_logic_vector(7 downto 0);
        
        ------- EQ out --------------------------
        EQ_dout         : out std_logic_vector((C_FIR_MAX+2)*8+7 downto 0);
        EQ_level_dout   : out std_logic_vector((C_FIR_MAX+2)*5+4 downto 0)

        );
end EQ_stage;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of EQ_stage is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type EQ_STATE is (EQ_RESET, EQ_IDLE, EQ_STORE,
                      EQ_PIPE1, EQ_PIPE2, EQ_PIPE3);

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component ROM_32_16bit
        port (
            a   : in std_logic_vector(4 downto 0);
            spo : out std_logic_vector(15 downto 0)
            );
    end component;

    component EQ_volume_ctrl is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            sw              : in  std_logic_vector(3 downto 0);
            EQ_vol_up       : in  std_logic;
            EQ_vol_down     : in  std_logic;
            EQ_level_dout   : out std_logic_vector((C_FIR_MAX+2)*5+4 downto 0)
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
    signal current_state        : EQ_STATE;
    signal next_state           : EQ_STATE;
    signal counter_channel      : unsigned(7 downto 0);
    signal cnt_channel_end      : std_logic;
    signal cnt_channel_inc      : std_logic;
    signal cnt_channel_clr      : std_logic;
    signal EQ_level_dout_net    : std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
    signal ROM_out              : std_logic_vector(15 downto 0);
    signal Volume_coef          : std_logic_vector(16 downto 0);
    signal Volume_data          : std_logic_vector(7 downto 0);
    signal EQ_addr              : std_logic_vector(4 downto 0);
    signal mult_opA             : std_logic_vector(7 downto 0);
    signal mult_opB             : std_logic_vector(16 downto 0);
    signal mult_out             : std_logic_vector(24 downto 0);
    signal mult_out_d           : std_logic_vector(24 downto 0);
    signal data_in              : std_logic_vector((C_FIR_MAX+2)*8+7 downto 0);
    signal data_store           : std_logic;
    signal sat_out              : std_logic_vector(7 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    ----------------------------------------------------------------
    -- INSTANCE : U_Mult
    -- Description : 8x17 Signed multiplier
    ----------------------------------------------------------------
    U_Mult : Multiplier generic map(
        G_OPERAND_A_SIZE    => 8,
        G_OPERAND_B_SIZE    => 17,
        G_MULT_OUT_SIZE     => 25)
    port map(
        clk         => clk,
        reset_n     => reset_n,
        enable      => '1',
        opA         => mult_opA,
        opB         => mult_opB,
        mult_out    => mult_out);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_Mult_reg
    -- Description : Register Multiplier inputs and outputs
    --------------------------------------------------------------------------------
    P_Mult_reg : process(clk, reset_n)
    begin
        if(reset_n='0') then
            mult_opA    <= (others => '0');
            mult_opB    <= (others => '0');
            mult_out_d  <= (others => '0');
        elsif(rising_edge(clk)) then
            mult_opA    <= std_logic_vector(unsigned(Volume_data)-128);
            mult_opB    <= Volume_coef;
            mult_out_d  <= mult_out;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Saturation
    --------------------------------------------------------------------------------
    process(mult_out_d)
    begin
        if(mult_out_d(24 downto 19)="000000" or mult_out_d(24 downto 19)="111111") then
            sat_out <= mult_out_d(19 downto 12);
        elsif(mult_out_d(24)='0') then
            sat_out <= X"7F";
        else
            sat_out <= X"80";
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_ROM
    -- Description : Contains coefficient for volume control
    ----------------------------------------------------------------
    ROM0 : if G_BEHAVIOURAL=false generate
        U_ROM : ROM_32_16bit port map(
            a   => EQ_addr,
            spo => ROM_out);
    end generate;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : EQ_addr generation and data selection
    --------------------------------------------------------------------------------
    process(counter_channel, EQ_level_dout_net, data_in)
    
    variable index : integer := 0;
    
    begin
        if(unsigned(counter_channel)>C_FIR_MAX+2-1) then
            index := 0;
        else
            index := to_integer(unsigned(counter_channel));
        end if;

        EQ_addr     <= EQ_level_dout_net(index*5+4 downto index*5);
        Volume_data <= data_in(index*8+7 downto index*8);

    end process;

    ----------------------------------------------------------------
    -- INSTANCE : EQ_volume_ctrl
    -- Description : 6 Channel audio equalizer volume controller
    ----------------------------------------------------------------
    U_EQ_volume_ctrl : EQ_volume_ctrl port map(
        clk             => clk,
        reset_n         => reset_n,
        sw              => sw,
        EQ_vol_up       => EQ_vol_up,
        EQ_vol_down     => EQ_vol_down,
        EQ_level_dout   => EQ_level_dout_net);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : EQ_level_dout_net
    --------------------------------------------------------------------------------
    EQ_level_dout   <= EQ_level_dout_net;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_fetch
    -- Description : Fetch coefficient from ROM
    --------------------------------------------------------------------------------
    P_fetch : process(clk, reset_n)
    begin
        if(reset_n='0') then
            Volume_coef <= (others => '0');
        elsif(rising_edge(clk)) then
            Volume_coef <= '0' & ROM_out;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_reg
    -- Description : Fetch coefficient from ROM
    --------------------------------------------------------------------------------
    P_reg : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in data_in'range loop
                data_in <= (others => '0');
            end loop;
        elsif(rising_edge(clk)) then
            data_in(7 downto 0) <= RAM_dout;
            for i in C_FIR_MIN to C_FIR_MAX loop
                data_in((i+1)*8+7 downto (i+1)*8)  <= FIR_dout(i*8+7 downto i*8);
            end loop;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_store
    -- Description : Store results
    --------------------------------------------------------------------------------
    P_store : process(clk, reset_n)
    
    variable index : integer := 0;
    
    begin

        if(unsigned(counter_channel)>C_FIR_MAX+2-1) then
            index := 0;
        else
            index := to_integer(unsigned(counter_channel));
        end if;

        if(reset_n='0') then
            EQ_dout <= (others => '0');
        elsif(rising_edge(clk)) then
            if(data_store='1') then
                EQ_dout(index*8+7 downto index*8)   <= std_logic_vector(unsigned(sat_out)+128);
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter_channel
    -- Description : Counter for keeping track of channels in FSM
    --------------------------------------------------------------------------------
    P_counter_channel : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter_channel <= to_unsigned(0, counter_channel'length);
        elsif(rising_edge(clk)) then
            if(cnt_channel_clr='1') then
                counter_channel <= to_unsigned(0, counter_channel'length);
            elsif(cnt_channel_inc='1') then
                counter_channel <= counter_channel + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : cnt_channel_end
    --------------------------------------------------------------------------------
    cnt_channel_end <= '1' when(counter_channel=C_FIR_MAX+2) else '0';

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_FSM_EQ_sync
    -- Description : FSM_EQ sequential part (current_state logic)
    --------------------------------------------------------------------------------
    P_FSM_EQ_sync : process(clk, reset_n)
    begin
        if(reset_n='0') then
            current_state   <= EQ_RESET;
        elsif(rising_edge(clk)) then
            current_state   <= next_state;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMB PROCESS : P_FSM_EQ_comb
    -- Description : FSM_EQ combinatorial part (next_state logic)
    --------------------------------------------------------------------------------
    P_FSM_EQ_comb : process(current_state, cnt_channel_end, EQ_en)
    begin
    cnt_channel_clr <= '0';
    cnt_channel_inc <= '0';
    data_store      <= '0';

        case current_state is
            when EQ_RESET =>
                next_state  <= EQ_IDLE;

            when EQ_IDLE =>
                cnt_channel_clr <= '1';
                if(EQ_en='1') then
                    next_state  <= EQ_PIPE1;
                else
                    next_state  <= EQ_IDLE;
                end if;

            when EQ_PIPE1 =>
                next_state      <= EQ_PIPE2;

            when EQ_PIPE2 =>
                next_state      <= EQ_PIPE3;

            when EQ_PIPE3 =>
                next_state      <= EQ_STORE;

            when EQ_STORE =>
                cnt_channel_inc <= '1';
                data_store      <= '1';
                if(cnt_channel_end='1') then
                    next_state  <= EQ_IDLE;
                else
                    next_state  <= EQ_PIPE1;
                end if;

        end case;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------