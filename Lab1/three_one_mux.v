`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:03:32 10/09/2017 
// Design Name: 
// Module Name:    three_one_mux 
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
module three_one_mux(sel, in0, in1, in2, out);

/**
 * Module inputs.
 */
input [1:0] sel;
input in0, in1, in2;

/**
 * Module outputs.
 */
output out;

/**
 * More un-understandable wires.
 */
wire [1:0] sel;
wire in0, in1, in2;

reg out;

always @(*) begin
   case (sel)
      2'b00: out <= in0;
      2'b01: out <= in1;
		2'b10: out <= in2;
	endcase
end

endmodule