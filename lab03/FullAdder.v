`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2026/09/10 22:11:14
// Design Name:
// Module Name: FullAdder
// Project Name:
// Target Devices:
// Tool Versions:
// Description: Gate-level one-bit full adder. {co, s} = a + b + ci.
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module FullAdder(
    input a,
    input b,
    input ci,
    output s,
    output co
    );
    wire wire1; // a XOR b: shared by the sum and carry paths.
    wire wire2; // Carry generated when both operand bits are 1.
    wire wire3; // Incoming carry propagated when a XOR b is 1.

    // Sum: a XOR b XOR ci.
    xor xor1(wire1, a, b);
    xor xor2(s, wire1, ci);

    // Carry-out: (a AND b) OR ((a XOR b) AND ci).
    and and1(wire2, a, b);
    and and2(wire3, wire1, ci);
    or or1(co, wire2, wire3);
endmodule
