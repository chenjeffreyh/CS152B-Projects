`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2017 10:41:24 AM
// Design Name: 
// Module Name: register_file_ut
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

module register_file_ut();

    reg [4:0] Ra;
    reg [4:0] Rb;
    reg [4:0] Rw;
    reg wrEn, clk, rst;
    reg [15:0] busW;

    wire [15:0] busA;
    wire [15:0] busB;

    register_file uut (.Ra(Ra),
                       .Rb(Rb),
                       .Rw(Rw),
                       .wrEn(wrEn),
                       .clk(clk),
                       .rst(rst),
                       .busW(busW),
                       .busA(busA),
                       .busB(busB));

    initial begin

        Ra = 0;
        Rb = 0;
        Rw = 0;
        wrEn = 0;
        clk = 0;
        rst = 0;
        busW = 0;

        #7
        busW = 547;

        #4
        wrEn = 1;

        #10
        Rw = 1;

        #20
        $finish;

    end

    /*
     * A clock generator running eternally in the background.
     */
    always begin
        #5 clk = ~clk;
    end

endmodule
