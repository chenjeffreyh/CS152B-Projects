`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:49:41 10/13/2017 
// Design Name: 
// Module Name:    sixteen_one_mux 
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
module sixteen_one_mux(sel, in, out
    );
/**
 * Module inputs.
 */
input [3:0] sel;
input [15:0] in;

/**
 * Module outputs.
 */
output out;

/**
 * More un-understandable wires.
 */
wire [3:0] sel;
wire [15:0] in;

reg out;

always @(*) begin
	/*
	 * Fix later if needed cause we were lazy.
	 */
   out <= in[sel];
end

endmodule
