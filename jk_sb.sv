class jk_sb;
    bit exp_q =0;
    jk_tx pkt, pkt_l;   
    virtual jk_intf vif;    

	task run();
               $display("inside jk_sb");
                    vif=jk_config::vif; 
      repeat(10) begin
                  @(posedge vif.clk);
                  jk_config::mon2sb.get(pkt);
                  jk_config::bfm2sb.get(pkt_l);
		    expect_q_cal();
        $display("inside SB value of pkt_l.j=%0d pkt_l.k=%0d ",pkt_l.j,pkt_l.k);
        $display("inside SB value of exp_q=%0d pkt_q=%0d ",exp_q,pkt.q);
                    if(pkt.q==exp_q)begin
                       $display("test is pasased");
                    end
                    else $display("test is failed");
	       end
	endtask
	task expect_q_cal();
	    if (pkt_l.j==0 && pkt_l.k==0) begin
		exp_q= exp_q; 
	    end
             if (pkt_l.j==0 && pkt_l.k==1) begin
		exp_q= 0; 
	    end 
             if (pkt_l.j==1 && pkt_l.k==0) begin
		exp_q= 1; 
	    end 
      if (pkt_l.j==1 && pkt_l.k==1) begin
             //  $display("-----------------------");
		exp_q= ~exp_q; 
	    end 
	endtask

endclass

