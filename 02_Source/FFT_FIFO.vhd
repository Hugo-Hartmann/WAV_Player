-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : FFT_FIFO.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-21
-- Last update: 2019-11-21
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Simple FIFO
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
entity FFT_FIFO is
    generic(
        G_OPERAND_SIZE  : integer := 16;
        G_FIFO_SIZE     : integer := 2 -- (> 1)
        );
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- FFT FIFO out ---------------------
        FFT_dout        : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);

        ------- FFT FIFO in ----------------------
        FFT_din         : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0)

        );
end FFT_FIFO;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of FFT_FIFO is

    --------------------------------------------------------------------------------
    -- CONSTANT DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_SIZE : integer   := G_OPERAND_SIZE;

    --------------------------------------------------------------------------------
    -- TYPE DECLARATIONS
    --------------------------------------------------------------------------------
    type fifo is array (1 to G_FIFO_SIZE) of std_logic_vector(C_SIZE-1 downto 0);

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal shift_reg    : fifo;

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_fifo
    -- Description :
    --------------------------------------------------------------------------------
    P_fifo : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in shift_reg'range loop
                shift_reg(i)    <= (others => '0');
            end loop;
        elsif(rising_edge(clk)) then
            shift_reg(1)    <= FFT_din;
            for i in 1 to G_FIFO_SIZE-1 loop
                shift_reg(i+1)  <= shift_reg(i);
            end loop;
        end if;
    end process;

    FFT_dout    <= shift_reg(G_FIFO_SIZE);

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------