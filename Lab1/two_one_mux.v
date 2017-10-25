`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:57:27 10/09/2017 
// Design Name: 
// Module Name:    two_one_mux 
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
module two_one_mux(sel, in0, in1, out);

/**
 * Module inputs.
 */
input sel, in0, in1;

/**
 * Module outputs.
 */
output out;

/**
 * More un-understandable wires.
 */
wire sel, in0, in1;

reg out;

always @(*) begin
   case (sel)
      1'b0: out <= in0;
      1'b1: out <= in1;
	endcase
end

endmodule
