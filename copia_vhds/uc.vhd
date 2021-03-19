library ieee;
use ieee.std_logic_1164.all;

-- UNIDADE DE CONTROLE DO NEANDER
-- EH UMA GRANDE MAQUINA DE ESTADOS QUE CONTROLA OS SINAIS

entity uc is

	port
	(
		-- INPUTS
		uc_nop : in std_logic;
		uc_sta : in std_logic;
		uc_lda : in std_logic;
		uc_add : in std_logic;
		uc_or : in std_logic;
		uc_and : in std_logic;
		uc_not : in std_logic;
		uc_jmp : in std_logic;
		uc_jn : in std_logic;
		uc_jz : in std_logic;
		uc_sub : in std_logic;
		uc_dec : in std_logic;
		uc_shl : in std_logic;
		uc_hlt : in std_logic;
		uc_flag_n : in std_logic;
		uc_flag_z : in std_logic;
		uc_clock : in std_logic;
		uc_reset0 : in std_logic;
		uc_reset1 : in std_logic;
		uc_botao : in std_logic;
		
		-- OUTPUTS
		uc_cargaPC : out std_logic;
		uc_incrementaPC : out std_logic;
		uc_seletorMux : out std_logic;
		uc_seletorMuxEnd : out std_logic;
		uc_seletorMuxDado : out std_logic;
		uc_cargaRem : out std_logic;
		uc_cargaRdm : out std_logic;
		uc_readRdm : out std_logic;
		uc_writeEnable : out std_logic_vector(0 downto 0);
		uc_cargaRi : out std_logic;
		uc_cargaN : out std_logic;
		uc_cargaZ : out std_logic;
		uc_seletorUla : out std_logic_vector (2 downto 0);
		uc_led_attrib : out std_logic;
		uc_cargaAc : out std_logic;
		uc_contador : out std_logic_vector (2 downto 0)
	);
	
end uc;

architecture arch of uc is

	type ESTADO is (e0, e1, e2, e3, ef, eri, sta0, sta1, sta2, sta3, sta4, ula0, ula1, ula2, ula3, ula4,
				    not0, jmp0, jmp1, jmp2, njmp0, nop0, hlt0, hlt1, erem1, erem2, erem3, erem4, erem5, erem6, write1,
					in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15);
	
	-- ESTADO ATUAL
	signal ea : ESTADO;
	-- PROXIMO ESTADO
	signal pe : ESTADO;

begin

	-- PROCESS DA MAQUINA
	process (uc_clock, uc_reset0, uc_reset1)
	begin
	
		-- SINAL DE RESET SEM LEITURA DOS DADOS ATIVO
		if (uc_reset0 = '1') then
			ea <= e0;
		
		-- SINAL DE RESET COM LEITURA DOS DADOS ATIVO
		elsif (uc_reset1 = '1') then
			ea <= in0;
			
		-- elsif(rising_edge(uc_clock)) then 
		elsif (rising_edge(uc_clock)) then
			ea <= pe;
				
		end if;
	end process;
	
	-- PROCESS PARA O CALCULO DO PROXIMO ESTADO E SUAS ATRIBUICOES
	process(ea, pe, uc_botao, uc_nop, uc_sta, uc_lda, uc_add, uc_or, uc_and, uc_sub, uc_dec, uc_shl, uc_not,
			uc_jmp, uc_jn, uc_flag_n, uc_jz, uc_flag_z, uc_hlt)
			
	begin
		
		case ea is
		-- CALCULO DO PROXIMO ESTADO
			-- ESTADOS DAS ESCRITAS DOS DADOS INICIAIS
			when in0 =>
				uc_seletorMuxEnd <= '1';
				uc_seletorMuxDado <= '1';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "000";
				if (uc_botao = '1') then
					pe <= in1;
				else
					pe <= in0;
				end if;
			when in1 =>
				uc_seletorMuxEnd <= '1';
				uc_seletorMuxDado <= '1';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "1";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "000";
				if (uc_botao = '1') then
					pe <= in1;
				else
					pe <= in2;
				end if;
			when in2 =>
				uc_seletorMuxEnd <= '1';
				uc_seletorMuxDado <= '1';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "001";
				if (uc_botao = '1') then
					pe <= in3;
				else
					pe <= in2;
				end if;
			when in3 =>
				uc_seletorMuxEnd <= '1';
				uc_seletorMuxDado <= '1';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "1";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "001";
				if (uc_botao = '1') then
					pe <= in3;
				else
					pe <= in4;
				end if;
			when in4 =>
				uc_seletorMuxEnd <= '1';
				uc_seletorMuxDado <= '1';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "010";
				if (uc_botao = '1') then
					pe <= in5;
				else
					pe <= in4;
				end if;
			when in5 =>
				uc_seletorMuxEnd <= '1';
				uc_seletorMuxDado <= '1';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "1";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "010";
				if (uc_botao = '1') then
					pe <= in5;
				else
					pe <= in6;
				end if;
			when in6 =>
				uc_seletorMuxEnd <= '1';
				uc_seletorMuxDado <= '1';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "011";
				if (uc_botao = '1') then
					pe <= in7;
				else
					pe <= in6;
				end if;
			when in7 =>
				uc_seletorMuxEnd <= '1';
				uc_seletorMuxDado <= '1';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "1";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "011";
				if (uc_botao = '1') then
					pe <= in7;
				else
					pe <= in8;
				end if;
			when in8 =>
				uc_seletorMuxEnd <= '1';
				uc_seletorMuxDado <= '1';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "100";
				if (uc_botao = '1') then
					pe <= in9;
				else
					pe <= in8;
				end if;
			when in9 =>
				uc_seletorMuxEnd <= '1';
				uc_seletorMuxDado <= '1';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "1";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "100";
				if (uc_botao = '1') then
					pe <= in9;
				else
					pe <= in10;
				end if;
			when in10 =>
				uc_seletorMuxEnd <= '1';
				uc_seletorMuxDado <= '1';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "101";
				if (uc_botao = '1') then
					pe <= in11;
				else
					pe <= in10;
				end if;
			when in11 =>
				uc_seletorMuxEnd <= '1';
				uc_seletorMuxDado <= '1';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "1";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "101";
				if (uc_botao = '1') then
					pe <= in11;
				else
					pe <= in12;
				end if;
			when in12 =>
				uc_seletorMuxEnd <= '1';
				uc_seletorMuxDado <= '1';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "110";
				if (uc_botao = '1') then
					pe <= in13;
				else
					pe <= in12;
				end if;
			when in13 =>
				uc_seletorMuxEnd <= '1';
				uc_seletorMuxDado <= '1';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "1";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "110";
				if (uc_botao = '1') then
					pe <= in13;
				else
					pe <= in14;
				end if;
			when in14 =>
				uc_seletorMuxEnd <= '1';
				uc_seletorMuxDado <= '1';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "111";
				if (uc_botao = '1') then
					pe <= in15;
				else
					pe <= in14;
				end if;
			when in15 =>
				uc_seletorMuxEnd <= '1';
				uc_seletorMuxDado <= '1';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "1";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "111";
				if (uc_botao = '1') then
					pe <= in15;
				else
					pe <= e0;
				end if;
			
			-- ESTADOS GERAIS
			when e0 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "000";
				if (uc_botao = '1') then
					pe <= e1;
				else
					pe <= e0;
				end if;
				
			when e1 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '1';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "000";
				pe <= erem1;
			
			when erem1 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '1';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "000";
				pe <= e2;
				
			when e2 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '1';
				uc_incrementaPc <= '1';
				uc_writeEnable <= "0";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "000";
				pe <= e3;
			
			-- ESTADOS INICIAIS DAS INSTRUCOES
			when e3 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_incrementaPC <= '0';
				uc_writeEnable <= "0";
				uc_cargaRi <= '1';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "000";
				pe <= eri;
				
			when eri =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "000";
				uc_seletorMux <= '0';
				uc_cargaRi <= '1';
				-- NOP VAI SOZINHA
				if (uc_nop = '1') then 
					pe <= nop0;
					
				-- STA VAI SOZINHA
				elsif (uc_sta = '1') then
					pe <= sta0;
					
				-- ESSAS VAO NA ULA (EXCETO A NOT, QUE VAI SEPARADA)
				elsif
				(
					uc_lda = '1' or
					uc_add = '1' or
					uc_or = '1' or
					uc_and = '1' or
					uc_sub = '1' 
				) 
				then pe <= ula0;
				
				-- NOT, DEC E SHL AFETAM DIRETAMENTE O ACUMULADOR
				elsif 
				(
					uc_not = '1' or
					uc_dec = '1' or
					uc_shl = '1'
				) 
				then pe <= not0;
					
				-- ESSAS REALIZAM O JUMP
				elsif
				(
					(uc_jmp = '1') or
					(uc_jn = '1' and uc_flag_n = '1') or
					(uc_jz = '1' and uc_flag_z = '1')
				)
				then pe <= jmp0;
				
				-- ESSAS NAO REALIZAM O JUMP
				elsif
				(
					(uc_jn = '1' and uc_flag_n = '0') or
					(uc_jz = '1' and uc_flag_z = '0')
				)
				then pe <= njmp0;
				
				-- HLT VAI SOZINHA
				elsif (uc_hlt = '1') then
					pe <= hlt0;
				
				end if;
			
			-- ESTADOS STA
			when sta0 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_cargaRi <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '1';
				uc_contador <= "000";
				pe <= erem2;
			when erem2 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '1';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "000";
				pe <= sta1;
			when sta1 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_cargaRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_cargaRem <= '0';
				uc_readRdm <= '1';
				uc_incrementaPc <= '1';
				uc_seletorMux <= '1';
				uc_contador <= "000";
				pe <= sta2;
			when sta2 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_seletorMux <= '1';
				uc_cargaRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_readRdm <= '0';
				uc_incrementaPc <= '0';
				uc_cargaRem <= '1';
				uc_contador <= "000";
				pe <= erem3;
			when erem3 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '1';
				uc_cargaRem <= '1';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "000";
				pe <= sta3;
			when sta3 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_cargaRem <= '0';
				uc_cargaRdm <= '1';
				uc_contador <= "000";
				pe <= sta4;
			when sta4 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_readRdm <= '0';
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_cargaRdm <= '0';
				uc_writeEnable <= "1";
				uc_contador <= "000";
				pe <= write1;
			when write1 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_readRdm <= '0';
				uc_cargaRi <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_cargaRdm <= '0';
				uc_writeEnable <= "1";
				uc_contador <= "000";
				pe <= ef;
			
			-- ESTADOS ULA
			when ula0 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_cargaRi <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '1';
				uc_contador <= "000";
				pe <= erem4;
			when erem4 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_cargaRi <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '1';
				uc_contador <= "000";
				pe <= ula1;
			when ula1 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_cargaRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_cargaRi <= '0';
				uc_cargaRem <= '0';
				uc_readRdm <= '1';
				uc_incrementaPC <= '1';
				uc_seletorMux <= '1';
				uc_contador <= "000";
				pe <= ula2;
			when ula2 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_cargaRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_cargaRi <= '0';
				uc_readRdm <= '0';
				uc_incrementaPc <= '0';
				uc_seletorMux <= '1';
				uc_cargaRem <= '1';
				uc_contador <= "000";
				pe <= erem5;
			when erem5 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_cargaRi <= '0';
				uc_cargaRem <= '1';
				uc_seletorMux <= '1';
				uc_contador <= "000";
				pe <= ula3;
			when ula3 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_cargaRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_cargaRi <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_readRdm <= '1';
				uc_contador <= "000";
				pe <= ula4;
			when ula4 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_cargaRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaRi <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_readRdm <= '0';
				uc_cargaAc <= '1';
				uc_cargaN <= '1';
				uc_cargaZ <= '1';
				uc_contador <= "000";
				if (uc_add = '1') then
					uc_seletorUla <= "000";
				elsif (uc_and = '1') then
					uc_seletorUla <= "001";
				elsif (uc_or = '1') then
					uc_seletorUla <= "010";
				elsif (uc_lda = '1') then
					uc_seletorUla <= "100";
				elsif (uc_sub = '1') then
					uc_seletorUla <= "101";
				elsif (uc_dec = '1') then
					uc_seletorUla <= "110";
				else
					uc_seletorUla <= "000";
				end if;
				pe <= ef;
			
			-- ESTADO NOT
			when not0 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRi <= '0';
				uc_cargaAc <= '1';
				uc_cargaN <= '1';
				uc_cargaZ <= '1';
				uc_contador <= "000";
				if (uc_not = '1') then
					uc_seletorUla <= "011";
				elsif (uc_dec = '1') then
					uc_seletorUla <= "110";
				elsif (uc_shl = '1') then
					uc_seletorUla <= "111";
				else
					uc_seletorUla <= "000";
				end if;
				pe <= ef;
			
			-- ESTADOS JMP
			when jmp0 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_cargaRi <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '1';
				uc_contador <= "000";
				pe <= erem6;
			when erem6 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_cargaRi <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '1';
				uc_contador <= "000";
				pe <= jmp1;
			when jmp1 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_cargaRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_cargaRi <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_readRdm <= '1';
				uc_contador <= "000";
				pe <= jmp2;
			when jmp2 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_incrementaPC <= '0';
				uc_cargaRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_cargaRi <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_readRdm <= '0';
				uc_cargaPc <= '1';
				uc_contador <= "000";
				pe <= ef;
			
			-- ESTADOS NJMP
			when njmp0 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRi <= '0';
				uc_incrementaPc <= '1';
				uc_contador <= "000";
				pe <= ef;
			
			-- ESTADOS NOP
			when nop0 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRi <= '0';
				uc_contador <= "000";
				pe <= ef;
			
			-- ESTADOS HLT
			when hlt0 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_cargaRi <= '0';
				uc_contador <= "000";
				pe <= hlt1;
			when hlt1 =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaPC <= '0';
				uc_incrementaPC <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_writeEnable <= "0";
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_cargaRi <= '0';
				uc_seletorMux <= '0';
				uc_cargaRem <= '0';
				uc_contador <= "000";
				pe <= hlt1;
			
			-- ESTADO FINAL
			when ef =>
				uc_seletorMuxEnd <= '0';
				uc_seletorMuxDado <= '0';
				uc_cargaRdm <= '0';
				uc_readRdm <= '0';
				uc_cargaN <= '0';
				uc_cargaZ <= '0';
				uc_seletorUla <= "000";
				uc_cargaAc <= '0';
				uc_contador <= "000";
				uc_cargaRi <= '0';
				uc_cargaRem <= '0';
				uc_writeEnable <= "0";
				uc_cargaPc <= '0';
				uc_incrementaPc <= '0';
				uc_seletorMux <= '0';
				if (uc_botao = '1') then
					pe <= ef;
				else
					pe <= e0;
				end if;
			
			when others =>
				pe <= pe;
			
			end case;
				
	end process;	

	-- PROCESS PARA CONTROLAR OS LEDS DA PLACA
	-- > led_attrib = 0: COLOCA OS VALORES DAS CHAVES NOS LEDS
	-- > led_attrib = 1: COLOCA O VALOR DA SAIDA DA ULA NOS LEDS
	process (ea)
	begin
	
		if
		(
			ea = in0 or
			ea = in1 or
			ea = in2 or
			ea = in3 or
			ea = in4 or
			ea = in5 or
			ea = in6 or
			ea = in7 or
			ea = in8 or
			ea = in9 or
			ea = in10 or
			ea = in11 or
			ea = in12 or
			ea = in13 or
			ea = in14 or
			ea = in15
		)
		then
			uc_led_attrib <= '0';
		else
			uc_led_attrib <= '1';
		end if;
		
	end process;
	
end arch;