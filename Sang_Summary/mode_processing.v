module mode_processing( input check,
								input	rst,
								input flick,
								output wire up_down);
								
	reg [2:0] mode;
	wire maxNum;
	wire prev_maxNum;
	initial begin
		mode =3'b0;
	end
	
	convert_mode_to_maxNum max(mode,maxNum);
	mem memo(maxNum,check,rst,prev_maxNum);
	Compare com(up_down,maxNum,prev_maxNum,rst);

	always @(posedge rst or posedge flick or posedge check) begin
		if (rst == 1'b1) begin
			mode <= 3'b000;
		end
		else begin
			case (mode)
				3'b000: begin
					if (flick == 1'b1 && check == 1'b1) begin
						mode <= 3'b001;
					end
					else begin
						mode <= mode;
					end
				end
				
				3'b001: begin
					if (check == 1'b1) begin
						mode <= 3'b010;
					end
					else begin
						mode <= mode;
					end
				end
				
				3'b010: begin
					if (check == 1'b1) begin
						mode <= 3'b011;
					end
					else begin
						mode <= mode;
					end
				end
				
				3'b011: begin
					if (check == 1'b1 && flick == 1'b0) begin
						mode <= 3'b100;
					end
					else if (check == 1'b1 && flick == 1'b1) begin
						mode <= 3'b010;
					end
					else begin
						mode <= mode;
					end
				end
				
				3'b100: begin
					if (check == 1'b1) begin
						mode <= 3'b101;
					end
					else begin
						mode <= mode;
					end
				end
				
				3'b101: begin
					if (check == 1'b1 && flick == 1'b0) begin
						mode <= 3'b000;
					end
					else if (check == 1'b1 && flick == 1'b1) begin
						mode <= 3'b100;
					end
					else begin
						mode <= mode;
					end
				end
				
				default: mode <= mode;
			endcase
		end
	end

endmodule
