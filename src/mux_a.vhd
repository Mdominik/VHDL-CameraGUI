--architecture of multiplexer

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ARCHITECTURE RTL OF displayMux_e IS 
BEGIN
	PROCESS(showTime_i, numberPics_i, expTime_i)
		BEGIN
		IF showTime_i = '1' THEN
			dispPhoto_o <= expTime_i;
			--output - exposure time		
		ELSE
			dispPhoto_o <= numberPics_i; 
			--output - picture count
		END IF;
	END PROCESS;
END RTL;

