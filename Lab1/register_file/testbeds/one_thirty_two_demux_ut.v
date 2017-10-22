`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:08:29 10/20/2017 
// Design Name: 
// Module Name:    one_thirty_two_demux_ut 
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
module one_thirty_two_demux_ut(
    );
	 reg wrEn;
	 reg [4:0] register;
	 wire [31:0] out;
	 
	 one_thirty_two_demux uut(.wrEn(wrEn), .register(register), .out(out));
	 
	 initial begin
		wrEn <= 1;
		register <= 1;
		
		#5
		register <= 5;
		
		#5
		register <= 31;
		
		#5
		register <= 0;
		
		#5
		wrEn <= 0;
		
		#5
		register <= 15;
		
		#5
		register <= 31;
		
		#5
		$finish;
	 end


endmodule
