library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity demux1x4 is
    Port ( A0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
           X : in  STD_LOGIC;
           F0, F1, F2, F3 : out  STD_LOGIC);
end demux1x4;

architecture Behavioral of demux1x4 is
begin
	F0 <= X and (not A0) and (not A1);
	F1 <= X and (not A0) and A1;
	F2 <= X and A0 and (not A1);
	F3 <= X and A0 and A1;
end Behavioral;

architecture Structural of demux1x4 is
component INV is
	Port (I : in STD_LOGIC;
			O : out STD_LOGIC);
end component;

component AND3 is
	Port (I0, I1, I2 : in STD_LOGIC;
			O : out STD_LOGIC);
end component;

signal s_inv0, s_inv1 : STD_LOGIC;
begin
	U0 : INV PORT MAP (I => A0, O => s_inv0);
	U1 : INV PORT MAP (I => A1, O => s_inv1);
	U2 : AND3 PORT MAP (I0 => A0, I1 => A1, I2 => x, O => F3);
	U3 : AND3 PORT MAP (I0 => A0, I1 => s_inv1, I2 => x, O => F2);
	U4 : AND3 PORT MAP (I0 => s_inv0, I1 => A1, I2 => x, O => F1);
	U5 : AND3 PORT MAP (I0 => s_inv0, I1 => s_inv1, I2 => x, O => F0);
end Structural;

