--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:32:34 05/26/2019
-- Design Name:   
-- Module Name:   /home/ise/Desktop/trabalho2/neander/testebench.vhd
-- Project Name:  neander
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: neander
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testebench IS
END testebench;
 
ARCHITECTURE behavior OF testebench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT neander
    PORT(
         clock : IN  std_logic;
         reset0 : IN  std_logic;
         reset1 : IN  std_logic;
         botao : IN  std_logic;
         display_saida : OUT  std_logic_vector(7 downto 0);
         display_seletor : OUT  std_logic_vector(3 downto 0);
         led7 : OUT  std_logic;
         led6 : OUT  std_logic;
         led5 : OUT  std_logic;
         led4 : OUT  std_logic;
         led3 : OUT  std_logic;
         led2 : OUT  std_logic;
         led1 : OUT  std_logic;
         led0 : OUT  std_logic;
         chave7 : IN  std_logic;
         chave6 : IN  std_logic;
         chave5 : IN  std_logic;
         chave4 : IN  std_logic;
         chave3 : IN  std_logic;
         chave2 : IN  std_logic;
         chave1 : IN  std_logic;
         chave0 : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset0 : std_logic := '0';
   signal reset1 : std_logic := '0';
   signal botao : std_logic := '0';
   signal chave7 : std_logic := '0';
   signal chave6 : std_logic := '0';
   signal chave5 : std_logic := '0';
   signal chave4 : std_logic := '0';
   signal chave3 : std_logic := '0';
   signal chave2 : std_logic := '0';
   signal chave1 : std_logic := '0';
   signal chave0 : std_logic := '0';

 	--Outputs
   signal display_saida : std_logic_vector(7 downto 0);
   signal display_seletor : std_logic_vector(3 downto 0);
   signal led7 : std_logic;
   signal led6 : std_logic;
   signal led5 : std_logic;
   signal led4 : std_logic;
   signal led3 : std_logic;
   signal led2 : std_logic;
   signal led1 : std_logic;
   signal led0 : std_logic;

   -- Clock period definitions
   constant clock_period : time := 13.210 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: neander PORT MAP (
          clock => clock,
          reset0 => reset0,
          reset1 => reset1,
          botao => botao,
          display_saida => display_saida,
          display_seletor => display_seletor,
          led7 => led7,
          led6 => led6,
          led5 => led5,
          led4 => led4,
          led3 => led3,
          led2 => led2,
          led1 => led1,
          led0 => led0,
          chave7 => chave7,
          chave6 => chave6,
          chave5 => chave5,
          chave4 => chave4,
          chave3 => chave3,
          chave2 => chave2,
          chave1 => chave1,
          chave0 => chave0
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	



      -- insert stimulus here 
		
		reset1 <= '1';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		
		reset1 <= '0';
		chave1 <= '1';
		botao <= '1';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		
		botao <= '0';
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		chave1 <= '0';
		chave2 <= '1';
		botao <= '1';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		
		botao <= '0';
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		chave1 <= '1';
		botao <= '1';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		
		botao <= '0';
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		chave1 <= '0';
		chave2 <= '0';
		chave3 <= '1';
		botao <= '1';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		
		botao <= '0';
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		chave1 <= '1';
		botao <= '1';
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);

		botao <= '0';
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		chave1 <= '0';
		chave2 <= '1';
		botao <= '1';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		
		botao <= '0';
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		chave1 <= '1';
		botao <= '1';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		
		botao <= '0';
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		chave1 <= '0';
		chave2 <= '0';
		chave3 <= '0';
		chave4 <= '1';
		botao <= '1';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		
		botao <= '0';

		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		
		botao <= '1';
		
		wait for clock_period*15;
		
		botao <= '0';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		
		botao <= '1';
		
		wait for clock_period*15;
		
		botao <= '0';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		botao <= '1';
		
		wait for clock_period*15;
		
		botao <= '0';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		botao <= '1';
		
		wait for clock_period*15;
		
		botao <= '0';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		botao <= '1';
		
		wait for clock_period*15;
		
		botao <= '0';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		botao <= '1';
		
		wait for clock_period*15;
		
		botao <= '0';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		botao <= '1';
		
		wait for clock_period*15;
		
		botao <= '0';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		botao <= '1';
		
		wait for clock_period*15;
		
		botao <= '0';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		botao <= '1';
		
		wait for clock_period*15;
		
		botao <= '0';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		botao <= '1';
		
		wait for clock_period*15;
		
		botao <= '0';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		botao <= '1';
		
		wait for clock_period*15;
		
		botao <= '0';
		
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		wait until rising_edge(clock);
		botao <= '1';
		
		wait for clock_period*15;
		
		botao <= '0';
		
		wait for clock_period*15;
		
		botao <= '1';
		
		wait for clock_period*15;
		
		botao <= '0';

      wait;
   end process;

END;