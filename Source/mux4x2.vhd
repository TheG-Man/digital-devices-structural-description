library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity MUX4x2 is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           s : in STD_LOGIC;
           f : out STD_LOGIC_VECTOR (1 downto 0));
end MUX4x2;

architecture Behavioral of MUX4x2 is
begin
	f <= a when s = '0' else b;
end Behavioral;

architecture Structural of MUX4x2 is
component MUX2 is
	Port (a, b, s : in STD_LOGIC;
			f : out STD_LOGIC);
end component;
begin
	U0 : MUX2 PORT MAP (a => a(0), b => b(0), s => s, f => f(0));
	U1 : MUX2 PORT MAP (a => a(1), b => b(1), s => s, f => f(1));
end Structural;

