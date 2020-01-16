use std.textio.all;
library work;
use work.quine_mccluskey.all;

entity testbench_qm is
end entity testbench_qm;

architecture EX_ACCESS of testbench_qm is
	shared variable min: minimizer;
begin

process begin

	min.load_function("..\test\functie1.txt");
	min.print;
	

	min.load_function("..\test\functie2.txt");
	min.print;	
	

	min.load_function("..\test\functie3.txt");
	min.print;	
	min.initTestList;
	
	min.order_function;

	assert false report "end sim" severity failure;
	wait;
end process;


end architecture EX_ACCESS;
