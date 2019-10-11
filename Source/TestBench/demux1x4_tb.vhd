LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY demux1x4_tb IS
END demux1x4_tb;
 
ARCHITECTURE behavior OF demux1x4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT demux1x4
    PORT(
         A0 : IN  std_logic;
         A1 : IN  std_logic;
         X : IN  std_logic;
         F0 : OUT  std_logic;
         F1 : OUT  std_logic;
         F2 : OUT  std_logic;
         F3 : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal A0 : std_logic := '0';
   signal A1 : std_logic := '0';
   signal X : std_logic := '0';

 	--Outputs
   signal f0_behavioral : std_logic;
	signal f1_behavioral : std_logic;
	signal f2_behavioral : std_logic;
	signal f3_behavioral : std_logic;
	signal f0_structural : std_logic;
	signal f1_structural : std_logic;
	signal f2_structural : std_logic;
	signal f3_structural : std_logic;
   signal error : std_logic;
 
BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut0: entity Work.demux1x4(Behavioral) PORT MAP (
          A0 => A0,
          A1 => A1,
          X => X,
          F0 => f0_behavioral,
          F1 => f1_behavioral,
          F2 => f2_behavioral,
          F3 => f3_behavioral
	);
	
	uut1: entity Work.demux1x4(Structural) PORT MAP (
          A0 => A0,
          A1 => A1,
          X => X,
          F0 => f0_structural,
          F1 => f1_structural,
          F2 => f2_structural,
          F3 => f3_structural
   );

	error <= (f0_behavioral xor f0_structural) or (f1_behavioral xor f1_structural) or
		(f2_behavioral xor f2_structural) or (f3_behavioral xor f3_structural);
	X <= not X after 40ns;
	A0 <= not A0 after 20ns;
	A1 <= not A1 after 10ns;
   
END;
