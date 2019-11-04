-------------------------------------------------------------------------------
--  This entire design, which includes all of the components and related files,
--  has been created and owned by : ELSYS DESIGN
--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : Equalizer.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-04
-- Last update: 2019-11-04
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 6 Channel audio equalizer
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-11-04 1.0      Hugo HARTMANN   Creation
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
entity Equalizer is
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- EQ control ----------------------
        EQ_en           : in  std_logic;

        ------- EQ in ---------------------------
        EQ_din          : in  std_logic_vector(C_FIR_MAX*8+7 downto 0);

        ------- EQ out --------------------------
        EQ_level_dout   : out std_logic_vector(C_FIR_MAX*5+4 downto 0);
        EQ_sum_dout     : out std_logic_vector(7 downto 0);
        EQ_band_dout    : out std_logic_vector(C_FIR_MAX*8+7 downto 0)

        );
end Equalizer;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of VU_metre is

    --------------------------------------------------------------------------------
    -- TYPES DECLARATIONS
    --------------------------------------------------------------------------------
    type accu_tab is array (C_FIR_MIN to C_FIR_MAX) of unsigned(19 downto 0);
    type EQ_STATE is (VU_RESET, VU_IDLE, VU_CLEAN);


    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal current_state    : VU_STATE;
    signal next_state       : VU_STATE;
    signal SRAM_out         : FIR_tab;
    signal SRAM_in          : FIR_tab;
    signal din_conv         : FIR_tab;
    signal accu             : accu_tab;
    signal SRAM_counter     : unsigned(10 downto 0);
    signal SRAM_write       : std_logic_vector(0 downto 0);
    signal SRAM_addr        : std_logic_vector(10 downto 0);
    signal SRAM_counter_clr : unsigned(10 downto 0);
    signal cnt_clr_end      : std_logic;
    signal SRAM_clr         : std_logic;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin


    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_Accu
    -- Description : Accumulator for averaging
    --------------------------------------------------------------------------------
    P_Accu : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in C_FIR_MIN to C_FIR_MAX loop
                accu(i) <= to_unsigned(0, accu(i)'length);
            end loop;
        elsif(rising_edge(clk)) then
            if(VU_en='1' and SRAM_clr='0') then
                for i in C_FIR_MIN to C_FIR_MAX loop
                    accu(i) <= accu(i) + resize(unsigned(din_conv(i)), accu(i)'length) - resize(unsigned(SRAM_out(i)), accu(i)'length);
                end loop;
            end if;
        end if;
    end process;


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
    P_FSM_VU_comb : process(current_state, cnt_clr_end)
    begin
    SRAM_clr    <= '0';

        case current_state is
            when VU_RESET =>
                next_state  <= VU_CLEAN;

            when VU_CLEAN =>
                SRAM_clr    <= '1';
                if(cnt_clr_end='1') then
                    next_state  <= VU_IDLE;
                else
                    next_state  <= VU_CLEAN;
                end if;

            when VU_IDLE =>
                next_state  <= VU_IDLE;

        end case;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------