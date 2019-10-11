library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity AND5_Custom is
    Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
           Z : out  STD_LOGIC);
end AND5_Custom;

architecture Behavioral of AND5_Custom is
begin
	Z <= A(0) and A(1) and A(2) and A(3) and A(4);
end Behavioral;

architecture Structural of AND5_Custom is
component AND2 is
	Port (I0, I1 : in STD_LOGIC;
			O : out STD_LOGIC);
end component;

signal s_and : STD_LOGIC_VECTOR(3 downto 0);
begin
	U0 : AND2 port map (I0 => A(0), I1 => A(1), O => s_and(0));
	GEN : for i in 1 to 3 generate
		GEN_U : AND2 port map (I0 => A(i + 1), I1 => s_and(i - 1), O => s_and(i));
	end generate;
	Z <= s_and(3);
end Structural;
