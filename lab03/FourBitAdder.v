`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2026/09/10 22:18:41
// Design Name:
// Module Name: FourBitAdder
// Project Name:
// Target Devices:
// Tool Versions:
// Description: Four-bit unsigned ripple-carry adder with a five-bit result.
//
// Dependencies: FullAdder.v
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module FourBitAdder(
    input [3:0] a,
    input [3:0] b,
    output [4:0] c
    );
    // Internal carries connect bit 0 through bit 3, from LSB to MSB.
    wire wire1;
    wire wire2;
    wire wire3;

    // No external carry-in: the first stage starts with ci = 0.
    FullAdder fa0(
        .a (a[0]),
        .b (b[0]),
        .ci (1'b0),
        .s (c[0]),
        .co (wire1)
    );
    FullAdder fa1(
        .a (a[1]),
        .b (b[1]),
        .ci (wire1),
        .s (c[1]),
        .co (wire2)
    );
    FullAdder fa2(
        .a (a[2]),
        .b (b[2]),
        .ci (wire2),
        .s (c[2]),
        .co (wire3)
    );
    // Preserve the final carry in c[4]; the maximum result is 15 + 15 = 30.
    FullAdder fa3(
        .a (a[3]),
        .b (b[3]),
        .ci (wire3),
        .s (c[3]),
        .co (c[4])
    );
endmodule
