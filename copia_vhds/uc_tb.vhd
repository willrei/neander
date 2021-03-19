LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY uc_tb IS
END uc_tb;
 
ARCHITECTURE behavior OF uc_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT uc
    PORT(
         uc_nop : IN  std_logic;
         uc_sta : IN  std_logic;
         uc_lda : IN  std_logic;
         uc_add : IN  std_logic;
         uc_or : IN  std_logic;
         uc_and : IN  std_logic;
         uc_not : IN  std_logic;
         uc_jmp : IN  std_logic;
         uc_jn : IN  std_logic;
         uc_jz : IN  std_logic;
         uc_sub : IN  std_logic;
         uc_dec : IN  std_logic;
         uc_shl : IN  std_logic;
         uc_hlt : IN  std_logic;
         uc_flag_n : IN  std_logic;
         uc_flag_z : IN  std_logic;
         uc_clock : IN  std_logic;
         uc_reset : IN  std_logic;
         uc_botao : IN  std_logic;
         uc_cargaPC : OUT  std_logic;
         uc_incrementaPC : OUT  std_logic;
         uc_seletorMux : OUT  std_logic;
         uc_cargaRem : OUT  std_logic;
         uc_cargaRdm : OUT  std_logic;
         uc_readRdm : OUT  std_logic;
         uc_writeEnable : OUT  std_logic_vector(0 downto 0);
         uc_cargaRi : OUT  std_logic;
         uc_cargaN : OUT  std_logic;
         uc_cargaZ : OUT  std_logic;
         uc_seletorUla : OUT  std_logic_vector(2 downto 0);
         uc_cargaAc : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal uc_nop : std_logic := '0';
   signal uc_sta : std_logic := '0';
   signal uc_lda : std_logic := '0';
   signal uc_add : std_logic := '0';
   signal uc_or : std_logic := '0';
   signal uc_and : std_logic := '0';
   signal uc_not : std_logic := '0';
   signal uc_jmp : std_logic := '0';
   signal uc_jn : std_logic := '0';
   signal uc_jz : std_logic := '0';
   signal uc_sub : std_logic := '0';
   signal uc_dec : std_logic := '0';
   signal uc_shl : std_logic := '0';
   signal uc_hlt : std_logic := '0';
   signal uc_flag_n : std_logic := '0';
   signal uc_flag_z : std_logic := '0';
   signal uc_clock : std_logic := '0';
   signal uc_reset : std_logic := '0';
   signal uc_botao : std_logic := '0';

 	--Outputs
   signal uc_cargaPC : std_logic;
   signal uc_incrementaPC : std_logic;
   signal uc_seletorMux : std_logic;
   signal uc_cargaRem : std_logic;
   signal uc_cargaRdm : std_logic;
   signal uc_readRdm : std_logic;
   signal uc_writeEnable : std_logic_vector(0 downto 0);
   signal uc_cargaRi : std_logic;
   signal uc_cargaN : std_logic;
   signal uc_cargaZ : std_logic;
   signal uc_seletorUla : std_logic_vector(2 downto 0);
   signal uc_cargaAc : std_logic;

   -- Clock period definitions
   constant uc_clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: uc PORT MAP (
          uc_nop => uc_nop,
          uc_sta => uc_sta,
          uc_lda => uc_lda,
          uc_add => uc_add,
          uc_or => uc_or,
          uc_and => uc_and,
          uc_not => uc_not,
          uc_jmp => uc_jmp,
          uc_jn => uc_jn,
          uc_jz => uc_jz,
          uc_sub => uc_sub,
          uc_dec => uc_dec,
          uc_shl => uc_shl,
          uc_hlt => uc_hlt,
          uc_flag_n => uc_flag_n,
          uc_flag_z => uc_flag_z,
          uc_clock => uc_clock,
          uc_reset => uc_reset,
          uc_botao => uc_botao,
          uc_cargaPC => uc_cargaPC,
          uc_incrementaPC => uc_incrementaPC,
          uc_seletorMux => uc_seletorMux,
          uc_cargaRem => uc_cargaRem,
          uc_cargaRdm => uc_cargaRdm,
          uc_readRdm => uc_readRdm,
          uc_writeEnable => uc_writeEnable,
          uc_cargaRi => uc_cargaRi,
          uc_cargaN => uc_cargaN,
          uc_cargaZ => uc_cargaZ,
          uc_seletorUla => uc_seletorUla,
          uc_cargaAc => uc_cargaAc
        );

   -- Clock process definitions
   uc_clock_process :process
   begin
		uc_clock <= '0';
		wait for uc_clock_period/2;
		uc_clock <= '1';
		wait for uc_clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for uc_clock_period*10;

      -- insert stimulus here
	  -- RESET
	  wait until rising_edge(uc_clock);
	  uc_reset <= '1';
	  wait until rising_edge(uc_clock);
	  uc_reset <= '0';
	  wait for uc_clock_period*2;
	  
	  -- STA
	  uc_sta <= '1';
	  uc_botao <= '1';
	  wait for uc_clock_period*20;
	  uc_botao <= '0';
	  wait for uc_clock_period*20;
	  
	  -- LDA
	  uc_sta <= '0';
	  uc_lda <= '1';
	  uc_botao <= '1';
	  wait for uc_clock_period*20;
	  uc_botao <= '0';
	  wait for uc_clock_period*20;
	  
	  -- ADD
	  uc_lda <= '0';
	  uc_add <= '1';
	  uc_botao <= '1';
	  wait for uc_clock_period*20;
	  uc_botao <= '0';
	  wait for uc_clock_period*20;
	  
	  -- OR
	  uc_add <= '0';
	  uc_or <= '1';
	  uc_botao <= '1';
	  wait for uc_clock_period*20;
	  uc_botao <= '0';
	  wait for uc_clock_period*20;
	  
	  -- AND
	  uc_or <= '0';
	  uc_and <= '1';
	  uc_botao <= '1';
	  wait for uc_clock_period*20;
	  uc_botao <= '0';
	  wait for uc_clock_period*20;
	  
	  -- NOT
	  uc_and <= '0';
	  uc_not <= '1';
	  uc_botao <= '1';
	  wait for uc_clock_period*20;
	  uc_botao <= '0';
	  wait for uc_clock_period*20;
	  
	  -- SUB
	  uc_not <= '0';
	  uc_sub <= '1';
	  uc_botao <= '1';
	  wait for uc_clock_period*20;
	  uc_botao <= '0';
	  wait for uc_clock_period*20;
	  
	  -- DEC
	  uc_sub <= '0';
	  uc_dec <= '1';
	  uc_botao <= '1';
	  wait for uc_clock_period*20;
	  uc_botao <= '0';
	  wait for uc_clock_period*20;
	  
	  -- SHL
	  uc_dec <= '0';
	  uc_shl <= '1';
	  uc_botao <= '1';
	  wait for uc_clock_period*20;
	  uc_botao <= '0';
	  wait for uc_clock_period*20;
	  
	  -- JMP
	  uc_shl <= '0';
	  uc_jmp <= '1';
	  uc_botao <= '1';
	  wait for uc_clock_period*20;
	  uc_botao <= '0';
	  wait for uc_clock_period*20;
	  
	  -- JN, N = 1
	  uc_jmp <= '0';
	  uc_jn <= '1';
	  uc_flag_n <= '1';
	  uc_botao <= '1';
	  wait for uc_clock_period*20;
	  uc_botao <= '0';
	  wait for uc_clock_period*20;
	  
	  -- JN, N = 0
	  uc_flag_n <= '0';
	  uc_botao <= '1';
	  wait for uc_clock_period*20;
	  uc_botao <= '0';
	  wait for uc_clock_period*20;
	  
	  -- JZ, J = 1
	  uc_jn <= '0';
	  uc_jz <= '1';
	  uc_flag_z <= '1';
	  uc_botao <= '1';
	  wait for uc_clock_period*20;
	  uc_botao <= '0';
	  wait for uc_clock_period*20;
	  
	  -- JZ, Z = 0
	  uc_flag_z <= '0';
	  uc_botao <= '1';
	  wait for uc_clock_period*20;
	  uc_botao <= '0';
	  wait for uc_clock_period*20;
	  
	  -- NOP
	  uc_jz <= '0';
	  uc_nop <= '1';
	  uc_botao <= '1';
	  wait for uc_clock_period*20;
	  uc_botao <= '0';
	  wait for uc_clock_period*20;
	  
	  -- HLT
	  uc_nop <= '0';
	  uc_hlt <= '1';
	  uc_botao <= '1';
	  wait for uc_clock_period*20;
	  uc_botao <= '0';
	  wait for uc_clock_period*20;

      wait;
   end process;

END;
