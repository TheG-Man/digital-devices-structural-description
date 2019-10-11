library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity combinational_scheme is
    Port ( w : in  STD_LOGIC;
			  x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : in  STD_LOGIC;
           f : out  STD_LOGIC);
end combinational_scheme;

architecture Behavioral of combinational_scheme is
begin
	f <= (not (((not w) or x) and y)) and (not ((not w) or x or (not y))) and (not (w or z));
end Behavioral;

architecture Structural of combinational_scheme is
component INV is
	Port (I : in STD_LOGIC;
			O : out STD_LOGIC);
end component;

component OR2B2 is
	Port (I0, I1 : in STD_LOGIC;
			O : out STD_LOGIC);
end component;

component AND2 is
	Port (I0, I1 : in STD_LOGIC;
			O : out STD_LOGIC);
end component;

component AND3 is
	Port (I0, I1, I2 : in STD_LOGIC;
			O : out STD_LOGIC);
end component;

component NOR2 is
	Port (I0, I1 : in STD_LOGIC;
			O : out STD_LOGIC);
end component;

component NOR3 is
	Port (I0, I1, I2 : in STD_LOGIC;
			O : out STD_LOGIC);
end component;

signal s_inv0, s_inv1, s_inv2 : STD_LOGIC;
signal s_or2b2 : STD_LOGIC;
signal s_and2 : STD_LOGIC;
signal s_nor2 : STD_LOGIC;
signal s_nor3 : STD_LOGIC;

begin
	U0 : INV PORT MAP (I => x, O => s_inv0);
	U1 : INV PORT MAP (I => w, O => s_inv1);
	U2 : INV PORT MAP (I => y, O => s_inv2);
	U3 : OR2B2 PORT MAP (I0 => s_inv0, I1 => w, O => s_or2b2);
	U4 : AND2 PORT MAP (I0 => y, I1 => s_or2b2, O => s_and2);
	U5 : NOR3 PORT MAP (I0 => s_inv2, I1 => x, I2 => s_inv1, O => s_nor3);
	U6 : NOR2 PORT MAP (I0 => z, I1 => w, O => s_nor2);
	U7 : AND3 PORT MAP (I0 => s_nor2, I1 => s_nor3, I2 => s_and2, O => f);
end Structural;


