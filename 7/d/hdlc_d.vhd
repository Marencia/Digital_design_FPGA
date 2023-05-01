library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity hdlc_d is
port (clk, reset, Din: in std_logic;
		F: out std_logic
);
end hdlc_d;

architecture estructura of hdlc_d is

	--type e is (eReset, Primer0, Primer1, Segundo1, Tercer1, Cuarto1, Quinto1, Sexto1, Inicio);
	
	attribute enum_encoding : string;
	subtype e is unsigned (3 downto 0);
		constant eReset : e := "0000";
		constant Primer0 : e := "0001";
		constant Primer1 : e := "0010";
		constant Segundo1 : e := "0011";
		constant Tercer1 : e := "0100";
		constant Cuarto1 : e := "0101";
		constant Quinto1 : e := "0110";
		constant Sexto1 : e := "0111";
		constant Inicio : e := "1000";
	signal estado:e;
	
begin
	
	process(clk, reset)
	begin
	
	if reset ='0' then
		estado<=eReset;
		
	elsif (rising_edge(clk)) then
		case estado is
			
			when eReset  => if Din='0' then
									estado<=Primer0;
								 else
									estado<=eReset;
								 end if;
			
			when Primer0  => if Din='1' then
									estado<=Primer1;
								  else
									estado<=Primer0;
								  end if;
								 
			when Primer1  => if Din='1' then
								    estado<=Segundo1;
								  else
									 estado<=Primer0;
								  end if;
								 
			when Segundo1 => if Din='1' then
								    estado<=Tercer1;
								  else
									 estado<=Primer0;
								  end if;
								 
			when Tercer1  => if Din='1' then
								    estado<=Cuarto1;
								  else
									 estado<=Primer0;
								  end if;
	
			when Cuarto1  => if Din='1' then
								    estado<=Quinto1;
								  else
									 estado<=Primer0;
								  end if;
			
			when Quinto1  => if Din='1' then
								    estado<=Sexto1;
								  else
									 estado<=Primer0;
								  end if;
								  
			when Sexto1   => if Din='1' then
								    estado<=eReset;
								  else
									 estado<=Inicio;
								  end if;
								  
			when Inicio   => if Din='1' then
								    estado<=eReset;
								  else
									 estado<=Primer0;
								  end if;
			when others   => null;
			
	end case;	
	end if;
	end process;

	process (estado)
	
	begin
	
		if estado=Inicio then
			F<='1';
		else
			F<='0';
		end if;	
		
	end process;
	
end estructura;