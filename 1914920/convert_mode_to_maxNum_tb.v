module convert_mode_to_maxNum_tb;
    reg     [2:0] mode;
    wire    [4:0] maxNum;

    convert_mode_to_maxNum TESTMODULE_convert_mode_to_maxNum (
        .mode(mode),
        .maxNum(maxNum)
    );

    initial begin
        assign mode = 3'b000;
    #20 assign mode = 3'b001;
    #20 assign mode = 3'b010;
    #20 assign mode = 3'b011;
    #20 assign mode = 3'b100;
    #20 assign mode = 3'b101;
    #20 assign mode = 3'b111;
        $finish;
    end
endmodule

// 3'b000:     maxNum = 5'd0;
// 3'b001:     maxNum = 5'd6;
// 3'b010:     maxNum = 5'd0;
// 3'b011:     maxNum = 5'd11;
// 3'b100:     maxNum = 5'd5;
// 3'b101:     maxNum = 5'd16;  