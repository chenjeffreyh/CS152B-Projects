`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2017 11:02:49 AM
// Design Name: 
// Module Name: register_file
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
 * A 32-register file with support for up to two concurrent read streams and
 * a single write stream.
 *
 * @input Ra Register address for bus A output.
 * @input Rb Register address for bus B output.
 * @input Rw Register address for write bus input.
 * @input wrEn Register write enable.
 * @input busW Input write bus.
 * @input clk Clock signal.
 * @input rst Global reset signal.
 * @output busA Output bus A.
 * @output busB Output bus B.
 */
module register_file(Ra, Rb, Rw, wrEn, busW, clk, rst, busA, busB);

    /*
     * Module input declarations.
     */
    input [4:0] Ra;
    input [4:0] Rb;
    input [4:0] Rw;
    input wrEn;
    input [15:0] busW;
    input clk;
    input rst;

    /*
     * Module output declarations.
     */
    output [15:0] busA;
    output [15:0] busB;

    /*
     * Write enable outputs from the demux.
     */
    wire [15:0] wrEn_indv;

    /*
     * The registers.
     */
    16_bit_register regs[31:0] (.wrEn(wrEn),
                                .busIn(Rw),
                                .clk(clk),
                                .rst(rst),
                                .busOut(SOMESHITHERE));
                                

endmodule
