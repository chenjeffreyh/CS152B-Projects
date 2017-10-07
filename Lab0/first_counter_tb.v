`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:30:33 10/02/2017
// Design Name:   counter
// Module Name:   C:/Users/CS152B/Desktop/RMJ/RMJ-Lab0/first_counter_tb.v
// Project Name:  RMJ-Lab0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module first_counter_tb;

	// Inputs
	reg clock;
	reg reset;
	reg enable;

	// Outputs
	wire [3:0] counter_out;
	
	// Initialization of variables.
	initial begin
	    $display ("time\t clk reset enable counter");
		 $monitor ("%g\t %b %b  %b   %b",
		            $time, clock, reset, enable, counter_out);
		 clock = 1;
		 reset = 0;
		 enable = 0;
		 #5 reset = 1;
		 #10 reset = 0;
		 #10 enable = 1;
		 #100 enable = 0;
		 #20 enable = 1;
		 #100 enable = 0;
		 #25 $finish;
	end
	
	// Clock generator
	always begin
	    #5 clock = ~clock;
	end

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.clock(clock), 
		.reset(reset), 
		.enable(enable), 
		.counter_out(counter_out)
	);
      
endmodule

