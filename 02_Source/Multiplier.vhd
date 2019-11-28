-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : Multiplier.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-28
-- Last update: 2019-10-28
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: signed multiplier
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

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
entity Multiplier is
    generic(
        G_OPERAND_A_SIZE    : INTEGER := 5;
        G_OPERAND_B_SIZE    : INTEGER := 5;
        G_MULT_OUT_SIZE     : INTEGER := 10
        );
    port(
        ------- Clock and RESET ------------------
        clk          : in  std_logic;                      -- clock
        reset_n      : in  std_logic;                      -- reset_n
        
        ------- enable ---------------------------
        enable       : in  std_logic;                      -- enable multiplier
        
        ------- operands -------------------------
        opA          : in  std_logic_vector(G_OPERAND_A_SIZE-1 downto 0);  -- operand A
        opB          : in  std_logic_vector(G_OPERAND_B_SIZE-1 downto 0);  -- operand B
        mult_out     : out std_logic_vector(G_MULT_OUT_SIZE-1 downto 0)    -- result
        );
end Multiplier;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of Multiplier is

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin
    
    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Signed multiplication
    --------------------------------------------------------------------------------
    mult_out <= std_logic_vector(signed(opA)*signed(opB));

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------