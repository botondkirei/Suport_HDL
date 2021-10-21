library ieee;
use ieee.std_logic_1164.all;
library work;
use work.PAECore.all;

entity test_inv is
end entity;

architecture test of test_inv is
	signal a, y : std_logic;
	component inv is
		port ( a : in std_logic;
		   y : out std_logic;
		   consum : out estimation_type);
	end component;
	signal consum : estimation_type;
	signal valoare : real;
begin
	
	uut : inv port map (a => a, y => y, consum => consum);
	valoare <=consum.power.dynamic;
	
	a <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns;
	
	process
	begin
		wait for 40 ns;
		assert false report "End of Simulation" severity failure;
	end process;	
	
	process begin
		report real'image(valoare);
		wait for 10 ns;
	end process;
	
end architecture;
