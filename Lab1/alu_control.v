`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:02:00 10/11/2017 
// Design Name: 
// Module Name:    alu_control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu_control(a, b, ctrl, overflow, zero, s
    );
input signed [15:0] a;
input signed [15:0] b;
input [3:0] ctrl;

output overflow;
output zero;
output [15:0] s;

wire [1:0] input_operation;

wire lte;

wire [15:0] result[0:11];
wire [11:0] ovf;

/**
 * 16-bit subtraction module.
 *
 * Utilizes the ALU's add function and takes the 2s complement of input b via
 * an invert and a carry in of 1.
 */
sixteen_bit_alu _16_bit_sub (.a(a),
                             .b(b),
                             .b_invert(1),
                             .carry_in(1),
                             .operation(2),
                             .result(result[0]),
                             .carry_out());

/**
 * 16-bit addition module.
 *
 * Utilizes the ALU's add function.
 */
sixteen_bit_alu _16_bit_add (.a(a),
                             .b(b),
                             .b_invert(0),
                             .carry_in(0),
                             .operation(2),
                             .result(result[1]),
                             .carry_out());
									  
/**
 * 16-bit OR module.
 *
 * Utilizes the ALU's bitwise OR function.
 */
sixteen_bit_alu _16_bit_or (.a(a),
                            .b(b),
                            .b_invert(0),
                            .carry_in(0),
                            .operation(1),
                            .result(result[2]),
                            .carry_out(ovf[2]));
									 
/**
 * 16-bit AND module.
 *
 * Utilizes the ALU's bitwise AND function.
 */
sixteen_bit_alu _16_bit_and (.a(a),
						     .b(b),
							 .b_invert(0),
							 .carry_in(0),
							 .operation(0),
							 .result(result[3]),
							 .carry_out());
									  
/**
 * 16-bit decrement module.
 *
 * Utilizes the ALU's adder and feeds a -1 as the input to b.
 */
sixteen_bit_alu _16_bit_dec (.a(a),
                             .b(1),
                             .b_invert(1),
                             .carry_in(1),
                             .operation(2),
                             .result(result[4]),
                             .carry_out());
									  
/**
 * 16-bit increment module.
 *
 * Utilizes the ALU's adder and feeds a 1 as the input to b.
 */
sixteen_bit_alu _16_bit_inc (.a(a),
                             .b(1),
                             .b_invert(0),
                             .carry_in(0),
                             .operation(2),
                             .result(result[5]),
                             .carry_out());
									  
/**
 * 16-bit invert module.
 *
 * Utilizes the ALU's adder and swaps a to b, utilizing b's invert stage. Then
 * performs a simple add with a set to 0.
 */
sixteen_bit_alu _16_bit_inv (.a(0),
                             .b(a),
                             .b_invert(1),
                             .carry_in(0),
                             .operation(2),
                             .result(result[6]),
                             .carry_out());
									  
/**
 * 16-bit arithmetic left shift.
 *
 * Directly applies the shift and performs a simple add with b set to 0.
 */
sixteen_bit_alu _16_bit_sla (.a(a <<< b),
                             .b(0),
                             .b_invert(0),
                             .carry_in(0),
                             .operation(2),
                             .result(result[7]),
                             .carry_out());
									  
/**
 * 16-bit arithmetic right shift.
 *
 * Directly applies the shift and performs a simple add with b set to 0.
 */

sixteen_bit_alu _16_bit_sra (.a(a >>> b),
                             .b(0),
                             .b_invert(0),
                             .carry_in(0),
                             .operation(2),
                             .result(result[8]),
                             .carry_out(ovf[8]));
									  
/**
 * 16-bit logical left shift.
 *
 * Directly applies the shift and performs a simple add with b set to 0.
 */
sixteen_bit_alu _16_bit_sll (.a(a << b),
                             .b(0),
                             .b_invert(0),
                             .carry_in(0),
                             .operation(2),
                             .result(result[9]),
                             .carry_out(ovf[9]));
									  
/**
 * 16-bit logical right shift.
 *
 * Directly applies the shift and performs a simple add with b set to 0.
 */
sixteen_bit_alu _16_bit_srl (.a(a >> b),
                             .b(0),
                             .b_invert(0),
                             .carry_in(0),
                             .operation(2),
                             .result(result[10]),
                             .carry_out(ovf[10]));
									  
/**
 * 16-bit set on less than or equal.
 *
 * Utilizes the ALU's adder and subtracts b from a by performing a simple add.
 */
sixteen_bit_alu _16_bit_sle (.a(a),
                             .b(b),
                             .b_invert(1),
                             .carry_in(1),
                             .operation(2),
                             .result(result[11]),
                             .carry_out(ovf[11]));

sixteen_one_mux _bit0 (.sel(ctrl),
                       .in({0,
                            0,
                            0,
                            0,
                            lte,
                            result[10][0],
                            result[9][0],
                            result[8][0],
                            result[7][0],
                            result[6][0],
                            result[5][0],
                            result[4][0],
                            result[3][0],
                            result[2][0],
                            result[1][0],
                            result[0][0]}),
                       .out(s[0]));
	 
sixteen_one_mux _bit1 (.sel(ctrl),
                       .in({0,
                            0,
                            0,
                            0,
                            0,
                            result[10][1],
                            result[9][1],
                            result[8][1],
                            result[7][1],
                            result[6][1],
                            result[5][1],
                            result[4][1],
                            result[3][1],
                            result[2][1],
                            result[1][1],
                            result[0][1]}),
                       .out(s[1]));

sixteen_one_mux _bit2 (.sel(ctrl),
                       .in({0,
                            0,
                            0,
                            0,
                            0,
                            result[10][2],
                            result[9][2],
                            result[8][2],
                            result[7][2],
                            result[6][2],
                            result[5][2],
                            result[4][2],
                            result[3][2],
                            result[2][2],
                            result[1][2],
                            result[0][2]}),
                       .out(s[2]));

sixteen_one_mux _bit3 (.sel(ctrl),
                       .in({0,
                            0,
                            0,
                            0,
                            0,
                            result[10][3],
                            result[9][3],
                            result[8][3],
                            result[7][3],
                            result[6][3],
                            result[5][3],
                            result[4][3],
                            result[3][3],
                            result[2][3],
                            result[1][3],
                            result[0][3]}),
                       .out(s[3]));

sixteen_one_mux _bit4 (.sel(ctrl),
                       .in({0,
                            0,
                            0,
                            0,
                            0,
                            result[10][4],
                            result[9][4],
                            result[8][4],
                            result[7][4],
                            result[6][4],
                            result[5][4],
                            result[4][4],
                            result[3][4],
                            result[2][4],
                            result[1][4],
                            result[0][4]}),
                       .out(s[4]));

sixteen_one_mux _bit5 (.sel(ctrl),
                       .in({0,
                            0,
                            0,
                            0,
                            0,
                            result[10][5],
                            result[9][5],
                            result[8][5],
                            result[7][5],
                            result[6][5],
                            result[5][5],
                            result[4][5],
                            result[3][5],
                            result[2][5],
                            result[1][5],
                            result[0][5]}),
                       .out(s[5]));

sixteen_one_mux _bit6 (.sel(ctrl),
                       .in({0,
                            0,
                            0,
                            0,
                            0,
                            result[10][6],
                            result[9][6],
                            result[8][6],
                            result[7][6],
                            result[6][6],
                            result[5][6],
                            result[4][6],
                            result[3][6],
                            result[2][6],
                            result[1][6],
                            result[0][6]}),
                       .out(s[6]));

sixteen_one_mux _bit7 (.sel(ctrl),
                       .in({0,
                            0,
                            0,
                            0,
                            0,
                            result[10][7],
                            result[9][7],
                            result[8][7],
                            result[7][7],
                            result[6][7],
                            result[5][7],
                            result[4][7],
                            result[3][7],
                            result[2][7],
                            result[1][7],
                            result[0][7]}),
                       .out(s[7]));

sixteen_one_mux _bit8 (.sel(ctrl),
                       .in({0,
                            0,
                            0,
                            0,
                            0,
                            result[10][8],
                            result[9][8],
                            result[8][8],
                            result[7][8],
                            result[6][8],
                            result[5][8],
                            result[4][8],
                            result[3][8],
                            result[2][8],
                            result[1][8],
                            result[0][8]}),
                       .out(s[8]));

sixteen_one_mux _bit9 (.sel(ctrl),
                       .in({0,
                            0,
                            0,
                            0,
                            0,
                            result[10][9],
                            result[9][9],
                            result[8][9],
                            result[7][9],
                            result[6][9],
                            result[5][9],
                            result[4][9],
                            result[3][9],
                            result[2][9],
                            result[1][9],
                            result[0][9]}),
                       .out(s[9]));
	 
sixteen_one_mux _bit10 (.sel(ctrl),
                        .in({0,
                             0,
                             0,
                             0,
                             0,
                             result[10][10],
                             result[9][10],
                             result[8][10],
                             result[7][10],
                             result[6][10],
                             result[5][10],
                             result[4][10],
                             result[3][10],
                             result[2][10],
                             result[1][10],
                             result[0][10]}),
                        .out(s[10]));

sixteen_one_mux _bit11 (.sel(ctrl),
                        .in({0,
                             0,
                             0,
                             0,
                             0,
                             result[10][11],
                             result[9][11],
                             result[8][11],
                             result[7][11],
                             result[6][11],
                             result[5][11],
                             result[4][11],
                             result[3][11],
                             result[2][11],
                             result[1][11],
                             result[0][11]}),
                        .out(s[11]));

sixteen_one_mux _bit12 (.sel(ctrl),
                        .in({0,
                             0,
                             0,
                             0,
                             0,
                             result[10][12],
                             result[9][12],
                             result[8][12],
                             result[7][12],
                             result[6][12],
                             result[5][12],
                             result[4][12],
                             result[3][12],
                             result[2][12],
                             result[1][12],
                             result[0][12]}),
                        .out(s[12]));	 

sixteen_one_mux _bit13 (.sel(ctrl),
                        .in({0,
                             0,
                             0,
                             0,
                             0,
                             result[10][13],
                             result[9][13],
                             result[8][13],
                             result[7][13],
                             result[6][13],
                             result[5][13],
                             result[4][13],
                             result[3][13],
                             result[2][13],
                             result[1][13],
                             result[0][13]}),
                        .out(s[13]));

sixteen_one_mux _bit14 (.sel(ctrl),
                        .in({0,
                             0,
                             0,
                             0,
                             0,
                             result[10][14],
                             result[9][14],
                             result[8][14],
                             result[7][14],
                             result[6][14],
                             result[5][14],
                             result[4][14],
                             result[3][14],
                             result[2][14],
                             result[1][14],
                             result[0][14]}),
                        .out(s[14]));

sixteen_one_mux _bit15 (.sel(ctrl),
                        .in({0,
                             0,
                             0,
                             0,
                             0,
                             result[10][15],
                             result[9][15],
                             result[8][15],
                             result[7][15],
                             result[6][15],
                             result[5][15],
                             result[4][15],
                             result[3][15],
                             result[2][15],
                             result[1][15],
                             result[0][15]}),
                        .out(s[15]));

/**
 * Overflow output mux. Overflow is only applicable for addition, subtraction,
 * incrementing, and decrementing. Overflow is asserted low for all other ALU
 * modes.
 */
sixteen_one_mux _ovf (.sel(ctrl),
                      .in({1'b0,
                           1'b0,
                           1'b0,
                           1'b0,
                           1'b0,
                           1'b0,
                           1'b0,
                           1'b0,
                           ovf[7],
                           1'b0,
                           ovf[5],
                           ovf[4],
                           1'b0,
                           1'b0,
                           ovf[1],
                           ovf[0]}),
                      .out(overflow));

/*
 * A detector for if the ALU result is 0.
 */
assign zero = ~(s[0] |
                s[1] |
                s[2] |
                s[3] |
                s[4] |
                s[5] |
                s[6] |
                s[7] |
                s[8] |
                s[9] |
                s[10] |
                s[11] |
                s[11] |
                s[12] |
                s[13] |
                s[14] |
                s[15]);

/*
 * 1-bit wire indicating the set on less than or equal to result. The
 * following conditions are used to determine whether a less-than-or-equal
 * condition has been satisfied:
 *
 * 1.) MSb of a is not 0 while MSb of b is 1, AND
 * 2.) MSb of a is 1 while MSb of b is 0, OR
 * 3.) the difference a - b is either all 0s or has an MSb of 1.
 */
assign lte = (a[15] | ~b[15]) &
             ((a[15] & ~b[15]) |
              (~(result[11][0] |
                 result[11][1] |
                 result[11][2] |
                 result[11][3] |
                 result[11][4] |
                 result[11][5] |
                 result[11][6] |
                 result[11][7] |
                 result[11][8] |
                 result[11][9] |
                 result[11][10] |
                 result[11][11] |
                 result[11][12] |
                 result[11][13] |
                 result[11][14] |
                 result[11][15]) |
               result[11][15]));

/*
 * For subtraction, overflow has occurred when the operands a and b have
 * different MSbs and the result MSb is different operand a's MSb.
 */
assign ovf[0] = (a[15] & ~b[15] & ~s[15]) |
                (~a[15] & b[15] & s[15]);

/*
 * For addition, overflow has occurred when both operands have the same MSb
 * and it is different from the MSb of the result.
 */
assign ovf[1] = (a[15] & b[15] & ~s[15]) |
                (~a[15] & ~b[15] & s[15]);
                
/*
 * For decrementing, overflow has occurred when the input MSb is 1 and the result
 * MSb is 0.
 */
assign ovf[4] = a[15] & ~s[15]; 

/*
 * For incrementing, overflow has occurred when the input MSb is 0 and the result
 * MSb is 1.
 */
assign ovf[5] = s[15] & ~a[15]; 

/*
 *
 */
wire signed[15:0] premask;
wire signed [15:0] mask;
wire [15:0] inv_mask;
wire [15:0] check_1;
wire [15:0] check_0;
wire [15:0] check_1_all_1s;
wire [15:0] check_0_all_0s;
assign premask = 16'b1000_0000_0000_0000;
assign mask = premask >>> b;
assign inv_mask = 16'b0111_1111_1111_1111 >> b;

// All 1 if the targeted bitfield is all 1s.
assign check_1 = a & mask | inv_mask;

// All 0 if the targeted bitfield is all 0s.
assign check_0 = (a | inv_mask) & mask;

assign check_1_all_1s =  check_1[15] & check_1[14] & check_1[13] & check_1[12] &
                         check_1[11] & check_1[10] & check_1[9] & check_1[8] &
                         check_1[7] & check_1[6] & check_1[5] & check_1[4] &
                         check_1[3] & check_1[2] & check_1[1] & check_1[0];

assign check_0_all_0s =  ~(check_0[15] | check_0[14] | check_0[13] | check_0[12] |
                           check_0[11] | check_0[10] | check_0[9] | check_0[8] |
                           check_0[7] | check_0[6] | check_0[5] | check_0[4] |
                           check_0[3] | check_0[2] | check_0[1] | check_0[0]);
                  
assign ovf[7] = 1 & (check_1_all_1s | check_0_all_0s) &
                (b[15] | b[14] | b[13] | b[12] |
                 b[11] | b[10] | b[9] | b[8] |
                 b[7] | b[6] | b[5] | b[4] |
                 b[3] | b[2] | b[1] | b[0]);

endmodule
