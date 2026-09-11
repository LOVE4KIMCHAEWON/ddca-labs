`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/11 18:20:01
// Design Name: 
// Module Name: fsm_tb
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


`timescale 1ns / 1ps

module fsm_tb;

    reg clk;
    reg rst;
    reg left;
    reg right;

    wire LA;
    wire LB;
    wire LC;
    wire RA;
    wire RB;
    wire RC;

    // Instantiate FSM
    fsm dut(
        .clk(clk),
        .rst(rst),
        .left(left),
        .right(right),
        .LA(LA),
        .LB(LB),
        .LC(LC),
        .RA(RA),
        .RB(RB),
        .RC(RC)
    );

    // 100 MHz clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        left = 0;
        right = 0;
    
        #20;
        rst = 0;
    
        #20;
        left = 1;
    
        #100;
        left = 0;
    
        #400;
    
        right = 1;
    
        #100;
        right = 0;
    
        #400;
    
        $finish;
    end

endmodule
