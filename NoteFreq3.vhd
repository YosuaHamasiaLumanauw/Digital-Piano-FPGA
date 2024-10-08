library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity NoteFreq3 is
    Port (
        -- output dari Decoder KYPD
        NoteValue3 : in STD_LOGIC_VECTOR (3 downto 0);
        clk3 : in STD_LOGIC; -- clock dari board 100MHz
        FreqOut3 : out STD_LOGIC); -- output ke speaker
       
end NoteFreq3;

architecture Behavioral of NoteFreq3 is
    signal counter: integer := 0;
    signal temp_out : STD_LOGIC := '0';
    signal note : STD_LOGIC_VECTOR(3 downto 0);
begin
    process(clk3, note)
    begin
        if rising_edge(clk3) then
            case note is
                when "0000" => -- untuk not C5
                    if counter >= 95557 then -- 100MHz / 95557 = 1046.50 Hz (C5)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0001" => -- untuk not C#5/Db5
                    if counter >= 90193 then -- 100MHz / 90193 = 1108.73 Hz (C#5/Db5)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0010" => -- untuk not D5
                    if counter >= 85131 then -- 100MHz / 85131 = 1174.66 Hz (D5)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0011" => -- untuk not D#5/Eb5
                    if counter >= 80352 then -- 100MHz / 80352 = 1244.51 Hz (D#5/Eb5)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0100" => -- untuk not E5
                    if counter >= 75843 then -- 100MHz / 75843 = 1318.51 Hz (E5)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0101" => -- untuk not F5
                    if counter >= 71586 then -- 100MHz / 71586 = 1396.91 Hz (F5)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0110" => -- untuk not F#5/Gb5
                    if counter >= 67568 then -- 100MHz / 67568 = 1479.98 Hz (F#5/Gb5)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0111" => -- untuk not G5
                    if counter >= 63776 then -- 100MHz / 63776 = 1567.98 Hz (G5)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "1000" => -- untuk not G#5/Ab5
                    if counter >=  60196 then -- 100MHz / 60196 = 1661.22 Hz (G#5/Ab5)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "1001" => -- untuk not A5
                    if counter >= 56818 then -- 100MHz / 56818 = 1760.00 Hz (A5)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "1010" => -- untuk not A#5/Bb5
                    if counter >= 53629 then -- 100MHz / 53629 = 1864.66 Hz (A#5/Bb5)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "1011" => -- untuk not B5
                    if counter >= 50619 then -- 100MHz / 50619 = 1975..53 Hz (B5)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "1100" => -- untuk not C6
                    if counter >= 47778 then -- 100MHz / 47778 = 2093.00 Hz (C6)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when others =>
                    temp_out <= '0';
                    counter <= 0;
            end case;
        end if;
    end process;
   FreqOut3 <= temp_out;

    with NoteValue3 select
        note <=  "0000" when "0001",  -- 1 = C5
                 "0001" when "0010",  -- 2 = C#5/Db5
                 "0010" when "0011",  -- 3 = D5
                 "0011" when "0100",  -- 4 = D#5/Eb5
                 "0100" when "0101",  -- 5 = E5
                 "0101" when "0110",  -- 6 = F5
                 "0110" when "0111",  -- 7 = F#5/Gb5
                 "0111" when "1000",  -- 8 = G5
                 "1000" when "1001",  -- 9 = G#5/Ab5
                 "1001" when "1010",  -- 10 = A5
                 "1010" when "1011",  -- 11 = A#5/Bb5
                 "1011" when "1100",  -- 12 = B5
                 "1100" when "1101",  -- 13 = C6
                 "1101" when others;  -- Default = silence
end Behavioral;