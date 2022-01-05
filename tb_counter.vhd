----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/16/2019 11:53:07 PM
-- Design Name: 
-- Module Name: tb_counter - Behavioral
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

entity tb_counter is
end tb_counter;

architecture Behavioral of tb_counter is
    component counter is
            Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           cen : in STD_LOGIC_VECTOR(3 downto 0);
           b : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    --Input Signals
    signal clk, rst : STD_LOGIC;
    signal cen : STD_LOGIC_VECTOR(3 downto 0);
    --Output Signals
    signal b : STD_LOGIC_VECTOR (3 downto 0);
begin
    dut : counter port map(
        clk => clk,
        rst => rst,
        cen => cen,
        b => b );
process -- CLK generator 20 ns period
begin 
    clk <= '0';
    wait for 10ns;
    clk <= '1';
    wait for 10ns;
end process;
        
process 
begin
      rst <= '1';
      wait for 10 ns;
      rst <= '0';
      wait for 100 ns;
end process;  
end Behavioral;
