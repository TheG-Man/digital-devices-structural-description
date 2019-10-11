LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ADDER2x2_tb IS
END ADDER2x2_tb;
 
ARCHITECTURE behavior OF ADDER2x2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ADDER2x2
    PORT(
         A : IN  std_logic_vector(1 downto 0);
         B : IN  std_logic_vector(1 downto 0);
         F : OUT  std_logic_vector(1 downto 0);
         C : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal A : std_logic_vector(1 downto 0) := (others => '0');
   signal B : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal F : std_logic_vector(1 downto 0);
   signal C : std_logic;
	signal Result : std_logic_vector(2 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity Work.ADDER2x2(Structural) PORT MAP (
          A => A,
          B => B,
          F => F,
          C => C
        );

	Result <= C & F;
	
   process begin
		for m in 0 to 3 loop
			A <= std_logic_vector(to_UNSIGNED(m, 2));
			for n in 0 to 3 loop
				B <= std_logic_vector(to_UNSIGNED(n, 2));
				wait for 10ns;
				assert (to_integer(UNSIGNED(Result)) = (m + n))
					report "Incorrect sum"
					severity error;
			end loop;
		end loop;
	end process;

END;
