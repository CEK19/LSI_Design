module Compare_Testbench ;

	wire up_down;
	reg [3:0]max_num;
	reg [3:0]pre_max_num;
	Compare uut(up_down,max_num,pre_max_num);
	initial begin
		max_num=0;pre_max_num=6; #100;
		max_num=6;pre_max_num=0; #100;
		max_num=6;pre_max_num=12; #100;
		max_num=6;pre_max_num=12; #100;
		
	end
	
endmodule