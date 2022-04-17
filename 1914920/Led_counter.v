module Led_counter (
                    input	[4:0]  start_num,
						  input	[4:0]	 end_num,
						  input	clk, up_down, rst,
                    output reg  [4:0]  counter_out,
						  output reg check
                    );
						  
	always @(posedge rst or posedge clk) begin
		if (rst) begin counter_out <= 5'b00000; check <=1'b1; end
		
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
