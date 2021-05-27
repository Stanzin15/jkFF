interface jk_intf(input logic clk,rst);
	logic j;
	logic k;
	logic q;

modport DUT(input j,k,clk,rst, output q);
modport MON(input j,k,clk,rst,q);

clocking jk_cb@(posedge clk);
	default output #1;
	output j,k;
	input q;
endclocking

modport BFM(clocking jk_cb, rst);
endinterface

