`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2017 04:44:15 AM
// Design Name: 
// Module Name: alu_16_sub_ut
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

module alu_16_or_ut;

    /*
     * UUT inputs.
     */
    reg[15:0] a;
    reg[15:0] b;
    reg [3:0] ctrl;

    /*
     * UUT outputs.
     */
    wire zero;
    wire [15:0] s;
    wire overflow;

    /*
     * Instantiate the Unit Under Test (UUT).
     */
    alu_control uut (.a(a),
                     .b(b),
                     .ctrl(ctrl),
                     .overflow(overflow),
                     .zero(zero),
                     .s(s));

    /**
     * Defines a procedure for evaluating a single test case.
     * 
     * @param a Input operand a.
     * @param b Input operand b.
     */
    task testcase;
        input [15:0] op_a;
        input [15:0] op_b;

        begin
            a = op_a;
            b = op_b;

            /*
             * Delay of 5 ticks after setting operands to observe result.
             */
            #5;
        end
    endtask

    /**
     * All of the test cases.
     */
    task run_tests;

        begin
            
        end
    endtask

    /**
     * Entry point for the unit test.
     */
    initial begin
        /*
         * Initialize operands to 0. Subtraction is selected using control code
         * 0.
         */
        a = 0;
        b = 0;
        ctrl = 0;

        /*
         * Enforce a short delay before tests begin.
         */
        #10

        /*
         * Run the tests.
         */
        run_tests;

        /*
         * Complete the simulation.
         */
        $finish;

        /*
         * Delay for global reset.
         */
        #100;
    end
endmodule
