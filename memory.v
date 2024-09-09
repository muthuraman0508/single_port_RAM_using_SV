module memory(clk,rst,addr,wdata,rdata,wrd,valid,ready);
parameter W=8;
parameter D=16;
parameter addr_w=4;
input clk,rst,wrd,valid;
  input [W-1:0]wdata;
  input [addr_w-1:0]addr;
output reg ready;
  output reg [W-1:0]rdata;
reg[W-1:0]mem[D-1:0];
integer i=0;
always@(posedge clk)
	begin
		if(rst)
			begin
				rdata=0;
				ready=0;
				for (i=0;i<D;i=i+1)mem[i]=0;
			end
			else begin 
				if(valid)
			begin
				ready=1'b1;
					if(wrd)
						mem[addr]=wdata;
					else
						rdata=mem[addr];	
			end
			else begin
				ready=1'b0;
              	rdata = 1'b0;
			end
		end


	end
endmodule


