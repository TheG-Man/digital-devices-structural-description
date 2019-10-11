LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY combinational_scheme_tb IS
END combinational_scheme_tb;
 
ARCHITECTURE behavior OF combinational_scheme_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT combinational_scheme
    PORT(
         w : IN  std_logic;
         x : IN  std_logic;
         y : IN  std_logic;
         z : IN  std_logic;
         f : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal w : std_logic := '0';
   signal x : std_logic := '0';
   signal y : std_logic := '0';
   signal z : std_logic := '0';

 	--Outputs
   signal f_behavioral : std_logic;
	signal f_structural : std_logic;
   signal error : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	uut0: entity Work.combinational_scheme(Behavioral) PORT MAP (
          w => w,
          x => x,
          y => y,
          z => z,
          f => f_behavioral
	);
	
	uut1: entity Work.combinational_scheme(Structural) PORT MAP (
          w => w,
          x => x,
          y => y,
          z => z,
          f => f_structural
	);

	error <= f_behavioral xor f_structural;
	w <= not w after 80ns;
	x <= not x after 40ns;
	y <= not y after 20ns;
	z <= not z after 10ns;

END;
