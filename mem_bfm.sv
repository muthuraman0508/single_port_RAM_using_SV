class mem_bfm;
	mem_tx tx;
  virtual mem_intf vif;
	function new();
		vif = top.pif;
	endfunction

	task run();
		$display("this is the bfm class");
		forever begin
			tx = new();
			gen2bfm.get(tx);
			drive_task(tx);
			//tx.print("BFM");
          common::bfm_count++;
		end

	endtask

	task drive_task(mem_tx tx);
		$display("this is tx class");
       @(vif.bfm_cb);
		vif.bfm_cb.wrd <= tx.wrd;
      vif.bfm_cb.addr <= tx.addr;
      if(tx.wrd == 1)
        vif.bfm_cb.wdata <= tx.wdata;
      vif.bfm_cb.valid <= 1;
      wait(vif.ready == 1);
      @(vif.bfm_cb);
      if(tx.wrd == 0)
        tx.rdata = vif.bfm_cb.rdata;
       @(vif.bfm_cb);
       vif.valid <= 0;
      vif.bfm_cb.wrd <= 0;
      vif.bfm_cb.addr <= 0;
      vif.bfm_cb.wdata <= 0;
      vif.bfm_cb.valid <= 0;
	endtask
endclass

