module top;
	reg clk,rst;
  mem_intf pif(.clk(clk),.rst(rst));
	mem_env env;
	//dut
  memory #(.W(W),.D(D)) dut (.clk(pif.clk),.rst(pif.rst),.valid(pif.valid),.ready(pif.ready),.wrd(pif.wrd),.addr(pif.addr),.wdata(pif.wdata),.rdata(pif.rdata));
	//interfacing
	
	always #5 clk = ~clk;

	initial begin
		rst = 1;
		
		repeat(2)@(posedge clk);
		rst = 0;
       	env = new();
		env.run();
		//valid = 1;
		//wait(ready == 1);

	end
   initial begin
     $dumpfile("dump.vcd");
     $dumpvars();
   end

	initial begin
		clk = 0;
      #5000
      if(common::num_matches != common::count && common::num_missmatches != 0) begin
        $display("the test case is failed");
        $display("the matches is %0d and the miss match is %0d",common::num_matches,common::num_missmatches);
      end
      else begin
        $display("the test case is pass");
        $display("the matches is %0d and the miss match is %0d",common::num_matches,common::num_missmatches);
      end
    end
      

  
endmodule

