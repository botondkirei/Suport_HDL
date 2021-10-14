ghdl -a .\PAECore.vhd .\inv.vhd .\test_inv.vhd 
ghdl -e test_inv
ghdl -r test_inv --vcd=test.vcd 
gtkwave test.vcd 