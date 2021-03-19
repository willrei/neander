LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY disp_tb IS
END disp_tb;
 
ARCHITECTURE behavior OF disp_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT disp
    PORT(
         disp_clock_500hz : IN  std_logic;
         disp_reset : IN  std_logic;
         disp_entrada3 : IN  std_logic_vector(7 downto 0);
         disp_entrada2 : IN  std_logic_vector(7 downto 0);
         disp_entrada1 : IN  std_logic_vector(7 downto 0);
         disp_entrada0 : IN  std_logic_vector(7 downto 0);
         disp_seletor : OUT  std_logic_vector(3 downto 0);
         disp_saida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal disp_clock_500hz : std_logic := '0';
   signal disp_reset : std_logic := '0';
   signal disp_entrada3 : std_logic_vector(7 downto 0) := (others => '0');
   signal disp_entrada2 : std_logic_vector(7 downto 0) := (others => '0');
   signal disp_entrada1 : std_logic_vector(7 downto 0) := (others => '0');
   signal disp_entrada0 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal disp_seletor : std_logic_vector(3 downto 0);
   signal disp_saida : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant disp_clock_500hz_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: disp PORT MAP (
          disp_clock_500hz => disp_clock_500hz,
          disp_reset => disp_reset,
          disp_entrada3 => disp_entrada3,
          disp_entrada2 => disp_entrada2,
          disp_entrada1 => disp_entrada1,
          disp_entrada0 => disp_entrada0,
          disp_seletor => disp_seletor,
          disp_saida => disp_saida
        );

   -- Clock process definitions
   disp_clock_500hz_process :process
   begin
		disp_clock_500hz <= '0';
		wait for disp_clock_500hz_period/2;
		disp_clock_500hz <= '1';
		wait for disp_clock_500hz_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for disp_clock_500hz_period*10;

      -- insert stimulus here
	  wait until rising_edge(disp_clock_500hz);
	  disp_reset <= '1';
	  wait until rising_edge(disp_clock_500hz);
	  disp_reset <= '0';
	  disp_entrada0 <= "00001111";
	  disp_entrada1 <= "00011111";
	  disp_entrada2 <= "00111111";
	  disp_entrada3 <= "01111111";

      wait;
   end process;

END;
