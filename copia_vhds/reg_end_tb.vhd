LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY reg_end_tb IS
END reg_end_tb;
 
ARCHITECTURE behavior OF reg_end_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_end
    PORT(
         reg_end_entrada : IN  std_logic_vector(7 downto 0);
         reg_end_clock : IN  std_logic;
         reg_end_reset : IN  std_logic;
         reg_end_carga : IN  std_logic;
         reg_end_saida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reg_end_entrada : std_logic_vector(7 downto 0);
   signal reg_end_clock : std_logic;
   signal reg_end_reset : std_logic;
   signal reg_end_carga : std_logic;

 	--Outputs
   signal reg_end_saida : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant reg_end_clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_end PORT MAP (
          reg_end_entrada => reg_end_entrada,
          reg_end_clock => reg_end_clock,
          reg_end_reset => reg_end_reset,
          reg_end_carga => reg_end_carga,
          reg_end_saida => reg_end_saida
        );

   -- Clock process definitions
   reg_end_clock_process :process
   begin
		reg_end_clock <= '1';
		wait for reg_end_clock_period/2;
		reg_end_clock <= '0';
		wait for reg_end_clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.

      wait for reg_end_clock_period*10;

      -- insert stimulus here
	  -- RESET
	  reg_end_reset <= '1';
	  wait for reg_end_clock_period*2;
	  
	  -- CARGAS
	  reg_end_reset <= '0';
	  reg_end_entrada <= "11110000";
	  reg_end_carga <= '0';
	  wait for reg_end_clock_period*5;
	  
	  reg_end_carga <= '1';
	  wait for reg_end_clock_period;
	  
	  reg_end_carga <= '0';
	  wait for reg_end_clock_period;
	  
	  reg_end_entrada <= "10101010";
	  wait for reg_end_clock_period;
	  
	  reg_end_carga <= '1';
	  wait for reg_end_clock_period*3;
  
	  -- FIM
	  reg_end_carga <= '0';
	  reg_end_reset <= '1';

      wait;
   end process;

END;