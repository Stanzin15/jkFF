class jk_env;
	//handle creation
        jk_gen gen_h;
	jk_bfm bfm_h;//bfm - it driver, bus functional module
	jk_mon mon_h;
	jk_sb sb_h;

	//object allocation
	function new();
		gen_h=new();
                bfm_h=new();
                mon_h=new();
                sb_h=new();
	endfunction

	task run();
               fork
        	gen_h.run();
		bfm_h.run();
		mon_h.run();
		sb_h.run();
	       join
	endtask
endclass
