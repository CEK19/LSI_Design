module LED_display (
//                    input       [4:0]   counter_out,

						input	[4:0]  start_num,
						  input	[4:0]	 end_num,
						  input	clk, up_down, rst,
                    output reg  [15:0]  led_out
						  output check
                    );
    
	 reg [4:0] counter_out;
	 wire new_clk;
	 
	 Devider(clk,rst,new_clk);
	 Led_counter (start_num,end_num, new_clk, up_down, rst,counter_out, check);
	 
	 
	 always @(counter_out) begin
        case (counter_out)
            5'b00000: led_out = 16'b0000_0000_0000_0000;
            5'b00001: led_out = 16'b0000_0000_0000_0001;
            5'b00010: led_out = 16'b0000_0000_0000_0011;
            5'b00011: led_out = 16'b0000_0000_0000_0111;
            5'b00100: led_out = 16'b0000_0000_0000_1111;
            5'b00101: led_out = 16'b0000_0000_0001_1111;
            5'b00110: led_out = 16'b0000_0000_0011_1111;
            5'b00111: led_out = 16'b0000_0000_0111_1111;
            5'b01000: led_out = 16'b0000_0000_1111_1111;
            5'b01001: led_out = 16'b0000_0001_1111_1111;
            5'b01010: led_out = 16'b0000_0011_1111_1111;
            5'b01011: led_out = 16'b0000_0111_1111_1111;
            5'b01100: led_out = 16'b0000_1111_1111_1111;
            5'b01101: led_out = 16'b0001_1111_1111_1111;
            5'b01110: led_out = 16'b0011_1111_1111_1111;
            5'b01111: led_out = 16'b0111_1111_1111_1111;
            5'b10000: led_out = 16'b1111_1111_1111_1111;
            default:  led_out = 16'b0000_0000_0000_0000;
        endcase
    end
    
endmodule