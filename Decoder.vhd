----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2019 11:20:06 AM
-- Design Name: 
-- Module Name: Decoder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder is
    Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (6 downto 0));
end decoder;

architecture Behavioral of decoder is
begin
	WITH Input SELECT
		Output <= 		        "0000001" WHEN "0000",	--0
								"1001111" WHEN "0001",	--1
								"0010010" WHEN "0010",	--2
								"0000110" WHEN "0011",	--3
								"1001100" WHEN "0100",	--4
								"0100100" WHEN "0101",	--5
								"0100000" WHEN "0110",	--6
								"0001111" WHEN "0111",	--7
								"0000000" WHEN "1000",	--8
								"0000100" WHEN "1001",	--9
								"0001000" WHEN "1010",  --A
                                "1100000" WHEN "1011",  --b
                                "0110001" WHEN "1100",  --C
                                "1000010" WHEN "1101",  --d
                                "0110000" WHEN "1110",  --E
                                "0111000" WHEN "1111",  --F
                                "1111111" WHEN OTHERS;	--blank when not a digit
end Behavioral;
