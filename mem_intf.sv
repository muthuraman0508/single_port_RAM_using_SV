interface mem_intf (input reg clk,input reg rst);
	reg valid,wrd;
	reg [addr_w-1:0]addr;
	reg [W-1:0]wdata;
  reg ready;
	reg [W-1:0]rdata;
  
  clocking bfm_cb@(posedge clk);
    default input #0 output #1;
    input ready;
    input rdata;
    output wdata;
    output wrd;
    output addr;
    output valid;
  endclocking
  
  clocking mon_cb@(posedge clk);
    default input #1;
    input ready;
    input rdata;
    input wdata;
   input wrd;
    input addr;
    input valid;
  endclocking
endinterface

