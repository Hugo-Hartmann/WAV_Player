-------------------------------------------------------------------------------
--  This entire design, which includes all of the components and related files,
--  has been created and owned by : ELSYS DESIGN
--  © Propriété de ELSYS DESIGN
--  Reproduction et divulgation interdites / DiSCLosure and copy prohibited.
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : FFT_Adder.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-11-19
-- Last update: 2019-11-21
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Complex Add/Sub for FFT module
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-11-19  1.0      Hugo HARTMANN   Creation
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
entity FFT_Adder is
    generic(
        G_OPERAND_SIZE  : integer := 16;
        G_SUB_EN        : boolean := false
        );
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- FFT out --------------------------
        FFT_dout_r      : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);
        FFT_dout_i      : out std_logic_vector(G_OPERAND_SIZE-1 downto 0);

        ------- FFT control ----------------------
        FFT_en          : in  std_logic;
        FFT_done        : out std_logic;

        ------- FFT in ---------------------------
        FFT_dinA_r      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
        FFT_dinA_i      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
        FFT_dinB_r      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0);
        FFT_dinB_i      : in  std_logic_vector(G_OPERAND_SIZE-1 downto 0)

        );
end FFT_Adder;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of FFT_Adder is

    --------------------------------------------------------------------------------
    -- CONSTANT DECLARATIONS
    --------------------------------------------------------------------------------
    constant C_SIZE : integer   := G_OPERAND_SIZE;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal FFT_en_d     : std_logic;
    signal opA_r        : unsigned(C_SIZE-1 downto 0);
    signal opA_i        : unsigned(C_SIZE-1 downto 0);
    signal opB_r        : unsigned(C_SIZE-1 downto 0);
    signal opB_i        : unsigned(C_SIZE-1 downto 0);
    signal Cin_r        : unsigned(C_SIZE-1 downto 0);
    signal Cin_i        : unsigned(C_SIZE-1 downto 0);
    signal Add_out_r    : unsigned(C_SIZE-1 downto 0);
    signal Add_out_i    : unsigned(C_SIZE-1 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_input
    -- Description : Register data with proper format (div2 and rounding in one operation)
    --------------------------------------------------------------------------------
    P_input : process(clk, reset_n)
    begin
        if(reset_n='0') then
            FFT_en_d    <= '0';
            opA_r       <= (others => '0');
            opA_i       <= (others => '0');
            opB_r       <= (others => '0');
            opB_i       <= (others => '0');
            Cin_r       <= (others => '0');
            Cin_i       <= (others => '0');
        elsif(rising_edge(clk)) then
            FFT_en_d    <= FFT_en;
            opA_r       <= FFT_dinA_r(C_SIZE-1) & unsigned(FFT_dinA_r(C_SIZE-1 downto 1));
            opA_i       <= FFT_dinA_i(C_SIZE-1) & unsigned(FFT_dinA_i(C_SIZE-1 downto 1));
            opB_r       <= FFT_dinB_r(C_SIZE-1) & unsigned(FFT_dinB_r(C_SIZE-1 downto 1));
            opB_i       <= FFT_dinB_i(C_SIZE-1) & unsigned(FFT_dinB_i(C_SIZE-1 downto 1));
            Cin_r       <= (0 => FFT_dinA_r(0) OR FFT_dinB_r(0), others => '0');
            Cin_i       <= (0 => FFT_dinA_i(0) OR FFT_dinB_i(0), others => '0');
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Addition/Substraction
    --------------------------------------------------------------------------------
    ADD : if G_SUB_EN=false generate
        Add_out_r   <= opA_r + opB_r + Cin_r;
        Add_out_i   <= opA_i + opB_i + Cin_i;
    end generate;

    SUB : if G_SUB_EN=true generate
        Add_out_r   <= opA_r - opB_r + Cin_r;
        Add_out_i   <= opA_i - opB_i + Cin_i;
    end generate;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_output
    -- Description : Register outputs
    --------------------------------------------------------------------------------
    P_output : process(clk, reset_n)
    begin
        if(reset_n='0') then
            FFT_dout_r  <= (others => '0');
            FFT_dout_i  <= (others => '0');
            FFT_done    <= '0';
        elsif(rising_edge(clk)) then
            FFT_dout_r  <= std_logic_vector(Add_out_r);
            FFT_dout_i  <= std_logic_vector(Add_out_i);
            FFT_done    <= FFT_en_d;
        end if;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------