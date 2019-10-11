LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY MUX4x2_tb IS
END MUX4x2_tb;
 
ARCHITECTURE behavior OF MUX4x2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX4x2
    PORT(
         a : IN  std_logic_vector(1 downto 0);
         b : IN  std_logic_vector(1 downto 0);
         s : IN  std_logic;
         f : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal a : std_logic_vector(1 downto 0) := (others => '0');
   signal b : std_logic_vector(1 downto 0) := (others => '0');
   signal s : std_logic := '0';

 	--Outputs
   signal f_behavioral : std_logic_vector(1 downto 0);
	signal f_structural : std_logic_vector(1 downto 0);
   signal error : std_logic;
	-- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut0: entity Work.MUX4x2(Behavioral) PORT MAP (
          a => a,
          b => b,
          s => s,
          f => f_behavioral
	);
	
	uut1: entity Work.MUX4x2(Structural) PORT MAP (
          a => a,
          b => b,
          s => s,
          f => f_structural
	);
	
	error <= (f_behavioral(0) xor f_structural(0)) or (f_behavioral(1) xor f_structural(1));
	a(0) <= not a(0) after 10ns;
	a(1) <= not a(1) after 20ns;
	b(0) <= not b(0) after 40ns;
	b(1) <= not b(1) after 80ns;
	s <= not s after 160ns;

END;
