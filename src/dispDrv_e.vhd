-- entity of 7-segment display
-- Inputs: expTime_i, numberPics_i, showTime_i, error_i
-- Outputs: display_o

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.P_DISPLAY.ALL;
entity dispDrv_e is port ( expTime_i   	: IN T_DIGITS;
			   numberPics_i    	: IN T_DIGITS;
			   showTime_i  		: IN std_ulogic;
			   error_i		: IN std_ulogic;
			   display_o 		: OUT T_DISPLAY);
end dispDrv_e;
