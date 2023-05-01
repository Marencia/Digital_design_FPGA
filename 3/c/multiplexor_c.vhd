library ieee;
use ieee.std_logic_1164.all;

entity multiplexor_c is
port	(a, b: in std_logic_vector(7 downto 0);
		 sel: in std_logic;
		 y: out std_logic_vector (7 downto 0)
		 );
end multiplexor_c;

architecture estructura of multiplexor_c is
begin


	One:	y<=a	when	sel='0' else
	         b  when  sel='1' else
				"ZZZZZZZZ";
	

end estructura;
