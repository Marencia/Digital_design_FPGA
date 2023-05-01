library ieee;
use ieee.std_logic_1164.all;

entity decodificador_b is
port	(a: in std_logic_vector(2 downto 0);
		 y: out std_logic_vector (7 downto 0)
		 );
end decodificador_b;

architecture estructura of  decodificador_b is
begin

	process (a)
	begin
	
		case a is
		
			when  "000"=>	y<="10000000";
			when  "001"=>	y<="01000000";
			when  "010"=>	y<="00100000";
			when  "011"=>	y<="00010000";
			when  "100"=>	y<="00001000";
			when  "101"=>	y<="00000100";
			when  "110"=>	y<="00000010";
			when  "111"=>	y<="00000001";
		
			when others =>	y<="ZZZZZZZZ";
		
		end case;
	end process;

end estructura;
