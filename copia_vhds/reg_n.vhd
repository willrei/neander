library ieee;
use ieee.std_logic_1164.all;

-- REGISTRADOR DA FLAG N
-- COMO EH UM REGISTRADOR, NECESSITA DO CLOCK GERAL
-- > entrada: BIT PROVENIENTE DA ULA
-- > clock: CLOCK GERAL
-- > reset: SINAL DE RESET
-- > carga: POSSIBILITA ARMAZENAR A ENTRADA
-- > saida: VALOR ARMAZENADO

entity reg_n is

	port
	(
		reg_n_entrada : in std_logic;
		reg_n_clock : in std_logic;
		reg_n_reset : in std_logic;
		reg_n_carga : in std_logic;
		reg_n_saida : out std_logic
	);

end reg_n;

architecture arch of reg_n is

	-- NECESSARIO PARA MANTER O VALOR SE CARGA = 0
	signal reg_n_temp : std_logic;
	
begin

	process (reg_n_clock, reg_n_reset)
	begin
		
		-- SINAL DE RESET
		if (reg_n_reset = '1') then
			reg_n_temp <= '0';
			
		-- BORDA DE SUBIDA DO CLOCK
		elsif (reg_n_clock'event and reg_n_clock = '1') then
			
			-- SINAL DE CARGA
			if (reg_n_carga = '1') then
				reg_n_temp <= reg_n_entrada;
			else
				reg_n_temp <= reg_n_temp;
			end if;
		end if;
		
	end process;
	
	-- COLOCA O VALOR TEMPORARIO NA SAIDA
	reg_n_saida <= reg_n_temp;

end arch;