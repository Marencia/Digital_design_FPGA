--La pnatalla tiene las siguientes dimensiones:
--640 x 480 px (H x V)

--En el pixel 110H comienza el cartel
--En el pixel 210V comienza el cartel

--GANA EL JUGADOR 1 Y PIERDE EL JUGADOR 2


--Linea que atraviesa game over :)

if (cuentacartel_v>237) and (cuentacartel_v<243) and (cuentacartel_h>109) and (cuentacartel_h<508) then

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";
else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

end if;
--Palabra 'GAME'
--Letra 'G' :)
		
if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>109) and (cuentacartel_h<115) then

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<216) and (cuentacartel_h>109) and (cuentacartel_h<151) then

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>258) and (cuentacartel_v<265) and (cuentacartel_h>109) and (cuentacartel_h<151) then

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>237) and (cuentacartel_v<265) and (cuentacartel_h>142) and (cuentacartel_h<148) then

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
end if;

--Letra 'A' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>159) and (cuentacartel_h<165) then --linea izq 

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>159) and (cuentacartel_h<197) then --techito 

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>191) and (cuentacartel_h<197) then--linea der

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

end if;

--Letra 'M' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>210) and (cuentacartel_h<216) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>250) and (cuentacartel_h<256) then --linea der

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>216) and (cuentacartel_v<243) and (cuentacartel_h>230) and (cuentacartel_h<236) then --linea med

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>210) and (cuentacartel_h<229) then --techito izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>237) and (cuentacartel_h<256) then --techito izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

end if;


--Letra 'E' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>267) and (cuentacartel_h<273) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>267) and (cuentacartel_h<303) then --techito

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>267) and (cuentacartel_h<303) then --piso

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";


else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;


--Palabra 'OVER'
--Letra 'O' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>341) and (cuentacartel_h<347) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>372) and (cuentacartel_h<378) then -- linea der

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>341) and (cuentacartel_h<378) then --techito

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>341) and (cuentacartel_h<378) then --piso

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

end if;

--Letra 'V' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>388) and (cuentacartel_h<394) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<216) and (cuentacartel_h>412) and (cuentacartel_h<418) then --linea der

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>388) and (cuentacartel_h<418) then --piso

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";


else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;

--Letra 'E' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>427) and (cuentacartel_h<433) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>427) and (cuentacartel_h<461) then --techito

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>427) and (cuentacartel_h<461) then --piso

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";


else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;

--Letra 'R' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>471) and (cuentacartel_h<477) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<243) and (cuentacartel_h>502) and (cuentacartel_h<508) then --linea der sup

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>237) and (cuentacartel_v<265) and (cuentacartel_h>494) and (cuentacartel_h<500) then --linea der inf

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>471) and (cuentacartel_h<508) then --techito

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;


--Linea que atraviesa 'PLAYER' :)

if (cuentacartel_v>122) and (cuentacartel_v<128) and (cuentacartel_h>117) and (cuentacartel_h<392) then

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
end if;


--Palabra 'PLAYER'
--Letra 'P' :)

if (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>117) and (cuentacartel_h<162) then --techito

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>117) and (cuentacartel_h<123) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>258) and (cuentacartel_v<265) and (cuentacartel_h>156) and (cuentacartel_h<162) then --linea der

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;

--Letra 'L' :)

if (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>170) and (cuentacartel_h<176) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>147) and (cuentacartel_v<153) and (cuentacartel_h>170) and (cuentacartel_h<207) then --piso

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;

--Letra 'A' :)

if (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>216) and (cuentacartel_h<222) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>252) and (cuentacartel_h<258) then --linea der

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>216) and (cuentacartel_h<258) then --techito

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;

--Letra 'Y' :)

if (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>268) and (cuentacartel_h<274) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>299) and (cuentacartel_h<305) then --linea der

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>122) and (cuentacartel_v<153) and (cuentacartel_h>284) and (cuentacartel_h<290) then --linea med

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";


else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;

--Letra 'E' :)

if (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>316) and (cuentacartel_h<323) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>316) and (cuentacartel_h<350) then --techito

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>147) and (cuentacartel_v<153) and (cuentacartel_h>316) and (cuentacartel_h<350) then --piso

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";


else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;

--Letra 'R' :)

if (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>356) and (cuentacartel_h<362) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>386) and (cuentacartel_h<392) then --linea der sup

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>122) and (cuentacartel_v<153) and (cuentacartel_h>377) and (cuentacartel_h<383) then --linea der inf

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>356) and (cuentacartel_h<392) then --techito

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;

--Numero '2' :)

if (cuentacartel_v>120) and (cuentacartel_v<153) and (cuentacartel_h>476) and (cuentacartel_h<482) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>94) and (cuentacartel_v<126) and (cuentacartel_h>500) and (cuentacartel_h<506) then --linea der

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>476) and (cuentacartel_h<504) then --techito

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>147) and (cuentacartel_v<153) and (cuentacartel_h>476) and (cuentacartel_h<504) then --piso

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>120) and (cuentacartel_v<126) and (cuentacartel_h>476) and (cuentacartel_h<504) then --medio

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;


--Cartel para ganador/a

--Palabra "SO'"
--Letra 'S' :)

if (cuentacartel_v>209) and (cuentacartel_v<243) and (cuentacartel_h>109) and (cuentacartel_h<115) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>237) and (cuentacartel_v<265) and (cuentacartel_h>142) and (cuentacartel_h<148) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>109) and (cuentacartel_h<148) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>109) and (cuentacartel_h<148) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>237) and (cuentacartel_v<243) and (cuentacartel_h>109) and (cuentacartel_h<148) then --medio

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

else

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

end if;

--Letra 'O' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>159) and (cuentacartel_h<165) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>191) and (cuentacartel_h<197) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>159) and (cuentacartel_h<197) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>159) and (cuentacartel_h<197) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


else

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

end if;

--Simbolo " ' " :)

if (cuentacartel_v>209) and (cuentacartel_v<226) and (cuentacartel_h>210) and (cuentacartel_h<216) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

else

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

end if;

--Palabra 'RE'
--Letra 'R' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>267) and (cuentacartel_h<273) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>209) and (cuentacartel_v<243) and (cuentacartel_h>298) and (cuentacartel_h<304) then --linea der sup

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>237) and (cuentacartel_v<265) and (cuentacartel_h>290) and (cuentacartel_h<296) then --linea der inf

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>267) and (cuentacartel_h<304) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>237) and (cuentacartel_v<243) and (cuentacartel_h>267) and (cuentacartel_h<304) then --medio

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

else

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

end if;

--Letra 'E' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>313) and (cuentacartel_h<319) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>313) and (cuentacartel_h<347) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>313) and (cuentacartel_h<347) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>237) and (cuentacartel_v<243) and (cuentacartel_h>313) and (cuentacartel_h<334) then --medio

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

else

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

end if;


--Palabra "VO'"
--Letra 'V' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>388) and (cuentacartel_h<394) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>94) and (cuentacartel_v<265) and (cuentacartel_h>412) and (cuentacartel_h<418) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>388) and (cuentacartel_h<418) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

else

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

end if;

--Letra 'O' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>427) and (cuentacartel_h<433) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>455) and (cuentacartel_h<461) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>427) and (cuentacartel_h<461) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>427) and (cuentacartel_h<461) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

else

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

end if;

--Simbolo " ' " :)

if (cuentacartel_v>209) and (cuentacartel_v<226) and (cuentacartel_h>471) and (cuentacartel_h<477) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

else

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

end if;

  

--Numero '1' :)

if (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>497) and (cuentacartel_h<494) then --linea vert

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>157) and (cuentacartel_v<153) and (cuentacartel_h>476) and (cuentacartel_h<506) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

else

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

end if;

--**************************************************************************************************************************************************************************************************************
--GANA EL/LA JUGADOR/A 2 Y PIERDE LA/EL JUGADORA/R 1

  --Linea que atraviesa game over :)

if (cuentacartel_v>237) and (cuentacartel_v<243) and (cuentacartel_h>109) and (cuentacartel_h<508) then

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";
	
end if;
--Palabra 'GAME'
--Letra 'G' :)
		
if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>109) and (cuentacartel_h<115) then

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<216) and (cuentacartel_h>109) and (cuentacartel_h<151) then

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>258) and (cuentacartel_v<265) and (cuentacartel_h>109) and (cuentacartel_h<151) then

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>237) and (cuentacartel_v<265) and (cuentacartel_h>142) and (cuentacartel_h<148) then

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";
else

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

end if;

--Letra 'A' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>159) and (cuentacartel_h<165) then --linea izq 

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>159) and (cuentacartel_h<197) then --techito 

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>191) and (cuentacartel_h<197) then--linea der

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;

--Letra 'M' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>210) and (cuentacartel_h<216) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>250) and (cuentacartel_h<256) then --linea der

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>216) and (cuentacartel_v<243) and (cuentacartel_h>230) and (cuentacartel_h<236) then --linea med

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>210) and (cuentacartel_h<229) then --techito izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>237) and (cuentacartel_h<256) then --techito izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;


--Letra 'E' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>267) and (cuentacartel_h<273) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>267) and (cuentacartel_h<303) then --techito

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>267) and (cuentacartel_h<303) then --piso

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";


else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;


--Palabra 'OVER'
--Letra 'O' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>341) and (cuentacartel_h<347) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>372) and (cuentacartel_h<378) then -- linea der

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>341) and (cuentacartel_h<378) then --techito

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>341) and (cuentacartel_h<378) then --piso

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;

--Letra 'V' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>388) and (cuentacartel_h<394) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<216) and (cuentacartel_h>412) and (cuentacartel_h<418) then --linea der

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>388) and (cuentacartel_h<418) then --piso

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";


else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;

--Letra 'E' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>427) and (cuentacartel_h<433) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>427) and (cuentacartel_h<461) then --techito

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>427) and (cuentacartel_h<461) then --piso

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";


else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;

--Letra 'R' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>471) and (cuentacartel_h<477) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<243) and (cuentacartel_h>502) and (cuentacartel_h<508) then --linea der sup

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>237) and (cuentacartel_v<265) and (cuentacartel_h>494) and (cuentacartel_h<500) then --linea der inf

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>471) and (cuentacartel_h<508) then --techito

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;


--Linea que atraviesa 'PLAYER' :)

if (cuentacartel_v>122) and (cuentacartel_v<128) and (cuentacartel_h>117) and (cuentacartel_h<392) then

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

	
end if;


--Palabra 'PLAYER'
--Letra 'P' :)

if (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>117) and (cuentacartel_h<162) then --techito

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>117) and (cuentacartel_h<123) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>258) and (cuentacartel_v<265) and (cuentacartel_h>156) and (cuentacartel_h<162) then --linea der

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;

--Letra 'L' :)

if (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>170) and (cuentacartel_h<176) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>147) and (cuentacartel_v<153) and (cuentacartel_h>170) and (cuentacartel_h<207) then --piso

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;

--Letra 'A' :)

if (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>216) and (cuentacartel_h<222) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>252) and (cuentacartel_h<258) then --linea der

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>216) and (cuentacartel_h<258) then --techito

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;

--Letra 'Y' :)

if (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>268) and (cuentacartel_h<274) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>299) and (cuentacartel_h<305) then --linea der

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>122) and (cuentacartel_v<153) and (cuentacartel_h>284) and (cuentacartel_h<290) then --linea med

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";


else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;

--Letra 'E' :)

if (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>316) and (cuentacartel_h<323) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>316) and (cuentacartel_h<350) then --techito

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>147) and (cuentacartel_v<153) and (cuentacartel_h>316) and (cuentacartel_h<350) then --piso

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";


else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;

--Letra 'R' :)

if (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>356) and (cuentacartel_h<362) then --linea izq

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>94) and (cuentacartel_v<128) and (cuentacartel_h>386) and (cuentacartel_h<392) then --linea der sup

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>122) and (cuentacartel_v<153) and (cuentacartel_h>377) and (cuentacartel_h<383) then --linea der inf

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>356) and (cuentacartel_h<392) then --techito

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;

--Numero '1' :)

if (cuentacartel_v>94) and (cuentacartel_v<153) and (cuentacartel_h>497) and (cuentacartel_h<494) then --linea vert

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

elsif (cuentacartel_v>157) and (cuentacartel_v<153) and (cuentacartel_h>476) and (cuentacartel_h<506) then --piso

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";


else
	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


end if;


--Cartel para ganador/a

--Palabra "SO'"
--Letra 'S' :)

if (cuentacartel_v>209) and (cuentacartel_v<243) and (cuentacartel_h>109) and (cuentacartel_h<115) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>237) and (cuentacartel_v<265) and (cuentacartel_h>142) and (cuentacartel_h<148) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>109) and (cuentacartel_h<148) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>109) and (cuentacartel_h<148) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>237) and (cuentacartel_v<243) and (cuentacartel_h>109) and (cuentacartel_h<148) then --medio

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

else

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

end if;

--Letra 'O' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>159) and (cuentacartel_h<165) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>191) and (cuentacartel_h<197) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>159) and (cuentacartel_h<197) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>159) and (cuentacartel_h<197) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";


else

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

end if;

--Simbolo " ' " :)

if (cuentacartel_v>209) and (cuentacartel_v<226) and (cuentacartel_h>210) and (cuentacartel_h<216) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

else

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

end if;

--Palabra 'RE'
--Letra 'R' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>267) and (cuentacartel_h<273) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>209) and (cuentacartel_v<243) and (cuentacartel_h>298) and (cuentacartel_h<304) then --linea der sup

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>237) and (cuentacartel_v<265) and (cuentacartel_h>290) and (cuentacartel_h<296) then --linea der inf

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>267) and (cuentacartel_h<304) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>237) and (cuentacartel_v<243) and (cuentacartel_h>267) and (cuentacartel_h<304) then --medio

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

else

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

end if;

--Letra 'E' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>313) and (cuentacartel_h<319) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>313) and (cuentacartel_h<347) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>313) and (cuentacartel_h<347) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>237) and (cuentacartel_v<243) and (cuentacartel_h>313) and (cuentacartel_h<334) then --medio

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

else

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

end if;


--Palabra "VO'"
--Letra 'V' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>388) and (cuentacartel_h<394) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>94) and (cuentacartel_v<265) and (cuentacartel_h>412) and (cuentacartel_h<418) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>388) and (cuentacartel_h<418) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

else

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

end if;

--Letra 'O' :)

if (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>427) and (cuentacartel_h<433) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>209) and (cuentacartel_v<265) and (cuentacartel_h>455) and (cuentacartel_h<461) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>209) and (cuentacartel_v<215) and (cuentacartel_h>427) and (cuentacartel_h<461) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>259) and (cuentacartel_v<265) and (cuentacartel_h>427) and (cuentacartel_h<461) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

else

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

end if;

--Simbolo " ' " :)

if (cuentacartel_v>209) and (cuentacartel_v<226) and (cuentacartel_h>471) and (cuentacartel_h<477) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

else

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

end if;


--Numero '2' :)

if (cuentacartel_v>120) and (cuentacartel_v<153) and (cuentacartel_h>476) and (cuentacartel_h<482) then --linea izq

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>94) and (cuentacartel_v<126) and (cuentacartel_h>500) and (cuentacartel_h<506) then --linea der

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>94) and (cuentacartel_v<100) and (cuentacartel_h>476) and (cuentacartel_h<504) then --techito

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>147) and (cuentacartel_v<153) and (cuentacartel_h>476) and (cuentacartel_h<504) then --piso

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

elsif (cuentacartel_v>120) and (cuentacartel_v<126) and (cuentacartel_h>476) and (cuentacartel_h<504) then --medio

	salidarojo<="0000000000";
	salidaazul<="0000000000";
	salidaverde<="0000000000";

else

	salidarojo<="1111111111";
	salidaazul<="1111111111";
	salidaverde<="1111111111";

end if;
  
