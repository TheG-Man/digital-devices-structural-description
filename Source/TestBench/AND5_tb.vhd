LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY AND5_tb IS
END AND5_tb;
 
ARCHITECTURE behavior OF AND5_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AND5_Custom
    PORT(
         A : IN  std_logic_vector(4 downto 0);
         Z : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal A : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
	signal f_behavioral : std_logic;
	signal f_structural : std_logic;
   signal error : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut0: entity Work.AND5_Custom(Behavioral) PORT MAP (
		A => A,
      Z => f_behavioral
	);
	
	uut2: entity Work.AND5_Custom(Structural) PORT MAP (
		A => A,
      Z => f_structural
	);

	error <= f_behavioral xor f_structural;
	A(0) <= not A(0) after 10ns;
	A(1) <= not A(1) after 20ns;
	A(2) <= not A(2) after 40ns;
	A(3) <= not A(3) after 80ns;
	A(4) <= not A(4) after 160ns;
END;
