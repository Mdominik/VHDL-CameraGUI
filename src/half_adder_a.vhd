library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 

ARCHITECTURE half_adder_a OF half_adder_e IS 
BEGIN 
s <= a XOR b; -- Implements Sum for Half Adder 
c <= a AND b; -- Implements Carry for Half Adder 
END half_adder_a; 
