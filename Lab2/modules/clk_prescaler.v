`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 10/26/2017 11:24:08 AM
// Design Name:
// Module Name: clk_prescaler
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

/**
 * A prescaler module that divides a clock by some parameter-specified scaling.
 *
 * @input clk_in The source clock input.
 * @input clk_out The scaled clock output.
 */
module clk_prescaler(clk_in, clk_out);

    /**
     * Module input.
     */
    input clk_in;

    /**
     * Module output.
     */
    reg _clk_out;
    output clk_out;

    /**
     * The desired scaling, expressed as the log base 2.
     *
     * @note This module does not support unity scaling (CLOCK_SCALE_LOG_2
     * = 0). If you want unity scaling, don't use a prescaler module!
     */
    parameter CLOCK_SCALE_LOG_2 = 1;

    /**
     * An internal module counter. Should be enough bits to capture the
     * scaling parameter defined above.
     */
    reg [CLOCK_SCALE_LOG_2 - 1:0] counter;

    /*
     * Zero-initialize the counter and output clock.
     */
    initial begin
        counter <= 0;
        _clk_out <= 0;
    end

    always @ (posedge clk_in)
    begin : TICK
        /*
         * We increment the counter by 2 each time because two edges have
         * elapsed each time we run through this loop.
         */
        counter <= counter + 2;

        /*
         * On counter overflow, flip the clock.
         */
        if (counter == 0) begin
            /*
             * Flip the clock.
             */
            _clk_out = ~_clk_out;
        end
    end

    assign clk_out = _clk_out;

endmodule
