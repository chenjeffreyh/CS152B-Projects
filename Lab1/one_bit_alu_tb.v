`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:44:24 10/06/2017
// Design Name:   one_bit_alu
// Module Name:   C:/Users/CS152B/Desktop/RMJ/RMJ-Lab1/one_bit_alu_tb.v
// Project Name:  RMJ-Lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: one_bit_alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module one_bit_alu_tb;

	reg a, b, b_invert, carry_in;
	reg [1:0] operation;
   // Outputs

   wire result;
   wire carry_out;

   // Instantiate the Unit Under Test (UUT)
   one_bit_alu uut (
      a,
		b,
		b_invert,
		carry_in,
		operation,
		result,
		carry_out
   );

   initial begin
      // Initialize Inputs
      a = 1;
		b = 0;
		b_invert = 0;
		carry_in = 0;
		
		//and
		operation = 0;
		#10 a = 0;
		#10 b = 1;
		a = 1;
		
		//or
		#10
		operation = 1;
		a = 0;
		b = 0;
		#10
		a = 1;
		#10
		a = 0;
		b = 1;
		#10
		a = 1;
		
		//addition
		#10
		operation = 2'b10;
		a = 0;
		b = 0;
		carry_in = 0;
		#10 b = 1;
		#10
		a = 1;
		b = 0;
		#10 b = 1;
		#10 carry_in = 1;
		#10 b = 0;
		#10 a = 0;
		#10 carry_in = 0;
		
		//b_invert
		#10
		b = 1;
		b_invert = 1;
		#10
		b = 0;
		#10
		$finish;
      // Wait 100 ns for global reset to finish
      #100;
        
      // Add stimulus here

   end
      
endmodule

