class mem_env;
	mem_sbd sbd;
	mem_agent agent;
	function new();
		sbd = new();
		agent = new();
	endfunction

	task run();
		$display("this is environment class");
		fork

			sbd.run();
			agent.run();
		join
	endtask
endclass

