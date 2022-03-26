module Led_counter (
                    input	[4:0]  start_num,
						  input	[4:0]	 end_num,
						  input	clk, up_down, rst,
                    output reg  [4:0]  counter_out,
						  output check
                    );
						  
	always @(posedge rst or posedge clk) begin
		if (rst) counter_out <= 4'b0000;
		
		else if () // khuc nay kieu k nghi ra cach gan start_num vo counter_out nen gap day, ae thong cam
		
		else if (up_down) begin //count up
			if (counter_out < end_num)
			begin
				counter_out <= counter_out + 1'b1;
				check <= 1'b0;
			end
			else 
			begin
				check <= 1'b1;
			end
		end
		else begin //count down
			if (counter_out > end_num)
			begin 
				counter_out <= counter_out - 1'b1;
				check <= 1'b0;
			end
			else
			begin 
				check <= 1'b1;
			end
		end
   end
    
endmodule
