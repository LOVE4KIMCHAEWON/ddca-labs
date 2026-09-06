// Four-bit unsigned ripple-carry adder.
//
// Four one-bit full adders are chained from the least-significant bit to the
// most-significant bit. s[3:0] is the four-bit sum and s[4] is the final carry.
module FourBitAdder (
    input [3:0] a,
    input [3:0] b,
    output [4:0] s
);
    // Carry signals between adjacent full-adder stages.
    wire c0;
    wire c1;
    wire c2;

    // Bit 0 has no incoming carry.
    oneadder a0 (
        .a(a[0]),
        .b(b[0]),
        .carryin(1'b0),
        .result(s[0]),
        .carryout(c0)
    );

    oneadder a1 (
        .a(a[1]),
        .b(b[1]),
        .carryin(c0),
        .result(s[1]),
        .carryout(c1)
    );

    oneadder a2 (
        .a(a[2]),
        .b(b[2]),
        .carryin(c1),
        .result(s[2]),
        .carryout(c2)
    );

    // The carry from bit 3 becomes the fifth result bit.
    oneadder a3 (
        .a(a[3]),
        .b(b[3]),
        .carryin(c2),
        .result(s[3]),
        .carryout(s[4])
    );
endmodule
