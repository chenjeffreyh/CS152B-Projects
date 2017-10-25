`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:53:59 10/23/2017 
// Design Name: 
// Module Name:    thirtytwo_one_mux 
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
module thirtytwo_one_mux(sel, in, out
    );

/**
 * Module inputs.
 */
input [4:0] sel;
input [31:0] in;

/**
 * Module outputs.
 */
output out;

/**
 * More un-understandable wires.
 */
wire [4:0] sel;
wire [31:0] in;

reg out;

always @(*) begin
	/*
	 * Fix later if needed cause we were lazy.
	 */
   out <= in[sel];
end
endmodule
