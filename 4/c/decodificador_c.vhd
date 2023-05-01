library ieee;
use ieee.std_logic_1164.all;

entity decodificador_c is
port	(a: in std_logic_vector(2 downto 0);
		 y: out std_logic_vector (7 downto 0)
		 );
end decodificador_c;

architecture estructura of  decodificador_c is

begin
process (a)

variable i: integer:=0;

begin
	for i in 0 to 7 loop
				
		case a is
		
			when  "000"=>	y<="10000000";
			when 	"001"=>	y<="01000000";
			when  "010"=>	y<="00100000";
			when  "011"=>	y<="00010000";
			when  "100"=>	y<="00001000";
			when  "101"=>	y<="00000100";
			when  "110"=>	y<="00000010";
			when  "111"=>	y<="00000001";
		
			when others =>	y<="ZZZZZZZZ";
		
		end case;
	end loop;
end process;
end estructura;
