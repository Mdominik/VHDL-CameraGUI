-- entity of extended multiplexer
-- Inputs: exp_time_i, number_pics_i, show_time_i, error_i
-- Outputs: disp_photo_o

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
entity displayExtMux_e is port ( expTime_i   	: IN integer;
			   numberPics_i    	: IN integer;
			   showTime_i  		: IN std_ulogic;
			   error_i		: IN std_ulogic;
			   dispPhoto_o 		: OUT integer);
end displayExtMux_e;
