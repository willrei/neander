library ieee;
use ieee.std_logic_1164.all;

-- DECODIFICADOR DE INSTRUCOES DO NEANDER
-- A MAQUINA POSSUI 14 INSTRUCOES
-- > entrada: VETOR DE INSTRUCOES
-- > xxx: BITS DAS INSTRUCOES

entity decod is

	port
	(
		decod_entrada : in std_logic_vector (7 downto 0);
		decod_nop : out std_logic;
		decod_sta : out std_logic;
		decod_lda : out std_logic;
		decod_add : out std_logic;
		decod_or : out std_logic;
		decod_and : out std_logic;
		decod_not : out std_logic;
		decod_jmp : out std_logic;
		decod_jn : out std_logic;
		decod_jz : out std_logic;
		decod_sub : out std_logic;
		decod_dec : out std_logic;
		decod_shl : out std_logic;
		decod_hlt : out std_logic
	);
	
end decod;

-- INSTRUCOES
-- > NOP: 0000
-- > STA: 0001
-- > LDA: 0010
-- > ADD: 0011
-- > OR: 0100
-- > AND: 0101
-- > NOT: 0110
-- > JMP: 1000
-- > JN: 1001
-- > JZ: 1010
-- > SUB: 1011
-- > DEC: 1100
-- > SHL: 1101
-- > HLT: 1111

architecture arch of decod is

begin

	process (decod_entrada)
	
		-- VETOR PARA ARMAZENAR SOMENTE OS BITS MAIS SIGNIFICATIVOS
		variable decod_temp : std_logic_vector (3 downto 0);
		
		-- VETOR PARA RETIRAR O WARNING
		variable decod_unused : std_logic_vector (3 downto 0);
		
	begin
	
		-- INICIALIZACAO DOS VETORES TEMPORARIOS
		decod_temp := decod_entrada (7 downto 4);
		decod_unused := decod_entrada (3 downto 0);
		
		-- ZERAR TODOS OS BITS
		decod_nop <= '0';
		decod_sta <= '0';
		decod_lda <= '0';
		decod_add <= '0';
		decod_or <= '0';
		decod_and <= '0';
		decod_not <= '0';
		decod_jmp <= '0';
		decod_jn <= '0';
		decod_jz <= '0';
		decod_sub <= '0';
		decod_dec <= '0';
		decod_shl <= '0';
		decod_hlt <= '0';
		
		-- IF PARA ATRIBUIR 1 AOS BITs
		if (decod_temp = "0000") then
			decod_nop <= '1';
		elsif (decod_temp = "0001") then
			decod_sta <= '1';
		elsif (decod_temp = "0010") then
			decod_lda <= '1';
		elsif (decod_temp = "0011") then
			decod_add <= '1';
		elsif (decod_temp = "0100") then
			decod_or <= '1';
		elsif (decod_temp = "0101") then
			decod_and <= '1';
		elsif (decod_temp = "0110") then
			decod_not <= '1';
		elsif (decod_temp = "1000") then
			decod_jmp <= '1';
		elsif (decod_temp = "1001") then
			decod_jn <= '1';
		elsif (decod_temp = "1010") then
			decod_jz <= '1';
		elsif (decod_temp = "1011") then
			decod_sub <= '1';
		elsif (decod_temp = "1100") then
			decod_dec <= '1';
		elsif (decod_temp = "1101") then
			decod_shl <= '1';
		elsif (decod_temp = "1111") then
			decod_hlt <= '1';
		end if;
		
	end process;

end arch;