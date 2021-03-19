library ieee;
use ieee.std_logic_1164.all;

-- REGISTRADOR DO ACUMULADOR
-- COMO EH UM REGISTRADOR, NECESSITA DO CLOCK GERAL
-- > entrada: VALOR QUE VEM DA ULA
-- > clock: clock da placa
-- > reset: coloca zero no acumulador
-- > carga: permite armazenar o valor da entrada no acumulador
-- > saida: valor armazenado no acumulador

entity ac is

	port
	(
		ac_entrada : in std_logic_vector (7 downto 0);
		ac_clock : in std_logic;
		ac_reset : in std_logic;
		ac_carga : in std_logic;
		ac_saida : out std_logic_vector (7 downto 0)
	);

end ac;

architecture arch of ac is
begin

	process (ac_clock, ac_reset)
	begin
	
		-- SINAL DE RESET ATIVO
		if (ac_reset = '1') then
			ac_saida <= (others => '0');
		
		-- BORDA DE SUBIDA DO CLOCK
		elsif (ac_clock'event and ac_clock = '1') then
				
			-- SINAL DE CARGA ATIVO
			if (ac_carga = '1') then
				ac_saida <= ac_entrada;
				
			end if;
		end if;
		
	end process;

end arch;