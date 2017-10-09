`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:05:55 10/09/2017 
// Design Name: 
// Module Name:    four_bit_alu 
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
module four_bit_alu(a, b, b_invert, carry_in, operation, result, carry_out 
    );
input [3:0] a;
input [3:0] b;
input b_invert, carry_in;
input [2:0] operation;

output [3:0] result;
output carry_out;

wire co;
two_bit_alu _2_bit_alu_1 (.a(a[1:0]), .b(b[1:0]), .b_invert(b_invert),
								  .carry_in(carry_in), .operation(operation),
								  .result(result[1:0]), .carry_out(co));
two_bit_alu _2_bit_alu_2 (.a(a[3:2]), .b(b[3:2]), .b_invert(b_invert),
								  .carry_in(co), .operation(operation),
								  .result(result[3:2]), .carry_out(carry_out));

endmodule

