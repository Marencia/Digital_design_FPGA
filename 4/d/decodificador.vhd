library ieee;
use ieee.std_logic_1164.all;

entity decodificador is
port	(a: in std_logic_vector(2 downto 0);
		 y: out std_logic_vector (7 downto 0)
		 );
end decodificador;

architecture estructura of  decodificador is
begin

	with a select
		y<="10000000"			  when  "000",
			"01000000"			  when  "001",
			"00100000"		  	  when  "010",
			"00010000"			  when  "011",
			"00001000"		     when  "100",
			"00000100"			  when  "101",
			"00000010"			  when  "110",
		   "00000001"  		  when  "111",
						
		   "ZZZZZZZZ"			  when others;
	

end estructura;
