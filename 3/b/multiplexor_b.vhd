library ieee;
use ieee.std_logic_1164.all;

entity multiplexor_b is
port	(a, b: in std_logic_vector(7 downto 0);
		 sel: in std_logic;
		 y: out std_logic_vector (7 downto 0)
		 );
end multiplexor_b;


architecture estructura of multiplexor_b is
begin

process (a, b, sel)
begin
	
	case sel is
		
		when '1' =>	y<=b;
		when '0' =>	y<=a;
		when others =>	y<="ZZZZZZZZ";
		
	end case;
end process;

end estructura;
