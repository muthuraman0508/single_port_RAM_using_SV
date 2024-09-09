class mem_tx;
	rand bit wrd;
	rand bit [W-1:0] wdata;
  rand bit [addr_w-1:0] addr;
	bit [W-1:0]rdata;

	function void print(string name);
		$display("**********************************");
		$display("component name %0s",name);
		$display("the mode of operation is %0s", wrd?"write":"read");
		$display("address is %0h",addr);
		$display("write data is %0h",wdata);
		$display("read data is %0h",rdata);
		$display("**********************************");
	endfunction


endclass

