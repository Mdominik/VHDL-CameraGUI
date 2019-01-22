--architecture of extended multiplexer. 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.P_DISPLAY.ALL;
ARCHITECTURE RTL OF dispDrv_e IS 
TYPE integers is array (0 to 2) of integer;
SIGNAL dispPhoto_s : integers;
BEGIN
	-- DISP_MUX
	PROCESS(showTime_i, numberPics_i, expTime_i, error_i)
		BEGIN
		IF error_i = '0' THEN
			IF showTime_i = '1' THEN
				for I in 0 to 2 loop
					dispPhoto_s(I) <= expTime_i(I);
					--output - exposure time	
				END loop;	
			ELSE
				for I in 0 to 2 loop
					dispPhoto_s(I) <= numberPics_i(I); 
					--output - picture count	
				END loop;
			END IF;
		ELSE
			dispPhoto_s(0) <= 10;
			dispPhoto_s(1) <= 10;
			dispPhoto_s(2) <= 10;
		END IF;
	END PROCESS;

	-- DECODE
	PROCESS(dispPhoto_s)
		BEGIN
		for I in 0 to 2 loop
			IF dispPhoto_s(I) = 0 THEN
				display_o(I) <= SEG_0;
			ELSIF dispPhoto_s(I) = 1 THEN
				display_o(I) <= SEG_1;
			ELSIF dispPhoto_s(I) = 2 THEN
				display_o(I) <= SEG_2;
			ELSIF dispPhoto_s(I) = 3 THEN
				display_o(I) <= SEG_3;
			ELSIF dispPhoto_s(I) = 4 THEN
				display_o(I) <= SEG_4;
			ELSIF dispPhoto_s(I) = 5 THEN
				display_o(I) <= SEG_5;
			ELSIF dispPhoto_s(I) = 6 THEN
				display_o(I) <= SEG_6;
			ELSIF dispPhoto_s(I) = 7 THEN
				display_o(I) <= SEG_7;
			ELSIF dispPhoto_s(I) = 8 THEN
				display_o(I) <= SEG_8;
			ELSIF dispPhoto_s(I) = 9 THEN
				display_o(I) <= SEG_9;
			ELSE
				display_o(0) <= SEG_E;
				display_o(1) <= SEG_E;
				display_o(2) <= SEG_E;
			END IF;
		END loop;
	END PROCESS;
END RTL;

