`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 10/26/2017 12:01:59 PM
// Design Name:
// Module Name: clk_prescaler_ut
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


module clk_prescaler_ut();

    reg clk_in;
    wire clk_out;

    clk_prescaler uut (.clk_in(clk_in),
                       .clk_out(clk_out));

    /*
     * Zero-initialize input clock.
     */
    initial begin
        clk_in = 0;

        #100

        $finish;
    end

    /*
     * A clock generator running eternally in the background.
     */
    always begin
        #5 clk_in = ~clk_in;
    end

endmodule
