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

module alu_16_add_ut;

    /*
     * UUT inputs.
     */
    reg [15:0] a;
    reg [15:0] b;
    reg [3:0] ctrl;

    /*
     * UUT outputs used for waveform observation by unit test wrapper.
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
            testcase(0, 32767);
            testcase(-32768, 0);

            /*
             * Simple positive integer addition.
             */
            testcase(1, 1);
            testcase(3, 10);
            testcase(53, 64);
            testcase(1024, 3516);
            testcase(17592, 8156);
            testcase(16384, 16383);

            /*
             * Simple negative integer addition.
             */
            testcase(-1, -1);
            testcase(-16, -38);
            testcase(-429, -9024);
            testcase(-16384, -16384);
            testcase(-32000, -768);

            /*
             * Mixed integer addition.
             */
            testcase(-1, 1);
            testcase(1, -1);
            testcase(16384, -32768);
            testcase(32767, -16384);
            testcase(-32768, 32767);

            /*
             * Addition test cases causing overflow.
             *
             * The sum should wrap around. Additionally, the ALU's overflow
             * output should go high for all subsequent test cases.
             */
            testcase(32767, 1);
            testcase(-1, -32768);
            testcase(16384, 16384);
            testcase(-16384, -16385);
            testcase(16384, 32767);
            testcase(-16384, -32768);
        end
    endtask

    /**
     * Entry point for the unit test.
     */
    initial begin
        /*
         * Initialize operands to 0. Addition is selected using control code
         * 1.
         */
        a = 0;
        b = 0;
        ctrl = 1;

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
