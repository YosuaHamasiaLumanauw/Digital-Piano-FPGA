library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

entity Mux is
    Port (
        a1      : in  std_logic;
        a2      : in std_logic; 
        a3      : in std_logic;
        sel     : in  std_logic_vector (1 downto 0);
        b       : out std_logic
  );
end Mux;

architecture Behavioral of Mux is

begin
    process (sel, a1, a2, a3)
    begin
        case sel is
        when "00" => 
            b <= a1;
        when "01" => 
            b <= a2;
        when "10" =>
            b <= a3;
        when others =>
            b <= '0';
    end case;
    end process;
end Behavioral;