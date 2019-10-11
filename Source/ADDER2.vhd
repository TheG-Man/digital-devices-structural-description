library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity ADDER2 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           F : out  STD_LOGIC;
           C : out  STD_LOGIC);
end ADDER2;

architecture Behavioral of ADDER2 is
begin
	F <= ((not I0) and I1) or (I0 and (not I1));
	C <= I0 and I1;
end Behavioral;

architecture Structural of ADDER2 is
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

signal s_inv0, s_inv1 : STD_LOGIC;
signal s_and0, s_and1 : STD_LOGIC;
begin
	U0 : INV PORT MAP (I => I0, O => s_inv0);
	U1 : INV PORT MAP (I => I1, O => s_inv1);
	U2 : AND2 PORT MAP (I0 => I1, I1 => s_inv0, O => s_and0);
	U3 : AND2 PORT MAP (I0 => s_inv1, I1 => I0, O => s_and1);
	U4 : OR2 PORT MAP (I0 => s_and1, I1 => s_and0, O => F);
	U5 : AND2 PORT MAP (I0 => I1, I1 => I0, O => C);
end Structural;

