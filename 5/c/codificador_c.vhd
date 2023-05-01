library ieee;
use ieee.std_logic_1164.all;

entity codificador_c is
port	(a: in std_logic_vector(7 downto 0);
		 y: out std_logic_vector (2 downto 0)
		 );
end codificador_c;

architecture estructura of  codificador_c is
begin

process (a)

variable i: integer:=0;

begin
	for i in 0 to 7 loop
				
		case a is
		
			when  "10000000"=>	y<="000";
			when 	"01000000"=>	y<="001";
			when  "00100000"=>	y<="010";
			when  "00010000"=>	y<="011";
			when  "00001000"=>	y<="100";
			when  "00000100"=>	y<="101";
			when  "00000010"=>	y<="110";
			when  "00000001"=>	y<="111";
		
			when others =>	y<="ZZZ";
		
		end case;
	end loop;
end process;

end estructura;