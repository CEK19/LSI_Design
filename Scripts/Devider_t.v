module Devider_t;
wire clk;
reg reset;
reg clk_in;
reg [3:0] i;
Devider sang(clk_in,reset,clk);
initial begin
	reset=0;
	for(i=0;i<16;i=i+1) begin 
		clk_in=0; #50;
		clk_in=1; #50;
		if(i==10) begin reset=1;#50;end
		reset=0;
	end
	
end
endmodule 