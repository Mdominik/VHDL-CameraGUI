LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY halfadd_tb IS
END halfadd_tb;
ARCHITECTURE Behavioral of halfadd_tb is

--component name and entity name must be same
--ports must be same

COMPONENT half_adder_e IS 
	PORT (	a_i, b_i : IN std_logic;
		s_o, c_o : OUT std_logic);
END COMPONENT;
