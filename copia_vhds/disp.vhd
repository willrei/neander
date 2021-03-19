library ieee;
use ieee.std_logic_1164.all;

entity disp is

	port
	(
		disp_clock_500hz : in std_logic;
		disp_reset : in std_logic;
		disp_entrada3 : in std_logic_vector (7 downto 0);
		disp_entrada2 : in std_logic_vector (7 downto 0);
		disp_entrada1 : in std_logic_vector (7 downto 0);
		disp_entrada0 : in std_logic_vector (7 downto 0);
		disp_seletor : out std_logic_vector (3 downto 0);
		disp_saida : out std_logic_vector (7 downto 0)
	);

end disp;

architecture arch of disp is

	signal disp_temp : std_logic_vector (3 downto 0);
	
begin

	process (disp_clock_500hz, disp_reset)
	begin
	
		if (disp_reset = '1') then
			disp_temp <= "0000";
			disp_saida <= "00000000";
		elsif (disp_clock_500hz'event and disp_clock_500hz = '1') then
		
			case (disp_temp) is
			
				when "0111" =>
					disp_temp <= "1110";
					disp_saida <= disp_entrada3;
				when "1110" => 
					disp_temp <= "1101";
					disp_saida <= disp_entrada0;
				when "1101" => 
					disp_temp <= "1011";
					disp_saida <= disp_entrada1;
				when "1011" => 
					disp_temp <= "0111";
					disp_saida <= disp_entrada2;
				when others => 
					disp_temp <= "1110";
					disp_saida <= disp_entrada0;
					
			end case;
			
			disp_seletor <= disp_temp;
			
		end if;
		
	end process;

end arch;