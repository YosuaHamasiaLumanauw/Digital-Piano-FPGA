library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PianoKYPD is
    Port ( 
        clkin : in  STD_LOGIC; -- clock board 100MHz
        selector: in std_logic_vector (1 downto 0);
        JB : inout  STD_LOGIC_VECTOR (7 downto 0);
        adfinal: out std_logic
        ); 
end PianoKYPD;

architecture Behavioral of PianoKYPD is
    component DecoderKYPD is
        Port (
            clk : in  STD_LOGIC;
            Row : in  STD_LOGIC_VECTOR (3 downto 0);
            Col : out  STD_LOGIC_VECTOR (3 downto 0);
            DecodeOut : out  STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component NoteFreq1 is
        Port (
           NoteValue1 : in  STD_LOGIC_VECTOR (3 downto 0);
            clk1 : in STD_LOGIC; 
            FreqOut1 : out std_logic);   
    end component;
    
    
    component NoteFreq2 is
         Port (
        NoteValue2 : in STD_LOGIC_VECTOR (3 downto 0);
        clk2 : in STD_LOGIC; -- clock dari board 100MHz
        FreqOut2 : out STD_LOGIC); -- output ke speaker
    end component;
    
    component NoteFreq3 is
         Port (
        NoteValue3 : in STD_LOGIC_VECTOR (3 downto 0);
        clk3 : in STD_LOGIC; -- clock dari board 100MHz
        FreqOut3 : out STD_LOGIC); -- output ke speaker
    end component;
    
    component Mux is
        Port (
            a1   : in  std_logic ; 
            a2   : in  std_logic ;
            a3   : in  std_logic;
            sel  : in  std_logic_vector (1 downto 0);
            b    : out std_logic
  );
    end component;

    signal Decode : STD_LOGIC_VECTOR (3 downto 0);
    signal audiofix1 : STD_LOGIC;
    signal audiofix2: std_logic;
    signal audiofix3: std_logic;
begin

    P0: DecoderKYPD port map (clk => clkin, Row => JB(7 downto 4), Col => JB(3 downto 0), DecodeOut => Decode);
    P1: NoteFreq1 port map (NoteValue1=> Decode, clk1 => clkin, FreqOut1 => audiofix1);
    P2: NoteFreq2 port map (NoteValue2=> Decode, clk2 => clkin, FreqOut2 => audiofix2);
    P3: NoteFreq3 port map (NoteValue3=> Decode, clk3 => clkin, FreqOut3 => audiofix3);
    P4: Mux port map (a1 => audiofix1  , a2 => audiofix2, a3 => audiofix3  ,sel => selector(1 downto 0) , b => adfinal);
   
end Behavioral;