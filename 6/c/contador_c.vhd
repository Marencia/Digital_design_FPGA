library ieee;
use ieee.std_logic_1164.all;

entity contador_b is 
port ( clk, reset1, CE, L: in std_logic;
		 L_num: in integer range 0 to 15;
		 y: out std_logic_vector(3 downto 0)
		);
end contador_b;

architecture estructura of contador_b is
begin

process (CE, L)

variable i: integer:=0;

begin
if reset1 = '1' then
		i:=0;
		
	elsif CE='1' then
		
		if rising_edge(clk) then
		
			if L='1' then
			
				i:=L_num;
						
			else
				i:=i+1;
			end if;
		end if;
end if;

			case i is
			
					when  0  =>	y<="0000";
					when  1  =>	y<="0001";
					when  2  =>	y<="0010";
					when  3  =>	y<="0011";
					when  4  =>	y<="0100";
					when  5  =>	y<="0101";
					when  6  =>	y<="0110";
					when  7  =>	y<="0111";
					when  8  =>	y<="1000";
					when  9  =>	y<="1001";
					when  10 =>	y<="1010";
					when  11 =>	y<="1011";
					when  12 =>	y<="1100";
					when  13 =>	y<="1101";
					when  14 =>	y<="1110";
					when  15 =>	y<="1111";
				
				when others =>	y<="ZZZZ";
						
			end case;
		
end process;
end estructura;