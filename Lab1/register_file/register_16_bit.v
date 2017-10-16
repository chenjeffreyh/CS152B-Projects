`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2017 10:40:50 AM
// Design Name: 
// Module Name: register_16_bit
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
 * A synchronous 16-bit register.
 *
 * @param wrEn Register write enable.
 * @param busIn Input bus (for writing to the register).
 * @param clk Clock signal.
 * @param rst Global reset signal.
 * @param busOut Output bus (for reading from the register).
 */
module register_16_bit(wrEn, busIn, clk, rst, busOut);

/**
 * Define inputs.
 *
 * @{
 */
input wrEn;
input [15:0] busIn;
input clk;
input rst;
/**
 * @}
 */

/**
 * Define outputs.
 */
output [15:0] busOut;

endmodule
