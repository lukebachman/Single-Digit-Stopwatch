----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/16/2019 10:06:51 PM
-- Design Name: 
-- Module Name: counter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--Binary Counter Example was sourced from 
--https://reference.digilentinc.com/_media/textbooks/realdigital_module_10.pdf
entity counter is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           cen : in STD_LOGIC_VECTOR ( 3 downto 0);
           b : out STD_LOGIC_VECTOR (3 downto 0));
end counter;

architecture Behavioral of counter is

begin

process (clk, rst)
    begin
    if rst = '1' then b <= "0000";
     elsif (rising_edge(clk)) then
        b <= cen + 1;
     end if;
end process;
end Behavioral;
