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

        /*
        * Zero-initialize everything and hold reset high to reset all
        * registers.
        */
        Ra = 0;
        Rb = 0;
        Rw = 0;
        wrEn = 0;
        clk = 0;
        rst = 1;
        busW = 0;

        /*
         * Disable reset.
         */
        #10
            rst = 0;
        
        /*
         * Write 547 to register 1.
         */
        #10
            busW = 547;
            wrEn = 1;
            Rw = 1;
        
        /*
         * Write 32767 to register 31 but don't read it yet.
         */        
        #10
          
            Ra = 0;
            Rb = 0;
            Rw = 31;
            wrEn = 1;
            busW = 32767;

        /*
         * Now read register register 31.
         *
         * busA should read 32767, busB should read 0. 
         */
        #10
            Ra = 31;
            wrEn = 0;

        /*
         * Write to various registers.
         */
        #10
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

        /*
         * Read from all the registers we just wrote to.
         */       
        #10 
            Ra = 1; // -651
            Rb = 0; // Still 0.
        
        #10 
            Ra = 2; // 4576
            Rb = 1; // -651
        
        #10 
            Ra = 3; // 526
            Rb = 2; // 4576
        
        #10 
            Ra = 29; // 976
            Rb = 3; // 526
        
        #10 
            Ra = 30; // 8
            Rb = 29; // 976
        
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

        /*
         * Demonstrate that if a register is read from/written to
         * simultaneously, then the register exhibits write-forward behavior
         * and outputs the new write value immediately.
         */
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
