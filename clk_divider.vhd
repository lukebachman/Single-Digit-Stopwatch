----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2019 06:59:23 PM
-- Design Name: 
-- Module Name: CLK_Divider - Behavioral
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

--Clock Divider Example was sourced from 
--https://reference.digilentinc.com/_media/textbooks/realdigital_module_10.pdf

--This clock divider steps down 100MHz to 1Hz
entity clk_divider is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           clkout : out STD_LOGIC);
end clk_divider;

architecture Behavioral of clk_divider is
-- 100 MHz "101111101011110000100000000"
-- 100 MHz hex "5F5E100"
constant cntendval : STD_LOGIC_VECTOR(26 downto 0) := "101111101011110000100000000";
signal cntval : STD_LOGIC_VECTOR(26 downto 0);

begin

process(clk, rst)
    begin
    if rst = '1' then cntval <= "000000000000000000000000000"; 
    elsif (rising_edge(clk)) then
        if (cntval = cntendval) then cntval <= "000000000000000000000000000"; 
            else cntval <= cntval + 1;
            end if;
        end if;
end process;
end Behavioral;
