LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ch_tb IS
END ch_tb;
 
ARCHITECTURE behavior OF ch_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ch
    PORT(
         ch_chave7 : IN  std_logic;
         ch_chave6 : IN  std_logic;
         ch_chave5 : IN  std_logic;
         ch_chave4 : IN  std_logic;
         ch_chave3 : IN  std_logic;
         ch_chave2 : IN  std_logic;
         ch_chave1 : IN  std_logic;
         ch_chave0 : IN  std_logic;
         ch_contador : IN  std_logic_vector(2 downto 0);
         ch_end : OUT  std_logic_vector(7 downto 0);
         ch_dado : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ch_chave7 : std_logic := '0';
   signal ch_chave6 : std_logic := '0';
   signal ch_chave5 : std_logic := '0';
   signal ch_chave4 : std_logic := '0';
   signal ch_chave3 : std_logic := '0';
   signal ch_chave2 : std_logic := '0';
   signal ch_chave1 : std_logic := '0';
   signal ch_chave0 : std_logic := '0';
   signal ch_contador : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal ch_end : std_logic_vector(7 downto 0);
   signal ch_dado : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ch PORT MAP (
          ch_chave7 => ch_chave7,
          ch_chave6 => ch_chave6,
          ch_chave5 => ch_chave5,
          ch_chave4 => ch_chave4,
          ch_chave3 => ch_chave3,
          ch_chave2 => ch_chave2,
          ch_chave1 => ch_chave1,
          ch_chave0 => ch_chave0,
          ch_contador => ch_contador,
          ch_end => ch_end,
          ch_dado => ch_dado
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

      -- insert stimulus here
	  ch_contador <= "000";
	  wait for 20 ns;
	  ch_contador <= "001";
	  wait for 20 ns;
	  ch_contador <= "010";
	  wait for 20 ns;
	  ch_contador <= "011";
	  wait for 20 ns;
	  ch_contador <= "100";
	  wait for 20 ns;
	  ch_contador <= "101";
	  wait for 20 ns;
	  ch_contador <= "110";
	  wait for 20 ns;
	  ch_contador <= "111";
	  wait for 20 ns;
	  ch_contador <= "ZZZ";

      wait;
   end process;

END;
