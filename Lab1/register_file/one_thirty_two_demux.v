`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:59:01 10/20/2017 
// Design Name: 
// Module Name:    one_thirty_two_demux 
// Project Name: 
// Target Devices: 
// Tool versions: 
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
 * A 1-to-32 demultiplexer.
 *
 * @input wrEn The input bit.
 * @input register The output line selector.
 * @output out The 32 output lines.
 */ 
module one_thirty_two_demux(wrEn, register, out);

/**
 * Define inputs.
 *
 * @{
 */
input wire wrEn;
input wire [4:0] register;
/**
 * @}
 */

/**
 * Define outputs.
 */
output wire [31:0] out;

assign out[31:0] = wrEn << register;

endmodule
