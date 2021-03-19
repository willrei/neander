LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY reg_n_tb IS
END reg_n_tb;
 
ARCHITECTURE behavior OF reg_n_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_n
    PORT(
         reg_n_entrada : IN  std_logic;
         reg_n_clock : IN  std_logic;
         reg_n_reset : IN  std_logic;
         reg_n_carga : IN  std_logic;
         reg_n_saida : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reg_n_entrada : std_logic;
   signal reg_n_clock : std_logic;
   signal reg_n_reset : std_logic;
   signal reg_n_carga : std_logic;

 	--Outputs
   signal reg_n_saida : std_logic;

   -- Clock period definitions
   constant reg_n_clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_n PORT MAP (
          reg_n_entrada => reg_n_entrada,
          reg_n_clock => reg_n_clock,
          reg_n_reset => reg_n_reset,
          reg_n_carga => reg_n_carga,
          reg_n_saida => reg_n_saida
        );

   -- Clock process definitions
   reg_n_clock_process :process
   begin
		reg_n_clock <= '1';
		wait for reg_n_clock_period/2;
		reg_n_clock <= '0';
		wait for reg_n_clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for reg_n_clock_period*10;

      -- insert stimulus here
	  -- RESET
	  reg_n_reset <= '1';
	  wait for reg_n_clock_period*2;
	  
	  -- ENTRADA 1
	  reg_n_reset <= '0';
	  reg_n_entrada <= '1';
	  wait for reg_n_clock_period*2;
	  reg_n_carga <= '1';
	  wait for reg_n_clock_period*2;
	  reg_n_carga <= '0';
	  wait for reg_n_clock_period*2;
	  
	  -- ENTRADA 0
	  reg_n_entrada <= '0';
	  reg_n_carga <= '1';
	  wait for reg_n_clock_period*2;
	  reg_n_carga <= '0';
	  wait for reg_n_clock_period*2;
	  reg_n_entrada <= '1';

      wait;
   end process;

END;
