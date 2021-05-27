class jk_mon;
        jk_tx tx;
	virtual jk_intf vif;

	task run();
		tx = new();
               $display("inside jk_mon");
	       vif=jk_config::vif;
	       forever begin
                  @(posedge vif.clk);
		  tx.q = vif.q;
		 jk_config:: mon2sb.put(tx);
	       end
	endtask
endclass
