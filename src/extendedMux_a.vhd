--architecture of extended multiplexer. 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ARCHITECTURE RTL OF displayExtMux_e IS 
BEGIN
	PROCESS(showTime_i, numberPics_i, expTime_i, error_i)
		BEGIN
		IF error_i = '0' THEN
			IF showTime_i = '1' THEN
				dispPhoto_o <= expTime_i;
				--output - exposure time		
			ELSE
				dispPhoto_o <= numberPics_i; 
				--output - picture count
			END IF;
		ELSE
			dispPhoto_o <= 10;
		END IF;
	END PROCESS;
END RTL;

