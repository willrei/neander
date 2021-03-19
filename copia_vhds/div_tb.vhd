LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY div_tb IS
END div_tb;
 
ARCHITECTURE behavior OF div_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT div
    PORT(
         div_clock : IN  std_logic;
         div_reset : IN  std_logic;
         div_clock_500hz : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal div_clock : std_logic := '0';
   signal div_reset : std_logic := '0';

 	--Outputs
   signal div_clock_500hz : std_logic;

   -- Clock period definitions
   constant div_clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: div PORT MAP (
          div_clock => div_clock,
          div_reset => div_reset,
          div_clock_500hz => div_clock_500hz
        );

   -- Clock process definitions
   div_clock_process :process
   begin
		div_clock <= '0';
		wait for div_clock_period/2;
		div_clock <= '1';
		wait for div_clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for div_clock_period*10;

      -- insert stimulus here
	  wait until rising_edge(div_clock);
	  div_reset <= '1';
	  wait until rising_edge(div_clock);
	  div_reset <= '0';

      wait;
   end process;

END;
