`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2017 10:45:28 PM
// Design Name: 
// Module Name: 16_bit_alu_add_tb
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

module alu_16_sle_ut;

    /*
     * UUT inputs.
     */
    reg [15:0] a;
    reg [15:0] b;
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
            /*
             * Cases where a is greater than b.
             */
            testcase(1, 0);
            testcase(0, -1);
            testcase(32767, -2);
            testcase(32767, -32768);
            testcase(-1, -5);

            /*
             * Cases where a is less than b.
             */
            testcase(0, 1);
            testcase(-1, 0);
            testcase(-2, 32767);
            testcase(-32768, 32767);
            testcase(-5, -1);

            /*
             * Cases where a is equal to b.
             */
            testcase(0, 0);
            testcase(-16, -16);
            testcase(32767, 32767);
            testcase(-32768, -32768);
        end
    endtask

    /**
     * Entry point for the unit test.
     */
    initial begin
        /*
         * Initialize operands to 0. Set on less than or equal to is selected
         * using control code 11.
         */
        a = 0;
        b = 0;
        ctrl = 11;

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
