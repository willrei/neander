library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- REGISTRADOR DO PROGRAM COUNTER
-- COMO EH UM REGISTRADOR, NECESSITA DO CLOCK GERAL
-- > novo_valor: VEM DA MEMORIA
-- > clock: EH O CLOCK DA PLACA
-- > reset: ZERA O PC
-- > carga: PERMITE COLOCAR O NOVO VALOR NO PC
-- > incrementa: PERMITE INCREMENTAR O PC
-- > saida: EH O VALOR ATUAL DO PC

entity pc is

	port
	(
		pc_novo_valor : in std_logic_vector (7 downto 0);
		pc_clock : in std_logic;
		pc_reset : in std_logic;
		pc_carga : in std_logic;
		pc_incrementa : in std_logic;
		pc_saida : out std_logic_vector (7 downto 0)
	);

end pc;

architecture arch of pc is
begin

	process (pc_clock, pc_reset)
	
	-- VARIAVEL PARA ARMAZENAR O VALOR DO PC
	variable pc_temp : std_logic_vector (7 downto 0);
	
	begin
	
		-- SINAL DE RESET ATIVO
		if (pc_reset = '1') then
			pc_temp := "00000001";
		
		-- SE EH UMA BORDA DE SUBIDA DO CLOCK 
		elsif (pc_clock'event and pc_clock = '1') then
				
			-- SINAL DE CARGA ATIVO
			if (pc_carga = '1') then
				pc_temp := pc_novo_valor;
				
			-- SINAL DE INCREMENTA ATIVO
			elsif (pc_incrementa = '1') then
				pc_temp := std_logic_vector(unsigned(pc_temp) + 1);
				end if;
			end if;
	
		-- ATRIBUICAO DA VARIAVEL TEMPORARIA AO SINAL DE SAIDA
		pc_saida <= pc_temp;
		
	end process;

end arch;