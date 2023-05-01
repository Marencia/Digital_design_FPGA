library ieee;
use ieee.std_logic_1164.all;

entity multiplexor is
port	(a, b: in std_logic_vector(7 downto 0);
		 sel: in std_logic;
		 y: out std_logic_vector (7 downto 0)
		 );
end multiplexor;


architecture estructura of multiplexor is
begin

process (a, b, sel)
begin

	if (sel='1') then
		y<=b;
	
	elsif (sel='0') then
		y<=a;
		
	else
		y<="ZZZZZZZZ";
	
	end if;
end process;

end estructura;
