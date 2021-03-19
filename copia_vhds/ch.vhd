library ieee;
use ieee.std_logic_1164.all;

-- MODULO PARA ESCREVER OS DADOS INICIAIS DOS PROGRAMAS DAS MATRIZES
-- NA MEMORIA ATRAVES DAS CHAVES DA PLACA
-- > contador: VEM DA UNIDADE DE CONTROLE
-- > chaveX: SAO AS CHAVES DA PLACA. CHAVE PRA CIMA = 1
-- > end: ENDERECO DE ESCRITA ENVIADO PARA A MEMORIA
-- > dado: DADO DE ESCRITA ENVIADO PARA A MEMORIA

entity ch is

	port
	(
		ch_chave7 : in std_logic;
		ch_chave6 : in std_logic;
		ch_chave5 : in std_logic;
		ch_chave4 : in std_logic;
		ch_chave3 : in std_logic;
		ch_chave2 : in std_logic;
		ch_chave1 : in std_logic;
		ch_chave0 : in std_logic;
		ch_contador : in std_logic_vector (2 downto 0);
		ch_end : out std_logic_vector (7 downto 0);
		ch_dado : out std_logic_vector (7 downto 0)
	);
	
end ch;

architecture arch of ch is
begin

	-- PROCESS PARA DEFINIR O ENDERECO DE ESCRITA
	process (ch_contador)
	begin
	
		case (ch_contador) is
		
			when "000" => ch_end <= "11110100";
			when "001" => ch_end <= "11110101";
			when "010" => ch_end <= "11110110";
			when "011" => ch_end <= "11110111";
			when "100" => ch_end <= "11111000";
			when "101" => ch_end <= "11111001";
			when "110" => ch_end <= "11111010";
			when "111" => ch_end <= "11111011";
			when others => ch_end <= "00000000";
			
		end case;
		
	end process;
	
	-- ATRIBUICOES DAS CHAVES AO VETOR DO DADO DE SAIDA
	ch_dado(7) <= ch_chave7;
	ch_dado(6) <= ch_chave6;
	ch_dado(5) <= ch_chave5;
	ch_dado(4) <= ch_chave4;
	ch_dado(3) <= ch_chave3;
	ch_dado(2) <= ch_chave2;
	ch_dado(1) <= ch_chave1;
	ch_dado(0) <= ch_chave0;
	
end arch;