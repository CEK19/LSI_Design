module bound_flasher_testbench ;
reg clk;

reg rst;
reg flick;
wire [15:0] led_out;
//
wire [2:0] mode;
//
wire new_clk;
reg [15:0] i;
bound_flasher BoundFlasher(rst,clk,flick,new_clk,led_out,mode);
initial begin
	rst=1;
	flick=0;
	for (i=0;i<200;i=i+1) begin
		if(i==1) begin flick=1; rst=0;end
		if(i==100) flick=0;
		clk=0;#50;
		clk=1;#50;
	end
end
endmodule
