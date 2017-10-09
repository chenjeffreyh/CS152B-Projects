`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:49:15 10/09/2017 
// Design Name: 
// Module Name:    addbit 
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
module addbit(a, b, ci, sum, co);

/**
 * Module inputs.
 */
input a;
input b;
input ci;

/**
 * Module outputs.
 */
output sum;
output co;

/**
 * Wires which I don't get.
 */
wire a;
wire b;
wire ci;
wire sum;
wire co;

assign {co,sum} = a + b + ci;

endmodule