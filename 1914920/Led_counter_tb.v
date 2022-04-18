module Led_counter_tb;
	reg [4:0] start_num, end_num;
	wire [4:0] counter_out;
	reg clk, up_down, rst;
	wire check;
	
	Led_counter TESTMODULE_Led_counter (
		.start_num(start_num),
		.end_num(end_num),
		.counter_out(counter_out),
		.clk(clk), .up_down(up_down), .rst(rst),
		.check(check)
	);
	initial begin
		clk = 1'b0;
	end
	
	always begin
		#5;
		clk = ~clk;	
	end
	
	initial begin 
		rst = 1'b0;
		#5;
		rst = 1'b1;
		#10;
		start_num = 5'd0;
		end_num = 5'd5;
		up_down = 1'b1;
		rst = 1'b0;
		#100;
		
		start_num = 5'd5;
		end_num = 5'd0;
		up_down = 1'b0;
		#25;
		
		rst = 1'b1;
		#20;
		
		$stop;
		
		
		
		
		
		
		
		
	end
endmodule
	