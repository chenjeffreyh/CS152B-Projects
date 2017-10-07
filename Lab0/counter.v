`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:20:59 10/02/2017 
// Design Name: 
// Module Name:    counter 
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
module counter(
    clock,
    reset,
    enable,
	 counter_inter,
    counter_out
);

input clock;
input reset;
input enable;
output[26:0] counter_inter;
output[3:0] counter_out;

wire clock;
wire reset;
wire enable;

reg[26:0] counter_inter;
reg[3:0] counter_out;

always @ (posedge clock)
begin: COUNTER
    // At every rising edge of clock we check if reset is active
    // If active, we load the counter output with 4'b0000
    if (reset == 1'b1) begin
        counter_out <= #1 4'b0000;
		  counter_inter <= #1 27'b000000000000000000000000000;
    end
    // If enable is active, then we increment the counter
    else if (enable == 1'b1) begin
        counter_out <= #1 counter_out + 1;
		  counter_inter <= #1 counter_inter + 1;
    end
	 
	 else if (enable == 1'b1) begin
	     counter_inter <= #1 counter_inter + 1;
	 end
end // End of Block COUNTER
endmodule // End of Module counter
