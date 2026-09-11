`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2026/09/11 00:20:21
// Design Name:
// Module Name: Decoder
// Project Name:
// Target Devices:
// Tool Versions:
// Description: Four-bit hexadecimal to active-low seven-segment decoder.
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module Decoder(
    input [3:0] a,
    output reg [6:0] D
    );
    // D[6:0] = {g, f, e, d, c, b, a}; 0 lights a segment.
    // Hexadecimal glyphs: 0-9, A, b, C, d, E, F. No decimal point output.
    always @(*)
    begin
        case (a)
            4'b0000: D = 7'b1000000;
            4'b0001: D = 7'b1111001;
            4'b0010: D = 7'b0100100;
            4'b0011: D = 7'b0110000;
            4'b0100: D = 7'b0011001;
            4'b0101: D = 7'b0010010;
            4'b0110: D = 7'b0000010;
            4'b0111: D = 7'b1111000;
            4'b1000: D = 7'b0000000;
            4'b1001: D = 7'b0010000;
            4'b1010: D = 7'b0001000;
            4'b1011: D = 7'b0000011;
            4'b1100: D = 7'b1000110;
            4'b1101: D = 7'b0100001;
            4'b1110: D = 7'b0000110;
            4'b1111: D = 7'b0001110;
            default: D = 7'b1111111; // Blank the display for an unknown input.
        endcase
    end
endmodule
