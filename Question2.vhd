----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2019 10:15:10 PM
-- Design Name: 
-- Module Name: Question2 - Behavioral
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

entity Question2 is
    Port ( clk : in STD_LOGIC;
           X1 : in STD_LOGIC;
           X2 : in STD_LOGIC;
           Z : out STD_LOGIC;
           Y1, Y0 : out STD_LOGIC);
end Question2;

architecture Behavioral of Question2 is
    type state is (a, b, c);
    signal current_state, next_state : state := a;
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
                Y1 <= '1';
                Y0 <= '0';
                if(X1 = '0') then
                    Z <= '0';
                    next_state <= a;
                elsif (X1 = '1') then
                    Z <= '0';
                    next_state <= c;
                else
                    next_state <= a;
                end if;
            when b =>
                Y1 <= '1';
                Y0 <= '1';
                if(X2 = '1') then
                    Z <= '0';
                    next_state <= b;
                elsif (X2 = '0') then
                    Z <= '1';
                    next_state <= a;
                else
                    next_state <= b;
                end if;            
            when c =>
                Y1 <= '0';
                Y0 <= '1';
                if(X2 = '0') then
                    Z <= '1';
                    next_state <= a;
                elsif (X2 = '1') then
                    Z <= '0';
                    next_state <= b;
                else
                    next_state <= c;
                end if;   
            when others =>
                next_state <= current_state;
        end case;

end process;


end Behavioral;
