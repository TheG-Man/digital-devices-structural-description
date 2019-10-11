library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADDER2x2 is
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           B : in  STD_LOGIC_VECTOR (1 downto 0);
           F : out  STD_LOGIC_VECTOR (1 downto 0);
           C : out  STD_LOGIC);
end ADDER2x2;

architecture Structural of ADDER2x2 is
component ADDER2 is
	Port (I0, I1 : in STD_LOGIC;
			F, C : out STD_LOGIC);
end component;

component FULL_ADDER2 is
	Port (PC, I0, I1 : in STD_LOGIC;
			F, C : out STD_LOGIC);
end component;

signal s_carry : STD_LOGIC;
begin
	U0 : ADDER2 PORT MAP (I0 => A(0), I1 => B(0), F => F(0), C => s_carry);
	U1 : FULL_ADDER2 PORT MAP (PC => s_carry, I0 => A(1), I1 => B(1), F => F(1), C => C);
end Structural;

