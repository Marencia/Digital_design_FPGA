--FALTARIA CREAR LAS VARIABLES PARA EL PUNTAJE Y MANDARLA POR DECO AL 7 SEGMENTOS
--ADEMAS DE CREAR EL PROCESO DEL CARTEL O METERLO DIRACTAMENTE AL FINAL CUANDO PUNTAJE =10

library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
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
                VGA_Blank:out std_logic;
                VGA_Sync:out std_logic;
                VGA_clk:out std_logic
                );
end proyectopingpong;
 
 
architecture DC of proyectopingpong is
 
type state is (inicial,s0,s1,s2,s3);
type estados is (movimiento1, movimiento2,movimiento4,movimiento3, inicio);
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
signal num_aleat:integer range 0 to 200;
signal v1,v2,v3,v4:integer range 0 to 3;
signal estado_pelotita:estados;
signal velocpelotita:std_logic;
 
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
variable contador_aleatorio: integer range 0 to 200;
 
begin
 
    if estado_pelotita=inicio then
        num_aleat<=contador_aleatorio;
        contador_aleatorio:=0;
    else
        contador_aleatorio:=contador_aleatorio+1;
    end if;
    
end process;
 
process (reloj)
variable vert: integer range 1 to 2;
 
begin
 
    if estado_pelotita=movimiento1 then
        v1<=vert;
    else
        vert:=vert+1;
    end if;
 
    
end process;
 
process (reloj)
variable vert: integer range 1 to 2;
 
begin
 
    if estado_pelotita=movimiento2 then
        v2<=vert;
    else
        vert:=vert+1;
    end if;
 
    
end process;
process (reloj)
variable vert: integer range 1 to 2;
 
begin
 
    if estado_pelotita=movimiento3 then
        v3<=vert;
    else
        vert:=vert+1;
    end if;
 
    
end process;
 
process (reloj)
variable vert: integer range 1 to 2;
 
begin
 
    if estado_pelotita=movimiento4 then
        v4<=vert;
    else
        vert:=vert+1;
    end if;
 
    
end process;
 
 
process(cuenta_horzjugador,cuenta_vertj1,cuenta_vertj2,entradaazul,entradarojo,entradaverde,salidacont1,salidacont2,clk)
variable cont1,cont2,cont3,cont4:integer range 0 to 10;
variable limite_vertjug1:integer :=300;
variable limite_vertjug2:integer :=200;
variable cuenta_horizpelota: integer;
variable posicion_h1, posicion_h2, posicion_v1, posicion_v2: integer;
variable i,j :integer;
 
begin
 
 
   
    if rising_edge(clk) then    
--velocidad pelotita
    if j=5000000 then
            velocpelotita<='1';
            j:=0;
    else
        velocpelotita<='0';
        j:=j+1;
    end if;
     end if;
     
        if rising_edge(velocpelotita) then
        case  estado_pelotita is
                when inicio =>
                    if i=15 then
                    i:=0;
                        if num_aleat>0 and num_aleat<50 then
                            estado_pelotita<=movimiento1;
                        elsif num_aleat>50 and num_aleat<100 then
                            estado_pelotita<=movimiento2;
                        elsif num_aleat>100 and num_aleat<150 then
                            estado_pelotita<=movimiento3;
                        elsif num_aleat>150 and num_aleat<200 then
                            estado_pelotita<=movimiento4;
                        end if;
                    else
                    i:=i+1;
                    estado_pelotita<=inicio;
                    end if;
                    
                    when movimiento1 =>         --diagonal arriba y derecha
                        if posicion_v1=478 and posicion_h2<608 then
                            estado_pelotita<=movimiento2;
                        elsif posicion_h2=638 then
                            estado_pelotita<=inicio;
									 --puntaje_j1:=puntaje_j1+1;
									 --if puntaje_j1=10 then
										--puntaje_j1:=0;
										--lamar a proceso que gano el JUGADOR 1
									--end if;
                        elsif posicion_h2=608 and (limite_vertjug2<=posicion_v2 and (limite_vertjug2+50)>=posicion_v1) then
                            estado_pelotita<=movimiento3;
                        else
                            estado_pelotita<=movimiento1;
                        end if;
                            
                    when movimiento2 =>         --diagonal abajo y derecha
                        if posicion_v2=0 and posicion_h2<608 then
                            estado_pelotita<=movimiento1;
                        elsif posicion_h2=638 then
                            estado_pelotita<=inicio;
									 --puntaje_j1:=puntaje_j1+1;
									 --if puntaje_j1=10 then
										--puntaje_j1:=0;
										--lamar a proceso que gano el JUGADOR 1
									--end if;
                        elsif posicion_h2=608 and (limite_vertjug2<=posicion_v2 and (limite_vertjug2+50)>=posicion_v1) then
                            estado_pelotita<=movimiento4;
                        else
                            estado_pelotita<=movimiento2;
                        end if;
                    
                    when movimiento3 =>         --diagonal arriba e izquierda
                        if posicion_v1=478 and posicion_h1>30 then
                            estado_pelotita<=movimiento4;
                        elsif posicion_h1=1 then
                            estado_pelotita<=inicio;
									 --puntaje_j2:=puntaje_j2+1;
									 --if puntaje_j2=10 then
										--puntaje_j2:=0;
										--lamar a proceso que gano el JUGADOR 2
									--end if;
                        elsif posicion_h1=30 and (limite_vertjug1<=posicion_v2 and (limite_vertjug1+50)>=posicion_v1) then
                            estado_pelotita<=movimiento1;
                        else
                            estado_pelotita<=movimiento3;
                        end if;
                        
                    when movimiento4 =>         --diagonal abajo e izquierda
                        if posicion_v2=0 and posicion_h1>30 then
                            estado_pelotita<=movimiento3;
                        elsif posicion_h1=1 then
                            estado_pelotita<=inicio;
									 --puntaje_j2:=puntaje_j2+1;
									  --if puntaje_j2=10 then
										--puntaje_j2:=0;
										--lamar a proceso que gano el JUGADOR 2
									--end if;
                        elsif posicion_h1=30 and (limite_vertjug1<=posicion_v2 and (limite_vertjug1+50)>=posicion_v1) then
                            estado_pelotita<=movimiento2;
                        else
                            estado_pelotita<=movimiento4;
                        end if;
                    end case;
                    
                if estado_pelotita=inicio then
                posicion_h1:=300;
                posicion_h2:=310;
                posicion_v2:=200;
                posicion_v1:=210;
                
                elsif estado_pelotita=movimiento1 then
                posicion_h1:=posicion_h1+1;
                posicion_h2:=posicion_h2+1;
                posicion_v1:=posicion_v1+v1;
                posicion_v2:=posicion_v2+v1;
            
                elsif estado_pelotita=movimiento2 then
                posicion_h1:=posicion_h1+1;
                posicion_h2:=posicion_h2+1;
                posicion_v1:=posicion_v1-v2;
                posicion_v2:=posicion_v2-v2;
                
                elsif estado_pelotita=movimiento3 then
                posicion_h1:=posicion_h1-1;
                posicion_h2:=posicion_h2-1;
                posicion_v1:=posicion_v1+v3;
                posicion_v2:=posicion_v2+v3;
                
                elsif estado_pelotita=movimiento4 then
                posicion_h1:=posicion_h1-1;
                posicion_h2:=posicion_h2-1;
                posicion_v1:=posicion_v1-v4;
                posicion_v2:=posicion_v2-v4;
                end if;
    end if;
if rising_edge(clk)then
        if (cuenta_horizpelota>posicion_h1) and (cuenta_horizpelota<posicion_h2) and (cuenta_vertpelota>posicion_v2) and (cuenta_vertpelota<posicion_v1)  then
 
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
    else 
    salidarojo<="1111111111";
    salidaazul<="1111111111";
    salidaverde<="1111111111";
    end if;
                
--BARRAS
--j1arriba      
        if cont1=4 then
            if limite_vertjug1<429 then
                limite_vertjug1:=limite_vertjug1+1;
            end if;
            cont1:=0;
        end if;
    if (salidacont1="1111111111111110") and (j1_arriba='0') then
        cont1:=cont1+1;
    end if;
    
--j1abajo
    if cont2=4 then
        if limite_vertjug1>=0 then
            limite_vertjug1:=limite_vertjug1-1;
        end if;
        cont2:=0;
    end if;
    if (salidacont1="0000000000000001") and (j1_abajo='0') then
        cont2:=cont2+1;
    end if;
    
--j2arriba
    if cont3=4 then
        if limite_vertjug2<429 then
            limite_vertjug2:=limite_vertjug2+1;
        end if;
        cont3:=0;
    end if;
    if (salidacont2="1111111111111110") and (j2_arriba='0') then
        cont3:=cont3+1;
    end if;
    
--j2abajo
    if cont4=4 then
        if limite_vertjug2>=0 then
            limite_vertjug2:=limite_vertjug2-1;
        end if;
        cont4:=0;
    end if;
    if (salidacont2="0000000000000001") and (j2_abajo='0') then
        cont4:=cont4+1;
    end if;
 
-- (Barras)
    --barras color y pelotita
if (cuenta_horzjugador>20) and (cuenta_horzjugador<30) and (cuenta_vertj1>limite_vertjug1) and (cuenta_vertj1<(limite_vertjug1+50))  then
 
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
 
elsif (cuenta_horzjugador>609) and (cuenta_horzjugador<619) and (cuenta_vertj2>limite_vertjug2) and (cuenta_vertj2<(limite_vertjug2+50)) then
 
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
else
salidarojo<="1111111111";
salidaazul<="1111111111";
salidaverde<="1111111111";
end if;
 
 
    
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
            
end;  

/*V1 superior 
V2 inferior
H2 derecha
H1 izquierda

en movimiento 3 cambiar if de barra a movimiento 1

en movimiento 4 cambiar if de barra a movimiento 2 */
