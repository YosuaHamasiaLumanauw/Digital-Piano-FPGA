library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity NoteFreq2 is
    Port (
        -- output dari Decoder KYPD
       NoteValue2 : in STD_LOGIC_VECTOR (3 downto 0);
        clk2 : in STD_LOGIC; -- clock dari board 100MHz
        FreqOut2 : out STD_LOGIC); -- output ke speaker
end NoteFreq2;

architecture Behavioral of NoteFreq2 is
    signal counter: integer := 0;
    signal temp_out : STD_LOGIC := '0';
    signal note : STD_LOGIC_VECTOR(3 downto 0);
begin
    process(clk2, note)
    begin
        if rising_edge(clk2) then
            case note is
                when "0000" => -- untuk not C4
                    if counter >= 191113 then -- 100MHz / 191113 = 523.25 Hz (C4)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0001" => -- untuk not C#4/Db4
                    if counter >= 180385 then -- 100MHz / 180385 = 554.37 Hz (C#4/Db4)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0010" => -- untuk not D4
                    if counter >= 170262 then -- 170262 / 340530 = 587.33 Hz (D4)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0011" => -- untuk not D#4/Eb4
                    if counter >= 160707 then -- 100MHz / 160707 = 622.25 Hz (D#4/Eb4)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0100" => -- untuk not E4
                    if counter >= 151687 then -- 100MHz / 151687 = 659.25 Hz (E4)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0101" => -- untuk not F4
                    if counter >= 143172 then -- 100MHz / 143172 = 698.46 Hz (F4)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0110" => -- untuk not F#4/Gb4
                    if counter >= 135137 then -- 100MHz / 135137 = 739.99 Hz (F#4/Gb4)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0111" => -- untuk not G4
                    if counter >=  127553 then -- 100MHz / 127553= 783.99 Hz (G4)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "1000" => -- untuk not G#4/Ab4
                    if counter >=  120393 then -- 100MHz / 120393 = 830.61 Hz (G#4/Ab4)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "1001" => -- untuk not A4
                    if counter >= 113636 then -- 100MHz / 113636 = 880.00 Hz (A4)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "1010" => -- untuk not A#4/Bb4
                    if counter >= 107258 then -- 100MHz / 107258 = 932.33 Hz (A#4/Bb4)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "1011" => -- untuk not B4
                    if counter >= 101238 then -- 100MHz / 101238 = 987.77 Hz (B4)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "1100" => -- untuk not C5
                    if counter >= 95557 then -- 100MHz / 95557 = 1046.50 Hz (C5)
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
    FreqOut2 <= temp_out;

    with NoteValue2 select
        note <=  "0000" when "0001",  -- 1 = C4
                 "0001" when "0010",  -- 2 = C#4/Db4
                 "0010" when "0011",  -- 3 = D4
                 "0011" when "0100",  -- 4 = D#4/Eb4
                 "0100" when "0101",  -- 5 = E4
                 "0101" when "0110",  -- 6 = F4
                 "0110" when "0111",  -- 7 = F#4/Gb4
                 "0111" when "1000",  -- 8 = G4
                 "1000" when "1001",  -- 9 = G#4/Ab4
                 "1001" when "1010",  -- 10 = A4
                 "1010" when "1011",  -- 11 = A#4/Bb4
                 "1011" when "1100",  -- 12 = B4
                 "1100" when "1101",  -- 13 = C5
                 "1101" when others;  -- Default = silence
end Behavioral;