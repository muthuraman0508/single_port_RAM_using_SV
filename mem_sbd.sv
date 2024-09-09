class mem_sbd;
  mem_tx tx;
  int mem[int];
	function new();
      tx = new();
	endfunction

	task run();
		$display("this is the scoreboard class");
      forever begin
        mon2sbd.get(tx);
        if(tx.wrd == 1) begin
          mem[tx.addr] = tx.wdata;
        end
        else begin
          if(tx.rdata == mem[tx.addr]) begin
            common::num_matches++;
          end 
          else begin
            common::num_missmatches++;
          end
        end
      end
	endtask
endclass

