----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/16/2019 11:19:25 PM
-- Design Name: 
-- Module Name: tb_controller - Behavioral
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

entity tb_controller is
end tb_controller;

architecture Behavioral of tb_controller is
    component controller is
          Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           start : in STD_LOGIC;
           stop : in STD_LOGIC;
           inc : in STD_LOGIC;
           run : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    --input signals
    signal clk, rst, start, stop, inc : STD_LOGIC;
    --output signal
    signal run : STD_LOGIC_VECTOR(3 downto 0);
begin
    dut: controller port map(
        clk => clk,
        rst => rst,
        start => start,
        stop => stop,
        inc => inc,
        run => run );
process -- CLK generator 20 ns period
begin 
    clk <= '0';
    wait for 10ns;
    clk <= '1';
    wait for 10ns;
end process;

process --Tests for proper output logic on Stopwatch FSM
begin
    --Start at original state
    rst <= '1';
    wait for 10ns;
    rst <= '0';
    wait for 10ns;
    
    --Test state st_stop
    stop <= '1';
    wait for 10 ns;
    stop <= '0';
    start <= '1';
    wait for 10ns;
    start <= '0';
    
    --Test state st_count
    stop <= '1';
    wait for 10ns;
    stop <= '0';
    inc <= '1';
    wait for 10ns;
    inc <= '0';
    wait for 10ns;
    
    --Test state st_lap
    inc <= '0';
    wait for 10ns;

end process;
end Behavioral;
