library ieee;
use ieee.std_logic_1164.all;

entity div is

	port
	(
		div_clock : in std_logic;
		div_reset : in std_logic;
		div_clock_500hz : out std_logic
	);
	
end div;

architecture arch of div is
begin

	process (div_reset, div_clock)
	
		variable contador : integer;
		
	begin
	
		-- SINAL DE RESET ATIVO
		if (div_reset = '1') then
			contador := 0;
			
		-- BORDA DE SUBIDA DO CLOCK DA PLACA
		elsif (div_clock'event and div_clock = '1') then
		
			-- LIMITE DA CONTAGEM
			if (contador < 99999) then
				contador := contador + 1;
			else
				contador := 0;
			end if;

			-- METADE DO PERÍODO É LOW E METADE É HIGH
			if (contador < 50000) then
				div_clock_500hz <= '0';
			else
				div_clock_500hz <= '1';
			end if;
			
		end if;
		
	end process;
	
end arch;