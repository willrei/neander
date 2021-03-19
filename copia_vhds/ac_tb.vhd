LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ac_tb IS
END ac_tb;
 
ARCHITECTURE behavior OF ac_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ac
    PORT(
         ac_entrada : IN  std_logic_vector(7 downto 0);
         ac_clock : IN  std_logic;
         ac_reset : IN  std_logic;
         ac_carga : IN  std_logic;
         ac_saida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ac_entrada : std_logic_vector(7 downto 0);
   signal ac_clock : std_logic;
   signal ac_reset : std_logic;
   signal ac_carga : std_logic;

 	--Outputs
   signal ac_saida : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant ac_clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ac PORT MAP (
          ac_entrada => ac_entrada,
          ac_clock => ac_clock,
          ac_reset => ac_reset,
          ac_carga => ac_carga,
          ac_saida => ac_saida
        );

   -- Clock process definitions
   ac_clock_process :process
   begin
		ac_clock <= '1';
		wait for ac_clock_period/2;
		ac_clock <= '0';
		wait for ac_clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for ac_clock_period*10;

      -- insert stimulus here
	  -- RESET
	  ac_reset <= '1';
	  wait for ac_clock_period*2;
	  
	  -- CARGAS
	  ac_reset <= '0';
	  ac_entrada <= "11110000";
	  ac_carga <= '0';
	  wait for ac_clock_period*5;
	  
	  ac_carga <= '1';
	  wait for ac_clock_period;
	  
	  ac_carga <= '0';
	  wait for ac_clock_period;
	  
	  ac_entrada <= "10101010";
	  wait for ac_clock_period;
	  
	  ac_carga <= '1';
	  wait for ac_clock_period*3;
  
	  -- FIM
	  ac_carga <= '0';
	  ac_reset <= '1';

      wait;
   end process;

END;
