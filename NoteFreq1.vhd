library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity NoteFreq1 is
    Port (
        -- output dari Decoder KYPD
      NoteValue1 : in STD_LOGIC_VECTOR (3 downto 0);
       clk1 : in STD_LOGIC; -- clock dari board 100MHz
      FreqOut1 : out STD_LOGIC
        ); -- output ke speaker
end NoteFreq1;

architecture Behavioral of NoteFreq1 is
    signal counter: integer := 0;
    signal temp_out : STD_LOGIC := '0';
    signal note : STD_LOGIC_VECTOR(3 downto 0);
begin
    process(clk1, note)
    begin
        if rising_edge(clk1) then
            case note is
                when "0000" => -- untuk not C3
                    if counter >= 382219 then -- 100MHz / 382219  = 261.63 Hz (C3)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0001" => -- untuk not C#3/Db3
                    if counter >= 360776 then -- 100MHz / 360776 = 277.18 Hz (C#3/Db3)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0010" => -- untuk not D3
                    if counter >= 340530 then -- 100MHz / 340530 = 293.66 Hz (D3)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0011" => -- untuk not D#3/Eb3
                    if counter >= 321409 then -- 100MHz / 321409 = 311.13 Hz (D#3/Eb3)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0100" => -- untuk not E3
                    if counter >= 303370 then -- 100MHz / 303370 = 329.63 Hz (E3)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0101" => -- untuk not F3
                    if counter >= 303370 then -- 100MHz / 303370 = 349.23 Hz (F3)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0110" => -- untuk not F#3/Gb3
                    if counter >= 270277 then -- 100MHz / 270277 = 369.99 Hz (F#3/Gb3)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "0111" => -- untuk not G3
                    if counter >= 255102 then -- 100MHz / 255102 = 392.00 Hz (G3)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "1000" => -- untuk not G#3/Ab3
                    if counter >= 240790 then -- 100MHz / 240790  = 415.30 Hz (G#3/Ab3)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "1001" => -- untuk not A3
                    if counter >= 227273 then -- 100MHz / 227273 = 440.00 Hz (A3)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "1010" => -- untuk not A#3/Bb3
                    if counter >= 214518 then -- 100MHz / 214518 = 466.16 Hz (A#3/Bb3)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "1011" => -- untuk not B3
                    if counter >= 202478 then -- 100MHz / 202478  = 493.88 Hz (B3)
                        counter <= 0;
                        temp_out <= not temp_out;
                    else
                        counter <= counter + 1;
                    end if;
                when "1100" => -- untuk not C4
                    if counter >= 191113 then -- 100MHz / 191113 = 523.25 Hz (C4)
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
    FreqOut1 <= temp_out;

    with NoteValue1 select
        note <=  "0000" when "0001",  -- 1 = C3
                 "0001" when "0010",  -- 2 = C#3/Db3
                 "0010" when "0011",  -- 3 = D3
                 "0011" when "0100",  -- 4 = D#3/Eb3
                 "0100" when "0101",  -- 5 = E3
                 "0101" when "0110",  -- 6 = F3
                 "0110" when "0111",  -- 7 = F#3/Gb3
                 "0111" when "1000",  -- 8 = G3
                 "1000" when "1001",  -- 9 = G#3/Ab3
                 "1001" when "1010",  -- 10 = A3
                 "1010" when "1011",  -- 11 = A#3/Bb3
                 "1011" when "1100",  -- 12 = B3
                 "1100" when "1101",  -- 13 = C4
                 "1101" when others;  -- Default = silence
end Behavioral;