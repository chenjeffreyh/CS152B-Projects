`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2017 10:41:24 AM
// Design Name: 
// Module Name: register_file_ut
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module register_file_ut();

    reg [4:0] Ra;
    reg [4:0] Rb;
    reg [4:0] Rw;
    reg wrEn, clk, rst;
    reg [15:0] busW;

    wire [15:0] busA;
    wire [15:0] busB;

    register_file uut (.Ra(Ra),
                       .Rb(Rb),
                       .Rw(Rw),
                       .wrEn(wrEn),
                       .clk(clk),
                       .rst(rst),
                       .busW(busW),
                       .busA(busA),
                       .busB(busB));

    initial begin

        Ra = 0;
        Rb = 0;
        Rw = 0;
        wrEn = 0;
        clk = 0;
        rst = 1;
        busW = 0;
		  
		  #6 // 6
		  rst = 0;

        #1 // 7
        busW = 547;

        #4 // 11
        wrEn = 1;

        #10 // 21
        Rw = 1;

        #20 // 41
		  
		  // **** Test 2 ****
		  Ra = 0;
        Rb = 0;
        Rw = 31;
        wrEn = 0;
        clk = 0;
        rst = 1;
        busW = 0;
		  
		  #6 // 47
		  rst = 0;
        busW = 32767;

        #4 // 51
        wrEn = 1;

        #10 //61
		  // busA (register 31) should output 32767 and busB (register 0) output 0
		  Ra = 31; 
		  wrEn = 0;
		  
		  #10
		  // Write to other registers
		  busW = -651;
		  wrEn = 1;
		  Rw = 1;
		  
		  #10
		  busW = 4576;
		  wrEn = 1;
		  Rw = 2;
		  
		  #10
		  busW = 526;
		  wrEn = 1;
		  Rw = 3;
		  
		  #10
		  busW = 976;
		  wrEn = 1;
		  Rw = 29;
		  
		  #10
		  busW = 8;
		  wrEn = 1;
		  Rw = 30;
		  
		  #10 
		  Ra = 1; // -651
		  
		  #10 
		  Ra = 2; // 4576
		  
		  #10 
		  Ra = 3; // 526
		  
		  #10 
		  Ra = 29; // 976
		  
		  #10 
		  Ra = 30; // 8
		  Rb = 0; // still 0
		  
		  #10 
		  Rw = 2; //wrEn still on
		  
		  #10;
		  Ra = 1; // Register 1 overwritten from -651 to 2
		  
		  #10
		  rst = 1; // Everything we read below should be 0
		  
		  #10
		  Ra = 0;
		  Rb = 1;
		  
		  #10 
		  Ra = 2;
		  Rb = 3;
		  
		  #10
		  Ra = 4;
		  Rb = 5;
		  
		  #10
		  Ra = 27;
		  Rb = 28;
		  
		  #10
		  Ra = 29; 
		  Rb = 30;
		  rst = 0;
		  
		  #10
		  wrEn = 1;
		  Rw = 10;
		  Ra = 10;
		  busW = 14;
		  
		  #10
		  
        $finish;

    end

    /*
     * A clock generator running eternally in the background.
     */
    always begin
        #5 clk = ~clk;
    end

endmodule
