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

    /*
     * Defines a procedure for evaluating a single testcase.
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
             * Delay of 5 ticks after testcase to observe result.
             */
            #5;
        end

    endtask

    initial begin

        /*
         * Specify defaulted inputs.
         */
        a = 0;
        b = 0;
        ctrl = 0;

        #10
        ctrl = 1;
        
        #5

        testcase(2, 5);
        testcase(1, -1);
        testcase(-10, -6);
        testcase(-100, 64);
        testcase(32767,0);
        testcase(32767,1);
        testcase(-32768,1);
        testcase(-32768,-1);

        $finish;

        #100;

    end

endmodule
