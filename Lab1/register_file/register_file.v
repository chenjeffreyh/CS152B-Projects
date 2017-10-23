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

    /**
     * Define inputs.
     *
     * @{
     */
    input [4:0] Ra;
    input [4:0] Rb;
    input [4:0] Rw;
    input wrEn;
    input [15:0] busW;
    input clk;
    input rst;
    /*
     * @}
     */

    /**
     * Define outputs.
     *
     * @{
     */
    output [15:0] busA;
    output [15:0] busB;
    /*
     * @}
     */

    /*
     * Write enable outputs from the demux.
     */
    wire [31:0] wrEn_indv;

    /*
     * Output bus from each register.
     */
    wire [15:0] reg_outputs[0:31];

    /*
     * The demultiplexer
     */
    one_thirty_two_demux demux (.wrEn(wrEn),
                                .register(Rw),
                                .out(wrEn_indv));

    /*
     * Generation loop for all 32 registers.
     */
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : generate_regs
            register_16_bit regs (.wrEn(wrEn_indv[i]),
                                  .busIn(busW),
                                  .clk(clk),
                                  .rst(rst),
                                  .busOut(reg_outputs[i]));
    end
    endgenerate

    assign busA = reg_outputs[0];
    assign busB = reg_outputs[1];

endmodule
