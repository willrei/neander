LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY pc_tb IS
END pc_tb;
 
ARCHITECTURE behavior OF pc_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pc
    PORT(
         pc_novo_valor : IN  std_logic_vector(7 downto 0);
         pc_clock : IN  std_logic;
         pc_reset : IN  std_logic;
         pc_carga : IN  std_logic;
         pc_incrementa : IN  std_logic;
         pc_saida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal pc_novo_valor : std_logic_vector(7 downto 0) := (others => '0');
   signal pc_clock : std_logic := '0';
   signal pc_reset : std_logic := '0';
   signal pc_carga : std_logic := '0';
   signal pc_incrementa : std_logic := '0';

 	--Outputs
   signal pc_saida : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant pc_clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pc PORT MAP (
          pc_novo_valor => pc_novo_valor,
          pc_clock => pc_clock,
          pc_reset => pc_reset,
          pc_carga => pc_carga,
          pc_incrementa => pc_incrementa,
          pc_saida => pc_saida
        );

   -- Clock process definitions
   pc_clock_process :process
   begin
		pc_clock <= '0';
		wait for pc_clock_period/2;
		pc_clock <= '1';
		wait for pc_clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
   
      -- hold reset state for 100 ns.
      wait for pc_clock_period*10;

      -- insert stimulus here
	  -- RESET
	  wait until rising_edge(pc_clock);
	  pc_reset <= '1';
	  wait for pc_clock_period*2;
	  
	  -- INCREMENTA
	  wait until rising_edge(pc_clock);
	  pc_reset <= '0';
	  pc_incrementa <= '1';
	  wait for pc_clock_period*10;
	  
	  -- CARGA
	  wait until rising_edge(pc_clock);
	  pc_incrementa <= '0';
	  pc_carga <= '1';
	  pc_novo_valor <= "01100100";
	  wait for pc_clock_period*2;
	  
	  -- FIM
	  pc_carga <= '0';
      wait;
	  
   end process;

END;
