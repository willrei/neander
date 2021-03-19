LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY mux_tb IS
END mux_tb;
 
ARCHITECTURE behavior OF mux_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux
    PORT(
         mux_dado1 : IN  std_logic_vector(7 downto 0);
         mux_dado2 : IN  std_logic_vector(7 downto 0);
         mux_seletor : IN  std_logic;
         mux_saida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal mux_dado1 : std_logic_vector(7 downto 0);
   signal mux_dado2 : std_logic_vector(7 downto 0);
   signal mux_seletor : std_logic;

 	--Outputs
   signal mux_saida : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux PORT MAP (
          mux_dado1 => mux_dado1,
          mux_dado2 => mux_dado2,
          mux_seletor => mux_seletor,
          mux_saida => mux_saida
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

      -- insert stimulus here
	  mux_dado1 <= "10101010";
	  mux_dado2 <= "11110000";
	  mux_seletor <= '0';
	  wait for 20 ns;
	  mux_seletor <= '1';
	  wait for 20 ns;
	  mux_seletor <= 'U';

      wait;
   end process;

END;
