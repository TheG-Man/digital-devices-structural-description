library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity FULL_ADDER2 is
    Port ( PC : in  STD_LOGIC;
           I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           F : out  STD_LOGIC;
           C : out  STD_LOGIC);
end FULL_ADDER2;

architecture Structural of FULL_ADDER2 is
component OR2 is
	Port (I0, I1 : in STD_LOGIC;
			O : out STD_LOGIC);
end component;

component ADDER2 is
	Port (I0, I1 : in STD_LOGIC;
			F, C : out STD_LOGIC);
end component;

signal s_sum0, s_carry0, s_carry1: STD_LOGIC;
begin
	U0 : ADDER2 PORT MAP (I0 => I0, I1 => I1, F => s_sum0, C => s_carry0);
	U1 : ADDER2 PORT MAP (I0 => s_sum0, I1 => PC, F => F, C => s_carry1);
	U2 : OR2 PORT MAP (I0 => s_carry0, I1 => s_carry1, o => C);
end Structural;

