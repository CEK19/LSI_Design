module Bound_flasher( 	input 	rst,
								input 	clk,
								input 	flick,
								output reg  [15:0]  led_out
						);
	wire new_clk, up_down, check;
	wire [4:0] start_num;
	wire [4:0] end_num;
//	wire [4:0] pre_max_num;
//	wire [4:0] max_num;
	wire [2:0] mode;
	
	
	Devider divider(clk,rst,new_clk);
	Led_counter Led_counter(start_num,end_num, new_clk, 
									up_down, rst,counter_out,check);
	LED_display LED_display(counter_out, led_out);
	Compare compare(up_down,end_num,start_num);
	mem mem(end_num,check,rst,start_num);
	convert_mode_to_maxNum convert(mode, end_num);
	mode_processing mode_process(check, rst, flick, mode);
	
	
endmodule	