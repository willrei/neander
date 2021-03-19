library ieee;
use ieee.std_logic_1164.all;

-- REGISTRADOR DA FLAG Z
-- COMO EH UM REGISTRADOR, NECESSITA DO CLOCK GERAL
-- > entrada: BIT PROVENIENTE DA ULA
-- > clock: CLOCK GERAL
-- > reset: SINAL DE RESET
-- > carga: POSSIBILITA ARMAZENAR A ENTRADA
-- > saida: VALOR ARMAZENADO

entity reg_z is

	port
	(
		reg_z_entrada : in std_logic;
		reg_z_clock : in std_logic;
		reg_z_reset : in std_logic;
		reg_z_carga : in std_logic;
		reg_z_saida : out std_logic
	);

end reg_z;

architecture arch of reg_z is

	-- NECESSARIO PARA MANTER O VALOR SE CARGA = 0
	signal reg_z_temp : std_logic;
	
begin

	process (reg_z_clock, reg_z_reset)
	begin
		
		-- SINAL DE RESET
		if (reg_z_reset = '1') then
			reg_z_temp <= '0';
			
		-- BORDA DE SUBIDA DO CLOCK
		elsif (reg_z_clock'event and reg_z_clock = '1') then
			
			-- SINAL DE CARGA
			if (reg_z_carga = '1') then
				reg_z_temp <= reg_z_entrada;
			else
				reg_z_temp <= reg_z_temp;
			end if;
		end if;
		
	end process;
	
	-- COLOCA O VALOR TEMPORARIO NA SAIDA
	reg_z_saida <= reg_z_temp;

end arch;