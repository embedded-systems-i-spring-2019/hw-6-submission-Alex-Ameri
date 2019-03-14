----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2019 01:53:10 PM
-- Design Name: 
-- Module Name: Question4 - Behavioral
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

entity Question4 is
    Port ( clk, X1, X2, INIT : in STD_LOGIC;
           Z1, Z2 : out STD_LOGIC);
end Question4;

architecture Behavioral of Question4 is
    type state is (a, b, c);
    signal current_state : state := a;
    signal next_state : state := a;
begin

state_transition : process(clk, next_state,  INIT)
begin
    if (INIT = '1') then
        current_state <= a;
    elsif(rising_edge(clk)) then
        current_state <= next_state;
    end if;
end process;

main : process(current_state, X1, X2)
begin

        case current_state is
            when a =>
                Z1 <= '0';
                if(X1 = '0') then
                    Z2 <= '0';
                    next_state <= c;
                elsif (X1 = '1') then
                    Z2 <= '1';
                    next_state <= b;
                else
                    next_state <= a;
                end if;
            when b =>
                Z1 <= '1';
                if(X2 = '1') then
                    Z2 <= '0';
                    next_state <= a;
                elsif (X2 = '0') then
                    Z2 <= '1';
                    next_state <= c;
                else
                    next_state <= b;
                end if;            
            when c =>
                Z1 <= '1';
                if(X1 = '0') then
                    Z2 <= '1';
                    next_state <= a;
                elsif (X1 = '1') then
                    Z2 <= '1';
                    next_state <= b;
                else
                    next_state <= c;
                end if;   
            when others =>
                next_state <= current_state;
        end case;

end process;


end Behavioral;
