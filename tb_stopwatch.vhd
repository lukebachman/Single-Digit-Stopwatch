----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/19/2019 03:27:38 PM
-- Design Name: 
-- Module Name: tb_stopwatch - Behavioral
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

entity tb_stopwatch is
end tb_stopwatch;

architecture Behavioral of tb_stopwatch is
    component stopwatch is
            Port ( watch_start : in STD_LOGIC;
           watch_stop : in STD_LOGIC;
           watch_inc : in STD_LOGIC;
           watch_clk : in STD_LOGIC;
           watch_rst : in STD_LOGIC;
           watch_output : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    --input signals
    signal start, stop, inc, clk, rst : STD_LOGIC;
    --output signals
    signal output : STD_LOGIC_VECTOR(6 downto 0);
begin
    dut: stopwatch port map(
        watch_start => start,
        watch_stop => stop,
        watch_inc => inc,
        watch_clk => clk,
        watch_rst => rst,
        watch_output => output );
process --CLK Process
begin
    clk <= '0';
    wait for 10ns;
    clk <= '1';
    wait for 10ns;
end process;

process
begin
    rst <= '1';
    wait for 10ns;
    rst <= '0';
    wait for 10ns;
    
    --tests for state 1
    stop <= '1';
    stop <= '0';
    wait for 10 ns;
    start <= '1';

    wait for 10 ns;
    start <= '0';
    
    --tests for state 2
    inc <= '1';
    inc <= '0';
    wait for 10ns;
    stop <= '1';
    stop <= '0';
    
        
        
end process;
end Behavioral;
