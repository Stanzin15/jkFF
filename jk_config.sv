class jk_config;
        static mailbox#(jk_tx) gen2bfm = new();
        static mailbox#(jk_tx) bfm2sb = new();
        static mailbox#(jk_tx) mon2sb = new();
        static virtual interface jk_intf vif;
endclass
