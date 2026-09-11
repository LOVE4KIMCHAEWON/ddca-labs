`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2026/09/11 15:04:06
// Design Name:
// Module Name: top
// Project Name:
// Target Devices:
// Tool Versions:
// Description: Display the low four sum bits as hex; expose carry on LED.
//
// Dependencies: FourBitAdder.v, FullAdder.v, Decoder.v
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module top(
    input [3:0] A,
    input [3:0] B,
    output [6:0] D,
    output LED
    );

    // NVBoard demo bindings: SW[3:0] -> A, SW[7:4] -> B,
    // D -> the rightmost seven-segment digit, LED -> LED4.
    wire [4:0] s;

    FourBitAdder adder(
        .a (A),
        .b (B),
        .c (s)
    );

    // The digit displays (A + B) modulo 16, not a decimal two-digit result.
    Decoder decoder(
        .a (s[3:0]),
        .D (D)
    );

    assign LED = s[4]; // Fifth sum bit: 1 for unsigned sums of 16 or greater.
endmodule
