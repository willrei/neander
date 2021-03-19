library ieee;
use ieee.std_logic_1164.all;

entity conv is

	port
	(
		conv_entrada : in std_logic_vector (3 downto 0);
		conv_saida : out std_logic_vector (7 downto 0)
	);

end conv;

architecture arch of conv is
begin

	process (conv_entrada)
	begin

		if (conv_entrada = "0000") then conv_saida <= "00000011"; -- 0
		elsif (conv_entrada = "0001") then conv_saida <= "10011111"; -- 1
		elsif (conv_entrada = "0010") then conv_saida <= "00100101"; -- 2
		elsif (conv_entrada = "0011") then conv_saida <= "00001101"; -- 3
		elsif (conv_entrada = "0100") then conv_saida <= "10011001"; -- 4
		elsif (conv_entrada = "0101") then conv_saida <= "01001001"; -- 5
		elsif (conv_entrada = "0110") then conv_saida <= "01000001"; -- 6
		elsif (conv_entrada = "0111") then conv_saida <= "00011111"; -- 7
		elsif (conv_entrada = "1000") then conv_saida <= "00000001"; -- 8
		elsif (conv_entrada = "1001") then conv_saida <= "00001001"; -- 9
		elsif (conv_entrada = "1010") then conv_saida <= "00010001"; -- A
		elsif (conv_entrada = "1011") then conv_saida <= "11000001"; -- B
		elsif (conv_entrada = "1100") then conv_saida <= "01100011"; -- C
		elsif (conv_entrada = "1101") then conv_saida <= "10000101"; -- D
		elsif (conv_entrada = "1110") then conv_saida <= "01100001"; -- E
		elsif (conv_entrada = "1111") then conv_saida <= "01110001"; -- F
		else conv_saida <= "00000000";
		end if;
			
	end process;
	
end arch;