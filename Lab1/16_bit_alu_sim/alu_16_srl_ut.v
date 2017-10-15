`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2017 04:44:15 AM
// Design Name: 
// Module Name: alu_16_srl_ut
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

module alu_16_srl_ut;

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
            /*
             * Some simple shifts.
             */
            testcase(1, 1);
            testcase(16'b0000_1111_1111_1111, 4);
            testcase(21, 16);
            testcase(0, 12);
            testcase(32767, 1);

            /*
             * Shift by 0.
             */
            testcase(1, 0);
            testcase(-32768, 0);
            testcase(0, -0);

            /*
             * Does shift in 1s for negative numbers.
             */
            testcase(-1, 4);
            testcase(-32768, 5);

        end
    endtask

    /**
     * Entry point for the unit test.
     */
    initial begin
        /*
         * Initialize operands to 0. Logical right shift is selected using
         * control code 10.
         */
        a = 0;
        b = 0;
        ctrl = 10;

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
