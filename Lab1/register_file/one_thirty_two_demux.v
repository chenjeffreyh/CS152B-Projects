`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:59:01 10/20/2017 
// Design Name: 
// Module Name:    one_thirty_two_demux 
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
module one_thirty_two_demux(
	wrEn,
	register,
	out
    );

input wire wrEn;
input wire [4:0] register;

output wire [31:0] out;

assign out[31:0] = wrEn << register;

endmodule
