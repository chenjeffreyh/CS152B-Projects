`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:34 10/09/2017 
// Design Name: 
// Module Name:    sixteen_bit_alu 
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
module sixteen_bit_alu(a, b, b_invert, carry_in, operation, result, carry_out
    );
input [15:0] a;
input [15:0] b;
input b_invert, carry_in;
input [2:0] operation;

output [15:0] result;
output carry_out;

wire co;
eight_bit_alu _8_bit_alu_1 (.a(a[7:0]), .b(b[7:0]), .b_invert(b_invert),
								  .carry_in(carry_in), .operation(operation),
								  .result(result[7:0]), .carry_out(co));
eight_bit_alu _8_bit_alu_2 (.a(a[15:8]), .b(b[15:8]), .b_invert(b_invert),
								  .carry_in(co), .operation(operation),
								  .result(result[15:8]), .carry_out(carry_out));
								  
endmodule
