LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY decod_tb IS
END decod_tb;
 
ARCHITECTURE behavior OF decod_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decod
    PORT(
         decod_entrada : IN  std_logic_vector(7 downto 0);
         decod_nop : OUT  std_logic;
         decod_sta : OUT  std_logic;
         decod_lda : OUT  std_logic;
         decod_add : OUT  std_logic;
         decod_or : OUT  std_logic;
         decod_and : OUT  std_logic;
         decod_not : OUT  std_logic;
         decod_jmp : OUT  std_logic;
         decod_jn : OUT  std_logic;
         decod_jz : OUT  std_logic;
         decod_sub : OUT  std_logic;
         decod_dec : OUT  std_logic;
         decod_shl : OUT  std_logic;
         decod_hlt : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal decod_entrada : std_logic_vector(7 downto 0);

 	--Outputs
   signal decod_nop : std_logic;
   signal decod_sta : std_logic;
   signal decod_lda : std_logic;
   signal decod_add : std_logic;
   signal decod_or : std_logic;
   signal decod_and : std_logic;
   signal decod_not : std_logic;
   signal decod_jmp : std_logic;
   signal decod_jn : std_logic;
   signal decod_jz : std_logic;
   signal decod_sub : std_logic;
   signal decod_dec : std_logic;
   signal decod_shl : std_logic;
   signal decod_hlt : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decod PORT MAP (
          decod_entrada => decod_entrada,
          decod_nop => decod_nop,
          decod_sta => decod_sta,
          decod_lda => decod_lda,
          decod_add => decod_add,
          decod_or => decod_or,
          decod_and => decod_and,
          decod_not => decod_not,
          decod_jmp => decod_jmp,
          decod_jn => decod_jn,
          decod_jz => decod_jz,
          decod_sub => decod_sub,
          decod_dec => decod_dec,
          decod_shl => decod_shl,
          decod_hlt => decod_hlt
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

      -- insert stimulus here
	  -- NOP
	  decod_entrada <= "00000000";
	  wait for 20 ns;
	  
	  -- STA
	  decod_entrada <= "00010000";
	  wait for 20 ns;
	  
	  -- LDA
	  decod_entrada <= "00100000";
	  wait for 20 ns;
	  
	  -- ADD
	  decod_entrada <= "00110000";
	  wait for 20 ns;
	  
	  -- OR
	  decod_entrada <= "01000000";
	  wait for 20 ns;
	  
	  -- AND
	  decod_entrada <= "01010000";
	  wait for 20 ns;
	  
	  -- NOT
	  decod_entrada <= "01100000";
	  wait for 20 ns;
	  
	  -- JMP
	  decod_entrada <= "10000000";
	  wait for 20 ns;
	  
	  -- JN
	  decod_entrada <= "10010000";
	  wait for 20 ns;
	  
	  -- JZ
	  decod_entrada <= "10100000";
	  wait for 20 ns;
	  
	  -- SUB
	  decod_entrada <= "10110000";
	  wait for 20 ns;
	  
	  -- DEC
	  decod_entrada <= "11000000";
	  wait for 20 ns;
	  
	  -- SHL
	  decod_entrada <= "11010000";
	  wait for 20 ns;
	  
	  -- HLT
	  decod_entrada <= "11110000";
	  
      wait;
   end process;

END;
