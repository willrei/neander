LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY rdm_tb IS
END rdm_tb;
 
ARCHITECTURE behavior OF rdm_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rdm
    PORT(
         rdm_entrada1 : IN  std_logic_vector(7 downto 0);
         rdm_entrada2 : IN  std_logic_vector(7 downto 0);
         rdm_clock : IN  std_logic;
         rdm_carga : IN  std_logic;
         rdm_reset : IN  std_logic;
         rdm_read : IN  std_logic;
         rdm_saida1 : OUT  std_logic_vector(7 downto 0);
         rdm_saida2 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rdm_entrada1 : std_logic_vector(7 downto 0);
   signal rdm_entrada2 : std_logic_vector(7 downto 0);
   signal rdm_clock : std_logic;
   signal rdm_carga : std_logic;
   signal rdm_reset : std_logic;
   signal rdm_read : std_logic;

 	--Outputs
   signal rdm_saida1 : std_logic_vector(7 downto 0);
   signal rdm_saida2 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant rdm_clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rdm PORT MAP (
          rdm_entrada1 => rdm_entrada1,
          rdm_entrada2 => rdm_entrada2,
          rdm_clock => rdm_clock,
          rdm_carga => rdm_carga,
          rdm_reset => rdm_reset,
          rdm_read => rdm_read,
          rdm_saida1 => rdm_saida1,
          rdm_saida2 => rdm_saida2
        );

   -- Clock process definitions
   rdm_clock_process :process
   begin
		rdm_clock <= '1';
		wait for rdm_clock_period/2;
		rdm_clock <= '0';
		wait for rdm_clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for rdm_clock_period*10;

      -- insert stimulus here
	  -- RESET
	  rdm_reset <= '1';
	  wait for rdm_clock_period*2;
	  
	  -- CARGAS
	  rdm_reset <= '0';
	  rdm_entrada1 <= "00110011";
	  wait for rdm_clock_period;
	  rdm_read <= '1';
	  wait for rdm_clock_period;
	  rdm_entrada1 <= "11001100";
	  wait for rdm_clock_period;
	  rdm_read <= '0';
	  rdm_entrada1 <= "11111111";
	  wait for rdm_clock_period;
	  rdm_entrada2 <= "00001111";
	  wait for rdm_clock_period;
	  rdm_carga <= '1';
	  wait for rdm_clock_period;
	  rdm_entrada1 <= "11110000";
	  wait for rdm_clock_period;
	  rdm_entrada2 <= "10101010";
	  wait for rdm_clock_period;
	  rdm_carga <= '0';
	  wait for rdm_clock_period;
	  rdm_entrada2 <= "01111110";

      wait;
   end process;

END;
