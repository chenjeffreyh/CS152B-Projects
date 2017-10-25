`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:57:58 10/23/2017 
// Design Name: 
// Module Name:    mux_bank_512_16 
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
module mux_bank_512_16(sel, in, out
    );
    /**
     * Module inputs.
     */
    input [4:0] sel;
    input [511:0] in;

    /**
     * Module outputs.
     */
    output [15:0] out;

/**
 * More un-understandable wires.
 */
//wire [4:0] sel;
//wire [511:0] in;

//reg [15:0] out;

    /*
     * Generation loop for all 16 thirty-two to one muxes
     */
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : generate_muxes
            thirtytwo_one_mux muxes (.sel(sel),
                                  .in({in[496 + i],
                                       in[480 + i],
                                       in[464 + i],
                                       in[448 + i],
                                       in[432 + i],
                                       in[416 + i],
                                       in[400 + i],
                                       in[384 + i],
                                       in[368 + i],
                                       in[352 + i],
                                       in[336 + i],
                                       in[320 + i],
                                       in[304 + i],
                                       in[288 + i],
                                       in[272 + i],
                                       in[256 + i],
                                       in[240 + i],
                                       in[224 + i],
                                       in[208 + i],
                                       in[192 + i],
                                       in[176 + i],
                                       in[160 + i],
                                       in[144 + i],
                                       in[128 + i],
                                       in[112 + i],
                                       in[96 + i],
                                       in[80 + i],
                                       in[64 + i],
                                       in[48 + i],
                                       in[32 + i],
                                       in[16 + i],
                                       in[i]}),
                                  .out(out[i]));
    end
    endgenerate

endmodule
