//what is the difference between rand and randc??
class pkt;
	//properties
	rand bit [2:0] a;// rand use with only those vars which user wants to be randomize
	// 000
	// 001
	// ----------
	// 111
	int b;
	//methods
	task print();
		$display("value of a = %d",a);
		$display("value of b = %d",b);
	endtask
endclass

module top;
	// handle creation
	pkt pkt_h;
	initial begin
		//object creation- user has to allocte some memory to the
		//handle
		pkt_h = new();
		repeat(5) begin
			pkt_h.randomize();//user wants to randomize the var inside the pkt class
			pkt_h.print();//
		end
	end
endmodule
////////////////////////////////////////////////////
class my_pkt;
	//properties
	randc bit [2:0] a;// rand use with only those vars which user wants to be randomize
	// 000
	// 001
	// ----------
	// 111
	int b;
	//methods
	task print();
		$display("value of a = %d",a);
		$display("value of b = %d",b);
	endtask
endclass

module top;
	// handle creation
	my_pkt pkt; // for handle creation first of all give the class name after that wirte a handle name what ever you want underscore is not mandatory it just for better vis purpose
	initial begin
		//object creation- user has to allocte some memory to the
		//handle
		pkt = new();
		repeat(5) begin
			pkt.randomize();//user wants to randomize the var inside the pkt class
			pkt.print();//
		end
	end
endmodule


///////////////////
$display("value of a = %d", super.a);

