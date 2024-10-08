library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DecoderKYPD is
    Port (
        clk : in  STD_LOGIC;
        Row : in  STD_LOGIC_VECTOR (3 downto 0);
        Col : out  STD_LOGIC_VECTOR (3 downto 0);
        DecodeOut : out  STD_LOGIC_VECTOR (3 downto 0));
end DecoderKYPD;

architecture Behavioral of DecoderKYPD is
    signal sclk : STD_LOGIC_VECTOR(19 downto 0);
begin
    process(clk)
    begin
        if clk'event and clk = '1' then
            if sclk = "00011000011010100000" then
                Col <= "0111";
                sclk <= sclk + 1;
            elsif sclk = "00011000011010101000" then
                if Row = "0111" then
                    DecodeOut <= "0001";  -- C
                elsif Row = "1011" then
                    DecodeOut <= "0101";  -- E
                elsif Row = "1101" then
                    DecodeOut <= "1001";  -- G#
                elsif Row = "1110" then
                    DecodeOut <= "1101";  -- C
                end if;
                sclk <= sclk + 1;
            elsif sclk = "00110000110101000000" then
                Col <= "1011";
                sclk <= sclk + 1;
            elsif sclk = "00110000110101001000" then
                if Row = "0111" then
                    DecodeOut <= "0010";  -- C#
                elsif Row = "1011" then
                    DecodeOut <= "0110";  -- F
                elsif Row = "1101" then
                    DecodeOut <= "1010";  -- A
                elsif Row = "1110" then
                    DecodeOut <= "1110";  -- no notes
                end if;
                sclk <= sclk + 1;
            elsif sclk = "01001001001111100000" then
                Col <= "1101";
                sclk <= sclk + 1;
            elsif sclk = "01001001001111101000" then
                if Row = "0111" then
                    DecodeOut <= "0011";  -- D
                elsif Row = "1011" then
                    DecodeOut <= "0111";  -- F#
                elsif Row = "1101" then
                    DecodeOut <= "1011";  -- A#
                elsif Row = "1110" then
                    DecodeOut <= "1111";  -- no notes
                end if;
                sclk <= sclk + 1;
            elsif sclk = "01100001101010000000" then
                Col <= "1110";
                sclk <= sclk + 1;
            elsif sclk = "01100001101010001000" then
                if Row = "0111" then
                    DecodeOut <= "0100";  -- D#
                elsif Row = "1011" then
                    DecodeOut <= "1000";  -- G
                elsif Row = "1101" then
                    DecodeOut <= "1100";  -- B
                elsif Row = "1110" then
                    DecodeOut <= "1111";  -- no notes
                end if;
                sclk <= sclk + 1;
            elsif sclk = "01111010000100100000" then
                Col <= "0000";
                sclk <= sclk + 1;
            elsif sclk = "01111010000100101000" then
                if Row = "1111" then
                    DecodeOut <= "1110";  
                end if;
                sclk <= "00000000000000000000";
            else
                sclk <= sclk + 1;
            end if;
        end if;
    end process;

end Behavioral;