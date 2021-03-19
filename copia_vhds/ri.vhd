library ieee;
use ieee.std_logic_1164.all;

-- REGISTRADOR DE INSTRUCOES
-- COMO EH UM REGISTRADOR, NECESSITA DO CLOCK GERAL
-- > entrada: CODIGO DA INSTRUCAO QUE VEM DA MEMORIA
-- > clock: CLOCK GERAL
-- > reset: SINAL DE RESET
-- > carga: POSSIBILITA ARMAZENAR A ENTRADA
-- > saida: INSTRUCAO ARMAZENADA

entity ri is

	port
	(
		ri_entrada : in std_logic_vector (7 downto 0);
		ri_clock : in std_logic;
		ri_reset : in std_logic;
		ri_carga : in std_logic;
		ri_saida : out std_logic_vector (7 downto 0)
	);

end ri;

architecture arch of ri is
begin

	process (ri_clock, ri_reset)
	begin
	
		-- SINAL DE RESET ATIVO
		if (ri_reset = '1') then
			ri_saida <= (others => '0');
		
		-- BORDA DE SUBIDA DO CLOCK
		elsif (ri_clock'event and ri_clock = '1') then
				
			-- SINAL DE CARGA ATIVO
			if (ri_carga = '1') then
				ri_saida <= ri_entrada;
				
			end if;
		end if;
		
	end process;

end arch;