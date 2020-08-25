-------------------------------------------------------------------------------
-- Title      : 
-- Project    : WAV_Player
-------------------------------------------------------------------------------
-- File       : NRM_Mapper.vhd
-- Author     : Hugo HARTMANN
-- Company    : ELSYS DESIGN
-- Created    : 2020-08-04
-- Last update: 2020-08-25
-- Platform   : Notepad++
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Correctly maps FFT addresses based on FFT number of points
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2020-08-04  1.0      Hugo HARTMANN   Creation
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
entity NRM_Mapper is
    port(

        ------- Clock and RESET ------------------
        clk             : in  std_logic;                        -- clock
        reset_n         : in  std_logic;                        -- reset_n

        ------- NRM interface --------------------
        NRM_rounds_nb   : in  std_logic_vector(3 downto 0);
        NRM_en          : in  std_logic;
        NRM_din         : in  std_logic_vector(15 downto 0);
        NRM_dout        : out std_logic_vector(15 downto 0);
        NRM_addr_map    : out std_logic_vector(10 downto 0);
        NRM_addr_valid  : out std_logic

        );
end NRM_Mapper;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
architecture RTL of NRM_Mapper is

    --------------------------------------------------------------------------------
    -- TYPE DECLARATIONS
    --------------------------------------------------------------------------------
    type T_EN is array (0 to 1) of std_logic;
    type T_DATA is array (0 to 1) of std_logic_vector(15 downto 0);

    --------------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    --------------------------------------------------------------------------------
    signal NRM_en_d         : T_EN;
    signal NRM_data_d       : T_DATA;
    signal counter_addr     : unsigned(10 downto 0);
    signal addr_offset      : unsigned(10 downto 0);
    signal base_addr        : unsigned(10 downto 0);
    signal addr_map         : unsigned(10 downto 0);
    signal final_addr       : unsigned(10 downto 0);
    signal nb_points        : unsigned(3 downto 0);
    signal cnt_addr_end     : std_logic;
    signal cnt_addr_end_d   : std_logic;

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
            NRM_en_d(0) <= NRM_en;
            for i in 1 to NRM_en_d'high loop
                NRM_en_d(i) <= NRM_en_d(i-1);
            end loop;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_NRM_data_d
    -- Description : Enable pipeline
    --------------------------------------------------------------------------------
    P_NRM_data_d : process(clk, reset_n)
    begin
        if(reset_n='0') then
            for i in 0 to NRM_data_d'high loop
                NRM_data_d(i)   <= (others => '0');
            end loop;
        elsif(rising_edge(clk)) then
            NRM_data_d(0)   <= NRM_din;
            for i in 1 to NRM_data_d'high loop
                NRM_data_d(i)   <= NRM_data_d(i-1);
            end loop;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : End control pipeline mapping 
    --------------------------------------------------------------------------------
    NRM_addr_valid  <= NRM_en_d(NRM_en_d'high);
    NRM_dout        <= NRM_data_d(NRM_data_d'high);

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_counter_addr
    -- Description : Counter to determine addr addresses
    --------------------------------------------------------------------------------
    P_counter_addr : process(clk, reset_n)
    begin
        if(reset_n='0') then
            counter_addr    <= to_unsigned(0, counter_addr'length);
        elsif(rising_edge(clk)) then
            if(NRM_en='0') then
                counter_addr    <= to_unsigned(0, counter_addr'length);
            else
                if(cnt_addr_end='1') then
                    counter_addr    <= to_unsigned(0, counter_addr'length);
                else
                    counter_addr    <= counter_addr + 1;
                end if;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_cnt_addr_end
    -- Description : Counter to determine cnt_addr end
    --------------------------------------------------------------------------------
    P_cnt_addr_end : process(clk, reset_n)
    begin
        if(reset_n='0') then
            cnt_addr_end    <= '0';
            cnt_addr_end_d  <= '0';
        elsif(rising_edge(clk)) then
            cnt_addr_end_d  <= cnt_addr_end;
            if(unsigned(NRM_rounds_nb)=10 and counter_addr=1022) then
                cnt_addr_end    <= '1';
            elsif(unsigned(NRM_rounds_nb)=9 and counter_addr=510) then
                cnt_addr_end    <= '1';
            elsif(unsigned(NRM_rounds_nb)=8 and counter_addr=254) then
                cnt_addr_end    <= '1';
            elsif(unsigned(NRM_rounds_nb)=7 and counter_addr=126) then
                cnt_addr_end    <= '1';
            elsif(unsigned(NRM_rounds_nb)=6 and counter_addr=62) then
                cnt_addr_end    <= '1';
            elsif(unsigned(NRM_rounds_nb)=5 and counter_addr=30) then
                cnt_addr_end    <= '1';
            elsif(unsigned(NRM_rounds_nb)=4 and counter_addr=14) then
                cnt_addr_end    <= '1';
            elsif(unsigned(NRM_rounds_nb)=3 and counter_addr=6) then
                cnt_addr_end    <= '1';
            elsif(unsigned(NRM_rounds_nb)=2 and counter_addr=2) then
                cnt_addr_end    <= '1';
            else
                cnt_addr_end    <= '0';
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_offset_select
    -- Description : Select addr offset
    --------------------------------------------------------------------------------
    P_offset_select : process(clk, reset_n)
    begin
        if(reset_n='0') then
            addr_offset <= to_unsigned(0, addr_offset'length);
        elsif(rising_edge(clk)) then
            if(unsigned(NRM_rounds_nb)=10) then
                addr_offset <= to_unsigned(1024, addr_offset'length);
            elsif(unsigned(NRM_rounds_nb)=9) then
                addr_offset <= to_unsigned(512, addr_offset'length);
            elsif(unsigned(NRM_rounds_nb)=8) then
                addr_offset <= to_unsigned(256, addr_offset'length);
            elsif(unsigned(NRM_rounds_nb)=7) then
                addr_offset <= to_unsigned(128, addr_offset'length);
            elsif(unsigned(NRM_rounds_nb)=6) then
                addr_offset <= to_unsigned(64, addr_offset'length);
            elsif(unsigned(NRM_rounds_nb)=5) then
                addr_offset <= to_unsigned(32, addr_offset'length);
            elsif(unsigned(NRM_rounds_nb)=4) then
                addr_offset <= to_unsigned(16, addr_offset'length);
            elsif(unsigned(NRM_rounds_nb)=3) then
                addr_offset <= to_unsigned(8, addr_offset'length);
            elsif(unsigned(NRM_rounds_nb)=2) then
                addr_offset <= to_unsigned(4, addr_offset'length);
            else
                addr_offset <= to_unsigned(0, addr_offset'length);
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_base_addr
    -- Description : Base address computation
    --------------------------------------------------------------------------------
    P_base_addr : process(clk, reset_n)
    begin
        if(reset_n='0') then
            base_addr   <= to_unsigned(0, base_addr'length);
        elsif(rising_edge(clk)) then
            if(NRM_en='0') then
                base_addr   <= to_unsigned(0, base_addr'length);
            elsif(cnt_addr_end_d='1') then
                base_addr   <= base_addr + addr_offset;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_nb_points
    -- Description : nb_points mapping
    --------------------------------------------------------------------------------
    P_nb_points : process(clk, reset_n)
    begin
        if(reset_n='0') then
            nb_points   <= to_unsigned(0, nb_points'length);
        elsif(rising_edge(clk)) then
            nb_points   <= unsigned(NRM_rounds_nb)-1;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_mapping
    -- Description : Map LSBs to correct addresses based on FFT current size
    --------------------------------------------------------------------------------
    P_mapping : process(clk, reset_n)
    begin
        if(reset_n='0') then
            addr_map    <= to_unsigned(0, addr_map'length);
        elsif(rising_edge(clk)) then
            if(nb_points=10) then
                for i in 0 to 10 loop
                    addr_map(i) <= counter_addr(10-i);
                end loop;
            elsif(nb_points=0) then
                addr_map    <= counter_addr;
            else

                for k in 1 to 9 loop
                    if(nb_points=k) then
                        for i in 0 to k loop
                            addr_map(i) <= counter_addr(k-i);
                        end loop;
                        addr_map(addr_map'high downto k+1)  <= (addr_map'high downto k+1 => '0');
                    end if;
                end loop;

            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- SEQ PROCESS : P_final_addr
    -- Description : Full computation
    --------------------------------------------------------------------------------
    P_final_addr : process(clk, reset_n)
    begin
        if(reset_n='0') then
            final_addr  <= to_unsigned(0, counter_addr'length);
        elsif(rising_edge(clk)) then
            final_addr  <= base_addr + addr_map;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- COMBINATORY :
    -- Description : final address mapping
    --------------------------------------------------------------------------------
    NRM_addr_map    <= std_logic_vector(final_addr);

end RTL;
--------------------------------------------------------------------------------
-- END OF THE CODE
--------------------------------------------------------------------------------