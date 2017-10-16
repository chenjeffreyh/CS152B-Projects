`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2017 03:21:26 PM
// Design Name: 
// Module Name: sla_ovf_detect
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
 * A module used for detection of overflow in arithmetic left shifts.
 *
 * @param a The value to be shifted.
 * @param b The number of bits to shift by.
 * @param[out] ovf Whether or not there was overflow.
 */ 
module sla_ovf_detect(a, b, ovf);

    /**
     * Declaration of inputs.
     */
    input signed [15:0] a;
    input signed [15:0] b;

    /**
     * Declaration of outputs.
     */
    output ovf;

    /**
     * Utility bitmasks.
     *
     * @{ 
     */
    wire signed [15:0] premask;
    wire signed [15:0] mask;
    wire [15:0] inv_mask;
    assign premask = 16'b1000_0000_0000_0000;
    assign mask = premask >>> b;
    assign inv_mask = 16'b0111_1111_1111_1111 >> b;
    /**
     * @}
     */

    /**
     * Other module wires.
     *
     * @{
     */
    wire [15:0] check_1;
    wire [15:0] check_0;
    wire [15:0] check_1_all_1s;
    wire [15:0] check_0_all_0s;
    /**
     * @}
     */

    /*
    * Mask the top "b" bits of a to determine if they are either all 1s or all
    * 0s.
    */
    assign check_1 = a & mask | inv_mask;
    assign check_0 = (a | inv_mask) & mask;
    
    assign check_1_all_1s =  check_1[15] & check_1[14] & check_1[13] & check_1[12] &
                             check_1[11] & check_1[10] & check_1[9] & check_1[8] &
                             check_1[7] & check_1[6] & check_1[5] & check_1[4] &
                             check_1[3] & check_1[2] & check_1[1] & check_1[0];
    
    assign check_0_all_0s =  ~(check_0[15] | check_0[14] | check_0[13] | check_0[12] |
                               check_0[11] | check_0[10] | check_0[9] | check_0[8] |
                               check_0[7] | check_0[6] | check_0[5] | check_0[4] |
                               check_0[3] | check_0[2] | check_0[1] | check_0[0]);
                      
    assign ovf = 1 & (check_1_all_1s | check_0_all_0s) &
                 (b[15] | b[14] | b[13] | b[12] |
                  b[11] | b[10] | b[9] | b[8] |
                  b[7] | b[6] | b[5] | b[4] |
                  b[3] | b[2] | b[1] | b[0]);

endmodule
