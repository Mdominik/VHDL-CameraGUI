-- entity of extended multiplexer
-- Inputs: exp_time_i, number_pics_i, show_time_i, error_i
-- Outputs: disp_photo_o

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.P_DISPLAY.ALL;
entity dispDrv_e is port ( expTime_i   	: IN T_DIGITS;
			   numberPics_i    	: IN T_DIGITS;
			   showTime_i  		: IN std_ulogic;
			   error_i		: IN std_ulogic;
			   display_o 		: OUT T_DISPLAY);
end dispDrv_e;
