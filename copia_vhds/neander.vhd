library ieee;
use ieee.std_logic_1164.all;

-- > reset0: REINICIA O NEANDER SEM PASSAR PELA INSERCAO DE DADOS
-- > reset1: REINICIA O NEANDER E PASSA PELA INSERCAO DE DADOS

entity neander is

	port
	(
		clock : in std_logic;
		reset0 : in std_logic;
		reset1 : in std_logic;
		botao : in std_logic;
		display_saida : out std_logic_vector (7 downto 0);
		display_seletor : out std_logic_vector (3 downto 0);
		led7, led6, led5, led4, led3, led2, led1, led0 : out std_logic;
		chave7, chave6, chave5, chave4, chave3, chave2, chave1, chave0 : in std_logic 
	);
		
end neander;

architecture arch of neander is

	----------------- COMPONENTES -----------------
	
	-- UNIDADE DE CONTROLE
	component uc
	port
	(
		uc_nop : in std_logic;
		uc_sta : in std_logic;
		uc_lda : in std_logic;
		uc_add : in std_logic;
		uc_or : in std_logic;
		uc_and : in std_logic;
		uc_not : in std_logic;
		uc_jmp : in std_logic;
		uc_jn : in std_logic;
		uc_jz : in std_logic;
		uc_sub : in std_logic;
		uc_dec : in std_logic;
		uc_shl : in std_logic;
		uc_hlt : in std_logic;
		uc_flag_n : in std_logic;
		uc_flag_z : in std_logic;
		uc_clock : in std_logic;
		uc_reset0 : in std_logic;
		uc_reset1 : in std_logic;
		uc_botao : in std_logic;
		
		uc_seletorMuxEnd : out std_logic;
		uc_seletorMuxDado : out std_logic;
		uc_cargaPC : out std_logic;
		uc_incrementaPC : out std_logic;
		uc_seletorMux : out std_logic;
		uc_cargaRem : out std_logic;
		uc_cargaRdm : out std_logic;
		uc_readRdm : out std_logic;
		uc_writeEnable : out std_logic_vector(0 downto 0);
		uc_cargaRi : out std_logic;
		uc_cargaN : out std_logic;
		uc_cargaZ : out std_logic;
		uc_seletorUla : out std_logic_vector (2 downto 0);
		uc_led_attrib : out std_logic;
		uc_cargaAc : out std_logic;
		uc_contador : out std_logic_vector (2 downto 0)
	);
	end component;
	
	-- PROGRAM COUNTER
	component pc
	port
	(
		pc_novo_valor : in std_logic_vector (7 downto 0);
		pc_clock : in std_logic;
		pc_reset : in std_logic;
		pc_carga : in std_logic;
		pc_incrementa : in std_logic;
		pc_saida : out std_logic_vector (7 downto 0)
	);
	end component;
	
	-- DIVISOR DE FREQUENCIA
	component div
	port
	(
		div_clock : in std_logic;
		div_reset : in std_logic;
		div_clock_500hz : out std_logic
	);
	end component;
	
	-- CONVERSORES DOS DISPLAYS
	component conv
	port
	(
		conv_entrada : in std_logic_vector (3 downto 0);
		conv_saida : out std_logic_vector (7 downto 0)
	);
	end component;
	
	-- DECODIFICADOR DOS DISPLAYS
	component disp
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
	end component;
	
	-- MULTIPLEXADOR
	component mux
	port
	(
		mux_dado1 : in std_logic_vector (7 downto 0);
		mux_dado2 : in std_logic_vector (7 downto 0);
		mux_seletor : in std_logic;
		mux_saida : out std_logic_vector (7 downto 0)
	);
	end component;
	
	-- REGISTRADOR DE ENDERECOS DA MEMORIA
	component reg_end
	port
	(
		reg_end_entrada : in std_logic_vector (7 downto 0);
		reg_end_clock : in std_logic;
		reg_end_reset : in std_logic;
		reg_end_carga : in std_logic;
		reg_end_saida : out std_logic_vector (7 downto 0)
	);
	end component;
	
	-- REGISTRADOR DE DADOS DA MEMORIA
	component rdm
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
	end component;
	
	-- MEMORIA
	component mem
	port 
	(
		clka : in std_logic;
		wea : in std_logic_vector (0 downto 0);
		addra : in std_logic_vector (7 downto 0);
		dina : in std_logic_vector (7 downto 0);
		douta : out std_logic_vector (7 downto 0)
	);
	end component;
	
	-- ACUMULADOR
	component ac
	port
	(
		ac_entrada : in std_logic_vector (7 downto 0);
		ac_clock : in std_logic;
		ac_reset : in std_logic;
		ac_carga : in std_logic;
		ac_saida : out std_logic_vector (7 downto 0)
	);
	end component;
	
	-- UNIDADE LOGICA E ARTIMETICA
	component ula
	port
	(
		ula_dado1 : in std_logic_vector (7 downto 0);
		ula_dado2 : in std_logic_vector (7 downto 0);
		ula_seletor : in std_logic_vector (2 downto 0);
		ula_saida : out std_logic_vector (7 downto 0);
		ula_flag_n : out std_logic;
		ula_flag_z : out std_logic
	);
	end component;
	
	-- REGISTRADOR DE INSTRUCOES
	component ri
	port
	(
		ri_entrada : in std_logic_vector (7 downto 0);
		ri_clock : in std_logic;
		ri_reset : in std_logic;
		ri_carga : in std_logic;
		ri_saida : out std_logic_vector (7 downto 0)
	);
	end component;
	
	-- DECODIFICADOR DE INSTRUCOES
	component decod
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
	end component;
	
	-- REGISTRADOR DA FLAG N
	component reg_n
	port
	(
		reg_n_entrada : in std_logic;
		reg_n_clock : in std_logic;
		reg_n_reset : in std_logic;
		reg_n_carga : in std_logic;
		reg_n_saida : out std_logic
	);
	end component;
	
	-- REGISTRADOR DA FLAG Z
	component reg_z
	port
	(
		reg_z_entrada : in std_logic;
		reg_z_clock : in std_logic;
		reg_z_reset : in std_logic;
		reg_z_carga : in std_logic;
		reg_z_saida : out std_logic
	);
	end component;
	
	-- CONTROLADOR DAS CHAVES
	component ch
	port
	(
		ch_chave7 : in std_logic;
		ch_chave6 : in std_logic;
		ch_chave5 : in std_logic;
		ch_chave4 : in std_logic;
		ch_chave3 : in std_logic;
		ch_chave2 : in std_logic;
		ch_chave1 : in std_logic;
		ch_chave0 : in std_logic;
		ch_contador : in std_logic_vector (2 downto 0);
		ch_end : out std_logic_vector (7 downto 0);
		ch_dado : out std_logic_vector (7 downto 0)
	);
	end component;

	----------------- FIOS INTERMEDIARIOS -----------------
	
	-- RESET GERAL
	signal reset : std_logic;
	
	-- PROGRAM COUNTER
	signal pc_saida_s : std_logic_vector (7 downto 0);
	
	-- DECODIFICADOR DOS DISPLAYS
	-- nao precisa de fios porque conecta na saida do neander
	
	-- CONVERSORES DOS DISPLAYS
	signal conv_saida0_s : std_logic_vector (7 downto 0);
	signal conv_saida1_s : std_logic_vector (7 downto 0);
	signal conv_saida2_s : std_logic_vector (7 downto 0);
	signal conv_saida3_s : std_logic_vector (7 downto 0);
	
	-- DIVISOR DE FREQUENCIA
	signal div_clock_500hz_s : std_logic;
	
	-- UNIDADE DE CONTROLE
	signal uc_seletorMuxEnd_s : std_logic;
	signal uc_seletorMuxDado_s : std_logic;
	signal uc_cargaPC_s : std_logic;
	signal uc_incrementaPC_s : std_logic;
	signal uc_seletorMux_s : std_logic;
	signal uc_cargaRem_s : std_logic;
	signal uc_cargaRdm_s : std_logic;
	signal uc_readRdm_s : std_logic;
	signal uc_writeEnable_s : std_logic_vector(0 downto 0);
	signal uc_cargaAc_s : std_logic;
	signal uc_seletorUla_s : std_logic_vector (2 downto 0);
	signal uc_cargaRi_s : std_logic;
	signal uc_cargaN_s : std_logic;
	signal uc_cargaZ_s : std_logic;
	signal uc_led_attrib_s : std_logic;
	signal uc_contador_s : std_logic_vector (2 downto 0);
	
	-- MULTIPLEXADORES
	signal mux_saida_s : std_logic_vector (7 downto 0);
	signal mux_chend_saida_s : std_logic_vector (7 downto 0);
	signal mux_chdado_saida_s : std_logic_vector (7 downto 0);
	
	-- REGISTRADOR DE ENDERECOS DA MEMORIA
	signal reg_end_saida_s : std_logic_vector (7 downto 0);
	
	-- REGISTRADOR DE DADOS DA MEMORIA
	signal rdm_saida1_s : std_logic_vector (7 downto 0);
	signal rdm_saida2_s : std_logic_vector (7 downto 0);
	
	-- MEMORIA
	signal douta_s : std_logic_vector (7 downto 0);
	
	-- ACUMULADOR
	signal ac_saida_s : std_logic_vector (7 downto 0);
	
	-- UNIDADE LOGICA E ARTIMETICA
	signal ula_saida_s : std_logic_vector (7 downto 0);
	signal ula_flag_n_s : std_logic;
	signal ula_flag_z_s : std_logic;
	
	-- REGISTRADOR DE INSTRUCOES
	signal ri_saida_s : std_logic_vector (7 downto 0);
	
	-- DECODIFICADOR DE INSTRUCOES
	signal decod_nop_s : std_logic;
	signal decod_sta_s : std_logic;
	signal decod_lda_s : std_logic;
	signal decod_add_s : std_logic;
	signal decod_or_s : std_logic;
	signal decod_and_s : std_logic;
	signal decod_not_s : std_logic;
	signal decod_jmp_s : std_logic;
	signal decod_jn_s : std_logic;
	signal decod_jz_s : std_logic;
	signal decod_sub_s : std_logic;
	signal decod_dec_s : std_logic;
	signal decod_shl_s : std_logic;
	signal decod_hlt_s : std_logic;
	
	-- REGISTRADOR DA FLAG N
	signal reg_n_saida_s : std_logic;
	
	-- REGISTRADOR DA FLAG Z
	signal reg_z_saida_s : std_logic;
	
	-- CONTROLADOR DAS CHAVES
	signal ch_end_s : std_logic_vector (7 downto 0);
	signal ch_dado_s : std_logic_vector (7 downto 0);
	signal ch_chave7_s, ch_chave6_s, ch_chave5_s, ch_chave4_s, ch_chave3_s, ch_chave2_s, ch_chave1_s, ch_chave0_s : std_logic;
	
begin

	----------------- RESET GERAL -----------------
	
	reset <= reset0 or reset1;
	
	----------------- PORT MAPS -----------------
	
	-- UNIDADE DE CONTROLE
	unidade_controle : uc
	port map
	(
		uc_nop => decod_nop_s,
		uc_sta => decod_sta_s,
		uc_lda => decod_lda_s,
		uc_add => decod_add_s,
		uc_or => decod_or_s,
		uc_and => decod_and_s,
		uc_not => decod_not_s,
		uc_jmp => decod_jmp_s,
		uc_jn => decod_jn_s,
		uc_jz => decod_jz_s,
		uc_sub => decod_sub_s,
		uc_dec => decod_dec_s,
		uc_shl => decod_shl_s,
		uc_hlt => decod_hlt_s,
		uc_flag_n => reg_n_saida_s,
		uc_flag_z => reg_z_saida_s,
		
		uc_clock => clock,
		uc_reset0 => reset0,
		uc_reset1 => reset1,
		uc_botao => botao,
		
		uc_seletorMuxEnd => uc_seletorMuxEnd_s,
		uc_seletorMuxDado => uc_seletorMuxDado_s,
		uc_cargaPC => uc_cargaPC_s,
		uc_incrementaPC => uc_incrementaPC_s,
		uc_seletorMux => uc_seletorMux_s,
		uc_cargaRem => uc_cargaRem_s,
		uc_cargaRdm => uc_cargaRdm_s,
		uc_readRdm => uc_readRdm_s,
		uc_writeEnable => uc_writeEnable_s,
		uc_cargaRi => uc_cargaRi_s,
		uc_cargaN => uc_cargaN_s,
		uc_cargaZ => uc_cargaZ_s,
		uc_seletorUla => uc_seletorUla_s,
		uc_led_attrib => uc_led_attrib_s,
		uc_cargaAc => uc_cargaAc_s,
		uc_contador => uc_contador_s
	);
	
	-- PROGRAM COUNTER
	program_counter : pc
	port map
	(
		pc_novo_valor => rdm_saida1_s,
		pc_clock => clock,
		pc_reset => reset,
		pc_carga => uc_cargaPC_s,
		pc_incrementa => uc_incrementaPC_s,
		pc_saida => pc_saida_s
	);
	
	-- DIVISOR DE FREQUENCIA
	divisor_de_frequencia : div
	port map
	(
		div_clock => clock,
		div_reset => reset,
		div_clock_500hz => div_clock_500hz_s
	);
	
	-- CONVERSOR DO DISPLAY 0
	conversor_display_0 : conv
	port map
	(
		conv_entrada => pc_saida_s (3 downto 0),
		conv_saida => conv_saida0_s
	);
	
	-- CONVERSOR DO DISPLAY 1
	conversor_display_1 : conv
	port map
	(
		conv_entrada => pc_saida_s (7 downto 4),
		conv_saida => conv_saida1_s
	);
	
	-- CONVERSOR DO DISPLAY 2
	conversor_display_2 : conv
	port map
	(
		conv_entrada => ac_saida_s (3 downto 0),
		conv_saida => conv_saida2_s
	);
	
	-- CONVERSOR DO DISPLAY 3
	conversor_display_3 : conv
	port map
	(
		conv_entrada => ac_saida_s (7 downto 4),
		conv_saida => conv_saida3_s
	);
	
	-- DECODIFICADOR DOS DISPLAYS
	decodificador_displays : disp
	port map
	(
		disp_clock_500hz => div_clock_500hz_s,
		disp_reset => reset,
		disp_entrada3 => conv_saida3_s,
		disp_entrada2 => conv_saida2_s,
		disp_entrada1 => conv_saida1_s,
		disp_entrada0 => conv_saida0_s,
		disp_seletor => display_seletor,
		disp_saida => display_saida
	);
	
	-- MULTIPLEXADOR RDM_OUT/PC
	multiplexador_rdm_pc : mux
	port map
	(
		mux_dado1 => pc_saida_s,
		mux_dado2 => rdm_saida1_s,
		mux_seletor => uc_seletorMux_s,
		mux_saida => mux_saida_s
	);
	
	-- MULTIPLEXADOR CH_END/REM
	-- editar o seletor
	multiplexador_chEnd_rem : mux
	port map
	(
		mux_dado1 => reg_end_saida_s,
		mux_dado2 => ch_end_s,
		mux_seletor => uc_seletorMuxEnd_s,
		mux_saida => mux_chend_saida_s
	);
	
	-- MULTIPLEXADOR CH_DADO/RDM_IN
	-- editar o seletor
	multiplexador_chDado_rdm : mux
	port map
	(
		mux_dado1 => rdm_saida2_s,
		mux_dado2 => ch_dado_s,
		mux_seletor => uc_seletorMuxDado_s,
		mux_saida => mux_chdado_saida_s
	);
	
	-- REGISTRADOR DE ENDERECOS DA MEMORIA
	registrador_enderecos : reg_end
	port map
	(
		reg_end_entrada => mux_saida_s,
		reg_end_clock => clock,
		reg_end_reset => reset,
		reg_end_carga => uc_cargaRem_s,
		reg_end_saida => reg_end_saida_s
	);
	
	-- REGISTRADOR DE DADOS DA MEMORIA
	registrador_dados : rdm
	port map
	(
		rdm_entrada1 => douta_s,
		rdm_entrada2 => ac_saida_s,
		rdm_clock => clock,
		rdm_carga => uc_cargaRdm_s,
		rdm_reset => reset,
		rdm_read => uc_readRdm_s,
		rdm_saida1 => rdm_saida1_s,
		rdm_saida2 => rdm_saida2_s
	);
	
	-- MEMORIA
	memoria : mem
	port map
	(
		clka => clock,
		wea => uc_writeEnable_s,
		addra => mux_chend_saida_s,
		dina => mux_chdado_saida_s,
		douta => douta_s
	);
	
	-- ACUMULADOR
	acumulador : ac
	port map
	(
		ac_entrada => ula_saida_s,
		ac_clock => clock,
		ac_reset => reset,
		ac_carga => uc_cargaAc_s,
		ac_saida => ac_saida_s
	);
	
	-- UNIDADE LOGICA E ARTIMETICA
	unidade_logica_aritmetica : ula
	port map
	(
		ula_dado1 => ac_saida_s,
		ula_dado2 => rdm_saida1_s,
		ula_seletor => uc_seletorUla_s,
		ula_saida => ula_saida_s,
		ula_flag_n => ula_flag_n_s,
		ula_flag_z => ula_flag_z_s
	);
	
	-- REGISTRADOR DE INSTRUCOES
	registrador_instrucoes : ri
	port map
	(
		ri_entrada => rdm_saida1_s,
		ri_clock => clock,
		ri_reset => reset,
		ri_carga => uc_cargaRi_s,
		ri_saida => ri_saida_s
	);
	
	-- DECODIFICADOR DE INSTRUCOES
	decodificador_instrucoes : decod
	port map
	(
		decod_entrada => ri_saida_s,
		decod_nop => decod_nop_s,
		decod_sta => decod_sta_s,
		decod_lda => decod_lda_s,
		decod_add => decod_add_s,
		decod_or => decod_or_s,
		decod_and => decod_and_s,
		decod_not => decod_not_s,
		decod_jmp => decod_jmp_s,
		decod_jn => decod_jn_s,
		decod_jz => decod_jz_s,
		decod_sub => decod_sub_s,
		decod_dec => decod_dec_s,
		decod_shl => decod_shl_s,
		decod_hlt => decod_hlt_s
	);
	
	-- REGISTRADOR DA FLAG N
	registrador_flag_n : reg_n
	port map
	(
		reg_n_entrada => ula_flag_n_s,
		reg_n_clock => clock,
		reg_n_reset => reset,
		reg_n_carga => uc_cargaN_s,
		reg_n_saida => reg_n_saida_s
	);
	
	-- REGISTRADOR DA FLAG Z
	registrador_flag_z : reg_z
	port map
	(
		reg_z_entrada => ula_flag_z_s,
		reg_z_clock => clock,
		reg_z_reset => reset,
		reg_z_carga => uc_cargaZ_s,
		reg_z_saida => reg_z_saida_s
	);
	
	-- CONTROLADOR DAS CHAVES
	chaves : ch
	port map
	(
		ch_chave7 => ch_chave7_s,
		ch_chave6 => ch_chave6_s,
		ch_chave5 => ch_chave5_s,
		ch_chave4 => ch_chave4_s,
		ch_chave3 => ch_chave3_s,
		ch_chave2 => ch_chave2_s,
		ch_chave1 => ch_chave1_s,
		ch_chave0 => ch_chave0_s,
		ch_contador => uc_contador_s,
		ch_end => ch_end_s,
		ch_dado => ch_dado_s
	);
	
	-- PROCESS PARA ATRIBUIR OS SINAIS CORRETOS AOS LEDS
	process (uc_led_attrib_s, ula_saida_s, ch_chave7_s, ch_chave6_s, ch_chave5_s, ch_chave4_s, ch_chave3_s,
			 ch_chave2_s, ch_chave1_s, ch_chave0_s)
	begin
	
		if (uc_led_attrib_s = '1') then
			led7 <= ula_saida_s(7);
			led6 <= ula_saida_s(6);
			led5 <= ula_saida_s(5);
			led4 <= ula_saida_s(4);
			led3 <= ula_saida_s(3);
			led2 <= ula_saida_s(2);
			led1 <= ula_saida_s(1);
			led0 <= ula_saida_s(0);
		else
			led7 <= ch_chave7_s;
			led6 <= ch_chave6_s;
			led5 <= ch_chave5_s;
			led4 <= ch_chave4_s;
			led3 <= ch_chave3_s;
			led2 <= ch_chave2_s;
			led1 <= ch_chave1_s;
			led0 <= ch_chave0_s;
		end if;
		
	end process;
	
	-- ATRIBUICOES DAS CHAVES
	ch_chave7_s <= chave7;
	ch_chave6_s <= chave6;
	ch_chave5_s <= chave5;
	ch_chave4_s <= chave4;
	ch_chave3_s <= chave3;
	ch_chave2_s <= chave2;
	ch_chave1_s <= chave1;
	ch_chave0_s <= chave0;

end arch;