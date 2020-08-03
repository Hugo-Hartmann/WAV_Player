-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : TYPE_Pkg.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-10-30
-- Last update: 2020-08-03
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
    constant C_FIR_MAX : integer := 8; -- Number of FIR Band filters
    constant C_FIR_TOT : integer := 10; -- Number of FIR filters + Input and Output

end TYPE_Pkg;
