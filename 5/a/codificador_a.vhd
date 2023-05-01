library ieee;
use ieee.std_logic_1164.all;

entity codificador_a is
port	(a: in std_logic_vector(7 downto 0);
		 y: out std_logic_vector (2 downto 0)
		 );
end codificador_a;

architecture estructura of  codificador_a is
begin

		y<="000"	 when  a = "10000000" else
			"001"	 when  a = "01000000" else
			"010"	 when  a = "00100000" else
			"011"  when  a = "00010000" else
			"100"	 when  a = "00001000" else
			"101"	 when  a = "00000100" else
			"110"	 when  a = "00000010" else
		   "111"  when  a = "00000001" else
						
		   "ZZZ";


end estructura;
