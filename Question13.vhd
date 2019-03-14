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

entity Question13 is
    Port ( clk, X1, X2: in STD_LOGIC;
           CS, RD, Y3, Y2, Y1 : out STD_LOGIC);
end Question13;

architecture Behavioral of Question13 is
    type state is (a, b, c);
    signal current_state : state := a;
    signal next_state : state := a;
begin

state_transition : process(clk, next_state)
begin
    if(rising_edge(clk)) then
        current_state <= next_state;
    end if;
end process;

main : process(current_state, X1, X2)
begin
   
        case current_state is
            when a =>
                if(X1 = '0') then
                    CS <= '1';
                    RD <= '0';
                    next_state <= c;
                elsif(X1 = '1') then
                    CS <= '0';
                    RD <= '1';
                    next_state <= b;
                else
                    next_state <= current_state;
                end if;
                --State
                Y3 <= '0';
                Y2 <= '0';
                Y1 <= '1';                
            when b =>
                next_state <= c;
                CS <= '1';
                RD <= '1';
                
                --State
                Y3 <= '0';
                Y2 <= '1';
                Y1 <= '0';
            when c =>
                if(X2 = '0') then
                    CS <= '0';
                    RD <= '0';
                    next_state <= a;
                elsif(X2 = '1') then
                    CS <= '0';
                    RD <= '1';
                else
                    next_state <= current_state;
                end if;
                --State
                Y3 <= '1';
                Y2 <= '0';
                Y1 <= '0';
            when others =>
                next_state <= current_state;
        end case;

end process;


end Behavioral;
