library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity MUX2 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : in  STD_LOGIC;
           f : out  STD_LOGIC);
end MUX2;

architecture Behavioral of MUX2 is
begin
	f <= a when s = '0' else b;
end Behavioral;

architecture Structural of MUX2 is
component INV is
	Port (I : in STD_LOGIC;
			O : out STD_LOGIC);
end component;

component OR2 is
	Port (I0, I1 : in STD_LOGIC;
			O : out STD_LOGIC);
end component;

component AND2 is
	Port (I0, I1 : in STD_LOGIC;
			O : out STD_LOGIC);
end component;

signal s_inv : STD_LOGIC;
signal s_and0, s_and1 : STD_LOGIC;
begin
	U0 : INV PORT MAP (I => s, O => s_inv);
	U1 : AND2 PORT MAP (I0 => a, I1 => s_inv, O => s_and0);
	U2 : AND2 PORT MAP (I0 => b, I1 => s, O => s_and1);
	U3 : OR2 PORT MAP (I0 => s_and0, I1 => s_and1, O => f);
end Structural;
