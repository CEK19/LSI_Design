module LED_display_tb;
    reg     [4:0]   counter_out,
    wire    [15:0]  led_out

    LED_display TESTMODULE_LED_display (
        .counter_out(counter_out),
        .led_out(led_out)
    );

    initial begin
        assign counter_out = 5'b00000;
    #20 assign counter_out = 5'b00001;
    #20 assign counter_out = 5'b00010;
    #20 assign counter_out = 5'b00011;
    #20 assign counter_out = 5'b00100;
    #20 assign counter_out = 5'b00101;
    #20 assign counter_out = 5'b00110;
    #20 assign counter_out = 5'b00111;
    #20 assign counter_out = 5'b01000;
    #20 assign counter_out = 5'b01001;
    #20 assign counter_out = 5'b01010;
    #20 assign counter_out = 5'b01011;
    #20 assign counter_out = 5'b01100;
    #20 assign counter_out = 5'b01101;
    #20 assign counter_out = 5'b01110;
    #20 assign counter_out = 5'b01111;
    #20 assign counter_out = 5'b10000;
    #20 assign counter_out = 5'b11111;
        $finish;
    end
endmodule

// 5'b00000: led_out = 16'b0000_0000_0000_0000;
// 5'b00001: led_out = 16'b0000_0000_0000_0001; 
// 5'b00010: led_out = 16'b0000_0000_0000_0011; 
// 5'b00011: led_out = 16'b0000_0000_0000_0111; 
// 5'b00100: led_out = 16'b0000_0000_0000_1111; 
// 5'b00101: led_out = 16'b0000_0000_0001_1111;
// 5'b00110: led_out = 16'b0000_0000_0011_1111;
// 5'b00111: led_out = 16'b0000_0000_0111_1111;
// 5'b01000: led_out = 16'b0000_0000_1111_1111;
// 5'b01001: led_out = 16'b0000_0001_1111_1111;
// 5'b01010: led_out = 16'b0000_0011_1111_1111;
// 5'b01011: led_out = 16'b0000_0111_1111_1111;
// 5'b01100: led_out = 16'b0000_1111_1111_1111;
// 5'b01101: led_out = 16'b0001_1111_1111_1111;
// 5'b01110: led_out = 16'b0011_1111_1111_1111;
// 5'b01111: led_out = 16'b0111_1111_1111_1111;
// 5'b10000: led_out = 16'b1111_1111_1111_1111;
// default:  led_out = 16'b0000_0000_0000_0000;