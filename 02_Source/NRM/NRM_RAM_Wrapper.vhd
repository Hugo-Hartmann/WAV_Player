-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : NRM_RAM_Wrapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2019-12-09
-- Last update: 2020-07-24
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Custom RAM wrapper for NRM module
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-12-09  1.0      Hugo HARTMANN   Creation
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
entity NRM_RAM_Wrapper is
    port(
    
        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- RAM_sample in --------------------
        RAM_spl_dinA_r  : in  std_logic_vector(15 downto 0);
        RAM_spl_dinA_i  : in  std_logic_vector(15 downto 0);
        RAM_spl_dinB_r  : in  std_logic_vector(15 downto 0);
        RAM_spl_dinB_i  : in  std_logic_vector(15 downto 0);

        ------- RAM_sample control ---------------
        NRM_spl_addrA_r : in  std_logic_vector(10 downto 0);
        NRM_spl_addrB_r : in  std_logic_vector(10 downto 0);
        NRM_spl_addrA_w : in  std_logic_vector(10 downto 0);
        NRM_spl_addrB_w : in  std_logic_vector(10 downto 0);
        NRM_spl_write_A : in  std_logic;
        NRM_spl_write_B : in  std_logic;

        ------- RAM_sample out -------------------
        RAM_spl_doutA_r : out std_logic_vector(15 downto 0);
        RAM_spl_doutA_i : out std_logic_vector(15 downto 0);
        RAM_spl_doutB_r : out std_logic_vector(15 downto 0);
        RAM_spl_doutB_i : out std_logic_vector(15 downto 0);

        ------- RAM_module in --------------------
        RAM_mdl_din_r   : in  std_logic_vector(15 downto 0);

        ------- RAM_module control ---------------
        NRM_mdl_addr_r  : in  std_logic_vector(10 downto 0);
        NRM_mdl_addr_w  : in  std_logic_vector(10 downto 0);
        NRM_mdl_write   : in  std_logic;

        ------- RAM_module out -------------------
        RAM_mdl_dout_r  : out std_logic_vector(15 downto 0);

        RAM_en          : in  std_logic;
        RAM_rdy         : out std_logic

        );
end NRM_RAM_Wrapper;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of NRM_RAM_Wrapper is

    --------------------------------------------------------------------------------
    -- TYPE DECLARATIONS
    --------------------------------------------------------------------------------
    type T_EN is array (0 to 2) of std_logic;

    --------------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------------------
    component BRAM_2048_32bit
        port(
            clka    : in  std_logic;
            wea     : in  std_logic_vector(0 downto 0);
            ena     : in  std_logic;
            addra   : in  std_logic_vector(10 downto 0);
            dina    : in  std_logic_vector(31 downto 0);
            douta   : out std_logic_vector(31 downto 0);
            clkb    : in  std_logic;
            web     : in  std_logic_vector(0 downto 0);
            enb     : in  std_logic;
            addrb   : in  std_logic_vector(10 downto 0);
            dinb    : in  std_logic_vector(31 downto 0);
            doutb   : out std_logic_vector(31 downto 0)
        );
    end component;

    component RAM_2048_16bit_NRM
        port (
            clka    : in  std_logic;
            wea     : in  std_logic_vector(0 downto 0);
            addra   : in  std_logic_vector(10 downto 0);
            dina    : in  std_logic_vector(15 downto 0);
            douta   : out std_logic_vector(15 downto 0)
        );
    end component;

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal NRM_en_d         : T_EN;
    signal RAM_NRM_wrA      : std_logic_vector(0 downto 0);
    signal RAM_NRM_addrA    : std_logic_vector(10 downto 0);
    signal RAM_NRM_dinA     : std_logic_vector(31 downto 0);
    signal RAM_NRM_doutA    : std_logic_vector(31 downto 0);
    signal RAM_NRM_wrB      : std_logic_vector(0 downto 0);
    signal RAM_NRM_addrB    : std_logic_vector(10 downto 0);
    signal RAM_NRM_dinB     : std_logic_vector(31 downto 0);
    signal RAM_NRM_doutB    : std_logic_vector(31 downto 0);
    signal RAM_MDL_wr       : std_logic_vector(0 downto 0);
    signal RAM_MDL_addr     : std_logic_vector(10 downto 0);
    signal RAM_MDL_din      : std_logic_vector(15 downto 0);
    signal RAM_MDL_dout     : std_logic_vector(15 downto 0);

--------------------------------------------------------------------------------
-- BEGINNING OF THE CODE
--------------------------------------------------------------------------------
begin

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_NRM_en_d
    -- Description : Enable pipeline
    --------------------------------------------------------------------------------
    P_NRM_en_d : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in 0 to NRM_en_d'high loop
                NRM_en_d(i) <= '0';
            end loop;
        elsif(rising_edge(clk)) then
            NRM_en_d(0) <= RAM_en;
            for i in 1 to NRM_en_d'high loop
                NRM_en_d(i) <= NRM_en_d(i-1);
            end loop;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : Map NRM_en_d
    --------------------------------------------------------------------------------
    RAM_rdy     <= NRM_en_d(NRM_en_d'high);

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM_Module
    -- Description : Contains 2048 modules of FFT samples
    ----------------------------------------------------------------
    U_RAM_Module : RAM_2048_16bit_NRM port map(
        clka    => clk,
        wea     => RAM_MDL_wr,
        addra   => RAM_MDL_addr,
        dina    => RAM_MDL_din,
        douta   => RAM_MDL_dout);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_RAM
    -- Description : Register all RAM signals
    --------------------------------------------------------------------------------
    P_RAM : process(clk, reset_n)
    begin
        if(reset_n='0') then
            RAM_MDL_wr      <= (others => '0');
            RAM_MDL_addr    <= (others => '0');
            RAM_MDL_din     <= (others => '0');
            RAM_mdl_dout_r  <= (others => '0');
        elsif(rising_edge(clk)) then

            if(NRM_mdl_write='0') then
                RAM_MDL_addr    <= NRM_mdl_addr_r;
            else
                RAM_MDL_addr    <= NRM_mdl_addr_w;
            end if;
            RAM_MDL_wr  <= (others => NRM_mdl_write);
            RAM_MDL_din <= RAM_mdl_din_r;

            --- Outputs
            RAM_mdl_dout_r  <= RAM_MDL_dout;

        end if;
    end process;

    ----------------------------------------------------------------
    -- INSTANCE : U_RAM_sample
    -- Description : Contains 2048 complex numbers from NRM computations
    ----------------------------------------------------------------
    U_RAM_sample : BRAM_2048_32bit port map(
        clka    => clk,
        wea     => RAM_NRM_wrA,
        ena     => '1',
        addra   => RAM_NRM_addrA,
        dina    => RAM_NRM_dinA,
        douta   => RAM_NRM_doutA,
        clkb    => clk,
        web     => RAM_NRM_wrB,
        enb     => '1',
        addrb   => RAM_NRM_addrB,
        dinb    => RAM_NRM_dinB,
        doutb   => RAM_NRM_doutB);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_BRAM
    -- Description : Register all BRAM signals
    --------------------------------------------------------------------------------
    P_BRAM : process(clk, reset_n)
    begin
        if(reset_n='0') then
            RAM_NRM_wrA     <= (others => '0');
            RAM_NRM_addrA   <= (others => '0');
            RAM_NRM_dinA    <= (others => '0');
            RAM_NRM_wrB     <= (others => '0');
            RAM_NRM_addrB   <= (others => '0');
            RAM_NRM_dinB    <= (others => '0');
            RAM_spl_doutA_r <= (others => '0');
            RAM_spl_doutA_i <= (others => '0');
            RAM_spl_doutB_r <= (others => '0');
            RAM_spl_doutB_i <= (others => '0');
        elsif(rising_edge(clk)) then

            --- Port A
            if(NRM_spl_write_A='0') then
                RAM_NRM_addrA   <= NRM_spl_addrA_r;
            else
                RAM_NRM_addrA   <= NRM_spl_addrA_w;
            end if;
            RAM_NRM_wrA     <= (others => NRM_spl_write_A);
            RAM_NRM_dinA    <= RAM_spl_dinA_r & RAM_spl_dinA_i;

            --- Port B
            if(NRM_spl_write_B='0') then
                RAM_NRM_addrB   <= NRM_spl_addrB_r;
            else
                RAM_NRM_addrB   <= NRM_spl_addrB_w;
            end if;
            RAM_NRM_wrB     <= (others => NRM_spl_write_B);
            RAM_NRM_dinB    <= RAM_spl_dinB_r & RAM_spl_dinB_i;

            --- Outputs
            RAM_spl_doutA_r <= RAM_NRM_doutA(31 downto 16);
            RAM_spl_doutA_i <= RAM_NRM_doutA(15 downto 0);

            RAM_spl_doutB_r <= RAM_NRM_doutB(31 downto 16);
            RAM_spl_doutB_i <= RAM_NRM_doutB(15 downto 0);

        end if;
    end process;

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------