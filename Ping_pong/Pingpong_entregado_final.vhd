--FALTARIA CREAR LAS VARIABLES PARA EL PUNTAJE Y MANDARLA POR DECO AL 7 SEGMENTOS
--ADEMAS DE CREAR EL PROCESO DEL CARTEL O METERLO DIRACTAMENTE AL FINAL CUANDO PUNTAJE =10

library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
LIBRARY lpm;
USE lpm.lpm_components.all;
 
 
entity proyectopingpong is
        port(reloj:in std_logic;
                j1_arriba:in std_logic;
                j1_abajo:in std_logic;
                j2_arriba:in std_logic;
                j2_abajo:in std_logic;
                entradarojo:in std_logic_vector (5 downto 0);
                entradaverde:in std_logic_vector (5 downto 0);
                entradaazul:in std_logic_vector (5 downto 0);
                salidarojo:out std_logic_vector (9 downto 0);
                salidaverde:out std_logic_vector (9 downto 0);
                salidaazul:out std_logic_vector (9 downto 0);
                VGA_HS:out std_logic;
                VGA_VS:out std_logic;
					 a1,b1,cc1,d1,e1,f1,g1,p1:out std_logic;
					 a2,b2,cc2,d2,e2,f2,g2,p2:out std_logic;
                VGA_Blank:out std_logic;
                VGA_Sync:out std_logic;
                VGA_clk:out std_logic
                );
end proyectopingpong;
 
 
architecture DC of proyectopingpong is
 
type state is (inicial,s0,s1,s2,s3);
type estados is ( inicio,movimiento1,movimiento2,movimiento3,movimiento4, cartel1, cartel2, cartel1b, cartel2b);
signal estado1:state;
signal estado2:state;
signal clk:std_logic;
signal H_blank:std_logic;
signal V_blank:std_logic;
signal Hs:std_logic;
signal salidacont1:std_logic_vector(15 downto 0);
signal salidacont2:std_logic_vector(15 downto 0);
signal cuenta_horizpelota:integer range 0 to 650;
signal cuenta_vertpelota:integer range 0 to 490;
signal cuenta_horzjugador:integer range 0 to 650;
signal cuenta_vertj1:integer range 0 to 490;
signal cuenta_vertj2:integer range 0 to 490;
signal cuentacartel_h:integer range 0 to 650;
signal cuentacartel_v:integer range 0 to 490;
signal num_aleat:integer range 0 to 3;
signal v1,v2,v3,v4:integer range 1 to 3;
signal estado_pelotita:estados;
signal spuntaje_j1,spuntaje_j2:integer;

 
component lpm_counter is
    generic (lpm_width:integer);
    port(clock:in std_logic;
          clk_en:in std_logic;
          updown:in std_logic;
            q:out std_logic_vector(15 downto 0));
end component lpm_counter;
 
 
begin
 
C1:lpm_counter generic map (lpm_width => 16)
                    Port map (clock=>clk,clk_en=>j1_arriba xor j1_abajo,updown=>((not j1_arriba) and j1_abajo),q=>salidacont1);
C2:lpm_counter generic map (lpm_width => 16)
                    Port map (clock=>clk,clk_en=>j2_arriba xor j2_abajo,updown=>((not j2_arriba) and j2_abajo),q=>salidacont2);
--salidas
    VGA_clk<=clk;
    VGA_Sync<='0';
    VGA_Blank<=H_blank and V_blank;
    VGA_HS<=Hs;
 
--proceso para cada estado y salida
process (reloj)
variable contador_aleatorio: integer range 0 to 3;

begin

    if estado_pelotita=inicio then
        num_aleat<=contador_aleatorio;
    else
        contador_aleatorio:=contador_aleatorio+1;
    end if;
    
end process;
-- 
process (reloj)
variable vert: integer range 1 to 3;

begin
  vert:=1;
    if estado_pelotita=movimiento1 then
        v1<=vert;
    else
        vert:=vert+1;
    end if;
 
    
end process;
 
process (reloj)
variable vert: integer range 1 to 3;

begin
--   vert:=1;
    if estado_pelotita=movimiento2 then
        v2<=vert;
	 else
        vert:=vert+1;
    end if;
 
    
end process;
process (reloj)
variable vert: integer range 1 to 3;

begin
   vert:=1;
    if estado_pelotita=movimiento3 then
        v3<=vert;
    else
        vert:=vert+1;
    end if;
 
    
end process;
 
process (reloj)
variable vert: integer range 1 to 3;

begin
--  vert:=1; 
    if estado_pelotita=movimiento4 then
        v4<=vert;
    else
        vert:=vert+1;
    end if;
 
    
end process;
-- 
 
process(cuenta_horzjugador,cuenta_vertj1,cuenta_vertj2,entradaazul,entradarojo,entradaverde,salidacont1,salidacont2,clk,num_aleat,cuentacartel_h, cuentacartel_v)
variable cont1,cont2,cont3,cont4:integer range 0 to 10;
variable limite_vertjug1:integer :=200;
variable limite_vertjug2:integer :=200;
variable posicion_h1, posicion_h2, posicion_v1, posicion_v2: integer;
variable i,k,f :integer:=0;
variable j :integer;
variable cuentass :integer:=0;
variable puntaje_j1:integer:=0;
VARiable puntaje_j2:integer:=0;
--variable veloc:integer;
 
begin
 
 
   
     if rising_edge(clk) then
        case  estado_pelotita is
                when inicio =>
					 posicion_h1:=300;
                posicion_h2:=310;
                posicion_v2:=210;
                posicion_v1:=200;
                    if i=100000000 then
                    i:=0;
							if num_aleat=0 then
--                        if ((num_aleat>=0 and num_aleat<2))then
--									if ((num_aleat mod 2)=0) then
										estado_pelotita<=movimiento1;
									elsif  num_aleat=1 then
										estado_pelotita<=movimiento2;
--									end if;
										
                       elsif  num_aleat=2 then
--									if ((num_aleat mod 2)=0) then
									   estado_pelotita<=movimiento3;
									else
                            estado_pelotita<=movimiento4;
									 end if;
--                        end if;
                    else
                    i:=i+1;
						  
                    estado_pelotita<=inicio;
                    end if;
                    
                    when movimiento1 =>         --diagonal arriba y derecha
                       
							  if ((posicion_v1<6 and posicion_v1>0)and posicion_h2<608) then
                            estado_pelotita<=movimiento2;
                        elsif posicion_h2=638 then
                           if puntaje_j1=2 then
										puntaje_j1:=0;
										puntaje_j2:=0;
									 estado_pelotita<=cartel1;
									 else
									 puntaje_j1:=puntaje_j1+1;
									 estado_pelotita<=inicio;

										--lamar a proceso que gano el JUGADOR 1
									end if;
                        elsif (posicion_h2=608 and (limite_vertjug2>posicion_v1 and (limite_vertjug2-50)<posicion_v2)) then
                            estado_pelotita<=movimiento3;
								elsif (posicion_v1=limite_vertjug2 and (posicion_h2<619 and posicion_h2>609)) then
									 estado_pelotita<=movimiento2;
									
                        elsif	 cuentass=250000 then
									posicion_h1:=posicion_h1+1;
									posicion_h2:=posicion_h2+1;
									posicion_v1:=posicion_v1-v1;
									posicion_v2:=posicion_v2-v1;
									cuentass:=0;
									estado_pelotita<=movimiento1;
								else	
								cuentass:=cuentass+1;
								  estado_pelotita<=movimiento1;
                        end if;
                            
                    when movimiento2 =>         --diagonal abajo y derecha
                        if ((posicion_v2<480 and posicion_v2>475) and posicion_h2<608) then
                            estado_pelotita<=movimiento1;
                        elsif posicion_h2=638 then
                           if puntaje_j1=2 then
										puntaje_j1:=0;
										puntaje_j2:=0;
									 estado_pelotita<=cartel1;
									 else
									 puntaje_j1:=puntaje_j1+1;
									 estado_pelotita<=inicio;

										--lamar a proceso que gano el JUGADOR 1
									end if;
                        elsif (posicion_h2=608 and (limite_vertjug2>posicion_v1 and (limite_vertjug2-50)<posicion_v2)) then
                            estado_pelotita<=movimiento4;
								elsif (posicion_v2=(limite_vertjug2-50) and (posicion_h2<619 and posicion_h2>609)) then
									 estado_pelotita<=movimiento1;
                        elsif cuentass=250000	   then
								posicion_h1:=posicion_h1+1;
								posicion_h2:=posicion_h2+1;
								posicion_v1:=posicion_v1+v2;
								posicion_v2:=posicion_v2+v2;
                            estado_pelotita<=movimiento2;
									 cuentass:=0;
								else
									cuentass:=cuentass+1;
									estado_pelotita<=movimiento2;
                        end if;
--                    
                    when movimiento3 =>         --diagonal arriba e izquierda
                        if ((posicion_v1<6 and posicion_v1>0) and posicion_h1>30) then
                            estado_pelotita<=movimiento4;
                        elsif posicion_h1=1 then
                           if puntaje_j2=2 then
										puntaje_j2:=0;
										puntaje_j1:=0;
									 estado_pelotita<=cartel2;
									 else
									 puntaje_j2:=puntaje_j2+1;
									 estado_pelotita<=inicio;

										--lamar a proceso que gano el JUGADOR 2
									end if;
                        elsif (posicion_h1=30 and ((limite_vertjug1-50)<posicion_v2 and limite_vertjug1>posicion_v1)) then
                            estado_pelotita<=movimiento1;
								elsif (posicion_v1=limite_vertjug1 and (posicion_h1<30 and posicion_h1>20)) then
									estado_pelotita<=movimiento4;
                        elsif  cuentass=250000 then
									posicion_h1:=posicion_h1-1;
									posicion_h2:=posicion_h2-1;
									posicion_v1:=posicion_v1-v3;
									posicion_v2:=posicion_v2-v3;
                           estado_pelotita<=movimiento3;
									cuentass:=0;
								else
									cuentass:=cuentass+1;
									estado_pelotita<=movimiento3;
                        end if;
                        
                    when movimiento4 =>         --diagonal abajo e izquierda
                        if ((posicion_v2<480 and posicion_v2>475) and posicion_h1>30) then
                            estado_pelotita<=movimiento3;
                        elsif posicion_h1=1 then
                           if puntaje_j2=2 then
										puntaje_j2:=0;
										puntaje_j1:=0;
									 estado_pelotita<=cartel2;
									 else
									 puntaje_j2:=puntaje_j2+1;
									 estado_pelotita<=inicio;

										--lamar a proceso que gano el JUGADOR 2
									end if;
                        elsif (posicion_h1=30 and ((limite_vertjug1-50)<posicion_v2 and limite_vertjug1>posicion_v1))then
                            estado_pelotita<=movimiento2;
								elsif (posicion_v2=(limite_vertjug1-50) and (posicion_h1<30 and posicion_h1>20)) then
									 estado_pelotita<=movimiento3;
                        elsif cuentass=250000 then
								posicion_h1:=posicion_h1-1;
								posicion_h2:=posicion_h2-1;
								posicion_v1:=posicion_v1+v4;
								posicion_v2:=posicion_v2+v4;
								cuentass:=0;
								estado_pelotita<=movimiento4;
								else
								cuentass:=cuentass+1;
								estado_pelotita<=movimiento4;
								end if;
								
								when cartel1 =>
									if k=50000000 then
										k:=0;
										estado_pelotita<=cartel1b;
									else
										--muestro cartel 1
										k:=k+1;
										estado_pelotita<=cartel1;
									end if;
									
								when cartel1b=>
									if k=50000000 then
										k:=0;
										estado_pelotita<=inicio;
									else
										--muestro cartel 1b
										k:=k+1;
										estado_pelotita<=cartel1b;
									end if;
							
								when cartel2 =>
									if f=50000000 then
										f:=0;
										estado_pelotita<=cartel2b;
									else
										--muestro cartel 2
										f:=f+1;
										estado_pelotita<=cartel2;
									end if;
									
								when cartel2b=>
									if k=50000000 then
										k:=0;
										estado_pelotita<=inicio;
									else
										--muestro cartel 2b
										k:=k+1;
										estado_pelotita<=cartel2b;
									end if;
								
                    end case;


                
--BARRAS
--j1arriba      
        if cont1=4 then
            if limite_vertjug1<480 then
                limite_vertjug1:=limite_vertjug1+1;
            end if;
            cont1:=0;
        end if;
    if (salidacont1="1111111111111110") and (j1_arriba='0') then
        cont1:=cont1+1;
    end if;
    
--j1abajo
    if cont2=4 then
        if limite_vertjug1>=50 then
            limite_vertjug1:=limite_vertjug1-1;
        end if;
        cont2:=0;
    end if;
    if (salidacont1="0000000000000001") and (j1_abajo='0') then
        cont2:=cont2+1;
    end if;
    
--j2arriba
    if cont3=4 then
        if limite_vertjug2<480 then
            limite_vertjug2:=limite_vertjug2+1;
        end if;
        cont3:=0;
    end if;
    if (salidacont2="1111111111111110") and (j2_arriba='0') then
        cont3:=cont3+1;
    end if;
    
--j2abajo
    if cont4=4 then
        if limite_vertjug2>=50 then
            limite_vertjug2:=limite_vertjug2-1;
        end if;
        cont4:=0;
    end if;
    if (salidacont2="0000000000000001") and (j2_abajo='0') then
        cont4:=cont4+1;
    end if;
 
-- (Barras)
    --barras color y pelotita
if (cuenta_horzjugador>20) and (cuenta_horzjugador<30) and (cuenta_vertj1>(limite_vertjug1-50)) and (cuenta_vertj1<limite_vertjug1)  then
 
salidaverde(9)<=entradarojo(5);
salidaverde(8)<=entradarojo(4);
salidaverde(7)<=entradarojo(3);
salidaverde(6)<=entradarojo(2);
salidaverde(5)<=entradarojo(1);
salidaverde(4)<=entradarojo(0);
salidaverde(3)<='0';
salidaverde(2)<='0';
salidaverde(1)<='0';
salidaverde(0)<='0';
 
salidaazul(9)<=entradaverde(5);
salidaazul(8)<=entradaverde(4);
salidaazul(7)<=entradaverde(3);
salidaazul(6)<=entradaverde(2);
salidaazul(5)<=entradaverde(1);
salidaazul(4)<=entradaverde(0);
salidaazul(3)<='0';
salidaazul(2)<='0';
salidaazul(1)<='0';
salidaazul(0)<='0';
 
salidarojo(9)<=entradaazul(5);
salidarojo(8)<=entradaazul(4);
salidarojo(7)<=entradaazul(3);
salidarojo(6)<=entradaazul(2);
salidarojo(5)<=entradaazul(1);
salidarojo(4)<=entradaazul(0);
salidarojo(3)<='0';
salidarojo(2)<='0';
salidarojo(1)<='0';
salidarojo(0)<='0';
 
elsif (cuenta_horzjugador>609) and (cuenta_horzjugador<619) and (cuenta_vertj2>(limite_vertjug2-50)) and (cuenta_vertj2<limite_vertjug2) then
 
salidaverde(9)<=entradarojo(5);
salidaverde(8)<=entradarojo(4);
salidaverde(7)<=entradarojo(3);
salidaverde(6)<=entradarojo(2);
salidaverde(5)<=entradarojo(1);
salidaverde(4)<=entradarojo(0);
salidaverde(3)<='0';
salidaverde(2)<='0';
salidaverde(1)<='0';
salidaverde(0)<='0';
 
salidaazul(9)<=entradaverde(5);
salidaazul(8)<=entradaverde(4);
salidaazul(7)<=entradaverde(3);
salidaazul(6)<=entradaverde(2);
salidaazul(5)<=entradaverde(1);
salidaazul(4)<=entradaverde(0);
salidaazul(3)<='0';
salidaazul(2)<='0';
salidaazul(1)<='0';
salidaazul(0)<='0';
 
salidarojo(9)<=entradaazul(5);
salidarojo(8)<=entradaazul(4);
salidarojo(7)<=entradaazul(3);
salidarojo(6)<=entradaazul(2);
salidarojo(5)<=entradaazul(1);
salidarojo(4)<=entradaazul(0);
salidarojo(3)<='0';
salidarojo(2)<='0';
salidarojo(1)<='0';
salidarojo(0)<='0';
elsif (cuenta_horizpelota>posicion_h1) and (cuenta_horizpelota<posicion_h2) and (cuenta_vertpelota<posicion_v2) and (cuenta_vertpelota>posicion_v1)  then
 
salidarojo<="0000000000";
salidaazul<="0000000000";
salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>237) and (cuentacartel_v<243) and (cuentacartel_h>109) and (cuentacartel_h<508)) then

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Palabra 'GAME'
--Letra 'G' :)
		
elsif ((estado_pelotita = cartel1) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>109) and (cuentacartel_h<115)) then

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>209) and (cuentacartel_v<216) and (cuentacartel_h>109) and (cuentacartel_h<151)) then

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>258) and (cuentacartel_v<265) and (cuentacartel_h>109) and (cuentacartel_h<151)) then

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>237) and (cuentacartel_v<265) and (cuentacartel_h>145) and (cuentacartel_h<151)) then

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

--Letra 'A' :)

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>159) and (cuentacartel_h<165)) then --linea izq 

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>159) and (cuentacartel_h<197)) then --techito 

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and(cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>191) and (cuentacartel_h<197)) then--linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Letra 'M' :)

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>210) and (cuentacartel_h<216)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and(cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>250) and (cuentacartel_h<256)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and(cuentacartel_v>216) and (cuentacartel_v<243) and (cuentacartel_h>230) and (cuentacartel_h<236)) then --linea med

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and(cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>210) and (cuentacartel_h<229)) then --techito izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and(cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>237) and (cuentacartel_h<256)) then --techito izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Letra 'E' :)

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>267) and (cuentacartel_h<273)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>267) and (cuentacartel_h<303)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>267) and (cuentacartel_h<303)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	
	
--Palabra 'OVER'
--Letra 'O' :)

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>341) and (cuentacartel_h<347)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>372) and (cuentacartel_h<378)) then -- linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>341) and (cuentacartel_h<378)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>341) and (cuentacartel_h<378)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Letra 'V' :)

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>388) and (cuentacartel_h<394)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>412) and (cuentacartel_h<418)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>388) and (cuentacartel_h<418)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

--Letra 'E' :)

elsif  ((estado_pelotita = cartel1) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>427) and (cuentacartel_h<433)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel1) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>427) and (cuentacartel_h<461)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel1) and (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>427) and (cuentacartel_h<461)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Letra 'R' :)

elsif ((estado_pelotita = cartel1) and  (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>471) and (cuentacartel_h<477)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>209) and (cuentacartel_v<243) and (cuentacartel_h>502) and (cuentacartel_h<508)) then --linea der sup

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>237) and (cuentacartel_v<265) and (cuentacartel_h>494) and (cuentacartel_h<500)) then --linea der inf

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>471) and (cuentacartel_h<508)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	

--Linea que atraviesa 'PLAYER' :)

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>122) and (cuentacartel_v<128) and (cuentacartel_h>117) and (cuentacartel_h<392)) then

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Palabra 'PLAYER'
--Letra 'P' :)

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>117) and (cuentacartel_h<162)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>117) and (cuentacartel_h<123)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>156) and (cuentacartel_h<162)) then --linea der
	
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Letra 'L' :)

elsif ((estado_pelotita = cartel1) and  (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>170) and (cuentacartel_h<176)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>147) and (cuentacartel_v<153) and (cuentacartel_h>170) and (cuentacartel_h<207)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	

--Letra 'A' :)

elsif ((estado_pelotita = cartel1) and  (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>216) and (cuentacartel_h<222)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>252) and (cuentacartel_h<258)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>216) and (cuentacartel_h<258)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Letra 'Y' :)

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>268) and (cuentacartel_h<274)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>299) and (cuentacartel_h<305)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>122) and (cuentacartel_v<153) and (cuentacartel_h>284) and (cuentacartel_h<290)) then --linea med

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Letra 'E' :)

elsif  ((estado_pelotita = cartel1) and (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>316) and (cuentacartel_h<323)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel1) and (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>316) and (cuentacartel_h<350)) then --techito
	
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel1) and (cuentacartel_v>147) and (cuentacartel_v<153) and (cuentacartel_h>316) and (cuentacartel_h<350)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	
	
	
--Letra 'R' :)

elsif  ((estado_pelotita = cartel1) and (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>356) and (cuentacartel_h<362)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif  ((estado_pelotita = cartel1) and (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>386) and (cuentacartel_h<392)) then --linea der sup

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif  ((estado_pelotita = cartel1) and (cuentacartel_v>122) and (cuentacartel_v<153) and (cuentacartel_h>377) and (cuentacartel_h<383)) then --linea der inf

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif  ((estado_pelotita = cartel1) and (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>356) and (cuentacartel_h<392)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

--Numero '2' :)

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>120) and (cuentacartel_v<153) and (cuentacartel_h>476) and (cuentacartel_h<482)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>94) and (cuentacartel_v<126) and (cuentacartel_h>500) and (cuentacartel_h<506)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>476) and (cuentacartel_h<504)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>147) and (cuentacartel_v<153) and (cuentacartel_h>476) and (cuentacartel_h<504)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif ((estado_pelotita = cartel1) and (cuentacartel_v>120) and (cuentacartel_v<126) and (cuentacartel_h>476) and (cuentacartel_h<504)) then --medio

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	
	
--Cartel para ganador/a

--Palabra "SO'"
--Letra 'S' :)

elsif  ((estado_pelotita = cartel1b) and  (cuentacartel_v>209) and (cuentacartel_v<243) and (cuentacartel_h>109) and (cuentacartel_h<115)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel1b) and (cuentacartel_v>237) and (cuentacartel_v<265) and (cuentacartel_h>142) and (cuentacartel_h<148)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel1b) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>109) and (cuentacartel_h<148)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel1b) and (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>109) and (cuentacartel_h<148) )then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel1b) and (cuentacartel_v>237) and (cuentacartel_v<243) and (cuentacartel_h>109) and (cuentacartel_h<148)) then --medio

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

--Letra 'O' :)

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>159) and (cuentacartel_h<165)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>191) and (cuentacartel_h<197)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>159) and (cuentacartel_h<197)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>159) and (cuentacartel_h<197)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

	
--Simbolo " ' " :)

elsif  ((estado_pelotita = cartel1b) and (cuentacartel_v>209) and (cuentacartel_v<226) and (cuentacartel_h>210) and (cuentacartel_h<216)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
 
	
--Palabra 'RE'
--Letra 'R' :)

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>267) and (cuentacartel_h<273)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>209) and (cuentacartel_v<243) and (cuentacartel_h>298) and (cuentacartel_h<304)) then --linea der sup

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>237) and (cuentacartel_v<265) and (cuentacartel_h>290) and (cuentacartel_h<296)) then --linea der inf

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>267) and (cuentacartel_h<304)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>237) and (cuentacartel_v<243) and (cuentacartel_h>267) and (cuentacartel_h<304)) then --medio

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	
	
--Letra 'E' :)

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>313) and (cuentacartel_h<319)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>313) and (cuentacartel_h<347)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>313) and (cuentacartel_h<347)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>237) and (cuentacartel_v<243) and (cuentacartel_h>313) and (cuentacartel_h<334)) then --medio

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Palabra "VO'"
--Letra 'V' :)

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>388) and (cuentacartel_h<394)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>412) and (cuentacartel_h<418)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>388) and (cuentacartel_h<418)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
	
--Letra 'O' :)

elsif  ((estado_pelotita = cartel1b) and  (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>427) and (cuentacartel_h<433)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel1b) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>455) and (cuentacartel_h<461)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel1b) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>427) and (cuentacartel_h<461)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel1b) and (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>427) and (cuentacartel_h<461)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


--Simbolo " ' " :)

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>209) and (cuentacartel_v<226) and (cuentacartel_h>471) and (cuentacartel_h<477)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
	
--Numero '1' :)

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>488) and (cuentacartel_h<494)) then --linea vert

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>147) and (cuentacartel_v<153) and (cuentacartel_h>476) and (cuentacartel_h<504)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
	
--Linea que atraviesa 'PLAYER' :)

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>122) and (cuentacartel_v<128) and (cuentacartel_h>117) and (cuentacartel_h<392)) then

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Palabra 'PLAYER'
--Letra 'P' :)

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>117) and (cuentacartel_h<162)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>117) and (cuentacartel_h<123)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>156) and (cuentacartel_h<162)) then --linea der
	
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Letra 'L' :)

elsif ((estado_pelotita = cartel1b) and  (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>170) and (cuentacartel_h<176)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>147) and (cuentacartel_v<153) and (cuentacartel_h>170) and (cuentacartel_h<207)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	

--Letra 'A' :)

elsif ((estado_pelotita = cartel1b) and  (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>216) and (cuentacartel_h<222)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>252) and (cuentacartel_h<258)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>216) and (cuentacartel_h<258)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Letra 'Y' :)

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>268) and (cuentacartel_h<274)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>299) and (cuentacartel_h<305)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel1b) and (cuentacartel_v>122) and (cuentacartel_v<153) and (cuentacartel_h>284) and (cuentacartel_h<290)) then --linea med

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Letra 'E' :)

elsif  ((estado_pelotita = cartel1b) and (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>316) and (cuentacartel_h<323)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel1b) and (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>316) and (cuentacartel_h<350)) then --techito
	
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel1b) and (cuentacartel_v>147) and (cuentacartel_v<153) and (cuentacartel_h>316) and (cuentacartel_h<350)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	
	
	
--Letra 'R' :)

elsif  ((estado_pelotita = cartel1b) and (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>356) and (cuentacartel_h<362)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif  ((estado_pelotita = cartel1b) and (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>386) and (cuentacartel_h<392)) then --linea der sup

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif  ((estado_pelotita = cartel1b) and (cuentacartel_v>122) and (cuentacartel_v<153) and (cuentacartel_h>377) and (cuentacartel_h<383)) then --linea der inf

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif  ((estado_pelotita = cartel1b) and (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>356) and (cuentacartel_h<392)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	
	

	
--GANA EL/LA JUGADOR/A 2 Y PIERDE LA/EL JUGADORA/R 1
--Linea que atraviesa game over :)

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>237) and (cuentacartel_v<243) and (cuentacartel_h>109) and (cuentacartel_h<508)) then

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	

--Palabra 'GAME'
--Letra 'G' :)
		
elsif ((estado_pelotita = cartel2) and  (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>109) and (cuentacartel_h<115)) then

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>209) and (cuentacartel_v<216) and (cuentacartel_h>109) and (cuentacartel_h<151)) then

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>258) and (cuentacartel_v<265) and (cuentacartel_h>109) and (cuentacartel_h<151)) then

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>237) and (cuentacartel_v<265) and (cuentacartel_h>142) and (cuentacartel_h<148)) then

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
	
--Letra 'A' :)

elsif ((estado_pelotita = cartel2) and  (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>159) and (cuentacartel_h<165)) then --linea izq 

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>159) and (cuentacartel_h<197)) then --techito 

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>191) and (cuentacartel_h<197)) then--linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
	
--Letra 'M' :)

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>210) and (cuentacartel_h<216)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>250) and (cuentacartel_h<256)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>216) and (cuentacartel_v<243) and (cuentacartel_h>230) and (cuentacartel_h<236)) then --linea med

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>210) and (cuentacartel_h<229)) then --techito izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>237) and (cuentacartel_h<256)) then --techito izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
	
--Letra 'E' :)

elsif ((estado_pelotita = cartel2) and(cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>267) and (cuentacartel_h<273)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	

elsif ((estado_pelotita = cartel2) and(cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>267) and (cuentacartel_h<303)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	

elsif ((estado_pelotita = cartel2) and(cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>267) and (cuentacartel_h<303)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
	
--Palabra 'OVER'
--Letra 'O' :)

elsif((estado_pelotita = cartel2) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>341) and (cuentacartel_h<347)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and(cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>372) and (cuentacartel_h<378)) then -- linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif((estado_pelotita = cartel2) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>341) and (cuentacartel_h<378)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and(cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>341) and (cuentacartel_h<378)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
	
--Letra 'V' :)

elsif ((estado_pelotita = cartel2) and(cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>388) and (cuentacartel_h<394)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>412) and (cuentacartel_h<418)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>388) and (cuentacartel_h<418))then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
	
--Letra 'E' :)

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>427) and (cuentacartel_h<433)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>427) and (cuentacartel_h<461)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>427) and (cuentacartel_h<461)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
	

--Letra 'R' :)

elsif ((estado_pelotita = cartel2) and  (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>471) and (cuentacartel_h<477)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>209) and (cuentacartel_v<243) and (cuentacartel_h>502) and (cuentacartel_h<508)) then --linea der sup

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>237) and (cuentacartel_v<265) and (cuentacartel_h>494) and (cuentacartel_h<500)) then --linea der inf

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>471) and (cuentacartel_h<508)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	
	
--Linea que atraviesa 'PLAYER' :)

elsif ((estado_pelotita = cartel2) and  (cuentacartel_v>122) and (cuentacartel_v<128) and (cuentacartel_h>117) and (cuentacartel_h<392)) then

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	
	
	
--Palabra 'PLAYER'
--Letra 'P' :)

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>117) and (cuentacartel_h<162)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif ((estado_pelotita = cartel2) and(cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>117) and (cuentacartel_h<123)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif ((estado_pelotita = cartel2) and(cuentacartel_v>258) and (cuentacartel_v<265) and (cuentacartel_h>156) and (cuentacartel_h<162)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	
	
	
	
--Letra 'L' :)

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>170) and (cuentacartel_h<176)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif ((estado_pelotita = cartel2) and(cuentacartel_v>147) and (cuentacartel_v<153) and (cuentacartel_h>170) and (cuentacartel_h<207)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

	

--Letra 'A' :)

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>216) and (cuentacartel_h<222)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif ((estado_pelotita = cartel2) and(cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>252) and (cuentacartel_h<258)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif ((estado_pelotita = cartel2) and(cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>216) and (cuentacartel_h<258)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	
	
	
--Letra 'Y' :)

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>268) and (cuentacartel_h<274)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>299) and (cuentacartel_h<305)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2) and (cuentacartel_v>122) and (cuentacartel_v<153) and (cuentacartel_h>284) and (cuentacartel_h<290)) then --linea med

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Letra 'E' :)

elsif  ((estado_pelotita = cartel2) and (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>316) and (cuentacartel_h<323)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel2) and (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>316) and (cuentacartel_h<350)) then --techito
	
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel2) and (cuentacartel_v>147) and (cuentacartel_v<153) and (cuentacartel_h>316) and (cuentacartel_h<350)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	
	
	
--Letra 'R' :)

elsif  ((estado_pelotita = cartel2) and (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>356) and (cuentacartel_h<362)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif  ((estado_pelotita = cartel2) and (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>386) and (cuentacartel_h<392)) then --linea der sup

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif  ((estado_pelotita = cartel2) and (cuentacartel_v>122) and (cuentacartel_v<153) and (cuentacartel_h>377) and (cuentacartel_h<383)) then --linea der inf

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif  ((estado_pelotita = cartel2) and (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>356) and (cuentacartel_h<392)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
	
--Numero '1' :)

elsif  ((estado_pelotita = cartel2) and(cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>488) and (cuentacartel_h<494)) then --linea vert
	
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel2) and(cuentacartel_v>147) and (cuentacartel_v<153) and (cuentacartel_h>476) and (cuentacartel_h<504)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	

	--Cartel para ganador/a

--Palabra "SO'"
--Letra 'S' :)

elsif  ((estado_pelotita = cartel2b) and  (cuentacartel_v>209) and (cuentacartel_v<243) and (cuentacartel_h>109) and (cuentacartel_h<115)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel2b) and (cuentacartel_v>237) and (cuentacartel_v<265) and (cuentacartel_h>142) and (cuentacartel_h<148)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel2b) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>109) and (cuentacartel_h<148)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel2b) and (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>109) and (cuentacartel_h<148) )then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel2b) and (cuentacartel_v>237) and (cuentacartel_v<243) and (cuentacartel_h>109) and (cuentacartel_h<148)) then --medio

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

--Letra 'O' :)

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>159) and (cuentacartel_h<165)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>191) and (cuentacartel_h<197)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>159) and (cuentacartel_h<197)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>159) and (cuentacartel_h<197)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

	
--Simbolo " ' " :)

elsif  ((estado_pelotita = cartel2b) and (cuentacartel_v>209) and (cuentacartel_v<226) and (cuentacartel_h>210) and (cuentacartel_h<216)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
 
	
--Palabra 'RE'
--Letra 'R' :)

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>267) and (cuentacartel_h<273)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>209) and (cuentacartel_v<243) and (cuentacartel_h>298) and (cuentacartel_h<304)) then --linea der sup

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>237) and (cuentacartel_v<265) and (cuentacartel_h>290) and (cuentacartel_h<296)) then --linea der inf

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>267) and (cuentacartel_h<304)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>237) and (cuentacartel_v<243) and (cuentacartel_h>267) and (cuentacartel_h<304)) then --medio

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	
	
--Letra 'E' :)

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>313) and (cuentacartel_h<319)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>313) and (cuentacartel_h<347)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>313) and (cuentacartel_h<347)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>237) and (cuentacartel_v<243) and (cuentacartel_h>313) and (cuentacartel_h<334)) then --medio

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Palabra "VO'"
--Letra 'V' :)

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>388) and (cuentacartel_h<394)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>412) and (cuentacartel_h<418)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>388) and (cuentacartel_h<418)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
	
--Letra 'O' :)

elsif  ((estado_pelotita = cartel2b) and  (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>427) and (cuentacartel_h<433)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel2b) and (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>455) and (cuentacartel_h<461)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel2b) and (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>427) and (cuentacartel_h<461)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel2b) and (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>427) and (cuentacartel_h<461)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


--Simbolo " ' " :)

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>209) and (cuentacartel_v<226) and (cuentacartel_h>471) and (cuentacartel_h<477)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	

--Linea que atraviesa 'PLAYER' :)

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>122) and (cuentacartel_v<128) and (cuentacartel_h>117) and (cuentacartel_h<392)) then

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Palabra 'PLAYER'
--Letra 'P' :)

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>117) and (cuentacartel_h<162)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>117) and (cuentacartel_h<123)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>156) and (cuentacartel_h<162)) then --linea der
	
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Letra 'L' :)

elsif ((estado_pelotita = cartel2b) and  (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>170) and (cuentacartel_h<176)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>147) and (cuentacartel_v<153) and (cuentacartel_h>170) and (cuentacartel_h<207)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	

--Letra 'A' :)

elsif ((estado_pelotita = cartel2b) and  (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>216) and (cuentacartel_h<222)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>252) and (cuentacartel_h<258)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>216) and (cuentacartel_h<258)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Letra 'Y' :)

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>268) and (cuentacartel_h<274)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>299) and (cuentacartel_h<305)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>122) and (cuentacartel_v<153) and (cuentacartel_h>284) and (cuentacartel_h<290)) then --linea med

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
--Letra 'E' :)

elsif  ((estado_pelotita = cartel2b) and (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>316) and (cuentacartel_h<323)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel2b) and (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>316) and (cuentacartel_h<350)) then --techito
	
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif  ((estado_pelotita = cartel2b) and (cuentacartel_v>147) and (cuentacartel_v<153) and (cuentacartel_h>316) and (cuentacartel_h<350)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	
	
	
--Letra 'R' :)

elsif  ((estado_pelotita = cartel2b) and (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>356) and (cuentacartel_h<362)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif  ((estado_pelotita = cartel2b) and (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>386) and (cuentacartel_h<392)) then --linea der sup

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif  ((estado_pelotita = cartel2b) and (cuentacartel_v>122) and (cuentacartel_v<153) and (cuentacartel_h>377) and (cuentacartel_h<383)) then --linea der inf

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif  ((estado_pelotita = cartel2b) and (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>356) and (cuentacartel_h<392)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";		
	
--Numero '2' :)

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>120) and (cuentacartel_v<153) and (cuentacartel_h>476) and (cuentacartel_h<482)) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>94) and (cuentacartel_v<126) and (cuentacartel_h>500) and (cuentacartel_h<506)) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>476) and (cuentacartel_h<504)) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>147) and (cuentacartel_v<153) and (cuentacartel_h>476) and (cuentacartel_h<504)) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";	

elsif ((estado_pelotita = cartel2b) and (cuentacartel_v>120) and (cuentacartel_v<126) and (cuentacartel_h>476) and (cuentacartel_h<504)) then --medio

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";		
	
else
salidarojo<="1111111111";
salidaazul<="1111111111";
salidaverde<="1111111111";
end if;
 
 
spuntaje_j1<=puntaje_j1;
spuntaje_j2<=puntaje_j2;    
end if;
end process;
 
--bajo a 25MHz 
process(reloj)
variable cont:integer range 0 to 2;
 
begin     
        if rising_edge(reloj) then
            if cont=1 then 
                clk<='1';
                cont:=0;
            else
                clk<='0';
                cont := cont + 1;
            end if;
        end if;
 
end process;
 
--genero Vga_hs
process(clk)
variable cuenta: integer range 0 to 1000;
begin
    if rising_edge(clk) then
        case estado1 is
            when inicial =>
                                H_blank<='0';
                                estado1<=s0;
            when s0 =>
                                H_blank<='0';
                                if cuenta=95 then   --95
                                    estado1<=s1;
                                    cuenta:=0;
                                else
                                    cuenta:=cuenta+1;
                                end if;
            when s1 =>
                                H_blank<='0';
                                if cuenta=47 then--47
                                    estado1<=s2;
                                    cuenta:=0;
                                else
                                    cuenta:=cuenta+1;
                                end if;
            when s2 =>
                                H_blank<='1';
                                if cuenta=639 then--639
                                    estado1<=s3;
                                    cuenta:=0;
                                else
                                    cuenta_horzjugador<=cuenta;
                                    cuenta_horizpelota<=cuenta;
												cuentacartel_h<=cuenta;
                                    cuenta:=cuenta+1;
                                end if;
            when s3 =>
                                H_blank<='0';
                                if cuenta=15 then--15
                                    estado1<=inicial;
                                    cuenta:=0;
                                else
                                    cuenta:=cuenta+1;
                                end if;
        end case;
    end if;
end process;
 
with estado1 select
        Hs<='0' when s0,
            '1' when others;
 
--genero Vga_vs
process(Hs)
variable cuenta: integer range 0 to 1000;
begin
            if falling_edge(Hs) then
                case estado2 is
                    when inicial =>
                                        V_blank<='0';
                                        estado2<=s0;
                    when s0 =>
                                        V_blank<='0';
                                        if cuenta=1 then--1
                                            estado2<=s1;
                                            cuenta:=0;
                                        else
                                            cuenta:=cuenta+1;
                                        end if;
                    when s1 =>
                                        V_blank<='0';
                                        if cuenta=32 then--32
                                            estado2<=s2;
                                            cuenta:=0;
                                        else
                                            cuenta:=cuenta+1;
                                        end if;
                    when s2 =>
                                        V_blank<='1';
                                        if cuenta=479 then--479     
                                            estado2<=s3;
                                            cuenta:=0;
                                        else
                                            cuenta_vertj1<=cuenta;
                                            cuenta_vertj2<=cuenta;
                                            cuenta_vertpelota<=cuenta;
														  cuentacartel_v<=cuenta;
                                            cuenta:=cuenta+1;
                                        end if;
                    when s3 =>
                                        V_blank<='0';
                                        if cuenta=9 then--9
                                            estado2<=inicial;
                                            cuenta:=0;
                                        else
                                            cuenta:=cuenta+1;
                                        end if;
            end case;
        end if;
 
end process;
 
with estado2 select
    VGA_VS<='0' when s0,
            '1' when others;
--jug1	
	with spuntaje_j1 select
			(a1,b1,cc1,d1,e1,f1,g1,p1) <= std_logic_vector'("00000010") when 0,
							std_logic_vector'("10011111") when 1,
							std_logic_vector'("00100101") when 2,
							std_logic_vector'("00001101") when 3,
							std_logic_vector'("10011001") when 4,
							std_logic_vector'("01001001") when 5,
							std_logic_vector'("00000010") when others ;
--jug2
	with spuntaje_j2 select
			(a2,b2,cc2,d2,e2,f2,g2,p2) <= std_logic_vector'("00000010") when 0,
							std_logic_vector'("10011111") when 1,
							std_logic_vector'("00100101") when 2,
							std_logic_vector'("00001101") when 3,
							std_logic_vector'("10011001") when 4,
							std_logic_vector'("01001001") when 5,
							std_logic_vector'("00000010") when others ;
            
end;  
