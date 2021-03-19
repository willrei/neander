library ieee;
use ieee.std_logic_1164.all;

-- REGISTRADOR DE DADOS DA MEMÓRIA
-- > entrada1: DADO QUE VEM DA MEMORIA
-- > entrada2: DADO QUE VEM DO ACUMULADOR
-- > saida1: DADO GUARDADO DA MEMORIA
-- > saida2: DADO GUARDADO DO AC
-- > clock: CLOCK GERAL
-- > carga: SINAL QUE PERMITE ARMAZENAR O DADO DO AC
-- > read: SINAL QUE PERMITE ARMAZENAR O DADO DA MEMORIA
-- > reset: SINAL DE RESET
 
entity rdm is

	port
	(
		rdm_entrada1 : in std_logic_vector (7 downto 0);
		rdm_entrada2 : in std_logic_vector (7 downto 0);
		rdm_clock : in std_logic;
		rdm_carga : in std_logic;
		rdm_reset : in std_logic;
		rdm_read : in std_logic;
		rdm_saida1 : out std_logic_vector (7 downto 0);
		rdm_saida2 : out std_logic_vector (7 downto 0)
	);
	
end rdm;

architecture arch of rdm is
begin

	process (rdm_clock, rdm_reset)
	begin
	
		-- SINAL DE RESET ATIVO
		if (rdm_reset = '1') then
			rdm_saida1 <= (others => '0');
			rdm_saida2 <= (others => '0');
		
		-- BORDA DE SUBIDA DO CLOCK
		elsif (rdm_clock'event and rdm_clock = '1') then
			
			-- SINAL DE CARGA ATIVO
			if (rdm_carga = '1') then
				rdm_saida2 <= rdm_entrada2;
			
			-- SINAL DE READ ATIVO
			elsif (rdm_read = '1') then
				rdm_saida1 <= rdm_entrada1;
			
			end if;
		end if;
		
	end process;
	
end arch;