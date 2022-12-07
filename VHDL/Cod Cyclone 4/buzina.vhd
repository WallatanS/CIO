library IEEE;
use IEEE.std_logic_1164.all;

entity buzina is

	port( A : in std_logic;
			O : in std_logic;
			Z : out std_logic;
			B : out std_logic);

end buzina;

architecture hardware of buzina is
	begin

		B <= A OR O;
		Z <= A OR O;
		
	end hardware;