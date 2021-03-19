LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY mem_tb IS
END mem_tb;
 
ARCHITECTURE behavior OF mem_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mem
    PORT(
         clka : IN  std_logic;
         wea : IN  std_logic_vector(0 downto 0);
         addra : IN  std_logic_vector(7 downto 0);
         dina : IN  std_logic_vector(7 downto 0);
         douta : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clka : std_logic := '0';
   signal wea : std_logic_vector(0 downto 0) := (others => '0');
   signal addra : std_logic_vector(7 downto 0) := (others => '0');
   signal dina : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal douta : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clka_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mem PORT MAP (
          clka => clka,
          wea => wea,
          addra => addra,
          dina => dina,
          douta => douta
        );

   -- Clock process definitions
   clka_process :process
   begin
		clka <= '0';
		wait for clka_period/2;
		clka <= '1';
		wait for clka_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.	
      wait for clka_period*10;

      -- insert stimulus here
	  -- WRITE
	  wea <= "1";
	  dina <= "00001010";
	  wait for clka_period;
	  addra <= "00000001";
	  dina <= "00010100";
	  wait for clka_period;
	  addra <= "00000010";
	  dina <= "00011110";
	  wait for clka_period;
	  addra <= "00000011";
	  dina <= "00101000";
	  wait for clka_period;
	  addra <= "00000100";
	  dina <= "00110010";
	  wait for clka_period;
	  addra <= "00000101";
	  dina <= "00111100";
	  wait for clka_period;
	  
	  -- READ
	  wea <= "0";
	  addra <= "00000000";
	  wait for clka_period;
	  addra <= "00000001";
	  wait for clka_period;
	  addra <= "00000010";
	  wait for clka_period;
	  addra <= "00000011";
	  wait for clka_period;
	  addra <= "00000100";
	  wait for clka_period;
	  addra <= "00000101";
	  wait for clka_period;
	  addra <= "00000110";

      wait;
   end process;

END;
