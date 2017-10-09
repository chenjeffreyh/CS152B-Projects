`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:49:57 10/09/2017 
// Design Name: 
// Module Name:    two_bit_alu 
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
module two_bit_alu(a, b, b_invert, carry_in, operation, result, carry_out 
    );
input [1:0] a;
input [1:0] b;
input b_invert, carry_in;
input [2:0] operation;

output [1:0] result;
output carry_out;

wire co;
one_bit_alu _1_bit_alu_1 (.a(a[0]), .b(b[0]), .b_invert(b_invert),
								  .carry_in(carry_in), .operation(operation),
								  .result(result[0]), .carry_out(co));
one_bit_alu _1_bit_alu_2 (.a(a[1]), .b(b[1]), .b_invert(b_invert),
								  .carry_in(co), .operation(operation),
								  .result(result[1]), .carry_out(carry_out));

endmodule
