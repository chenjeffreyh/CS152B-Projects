`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 10/27/2017 04:41:48 PM
// Design Name:
// Module Name: traffic_fsm_ut
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module traffic_fsm_ut();

    reg clk;
    reg ped_btn;
    reg traf_sense;

    wire main_r;
    wire main_g;
    wire main_y;
    wire side_r;
    wire side_g;
    wire side_y;
    wire ped_light;

    traffic_fsm uut (.clk(clk),
                     .ped_btn(ped_btn),
                     .traf_sense(traf_sense),
                     .main_r(main_r),
                     .main_g(main_g),
                     .main_y(main_y),
                     .side_r(side_r),
                     .side_g(side_g),
                     .side_y(side_y),
                     .ped_light(ped_light));

    /**
     * Zero-initialize stuff.
     */
    initial begin
        clk = 0;
        ped_btn = 1;
        traf_sense = 0;
        #10
		  ped_btn = 0; 
		  
        #200
		  

        $finish;
    end

    /**
     * A clock generator running eternally in the background.
     */
    always begin
        #1 clk = ~clk;
    end

endmodule
