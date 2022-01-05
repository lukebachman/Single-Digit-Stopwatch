----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2019 10:48:00 PM
-- Design Name: 
-- Module Name: stopwatch - Behavioral
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

entity stopwatch is
    Port ( watch_start : in STD_LOGIC;
           watch_stop : in STD_LOGIC;
           watch_inc : in STD_LOGIC;
           watch_clk : in STD_LOGIC;
           watch_rst : in STD_LOGIC;
           watch_output : out STD_LOGIC_VECTOR (6 downto 0));
end stopwatch;

architecture Behavioral of stopwatch is

component clk_divider
     Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           clkout : out STD_LOGIC);
end component;

component controller
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           start : in STD_LOGIC;
           stop : in STD_LOGIC;
           inc : in STD_LOGIC;
           run : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component counter
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           cen : in STD_LOGIC_VECTOR ( 3 downto 0);
           b : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component decoder
    Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal output_signal_controller: STD_LOGIC_VECTOR(3 downto 0);
signal output_signal_counter: STD_LOGIC_VECTOR(3 downto 0);
signal output_signal_clkdiv: STD_LOGIC;
signal input_signal_decoder: STD_LOGIC_VECTOR(3 downto 0);
begin

module_a_inst: clk_divider
port map(
    clk => watch_clk,
    rst => watch_rst,
    clkout => output_signal_clkdiv
);

module_b_inst: controller
port map(
    start => watch_start,
    stop => watch_stop,
    inc => watch_inc,
    clk => output_signal_clkdiv,
    rst => watch_rst,
    run => output_signal_controller
);

module_c_inst: counter
port map(
    cen => output_signal_controller,
    clk => output_signal_clkdiv, 
    rst => watch_rst,
    b => input_signal_decoder
);

module_d_inst: decoder
port map(
    Input => input_signal_decoder,
    Output => watch_output
);
    

end Behavioral;
