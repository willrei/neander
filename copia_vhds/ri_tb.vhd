LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ri_tb IS
END ri_tb;
 
ARCHITECTURE behavior OF ri_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ri
    PORT(
         ri_entrada : IN  std_logic_vector(7 downto 0);
         ri_clock : IN  std_logic;
         ri_reset : IN  std_logic;
         ri_carga : IN  std_logic;
         ri_saida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ri_entrada : std_logic_vector(7 downto 0);
   signal ri_clock : std_logic;
   signal ri_reset : std_logic;
   signal ri_carga : std_logic;

 	--Outputs
   signal ri_saida : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant ri_clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ri PORT MAP (
          ri_entrada => ri_entrada,
          ri_clock => ri_clock,
          ri_reset => ri_reset,
          ri_carga => ri_carga,
          ri_saida => ri_saida
        );

   -- Clock process definitions
   ri_clock_process :process
   begin
		ri_clock <= '1';
		wait for ri_clock_period/2;
		ri_clock <= '0';
		wait for ri_clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for ri_clock_period*10;

      -- insert stimulus here
	  -- RESET
	  ri_reset <= '1';
	  wait for ri_clock_period*2;
	  
	  -- CARGAS
	  ri_reset <= '0';
	  ri_entrada <= "11110000";
	  ri_carga <= '0';
	  wait for ri_clock_period*5;
	  
	  ri_carga <= '1';
	  wait for ri_clock_period;
	  
	  ri_carga <= '0';
	  wait for ri_clock_period;
	  
	  ri_entrada <= "10100000";
	  ri_carga <= '1';
	  wait for ri_clock_period*3;
  
	  -- FIM
	  ri_carga <= '0';
	  ri_reset <= '1';

      wait;
   end process;

END;
