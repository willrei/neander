library ieee;
use ieee.std_logic_1164.all;

-- MULTIPLEXADOR 2x1 PARA DADOS DE 8 BITS
-- PASSA O DADO 1 PARA A SAIDA QUANDO SEL = '0'
-- PASSA O DADO 2 PARA A SAIDA QUANDO SEL = '1'

entity mux is

	port
	(
		mux_dado1 : in std_logic_vector (7 downto 0);
		mux_dado2 : in std_logic_vector (7 downto 0);
		mux_seletor : in std_logic;
		mux_saida : out std_logic_vector (7 downto 0)
	);

end mux;

architecture arch of mux is
begin
	
	process (mux_dado1, mux_dado2, mux_seletor)
	begin

		if mux_seletor = '0' then
			mux_saida <= mux_dado1;
		else
			mux_saida <= mux_dado2;
		end if;
		
	end process;

end arch;