module mode_processing_tb;

    reg             check;
    reg             rst;
    reg             flick;
    reg     [2:0]   prev_mode;
    wire    [2:0]   mode;

    mode_processing testmodule (
        .check(check),
        .rst(rst),
        .flick(flick),
        .prev_mode(prev_mode),
        .mode(mode)
    );

    initial begin
        rst = 0;
        flick = 0;
        prev_mode = 3'b000;
        check = 0;        
    end

    initial begin
			#5;
			check = 1;
			rst = 1;
			#5;
			rst = 0;
			#5;
			flick = 1;
			#5;
			flick = 0;
			#5;
                    // OUTPUT =  0

        #20;
        check = 1;  // OUTPUT = 1

        #20;
        check = 0; // OUTPUT = 1

        #20;
        check = 1; //OUTPUT = 2

        #20;
        check = 0; // OUTPUT = 2

        #20;
        check = 1; // OUTPUT = 3

        #20;
        check = 0; // OUTPUT = 3

        #20;
        check = 1; // OUTPUT = 4

        #20;
        check = 0; // OUTPUT = 4

        #20;
        check = 1; // OUTPUT = 5

        #20;
        check = 0; // OUTPUT = 5                

        #20;
        check = 1; // OUTPUT = 0

        #20;
        check = 0; // OUTPUT = 0        

        #20;
        check = 1;
		  flick = 1; // OUTPUT = 1
		  
		  #20;
		  check = 0; // OUTPUT = 1
		  
		  #20;
		  check = 1; // OUTPUT = 2
		  
		  #20;
		  check = 0; // OUTPUT = 2
		  
		  #20;
		  check = 1; // OUTPUT = 3
		  
		  #20;
		  check = 0; // OUTPUT = 3
		  
		  #20;
		  check = 1; // OUTPUT = 2
		  
		  #20;
		  flick = 0;
		  check = 0; // OUTPUT = 2

		  #20;
		  check = 1; // OUTPUT = 3
		  
		  #20;
		  check = 0; // OUTPUT = 3

		  #20;
		  check = 1; // OUTPUT = 4
		  
		  #20;
		  check = 0; // OUTPUT = 4
		  

		  #20;
		  check = 1; // OUTPUT = 5
		  
		  #20;
		  flick = 1;
		  check = 0; // OUTPUT = 5
		  

		  #20;
		  check = 1; // OUTPUT = 0 
		  
		  #20;
		  check = 0; // OUTPUT = 0
		  
		  $finish;
    end

endmodule