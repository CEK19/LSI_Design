module Devider(clk_in,reset,clk);
parameter CYC=100;  //   				100hz / 1hz
input clk_in,reset;
output reg clk=1'b0;

reg [27:0] counter=0;

always@(posedge reset or posedge clk_in)
begin
	if(reset) begin clk<=0; counter<=0;end
	else if(counter==CYC-1) begin 
		counter<=0;
		clk<=~clk;
	end
	else begin
		counter<=counter+1;
	end
end


endmodule 