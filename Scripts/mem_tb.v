// Code your testbench here
// or browse Examples
module mem_tb;
	reg clk;
  	reg [2:0] in;
  	reg rst;
	wire [2:0] out;

  	mem mode (.in(in), 
             .clk(clk),
             .rst(rst),
             .out(out));
	defparam mode.DATA_WIDTH = 3;

  
initial begin
	clk = 0;
	rst = 0;
end

always
	#10 clk = ~clk;

always
	#20 $display("input= %b%b%b, output= %b%b%b", in[2], in[1], in[0], out[2], out[1], out[0]);
 
initial begin
  	in = 3'b010;
  	#20;
  	in = 3'b111;
  	#20;
  	in = 3'b100;
  	#5;
  	rst = 1'b1;
  	#5;
  	rst = 1'b0;
end

  
endmodule