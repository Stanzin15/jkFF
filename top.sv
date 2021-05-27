`include"tx.sv"
`include"jk_interface.sv"
`include"jk_config.sv"
`include"jk_gen.sv"
`include"jk_bfm.sv"
`include"jk_mon.sv"

`include"jk_sb.sv"
`include"jk_env.sv"
`include"test.sv"
//
module top;
    //clk and rst generation
    logic clk, rst;
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        repeat(1) @(posedge clk);
        rst = 0; //active low reset
        repeat(2) @(posedge clk);
        rst = 1;
    end
    

    //interface inst
    jk_intf inf(clk,rst);

    //port mapping
    //one by one or named packing
  jk_ff dut (
    .clk(inf.clk),
    .rst(inf.rst),
    .j(inf.j),
    .k(inf.k),
    .q(inf.q)
    
   );
   //positional mapping
  //jk_ff dut(j,k,q,rst,clk);
    
    //interface connection
    initial begin
    jk_config::vif=inf;
    end
  //`include"test.sv"
    initial begin
      test test_h =new();
      test_h.run();
    end
    
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end

    initial begin
       #10000;
       $finish();
    end 
    endmodule

