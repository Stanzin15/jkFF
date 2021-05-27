class jk_gen;
	jk_tx tx;

	task run();
               $display("inside axi_gen");
	       repeat(10) begin
	      	 tx = new();
	      	 tx.randomize();
		 tx.print();
	      	 jk_config::gen2bfm.put(tx);
	      	 //jk_config::bfm2sb.put(tx);
       	       end
	endtask
endclass
