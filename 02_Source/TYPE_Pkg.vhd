--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : TYPE_Pkg.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-30
-- Last update: 2019-10-31
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: TYPE package
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-09-26  1.0      Hugo HARTMANN   Creation
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package TYPE_Pkg is

    constant C_FIR_MIN : integer := 0;
    constant C_FIR_MAX : integer := 5;
    type FIR_tab is array (C_FIR_MIN to C_FIR_MAX) of std_logic_vector(7 downto 0);
    type VU_tab is array (C_FIR_MIN to C_FIR_MAX) of std_logic_vector(4 downto 0);

end TYPE_Pkg;
