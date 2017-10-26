`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2017 01:05:45 PM
// Design Name: 
// Module Name: traffic_fsm
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

/**
 * A traffic controller finite state machine.
 *
 * @input clk The system clock.
 * @input ped_btn The pedestrian walk button.
 * @input traf_sense The side street traffic sensor.
 * @output main_r The main street red light.
 * @output main_g The main street green light.
 * @output main_y The main street yellow light.
 * @output side_r The side street red light.
 * @output side_g The side street green light.
 * @output side_y The side street yellow light.
 * @output ped_light The pedestrian walk light.
 */
module traffic_fsm(clk,
                   ped_btn,
                   traf_sense,
                   main_r,
                   main_g,
                   main_y,
                   side_r,
                   side_g,
                   side_y,
                   ped_light);

    /**
     * Module input declarations.
     */
    input clk,
          ped_btn,
          traf_sense;

    /**
     * Module output declarations.
     */
    output main_r,
           main_g,
           main_y,
           side_r,
           side_g,
           side_y,
           ped_light;

    /**
     * All of the states
     *
     * @{
     */
    parameter MAIN_ST_G = 8'b0000_0001;
    parameter MAIN_ST_SENS = 8'b0000_0010;
    parameter MAIN_ST_Y = 8'b0000_0100;
    parameter PED_WALK_ON = 8'b0000_1000;
    parameter SIDE_ST_G = 8'b0001_0000;
    parameter SIDE_ST_SENS = 8'b0010_0000;
    parameter SIDE_ST_Y = 8'b0100_0000;
    /**
     * @}
     */

endmodule
