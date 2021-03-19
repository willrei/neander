library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

-- UNIDADE LOGICA E ARITMETICA DO NEANDER
-- > dado1: VALOR DO ACUMULADOR
-- > dado2: VALOR LIDO DA MEMORIA
-- > seletor: SELECIONA A OPERACAO A SER FEITA
-- > saida: RESULTADO DA OPERACAO QUE VAI PRO ACUMULADOR
-- > flag_n: INDICA SE O RESULTADO FOI NEGATIVO
-- > flag_z: INDICA SE O RESULTADO FOI ZERO

entity ula is

	port
	(
		ula_dado1 : in std_logic_vector (7 downto 0);
		ula_dado2 : in std_logic_vector (7 downto 0);
		ula_seletor : in std_logic_vector (2 downto 0);
		ula_saida : out std_logic_vector (7 downto 0);
		ula_flag_n : out std_logic;
		ula_flag_z : out std_logic
	);

end ula;

-- OPERACOES DA UNIDADE LOGICA E ARITMETICA
-- > ADD(000): saida <= dado1 + dado2
-- > AND(001): saida <= dado1 && dado2
-- > OR(010): saida <= dado1 || dado2
-- > NOT(011): saida <= !dado1
-- > LDA(100): saida <= dado1
-- > SUB(101): saida <= dado1 - dado2
-- > DEC(110): saida <= dado1 - 1
-- > SHL(111): saida <= dado1 + dado1

architecture arch of ula is

	-- VETOR TEMPORARIO PARA PODER ANALISAR O RESULTADO
	signal ula_temp : std_logic_vector (7 downto 0);
	
begin

	-- SELECT PARA REALIZAR AS OPERACOES
	with (ula_seletor) select
	ula_temp <= ula_dado1 + ula_dado2 when "000",
				ula_dado1 and ula_dado2 when "001",
				ula_dado1 or ula_dado2 when "010",
				not ula_dado1 when "011",
				ula_dado2 when "100",
				ula_dado1 - ula_dado2 when "101",
				ula_dado1 - 1 when "110",
				ula_dado1 + ula_dado1 when "111",
				(others => '0') when others;
	
	-- PASSAR O RESULTADO PARA A SAIDA
	ula_saida <= ula_temp;
	
	-- VERIFICACAO DA FLAG NEGATIVA
	-- UTILIZA O BIT MAIS SIGNIFICATIVO DO RESULTADO
	with (ula_temp(7)) select
	ula_flag_n <= '1' when '1',
				  '0' when others;
				  
	-- VERIFICACAO DA FLAG ZERO
	-- NECESSITA DE TODO O VETOR DO RESULTADO
	with (ula_temp) select
	ula_flag_z <= '1' when "00000000",
				  '0' when others;

end arch;