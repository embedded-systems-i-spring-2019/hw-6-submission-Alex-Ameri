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

entity Question6 is
    Port ( clk, X: in STD_LOGIC;
           Z1, Z2 : out STD_LOGIC;
           State: out STD_LOGIC_VECTOR (1 downto 0));
end Question6;

architecture Behavioral of Question6 is
    type state_type is (zero, one, two, three);
    signal current_state : state_type;
    signal next_state : state_type;
begin

--Tell the world what state we're in
with current_state select
    State <= "00" when zero,
             "01" when one,
             "10" when two,
             "11" when three,
             "00" when others;
             
--Assign one of the outputs
--Tell the world what state we're in
with current_state select
       Z1 <= '1' when zero,
             '0' when one,
             '1' when two,
             '0' when three,
             '0' when others;


state_transition : process(clk, next_state)
begin
    if(rising_edge(clk)) then
        current_state <= next_state;
    end if;
end process;


main : process(current_state, X)
begin

        case current_state is
            when zero =>
                if (X = '1') then
                    next_state <= zero;
                    Z2 <= '0';
                elsif (X = '0') then
                    next_state <= two;
                    Z2 <= '0';
                end if;
            when one =>
                if (X = '1') then
                    next_state <= one;
                    Z2 <= '0';
                elsif (X = '0') then
                    next_state <= three;
                    Z2 <= '0';
                end if;                  
            when two =>
                if (X = '1') then
                    next_state <= zero;
                    Z2 <= '0';
                elsif (X = '0') then
                    next_state <= one;
                    Z2 <= '0';
                end if;                 
            when three =>
                if (X = '1') then
                    next_state <= one;
                    Z2 <= '0';
                elsif (X = '0') then
                    next_state <= zero;
                    Z2 <= '1';
                end if;              
            when others =>
                next_state <= current_state;
        end case;

end process;


end Behavioral;
