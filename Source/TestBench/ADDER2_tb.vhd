LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ADDER2_tb IS
END ADDER2_tb;
 
ARCHITECTURE behavior OF ADDER2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ADDER2
    PORT(
         I0 : IN  std_logic;
         I1 : IN  std_logic;
         F : OUT  std_logic;
         C : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal I0 : std_logic := '0';
   signal I1 : std_logic := '0';

 	--Outputs
   signal f_behavioral : std_logic;
	signal f_structural : std_logic;
	signal c_behavioral : std_logic;
	signal c_structural : std_logic;
	signal error : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut1: entity Work.ADDER2(Behavioral) PORT MAP (
          I0 => I0,
          I1 => I1,
          F => f_behavioral,
          C => c_behavioral
        );
	uut2: entity Work.ADDER2(Structural) PORT MAP (
          I0 => I0,
          I1 => I1,
          F => f_structural,
          C => c_structural
        );

	error <= (f_behavioral xor f_structural) or (c_behavioral xor c_structural);
	I0 <= not I0 after 10ns;
	I1 <= not I1 after 20ns;
END;
