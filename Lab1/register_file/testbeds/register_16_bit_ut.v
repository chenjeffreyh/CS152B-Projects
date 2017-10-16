`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2017 04:24:18 PM
// Design Name: 
// Module Name: register_16_bit_ut
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


module register_16_bit_ut();

    reg wrEn, clk, rst;
    reg [15:0] busIn;
    
    wire [15:0] busOut;
    
    /**
     * The UUT (Unit Under Test).
     */
    register_16_bit uut(.wrEn(wrEn),
                        .busIn(busIn),
                        .clk(clk),
                        .rst(rst),
                        .busOut(busOut));

    initial begin

        busIn = 0;
        wrEn = 0;
        rst = 0;
        clk = 0;

        #1
        busIn = 354;
        
        #1
        wrEn = 1;

        #5
        rst = 1;

        #10
        rst = 0;

        #100;
        $finish;
    end

    /*
     * Clock generator.
     */
    always begin
        #5 clk = ~clk;
    end

endmodule
