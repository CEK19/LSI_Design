
module Compare(up_down,max_num,pre_max_num,rst);
	input rst;
	input [3:0]max_num; 
	input [3:0]pre_max_num;
	output reg up_down; 
	always @(max_num) begin
		if (max_num>pre_max_num) begin up_down=1; end
		else begin up_down=0; end
	end
endmodule


