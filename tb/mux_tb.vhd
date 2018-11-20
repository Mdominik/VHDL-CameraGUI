LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_tb IS
END mux_tb;

ARCHITECTURE TEST OF mux_tb IS
	COMPONENT displayMux_e
		PORT 	( expTime_i   		: IN integer;
			   numberPics_i    	: IN integer;
			   showTime_i  		: IN std_ulogic;
			   dispPhoto_o 		: OUT integer);
	END COMPONENT;

	SIGNAL expTime_s 	: integer := 0;
	SIGNAL numberPics_s 	: integer := 0;
	SIGNAL showTime_s 	: std_ulogic := '0';
	SIGNAL dispPhoto_s 	: integer;

BEGIN 
	DUT : displayMux_e
		PORT MAP(
			expTime_i   	=> expTime_s,
			   numberPics_i => numberPics_s,
			   showTime_i  	=> showTime_s,	
			   dispPhoto_o  => dispPhoto_s);

	STIMULI : PROCESS
	BEGIN
		wait for 30 ns;
		showTime_s <= '1';
		numberPics_s <= 2;
		expTime_s <= 64;

		wait for 20 ns;	
		showTime_s <= '0';
		numberPics_s <= 2;
		expTime_s <= 64;	

		wait;
	END PROCESS;
END TEST;

CONFIGURATION cfg_mux_tb OF mux_tb IS
	FOR TEST
	END FOR;
END cfg_mux_tb;
	
