module mode_processing( input 					check,
								input						rst,
								input 					flick,
								input				[2:0] prev_mode,
								output	reg	[2:0]	mode );
								
	reg [2:0] state = 3'b0;


	always @(posedge rst or posedge flick or posedge check) begin
		if (rst == 1'b1) begin
			mode <= 3'b000;
		end
		else begin
			case (state)
				3'b000: begin
					if (flick == 1'b1 && check == 1'b1) begin
						state <= 3'b001;
					end
					else begin
						state <= state;
					end
				end
				
				3'b001: begin
					if (check == 1'b1) begin
						state <= 3'b010;
					end
					else begin
						state <= state;
					end
				end
				
				3'b010: begin
					if (check == 1'b1) begin
						state <= 3'b011;
					end
					else begin
						state <= state;
					end
				end
				
				3'b011: begin
					if (check == 1'b1 && flick == 1'b0) begin
						state <= 3'b100;
					end
					else if (check == 1'b1 && flick == 1'b1) begin
						state <= 3'b010;
					end
					else begin
						state <= state;
					end
				end
				
				3'b100: begin
					if (check == 1'b1) begin
						state <= 3'b101;
					end
					else begin
						state <= state;
					end
				end
				
				3'b101: begin
					if (check == 1'b1 && flick == 1'b0) begin
						state <= 3'b000;
					end
					else if (check == 1'b1 && flick == 1'b1) begin
						state <= 3'b100;
					end
					else begin
						state <= state;
					end
				end
				
				default: state <= state;
			endcase
		end
	end

endmodule
