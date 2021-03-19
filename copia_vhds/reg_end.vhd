library ieee;
use ieee.std_logic_1164.all;

-- REGISTRADOR DE ENDERECOS DA MEMORIA DO NEANDER
-- COMO EH UM REGISTRADOR, DEPENDE DO CLOCK GERAL
-- > entrada: ENDERECO LIDO DO MULTIPLEXADOR
-- > clock: CLOCK GERAL
-- > reset: SINAL DE RESET
-- > carga: PERMITE ARMAZENAR UM ENDERECO
-- > saida: ENDERECO ARMAZENADO NO REGISTRADOR

entity reg_end is

	port
	(
		reg_end_entrada : in std_logic_vector (7 downto 0);
		reg_end_clock : in std_logic;
		reg_end_reset : in std_logic;
		reg_end_carga : in std_logic;
		reg_end_saida : out std_logic_vector (7 downto 0)
	);
	
end reg_end;

architecture arch of reg_end is
begin

	process (reg_end_clock, reg_end_reset)
	begin
	
		-- SINAL DE RESET ATIVO
		if (reg_end_reset = '1') then
			reg_end_saida <= (others => '0');
			
		-- BORDA DE SUBIDA DO CLOCK
		elsif (reg_end_clock'event and reg_end_clock = '1') then
		
			-- SINAL DE CARGA ATIVO
			if (reg_end_carga = '1') then
				reg_end_saida <= reg_end_entrada;
				
			end if;
		end if;
	
	end process;
	
end arch;