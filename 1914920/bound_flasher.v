module bound_flasher( input	rst,
								input clk,
								
								input flick,
								output wire new_clk,
								output wire [15:0] led_out,
								output reg [2:0] mode
								);						
	wire up_down;
	//wire new_clk;	
	wire check;		
	//reg [2:0] mode;
	wire [4:0] maxNum;
	wire [4:0] prev_maxNum;
	wire [4:0] counter_out;
	initial begin
		mode <=3'b000;
	end
	convert_mode_to_maxNum max(mode,maxNum);
	
	mem memo(maxNum,check,rst,prev_maxNum);
	
	Compare com(up_down,maxNum,prev_maxNum,rst);
	
	Devider devider(clk,rst,new_clk);
	Led_counter led_counter(prev_maxNum, maxNum, new_clk, up_down, rst,counter_out, check);
	LED_display led_display(counter_out,led_out); 
	
	
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
