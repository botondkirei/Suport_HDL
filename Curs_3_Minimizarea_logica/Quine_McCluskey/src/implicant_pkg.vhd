
package implicant_pkg is

	

	--package integer_list is new work.list_pkg generic map (mytype => integer,
		--print_item => print_item) ;
	--use integer_list.all;

	type IMPLICANT;
	
	type IMPLICANT_PTR is access IMPLICANT;
	
	type IMPLICANT is protected
	procedure print_item(i : integer);
		--procedure initImplicant;
		--procedure addItem(variable i : in integer);
		--procedure print;

	end protected IMPLICANT;
	
end package;

package body implicant_pkg is


	type IMPLICANT is protected body 
	procedure print_item (i : integer) is
			begin
				report integer'image(i);
			end procedure;
		--variable covered : LIST;
		--variable size : integer;
		--variable used : boolean;
		--variable succ : IMPLICANT_PTR;
		
		--procedure initImplicant is
		--begin
			--size := 0;
			--used := false;
			--succ := null;
		--end procedure;
		
		--procedure addItem(variable i : in integer) is
		--begin
			--report "here";
			--size := size + 1;
			--covered.push(i);
		--end procedure;
		
		--procedure print is
		--begin
			--covered.show;
		--end procedure;
			
		
	end protected body IMPLICANT;

end package body;
