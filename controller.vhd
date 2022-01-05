----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/16/2019 10:23:22 PM
-- Design Name: 
-- Module Name: controller - Behavioral
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

entity controller is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           start : in STD_LOGIC;
           stop : in STD_LOGIC;
           inc : in STD_LOGIC;
           run : out STD_LOGIC_VECTOR(3 downto 0));
end controller;

architecture Behavioral of controller is
--define the states using a type statement
type myStates_t is (
    st_stop,
    st_count,
    st_lap
);
--Create a signal that uses the different states
signal state : mystates_t;
begin
process( clk, rst)
begin
    if(rst = '1') then
        state <= st_stop;
        run <= "0000";
    elsif(rising_edge(clk)) then
        case state is
            when st_stop =>
                if(start = '1') then
                    state <= st_count;
                else
                    state <= st_stop;
                end if;
                run <= "0000";
             when st_lap =>
                if(inc = '0') then
                    state <= st_count;
                else
                    state <= st_lap;
                end if;
                run <= "1111";
             when st_count =>
                 if( stop = '1') then
                    state <= st_stop;
                 elsif( inc = '1') then
                    state <= st_lap;
                 else
                    state <= st_count;
                 end if;
                 run <= "1111";
             when others =>
             state <= st_stop;
             run <= "0000";
          end case;
      end if; --rising-edge of CLK
  end process;
                
end Behavioral;
