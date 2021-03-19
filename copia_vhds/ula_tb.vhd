LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ula_tb IS
END ula_tb;
 
ARCHITECTURE behavior OF ula_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ula
    PORT(
         ula_dado1 : IN  std_logic_vector(7 downto 0);
         ula_dado2 : IN  std_logic_vector(7 downto 0);
         ula_seletor : IN  std_logic_vector(2 downto 0);
         ula_saida : OUT  std_logic_vector(7 downto 0);
         ula_flag_n : OUT  std_logic;
         ula_flag_z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ula_dado1 : std_logic_vector(7 downto 0);
   signal ula_dado2 : std_logic_vector(7 downto 0);
   signal ula_seletor : std_logic_vector(2 downto 0);

 	--Outputs
   signal ula_saida : std_logic_vector(7 downto 0);
   signal ula_flag_n : std_logic;
   signal ula_flag_z : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ula PORT MAP (
          ula_dado1 => ula_dado1,
          ula_dado2 => ula_dado2,
          ula_seletor => ula_seletor,
          ula_saida => ula_saida,
          ula_flag_n => ula_flag_n,
          ula_flag_z => ula_flag_z
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

		-- insert stimulus here
	  -- ADD
	  ula_dado1 <= "00001111";
	  ula_dado2 <= "00000010";
	  ula_seletor <= "000";
	  wait for 20 ns;
	  
	  -- AND
	  ula_dado1 <= "10101010";
	  ula_dado2 <= "00001111";
	  ula_seletor <= "001";
	  wait for 20 ns;
	  
	  -- OR
	  ula_dado1 <= "00001111";
	  ula_dado2 <= "11110000";
	  ula_seletor <= "010";
	  wait for 20 ns;
	  
	  -- NOT
	  ula_dado1 <= "11101110";
	  ula_dado2 <= "00000000";
	  ula_seletor <= "011";
	  wait for 20 ns;
	  
	  -- LDA
	  ula_dado1 <= "00010000";
	  ula_dado2 <= "11111111";
	  ula_seletor <= "100";
	  wait for 20 ns;
	  
	  -- SUB
	  ula_dado1 <= "00001000";
	  ula_dado2 <= "00100000";
	  ula_seletor <= "101";
	  wait for 20 ns;
	  
	  -- DEC
	  ula_dado1 <= "11111111";
	  ula_dado2 <= "00000000";
	  ula_seletor <= "110";
	  wait for 20 ns;
	  
	  -- SHL
	  ula_dado1 <= "00111111";
	  ula_dado2 <= "11111111";
	  ula_seletor <= "111";

	  -- FIM
      wait;
   end process;

END;
