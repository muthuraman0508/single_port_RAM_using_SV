class mem_agent;
	mem_cov cov;
	mem_bfm bfm;
	mem_gen gen;
	mem_mon mon;

	function new();
		cov = new();
		bfm = new();
		gen = new();
		mon = new();
	endfunction

	task run();
		$display("this is agent class");
		fork

			cov.run();
			bfm.run();
			gen.run();
			mon.run();
		join
	endtask
endclass

