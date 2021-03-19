LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY conv_tb IS
END conv_tb;
 
ARCHITECTURE behavior OF conv_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT conv
    PORT(
         conv_entrada : IN  std_logic_vector(3 downto 0);
         conv_saida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal conv_entrada : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal conv_saida : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: conv PORT MAP (
          conv_entrada => conv_entrada,
          conv_saida => conv_saida
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

      -- insert stimulus here
	  conv_entrada <= "0000";
	  wait for 20 ns;
	  conv_entrada <= "0001";
	  wait for 20 ns;
	  conv_entrada <= "0010";
	  wait for 20 ns;
	  conv_entrada <= "0011";
	  wait for 20 ns;
	  conv_entrada <= "0100";
	  wait for 20 ns;
	  conv_entrada <= "0101";
	  wait for 20 ns;
	  conv_entrada <= "0110";
	  wait for 20 ns;
	  conv_entrada <= "0111";
	  wait for 20 ns;
	  conv_entrada <= "1000";
	  wait for 20 ns;
	  conv_entrada <= "1001";
	  wait for 20 ns;
	  conv_entrada <= "1010";
	  wait for 20 ns;
	  conv_entrada <= "1011";
	  wait for 20 ns;
	  conv_entrada <= "1100";
	  wait for 20 ns;
	  conv_entrada <= "1101";
	  wait for 20 ns;
	  conv_entrada <= "1110";
	  wait for 20 ns;
	  conv_entrada <= "1111";

      wait;
   end process;

END;
