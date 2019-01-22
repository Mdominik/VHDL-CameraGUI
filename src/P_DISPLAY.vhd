LIBRARY ieee;

USE ieee.std_logic_1164.ALL;

PACKAGE P_DISPLAY IS
	TYPE T_DIGITS IS ARRAY (0 to 2) OF integer RANGE 0 TO 9;
	TYPE T_DISPLAY IS ARRAY (0 to 2) OF std_ulogic_vector(6 DOWNTO 0);

	CONSTANT SEG_0 : std_ulogic_vector(6 DOWNTO 0) := "0111111";
	CONSTANT SEG_1 : std_ulogic_vector(6 DOWNTO 0) := "0000011";
	CONSTANT SEG_2 : std_ulogic_vector(6 DOWNTO 0) := "1101101";
	CONSTANT SEG_3 : std_ulogic_vector(6 DOWNTO 0) := "1100111";
	CONSTANT SEG_4 : std_ulogic_vector(6 DOWNTO 0) := "1010011";
	CONSTANT SEG_5 : std_ulogic_vector(6 DOWNTO 0) := "1110110";
	CONSTANT SEG_6 : std_ulogic_vector(6 DOWNTO 0) := "1111110";
	CONSTANT SEG_7 : std_ulogic_vector(6 DOWNTO 0) := "0100011";
	CONSTANT SEG_8 : std_ulogic_vector(6 DOWNTO 0) := "1111111";
	CONSTANT SEG_9 : std_ulogic_vector(6 DOWNTO 0) := "1110111";
	CONSTANT SEG_E : std_ulogic_vector(6 DOWNTO 0) := "1111100";

	-- pragma translate_off
	PROCEDURE DISPLAY_DIGIT(SIGNAL DISPLAY : T_DISPLAY);
	-- pragma translate_on
END P_DISPLAY;
-- pragma translate_off

USE std.textio.ALL;
PACKAGE BODY P_DISPLAY IS
	-------------
	--
	--
	--
	--
	--12345678
	--1
	--5##-- 2 # #
	-- 3 4 0
	-- 4 # #
	-- 5 -- 6 # #
	-- 7 3 1
	-- 8 # #
	-- 9
	--6##
	--2##
	--
	-------------
	CONSTANT ACTIVE_SEG : CHARACTER := '#';
	CONSTANT EMPTY_SEG : CHARACTER := ' ';

	-- Width and height of a digit
	CONSTANT WIDTH : INTEGER := 8;
	CONSTANT HEIGHT : INTEGER := 9;

	-- Datatypes to store the complete display in a matrix
	SUBTYPE T_MATRIX_ROW IS bit_vector (1 TO WIDTH);
	TYPE T_DISP_MATRIX IS ARRAY (1 TO HEIGHT) OF T_MATRIX_ROW;

	-- Definition of the appearance of the 6 segments
	SUBTYPE T_DIGIT_ROW IS bit_vector(1 TO WIDTH);
	TYPE T_SEG_DEF IS ARRAY (1 TO HEIGHT) OF T_DIGIT_ROW;
	TYPE T_DIGIT_DEF IS ARRAY (0 TO 6) OF T_SEG_DEF;
	CONSTANT DIGIT_DEF : T_DIGIT_DEF := (("00000000",
		"00000010", -- . #
		"00000010", -- . 0
		"00000010", -- . #
		"00000000", --
		"00000000", -- . .
		"00000000", -- . .
		"00000000", -- . .
		"00000000"), -- ....


		("00000000",
		"00000000", -- . .
		"00000000", -- . .
		"00000000", -- . .
		"00000000", --
		"00000010", -- . #
		"00000010", -- . 1
		"00000010", -- . #
		"00000000"), -- ....


		("00000000", -- ....
		"00000000", -- . .
		"00000000", -- . .
		"00000000", -- . .
		"00000000", --
		"00000000", -- . .
		"00000000", -- . .
		"00000000", -- . .
		"00111100"), -- #2##


		("00000000", -- ....
		"00000000", -- . .
		"00000000", -- . .
		"00000000", -- . .
		"00000000", --
		"01000000", -- # .
		"01000000", -- 3 .
		"01000000", -- # .
		"00000000"), -- ....


		("00000000", -- ....
		"01000000", -- # .
		"01000000", -- 4 .
		"01000000", -- # .
		"00000000", --
		"00000000", -- . .
		"00000000", -- . .
		"00000000", 
		"00000000"),-- ....


		("00111100", -- #5##
		"00000000", -- . .
		"00000000", -- . .
		"00000000", -- . .
		"00000000", --
		"00000000", -- . .
		"00000000", -- . .
		"00000000", -- . .
		"00000000"), -- ....

		("00000000", -- ....
		"00000000", -- . .
		"00000000", -- . .
		"00000000", -- . .
		"00111100", --
		"00000000", -- . .
		"00000000", -- . .
		"00000000", -- . .
		"00000000"));--

		PROCEDURE DISPLAY_DIGIT(SIGNAL DISPLAY : T_DISPLAY) IS
		FILE OUTFILE : TEXT IS OUT "display.txt";

		VARIABLE L : line;
		VARIABLE DISP_TEXT : STRING(T_MATRIX_ROW'RANGE);

		VARIABLE DISP_MATRIX : T_DISP_MATRIX;
		VARIABLE COL_L : INTEGER;
		VARIABLE COL_R : INTEGER;
		BEGIN
		FOR i in 0 to 2 LOOP
			-- Clear the display
			DISP_MATRIX := (OTHERS => (OTHERS => '0'));
			-- Loop over all segments
			--6##
			FOR SEGMENT IN 0 TO 6 LOOP
				IF DISPLAY(i)(SEGMENT) = '1' THEN
					-- Copy the matrix to the final display
					-- Loop over all rows of the display
					FOR ROW IN T_SEG_DEF'RANGE LOOP
						DISP_MATRIX(ROW)(T_DIGIT_ROW'RANGE) := 
						DISP_MATRIX(ROW)(T_DIGIT_ROW'RANGE) OR
						DIGIT_DEF(SEGMENT)(ROW);
					END LOOP;
				END IF;
			END LOOP;
			-- Write the matrix to a textfile
			FOR I IN T_DISP_MATRIX'RANGE LOOP
				-- Start with an empty line
				DISP_TEXT := (OTHERS => EMPTY_SEG);

				FOR J IN T_MATRIX_ROW'RANGE LOOP
					IF DISP_MATRIX(I)(J) = '1' THEN
						DISP_TEXT(J) := ACTIVE_SEG;
					END IF;
				END LOOP;
				-- Write the line
				write(L, DISP_TEXT);
				writeline(OUTFILE, L);
			END LOOP;
		END LOOP;
		END DISPLAY_DIGIT;
		END P_DISPLAY;
-- pragma translate_on
