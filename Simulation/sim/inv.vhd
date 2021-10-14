library ieee;
use ieee.std_logic_1164.all;
library work;
use work.PAECore.all;

entity inv is
	port ( a : in std_logic;
		   y : out std_logic;
		   consum : out estimation_type);
end entity;

architecture behav of inv is
	signal y_int : std_logic;
begin
	y_int <= not a;
	y <= Y_int;
	monitorizare_consum : PAEstimator generic map (N => 1, M => 1, logic_family => hc, gate => inverter, Cload => 0.0)
									  port map ( Vcc => 5.0, sin(0) => a, sout(0) => y_int, estimation => consum );
	
end architecture;
