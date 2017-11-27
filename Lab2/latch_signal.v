`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:48:56 10/30/2017 
// Design Name: 
// Module Name:    latch_signal 
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
module latch_signal(btn, rst, out);

input btn, rst;
output out;

reg out_value;

initial begin
    out_value <= btn;
end

always @ (btn or rst) begin
    if (rst == 1) begin
	     out_value = 0;
    end else if (btn == 1) begin
        out_value = 1;
    end
end

assign out = out_value;
	


endmodule
