class mem_cov;
  mem_tx tx;
   covergroup mem_cg;
     wrd_cp: coverpoint tx.wrd {
       bins WRITE = {1'b0};
       bins READ = {1'b1};
     }
     addr_cp: coverpoint tx.addr {
       option.auto_bin_max = 8;
     }
     cross_cp: cross wrd_cp,addr_cp;
   endgroup
	function new();
      tx = new();
      mem_cg = new();
	endfunction

	task run();
		$display("this is the coverage class");
     	mon2cov.get(tx);
    	mem_cg.sample;
	endtask
endclass

