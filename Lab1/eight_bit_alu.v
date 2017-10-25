`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:08:24 10/09/2017 
// Design Name: 
// Module Name:    eight_bit_alu 
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
module eight_bit_alu(a, b, b_invert, carry_in, operation, result, carry_out
    );
input [7:0] a;
input [7:0] b;
input b_invert, carry_in;
input [2:0] operation;

output [7:0] result;
output carry_out;

wire co;
four_bit_alu _4_bit_alu_1 (.a(a[3:0]), .b(b[3:0]), .b_invert(b_invert),
								  .carry_in(carry_in), .operation(operation),
								  .result(result[3:0]), .carry_out(co));
four_bit_alu _4_bit_alu_2 (.a(a[7:4]), .b(b[7:4]), .b_invert(b_invert),
								  .carry_in(co), .operation(operation),
								  .result(result[7:4]), .carry_out(carry_out));


endmodule
