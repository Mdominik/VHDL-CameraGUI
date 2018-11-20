--architecture of extended multiplexer. 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.P_DISPLAY.ALL;
ARCHITECTURE RTL OF dispDrv_e IS 
SIGNAL dispPhoto_s : integer;
BEGIN

	-- DISP_MUX
	PROCESS(showTime_i, numberPics_i, expTime_i, error_i)
		BEGIN
		IF error_i = '0' THEN
			IF showTime_i = '1' THEN
				dispPhoto_s <= expTime_i;
				--output - exposure time		
			ELSE
				dispPhoto_s <= numberPics_i; 
				--output - picture count
			END IF;
		ELSE
			dispPhoto_s <= 10;
		END IF;
	END PROCESS;

	-- DECODE
	PROCESS(dispPhoto_s)
		BEGIN
			IF dispPhoto_s = 0 THEN
				display_o <= SEG_0;
			ELSIF dispPhoto_s = 1 THEN
				display_o <= SEG_1;
			ELSIF dispPhoto_s = 2 THEN
				display_o <= SEG_2;
			ELSIF dispPhoto_s = 3 THEN
				display_o <= SEG_3;
			ELSIF dispPhoto_s = 4 THEN
				display_o <= SEG_4;
			ELSIF dispPhoto_s = 5 THEN
				display_o <= SEG_5;
			ELSIF dispPhoto_s = 6 THEN
				display_o <= SEG_6;
			ELSIF dispPhoto_s = 7 THEN
				display_o <= SEG_7;
			ELSIF dispPhoto_s = 8 THEN
				display_o <= SEG_8;
			ELSIF dispPhoto_s = 9 THEN
				display_o <= SEG_9;
			ELSE
				display_o <= SEG_9;
			END IF;
	END PROCESS;
END RTL;

