class mem_gen;
	mem_tx tx;
	bit [addr_w-1:0] addr_t[$];
	function new();
		
	endfunction

	task run();
		$display("this is the generator class");
      case(common::testname)
        "write":begin
          //repeat(common::count)begin
				tx = new();
				tx.randomize() with {tx.wrd == 1;};	
				gen2bfm.put(tx);
         end
        "write_n_read":begin
          repeat(common::count)begin
				tx = new();
				tx.randomize() with {tx.wrd == 1;};	
				gen2bfm.put(tx);
				addr_t.push_back(tx.addr);
//				tx.print("generator");
			end
          repeat(common::count)begin
				tx = new();
         	 tx.randomize() with {tx.wrd == 0;tx.addr == addr_t.pop_front();tx.wdata == 0;};
				gen2bfm.put(tx);
				//tx.addr;
				//tx.print("generator");
			end
        end
      endcase
	endtask
endclass

