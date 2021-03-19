LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY reg_z_tb IS
END reg_z_tb;
 
ARCHITECTURE behavior OF reg_z_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_z
    PORT(
         reg_z_entrada : IN  std_logic;
         reg_z_clock : IN  std_logic;
         reg_z_reset : IN  std_logic;
         reg_z_carga : IN  std_logic;
         reg_z_saida : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reg_z_entrada : std_logic;
   signal reg_z_clock : std_logic;
   signal reg_z_reset : std_logic;
   signal reg_z_carga : std_logic;

 	--Outputs
   signal reg_z_saida : std_logic;

   -- Clock period definitions
   constant reg_z_clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_z PORT MAP (
          reg_z_entrada => reg_z_entrada,
          reg_z_clock => reg_z_clock,
          reg_z_reset => reg_z_reset,
          reg_z_carga => reg_z_carga,
          reg_z_saida => reg_z_saida
        );

   -- Clock process definitions
   reg_z_clock_process :process
   begin
		reg_z_clock <= '1';
		wait for reg_z_clock_period/2;
		reg_z_clock <= '0';
		wait for reg_z_clock_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for reg_z_clock_period*10;

      -- insert stimulus here
	  -- RESET
	  reg_z_reset <= '1';
	  wait for reg_z_clock_period*2;
	  
	  -- ENTRADA 1
	  reg_z_reset <= '0';
	  reg_z_entrada <= '1';
	  wait for reg_z_clock_period*2;
	  reg_z_carga <= '1';
	  wait for reg_z_clock_period*2;
	  reg_z_carga <= '0';
	  wait for reg_z_clock_period*2;
	  
	  -- ENTRADA 0
	  reg_z_entrada <= '0';
	  reg_z_carga <= '1';
	  wait for reg_z_clock_period*2;
	  reg_z_carga <= '0';
	  wait for reg_z_clock_period*2;
	  reg_z_entrada <= '1';

      wait;
   end process;

END;
