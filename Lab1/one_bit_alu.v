`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:14:39 10/06/2017 
// Design Name: 
// Module Name:    one_bit_alu 
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
module one_bit_alu(
a,
b,
b_invert,
carry_in,
operation,
result,
carry_out
);

input a;
input b;
input b_invert;
input carry_in;
input [1:0] operation;
output result;
output carry_out;
/*
wire a;
wire b;
wire b_invert;
wire carry_in;
wire operation;
*/
wire b_final;
wire sum;

wire result;
wire carry_out;

two_one_mux _2_1_mux(b_invert, b, ~b, b_final);
addbit _addbit (a, b_final, carry_in, sum, carry_out);
three_one_mux _3_1_mux(operation, a & b_final, a | b_final, sum, result);

endmodule
