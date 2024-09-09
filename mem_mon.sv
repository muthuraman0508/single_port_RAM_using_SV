class mem_mon;
  virtual mem_intf vif;
  mem_tx tx;
	function new();
     vif = top.pif;
	endfunction

	task run();
		$display("this is the monitor class");
      forever begin
        @(vif.mon_cb);
        if(vif.mon_cb.valid && vif.mon_cb.ready) begin
          tx = new();
          tx.wrd = vif.mon_cb.wrd;
          tx.addr = vif.mon_cb.addr;
          if(vif.mon_cb.wrd == 1) tx.wdata = vif.mon_cb.wdata;
          else tx.rdata = vif.mon_cb.rdata;
          mon2sbd.put(tx);
          mon2cov.put(tx);
          tx.print("this is monitor class");
        end
      end
	endtask
endclass

