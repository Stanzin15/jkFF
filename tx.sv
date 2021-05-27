//tx class- tranaction class- contains all the input and ouput of the design
//properties
//methods
//constraints
class jk_tx;
	rand bit j;
	rand bit k;
	bit q;

	task print();
               $display("j=%d",j);
               $display("k=%d",k);
	endtask

endclass
