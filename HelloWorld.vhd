----------------------------------------------------------------------------------
-- Company: UMSNH/BUAP
-- Engineer: Luis Villasenor
-- 
-- Create Date: 04/11/2016 10:32:32 AM
-- Design Name: Hello World  
-- Module Name: HelloWorld - Behavioral
-- Project Name: Binary counter at 1Hz
-- Target Devices: xc7z010clg400-1
-- Tool Versions: 
-- Description: Hello World code in VHDL for the Red Pitaya 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;


entity HelloWorld is
    Port ( clk_p_i : in STD_LOGIC;
           clk_n_i : in STD_LOGIC;
           led_o : out STD_LOGIC_VECTOR (7 downto 0));
end HelloWorld;

architecture Behavioral of HelloWorld is

-- Signals
signal  counter_27  : std_logic_vector(26 downto 0) := (others => '0');
signal  counter_8  : std_logic_vector(7 downto 0) := (others => '0');
signal  clk_o,clk_125MHz, clk_1Hz : std_logic;


begin

-- IBUFDS: Differential Input Buffer
IBUFDS_inst : IBUFDS
generic map (
IOSTANDARD => "LVDS_25")
port map (
    O => clk_o, -- Clock buffer output
        I => clk_p_i, -- Diff_p clock buffer input (connect to top-level port)
        IB => clk_n_i); -- Diff_n clock buffer input (connect directly to top-level port)

-- IBUFG: Buffer 
IBUFG_inst : IBUFG      
port map ( 
  I => clk_o, 
  O => clk_125MHz); 
  
-- Clock divider by 125000000
process (clk_125MHz)                
begin       
  if clk_125MHz = '1' and clk_125MHz'Event then 
    if to_integer (unsigned(counter_27))=125000000 then
        counter_27 <= (others => '0');          
    else
      counter_27 <= counter_27 + "1";
    end if;
    if to_integer (unsigned(counter_27))<125000000/2 then
        clk_1Hz <= '0';
    else
        clk_1Hz <= '1';
    end if;
  end if;
end process;

-- 8-bit binary counter
process (clk_1Hz)                
begin   
  if clk_1Hz = '1' and clk_1Hz'Event then 
    if counter_8 = "11111111" then
        counter_8 <= (others => '0');          
    else
        counter_8 <= counter_8 + "1";
    end if;
  end if;
end process;

-- Binary counter dispayed by the 8 LEDs
led_o <= counter_8;


end Behavioral;
