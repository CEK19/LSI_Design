module convert_mode_to_maxNum (
                                input       [2:0] mode,
                                output reg  [4:0] maxNum
                                );
    always @(mode) begin
        case (mode)
            3'b000:     maxNum = 5'd0;
            3'b001:     maxNum = 5'd6;
            3'b010:     maxNum = 5'd0;
            3'b011:     maxNum = 5'd11;
            3'b100:     maxNum = 5'd5;
            3'b101:     maxNum = 5'd16;    
            default:    maxNum = 5'd0;
        endcase
    end    
endmodule