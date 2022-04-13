// Verilog 1995 style port declaration
module mem #(parameter	DATA_WIDTH   = 4)
   (input		[DATA_WIDTH-1:0] in, 
	input		clk,
	input		rst,
	output reg	[DATA_WIDTH-1:0] out);

	always @(negedge clk or posedge rst) 
	begin
		if(rst == 1'b1)
     		out <= 1'b0; 
   	else
			out <= in; 
	end

endmodule 