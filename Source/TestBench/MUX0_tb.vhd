LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY MUX2_tb IS
END MUX2_tb;
 
ARCHITECTURE behavior OF MUX2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX2
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         s : IN  std_logic;
         f : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal s : std_logic := '0';

 	--Outputs
   signal f_behavioral : std_logic;
	signal f_structural : std_logic;
	signal error : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut_behevioral: entity Work.MUX2(Behavioral) PORT MAP (
          a => a,
          b => b,
          s => s,
          f => f_behavioral
        );
		  
	uut_structural:entity Work.MUX2(Structural) PORT MAP (
          a => a,
          b => b,
          s => s,
          f => f_structural
        );

	error <= f_behavioral xor f_structural;
	a <= not a after 10ns;
	b <= not b after 20ns;
	s <= not s after 40ns;
	
END;
