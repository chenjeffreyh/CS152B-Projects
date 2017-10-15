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
             * Basic test cases involving 0. Should theoretically give the
             * same value as the non-zero operand.
             */
            testcase(0, 0);
            testcase(1, 0);
            testcase(0, 1);
            testcase(-101, 0);
            testcase(0, 16'b1111_1111_1111_1111);
            testcase(16'b0111_1111_1111_1111, 0);

            /*
             * Ors with ~0 should all be ~0.
             */
            testcase(0, ~0);
            testcase(5, ~0);
            testcase(~0, ~0);
            testcase(16'b0111_1111_1111_1111, ~0);

            /*
             * Some more test cases.
             */
            testcase(16'b0101_0101_0101_0101, 16'b1010_1010_1010_1010);
            testcase(16'b0000_0000_1111_1111, 16'b0000_0000_1111_1111);
            testcase(53, 64);
            testcase(1024, 3516);
            testcase(17592, 8156);
            testcase(16384, 16383);
        end
    endtask

    /**
     * Entry point for the unit test.
     */
    initial begin
        /*
         * Initialize operands to 0. Bitwise or is selected using control code
         * 2.
         */
        a = 0;
        b = 0;
        ctrl = 2;

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
