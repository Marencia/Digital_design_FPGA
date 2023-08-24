library ieee;
library lpm;
use lpm.lpm_components.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity proyecto2 is
		port(reloj:in std_logic;
				rst:in std_logic;
				columna:in std_logic_vector (2 downto 0);
				display:out std_logic_vector(7 downto 0);
				fila:out std_logic_vector (3 downto 0);
				codigo:out std_logic_vector (3 downto 0);
				valido:out std_logic
				);
end proyecto2;

architecture teclado of proyecto2 is
type eliminarebotes is (descanso,cuenta,habilita);
signal estado:eliminarebotes;
signal teclapresionada:std_logic;
signal detener:std_logic; 
signal clk:STD_logic;
signal cod:std_logic_vector (3 downto 0);--salida del contador
signal disp:std_logic_vector(7 downto 0);--lo uso como registro
signal vari:std_logic;--lo uso como registro
--contador
component lpm_counter is 
		generic ( LPM_WIDTH : natural;
					  LPM_MODULUS:Natural); 
		port(clock:in std_logic;
				aclr:in std_logic;
				clk_en:in std_logic;
				q:out std_logic_vector (3 downto 0));
end component lpm_counter;

begin

process(reloj,rst)
variable cont:integer range 0 to 10;
begin	
		if rising_edge(reloj) then
			if  rst='0' then
			cont:=0;
			else
			cont := cont + 1;
			end if;
		end if;
	if cont=10 then 
	clk<='1';
	else
	clk<='0';
	end if;
end process;
C1:lpm_counter generic map(LPM_WIDTH=>4, LPM_MODULUS=>16)
					port map(clock=>clk, aclr=>not(rst), clk_en=>not(detener), q=>cod);
					
--decodificador
	process(cod)
		begin	
			case cod(3 downto 2) is
			when "00" =>
				fila<="0111";
			when "01" =>
				fila<="1011";
			when "10" =>
				fila<="1101";
			when "11" =>
				fila<="1110";
			end case;
	end process;
--multiplexor
	process(cod)
		begin	
			case cod(1 downto 0) is
			when "00" =>
				teclapresionada<=columna(0);
			when "01" =>
				teclapresionada<=columna(1);
			when "10" =>
				teclapresionada<=columna(2);
			when "11" =>
				teclapresionada<='1';
			end case;
	end process;
--elimina rebotes
process(teclapresionada,rst,clk)
variable cuentarebote:integer range 0  to 30;
	begin
		if rst='0' then
				estado<=descanso;
		elsif rising_edge(clk) then
			case estado is
			when descanso =>
				if teclapresionada='0' then 
					estado<=cuenta;
					detener<='1';
					cuentarebote:=0;
				else
					estado<=descanso;
					detener<='0';
				end if;
			when cuenta =>
			cuentarebote:=cuentarebote+1;
			if	teclapresionada='0' then
				if cuentarebote=2 then
					estado<=habilita;
					else estado<=cuenta;
					end if;
			else	estado<=descanso;
			end if;
			when habilita =>
			if teclapresionada='0' then
				estado<=habilita;
				else
				estado<=descanso;
			end if;
			end case;
		end if;
	end process;
process(estado,rst)
variable cod1:std_logic_vector (3 downto 0);
variable disp1:std_logic_vector(7 downto 0);	
	begin
		case estado is
			when descanso=> vari<='0';
			when cuenta=>   vari<='0';
			when habilita=>  vari<='1';
								cod1:=cod;
								disp1:=disp;
		end case;
		
		if rst='0' then
		display<="11111111";
		codigo<="0000";
		else if vari='1' then
		codigo<=cod1;
		display<=disp1;
		end if;
		end if;
valido<=vari;
end process;
--display

	with cod select
			disp <=  	"10011111" when "0000",--1
						   "00100101" when "0001",--2
						   "00001101" when "0010",--3
						   "01100011" when "0011",--C
						   "10011001" when "0100",--4
						   "01001001" when "0101",--5
						   "01000001" when "0110",--6
						   "10000101" when "0111",--d
						   "00011111" when "1000",--7
						   "00000001" when "1001",--8
						   "00011001" when "1010",--9
						   "01100001" when "1011",--E
						   "00010001" when "1100",--A
						   "00000011" when "1101",--0
						   "11000001" when "1110",--b
						   "11111111" when others ;	
	

end;