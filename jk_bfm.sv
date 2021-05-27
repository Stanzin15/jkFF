class jk_bfm;
        jk_tx tx;
        virtual jk_intf vif;
	
	task run();
               $display("inside jk_bfm");
                vif=jk_config::vif;
	       @(posedge !vif.rst);
	       forever begin
		       jk_config::gen2bfm.get(tx);
		       tx.print();
		       drive_dut(tx);
	       end
	endtask

	task drive_dut(jk_tx tx);
               	vif.jk_cb.j <= tx.j;
               	vif.jk_cb.k <= tx.k;
	endtask
endclass
