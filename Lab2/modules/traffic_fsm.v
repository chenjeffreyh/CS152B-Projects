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
     * The clock prescaler.
     */
    wire clk_1Hz;
    clk_prescaler _clk_prescaler (.clk_in(clk),
                                  .clk_out(clk_1Hz));

    /**
     * All of the states.
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

    /**
     * State variables and constants.
     */
    parameter NUM_STATE_BITS = 8;
    reg [NUM_STATE_BITS - 1:0] state;
    reg [NUM_STATE_BITS - 1:0] next_state;
    reg [2:0] counter;
    reg [2:0] next_counter;
    wire walk_light_button;
    wire side_sensor;

    /**
     * On initialization, set the traffic controller to the first state.
     */
    initial begin
        state = MAIN_ST_G;
        counter = 6;
    end

    /**
     * Asynchronous block for determining the next state and counters to be
     * set upon completion of the current state.
     */
    always begin : NEXT_STATE_LOGIC
        case (state)
       	    MAIN_ST_G : begin
       		    next_state <= MAIN_ST_SENS;
       		    if (side_sensor) begin
       		    	next_counter <= 3;
       		    end else begin
       		    	next_counter <= 6;
       		    end
       	    end

            MAIN_ST_SENS : begin
       	    	next_state <= MAIN_ST_Y;
       	    	next_counter <= 2;
       	    end

            MAIN_ST_Y : begin
       	    	if (walk_light_button) begin
       	    		next_state <= PED_WALK_ON;
       	    		next_counter <= 3;
       	    	end else begin
       	    		next_state <= SIDE_ST_G;
       	    		next_counter <= 6;
       	    	end
       	    end

            PED_WALK_ON : begin
       	    	next_state <= SIDE_ST_G;
       	    	next_counter <= 6;
       	    end

            SIDE_ST_G : begin
       	    	if (side_sensor) begin
       	    		next_state <= SIDE_ST_SENS;
       	    		next_counter <= 3;
       	    	end else begin
       	    		next_state <= SIDE_ST_Y;
       	    		next_counter <= 2;
       	    	end
       	    end

            SIDE_ST_SENS : begin
       	    	next_state <= SIDE_ST_Y;
       	    	next_counter <= 2;
       	    end

            SIDE_ST_Y : begin
       	    	next_state <= MAIN_ST_G;
       	    	next_counter <= 6;
       	    end
       endcase
    end

    always @(posedge clk_1Hz) begin
        counter <= counter - 1;
        if (counter == 0) begin
       	    state <= next_state;
       	    counter <= next_counter;
        end
    end

    /**
     * Set all outputs depending on the current state.
     */
    always @(posedge clk_1Hz) begin : STATE_OUTPUT_LOGIC
        case(state)
            MAIN_ST_G : begin
                {main_r, main_y, main_g} <= {0, 0, 1};
                {side_r, side_y, side_g} <= {1, 0, 0};
                ped_light <= 0;
            end

            MAIN_ST_SENS : begin
                {main_r, main_y, main_g} <= {0, 0, 1};
                {side_r, side_y, side_g} <= {1, 0, 0};
                ped_light <= 0;
            end

            MAIN_ST_Y : begin
                {main_r, main_y, main_g} <= {0, 1, 0};
                {side_r, side_y, side_g} <= {1, 0, 0};
                ped_light <= 0;
            end

            PED_WALK_ON : begin
                {main_r, main_y, main_g} <= {1, 0, 0};
                {side_r, side_y, side_g} <= {1, 0, 0};
                ped_light <= 1;
            end

            SIDE_ST_G : begin
                {main_r, main_y, main_g} <= {1, 0, 0};
                {side_r, side_y, side_g} <= {0, 0, 1};
                ped_light <= 0;
            end

            SIDE_ST_SENS : begin
                {main_r, main_y, main_g} <= {1, 0, 0};
                {side_r, side_y, side_g} <= {0, 0, 1};
                ped_light <= 0;
            end

            SIDE_ST_Y : begin
                {main_r, main_y, main_g} <= {1, 0, 0};
                {side_r, side_y, side_g} <= {0, 1, 0};
                ped_light <= 0;
            end
      endcase
    end

endmodule
