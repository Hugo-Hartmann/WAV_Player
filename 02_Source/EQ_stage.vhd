-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : EQ_stage.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-05
-- Last update: 2019-12-19
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
        EQ_select       : in  std_logic_vector(3 downto 0);
        EQ_vol_up       : in  std_logic;
        EQ_vol_down     : in  std_logic;

        ------- EQ in --------------------------
        EQ_din_band     : in  std_logic_vector(C_FIR_MAX*16+15 downto 0);
        EQ_din          : in  std_logic_vector(15 downto 0);
        
        ------- EQ out --------------------------
        EQ_dout         : out std_logic_vector((C_FIR_MAX+2)*16+15 downto 0);
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
    type T_EQ_sum is array (C_FIR_MIN to C_FIR_MAX+1) of std_logic_vector(18 downto 0);
    type T_EQ_din is array (C_FIR_MIN to C_FIR_MAX) of std_logic_vector(15 downto 0);
    type T_EQ_dout is array (C_FIR_MIN to C_FIR_MAX+2) of std_logic_vector(15 downto 0);
    type T_EQ_level is array (C_FIR_MIN to C_FIR_MAX+2) of std_logic_vector(4 downto 0);
    type T_EQ_done is array (C_FIR_MIN to C_FIR_MAX) of std_logic;
    type T_EQ_sum_done is array (C_FIR_MIN to C_FIR_MAX+1) of std_logic;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component EQ_volume_ctrl is
        port(
            clk             : in  std_logic;
            reset_n         : in  std_logic;
            EQ_select       : in  std_logic_vector(3 downto 0);
            EQ_vol_up       : in  std_logic;
            EQ_vol_down     : in  std_logic;
            EQ_level_dout   : out std_logic_vector((C_FIR_MAX+2)*5+4 downto 0)
            );
    end component;

    component EQ_volume is
        port(
            clk         : in  std_logic;
            reset_n     : in  std_logic;
            EQ_en       : in  std_logic;
            EQ_sum_en   : in  std_logic;
            EQ_level    : in  std_logic_vector(4 downto 0);
            EQ_done     : out std_logic;
            EQ_sum_done : out std_logic;
            EQ_din      : in  std_logic_vector(15 downto 0);
            EQ_sum_din  : in  std_logic_vector(18 downto 0);
            EQ_dout     : out std_logic_vector(15 downto 0);
            EQ_sum_dout : out std_logic_vector(18 downto 0)
            );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal EQ_level_dout_net    : std_logic_vector((C_FIR_MAX+2)*5+4 downto 0);
    signal EQ_level_tab         : T_EQ_level;
    signal EQ_din_tab           : T_EQ_din;
    signal EQ_sum_tab           : T_EQ_sum;
    signal EQ_dout_tab          : T_EQ_dout;
    signal EQ_done_tab          : T_EQ_done;
    signal EQ_sum_done_tab      : T_EQ_sum_done;
    signal EQ_sum_out           : std_logic_vector(18 downto 0);
    signal EQ_sum_sat           : std_logic_vector(15 downto 0);
    signal EQ_sum_en            : std_logic;
    signal EQ_en_d              : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS :
    -- Description : EQ_en reg
    --------------------------------------------------------------------------------
    process(reset_n, clk)
    begin
        if(reset_n='0') then
            EQ_en_d <= '0';
        elsif(rising_edge(clk)) then
            EQ_en_d <= EQ_en;
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : EQ_volume_ctrl
    -- Description : 6 Channel audio equalizer volume controller
    ----------------------------------------------------------------
    U_EQ_volume_ctrl : EQ_volume_ctrl port map(
        clk             => clk,
        reset_n         => reset_n,
        EQ_select       => EQ_select,
        EQ_vol_up       => EQ_vol_up,
        EQ_vol_down     => EQ_vol_down,
        EQ_level_dout   => EQ_level_dout_net);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_EQ_level_dout
    -- Description : EQ_level_dout
    --------------------------------------------------------------------------------
    P_EQ_level_dout : process(reset_n, clk)
    begin
        if(reset_n='0') then
            EQ_level_dout   <= (others => '0');
        elsif(rising_edge(clk)) then
            EQ_level_dout   <= EQ_level_dout_net;
        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : EQ_volume_input
    -- Description : 1 Channel audio volume controller
    ----------------------------------------------------------------
    U_EQ_volume_input : EQ_volume port map(
        clk         => clk,
        reset_n     => reset_n,
        EQ_en       => EQ_en_d,
        EQ_sum_en   => '0',
        EQ_level    => EQ_level_tab(0),
        EQ_done     => open,
        EQ_sum_done => open,
        EQ_din      => EQ_din,
        EQ_sum_din  => (others => '0'),
        EQ_dout     => EQ_dout_tab(0),
        EQ_sum_dout => open);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Tab generation
    --------------------------------------------------------------------------------
    process(EQ_din_band)
    begin
        for i in C_FIR_MIN to C_FIR_MAX loop
            EQ_din_tab(i)   <= EQ_din_band(i*16+15 downto i*16);
        end loop;
    end process;

    process(EQ_level_dout_net)
    begin
        for i in C_FIR_MIN to C_FIR_MAX+2 loop
            EQ_level_tab(i)   <= EQ_level_dout_net(i*5+4 downto i*5);
        end loop;
    end process;

    EQ_sum_tab(0)       <= (others => '0');
    EQ_sum_done_tab(0)  <= EQ_done_tab(0);

    ----------------------------------------------------------------
    -- INSTANCE : EQ_volume
    -- Description : 6 Channel audio volume controller
    ----------------------------------------------------------------
    GEN_EQ : for i in C_FIR_MIN to C_FIR_MAX generate
        U_EQ_volume : EQ_volume port map(
            clk         => clk,
            reset_n     => reset_n,
            EQ_en       => EQ_en_d,
            EQ_sum_en   => EQ_sum_done_tab(i),
            EQ_level    => EQ_level_tab(i+1),
            EQ_done     => EQ_done_tab(i),
            EQ_sum_done => EQ_sum_done_tab(i+1),
            EQ_din      => EQ_din_tab(i),
            EQ_sum_din  => EQ_sum_tab(i),
            EQ_dout     => EQ_dout_tab(i+1),
            EQ_sum_dout => EQ_sum_tab(i+1));
    end generate GEN_EQ;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Sum mapping
    --------------------------------------------------------------------------------
    EQ_sum_out  <= EQ_sum_tab(C_FIR_MAX+1);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS :
    -- Description : Saturation
    --------------------------------------------------------------------------------
    process(reset_n, clk)
    begin
        if(reset_n='0') then
            EQ_sum_sat  <= (others => '0');
            EQ_sum_en   <= '0';
        elsif(rising_edge(clk)) then
            if(EQ_sum_out(18 downto 15)="0000" or EQ_sum_out(18 downto 15)="1111") then
                EQ_sum_sat  <= EQ_sum_out(15 downto 0);
            elsif(EQ_sum_out(18)='0') then
                EQ_sum_sat  <= X"7FFF";
            else
                EQ_sum_sat  <= X"8000";
            end if;

            EQ_sum_en   <= EQ_sum_done_tab(C_FIR_MAX+1);

        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : EQ_volume_output
    -- Description : 1 Channel audio volume controller
    ----------------------------------------------------------------
    U_EQ_volume_output : EQ_volume port map(
        clk         => clk,
        reset_n     => reset_n,
        EQ_en       => EQ_sum_en,
        EQ_sum_en   => '0',
        EQ_level    => EQ_level_tab(C_FIR_MAX+2),
        EQ_done     => open,
        EQ_sum_done => open,
        EQ_din      => EQ_sum_sat,
        EQ_sum_din  => (others => '0'),
        EQ_dout     => EQ_dout_tab(C_FIR_MAX+2),
        EQ_sum_dout => open);

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Output mapping
    --------------------------------------------------------------------------------
    process(EQ_dout_tab)
    begin
        for i in C_FIR_MIN to C_FIR_MAX+2 loop
            EQ_dout(i*16+15 downto i*16)    <= EQ_dout_tab(i);
        end loop;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------