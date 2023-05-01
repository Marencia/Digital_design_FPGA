library ieee;
use ieee.std_logic_1164.all;

entity multiplexor_d is
port	(a, b: in std_logic_vector(7 downto 0);
		 sel: in std_logic;
		 y: out std_logic_vector (7 downto 0)
		 );
end multiplexor_d;

architecture estructura of multiplexor_d is
begin

	with sel select
		y<=a			  when  '0', 
		   b  		  when  '1',
			"ZZZZZZZZ" when others;
	

end estructura;
