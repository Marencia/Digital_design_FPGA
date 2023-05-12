library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador is
	port(
			clk:in std_logic;
			rst:in std_logic;
			au,bu,cu,du,eu,fu,gu,p1:out std_logic;
			ad,bd,cd,dd,ed,fd,gd,p2:out std_logic
			);
end contador;

architecture proyectoa of contador is
signal salidaunidad:std_logic_vector (3 downto 0);
signal salidadecena:std_logic_vector (3 downto 0);
signal unhertz:std_logic;
shared variable cambio:bit;
begin
--contador
process(clk,rst)
variable cont:integer range 0 to 1;
begin	
		if rising_edge(clk) then
			if  rst='0' then
			cont:=0;
			else
			cont := cont + 1;
			end if;
		end if;
	if cont=1 then 
	unhertz<='1';
--	cont:=0;
	else
	unhertz<='0';
	end if;
end process;

--contador unidad
process(clk,rst,unhertz)
variable contunidad:integer range 0 to 9;
begin	
if rising_edge(clk) then
	if rst='0' then
	contunidad:=0;
	elsif unhertz='1' then
		contunidad := contunidad + 1;
	end if;
	end if;
	salidaunidad<=std_logic_vector(to_unsigned(contunidad,4));
		
		if contunidad=10 then
			contunidad:=0;
		end if;
		
		if contunidad=9 then 
			cambio:='1';
		else
			cambio:='0';
		end if;
		
		--cambio se debe dar en 9 no en 10 por eso no se inicia la decena
		
end process;
--contador decena
process(clk,rst,unhertz, salidaunidad)
variable contdecena:integer range 0 to 9;
begin	
if rising_edge(clk) then
	if rst='0' then
	contdecena:=0;
	elsif  unhertz='1' then
		if cambio='1' then
			contdecena := contdecena + 1;
		end if;
	end if;
	end if;
	salidadecena<=std_logic_vector(to_unsigned(contdecena,4));
end process;
--deco unidad	

	(au,bu,cu,du,eu,fu,gu,p1) <= std_logic_vector'("00000000") when salidaunidad= "0000" else
										  std_logic_vector'("01100000") when salidaunidad= "0001" else
										  std_logic_vector'("11011010") when salidaunidad= "0010" else
										  std_logic_vector'("11110010") when salidaunidad= "0011" else
										  std_logic_vector'("01100110") when salidaunidad= "0100" else
										  std_logic_vector'("10110110") when salidaunidad= "0101" else
										  std_logic_vector'("10111110") when salidaunidad= "0110" else
										  std_logic_vector'("11100010") when salidaunidad= "0111" else
										  std_logic_vector'("11111110") when salidaunidad= "1000" else
										  std_logic_vector'("11100110") when salidaunidad= "1001";
	

--deco decena
	(ad,bd,cd,dd,ed,fd,gd,p2) <= std_logic_vector'("00000000") when salidadecena= "0000" else
										  std_logic_vector'("01100000") when salidadecena= "0001" else
										  std_logic_vector'("11011010") when salidadecena= "0010" else 
										  std_logic_vector'("11110010") when salidadecena= "0011" else
										  std_logic_vector'("01100110") when salidadecena= "0100" else
										  std_logic_vector'("10110110") when salidadecena= "0101" else
										  std_logic_vector'("10111110") when salidadecena= "0110" else
										  std_logic_vector'("11100010") when salidadecena= "0111" else
										  std_logic_vector'("11111110") when salidadecena= "1000" else
										  std_logic_vector'("11100110") when salidadecena= "1001";
end;
