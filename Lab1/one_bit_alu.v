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
reg b_final;
reg [1:0] sum;
    
reg result;
reg carry_out;

always @(*) begin
   if (b_invert) begin
      b_final <= ~b;
   end else begin
		b_final <= b;
	end
   case (operation)
      2'b00: result <= a & b_final;
      2'b01: result <= a | b_final;
      2'b10: begin
         sum <= a + b_final + carry_in;
         result <= sum[0];
         carry_out <= sum[1];
      end
	endcase
end


endmodule
