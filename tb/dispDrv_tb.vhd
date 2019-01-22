LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.P_DISPLAY.ALL;

ENTITY dispDrv_tb IS
END dispDrv_tb;

ARCHITECTURE TEST OF dispDrv_tb IS
	COMPONENT dispDrv_e
		PORT 	 ( expTime_i   	: IN T_DIGITS;
			   numberPics_i    	: IN T_DIGITS;
			   showTime_i  		: IN std_ulogic;
			   error_i		: IN std_ulogic;
			   display_o 		: OUT T_DISPLAY);
	END COMPONENT;

	SIGNAL expTime_s 	: T_DIGITS := (0, 0, 0);
	SIGNAL numberPics_s 	: T_DIGITS := (0, 0, 0);
	SIGNAL showTime_s 	: std_ulogic := '0';
	SIGNAL error_s 		: std_ulogic := '0';
	SIGNAL display_s 	: T_DISPLAY;

BEGIN 
	DUT : dispDrv_e
		PORT MAP(
			expTime_i   	=> expTime_s,
			   numberPics_i => numberPics_s,
			   showTime_i  	=> showTime_s,
			   error_i	=> error_s,	
			   display_o  => display_s);

	STIMULI : PROCESS
	BEGIN
		wait for 30 ns;
		showTime_s <= '1';
		error_s <= '0';
		numberPics_s <= (1,0,2);
		expTime_s <= (2,1,4);
		DISPLAY_DIGIT(display_s);

		wait for 30 ns;	
		showTime_s <= '0';
		error_s <= '0';
		numberPics_s <= (1,0,6);
		expTime_s <= (2,1,0);
		DISPLAY_DIGIT(display_s);

		wait for 30 ns;	
		showTime_s <= '1';
		error_s <= '0';
		numberPics_s <= (1,5,1);
		expTime_s <= (7,4,3);
		DISPLAY_DIGIT(display_s);

		wait for 30 ns;	
		showTime_s <= '1';
		error_s <= '0';
		numberPics_s <= (1,0,1);
		expTime_s <= (2,1,3);
		DISPLAY_DIGIT(display_s);

		wait;
	END PROCESS;
END TEST;

CONFIGURATION cfg_dispDrv_tb OF dispDrv_tb IS
	FOR TEST
	END FOR;
END cfg_dispDrv_tb;
	
