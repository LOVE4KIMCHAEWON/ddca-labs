`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/11 17:15:10
// Design Name: 
// Module Name: fsm
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


module fsm(
    input clk,
    input rst,
    input left,
    input right,
    
    output reg LA,
    output reg LB,
    output reg LC,
    output reg RA,
    output reg RB,
    output reg RC
    );  
    // define
    reg [2:0] state_p;
    reg [2:0] state_n;
    parameter OFF = 3'b000;
    parameter L1 = 3'b001;
    parameter L2 = 3'b010;
    parameter L3 = 3'b011;
    parameter R1 = 3'b100;
    parameter R2 = 3'b101;
    parameter R3 = 3'b110;
    
    // define clock
    clk_div divider(
        .clk(clk),
        .rst(rst),
        .clk_en(clk_en)
    );
    
    // state register
    always @ (posedge clk)
    begin
        if (rst)
            state_p <= OFF;
        else if (clk_en)
            state_p = state_n;
    end
    
    // next state logic
    always @ (*)
    begin
        case (state_p)
            OFF:
            begin
                if (left)
                    state_n = L1;
                else if (right)
                    state_n = R1;
                else
                    state_n = OFF;
            end
            
            L1: state_n = L2;
            L2: state_n = L3;
            L3: state_n = OFF;
            R1: state_n = R2;
            R2: state_n = R3;
            R3: state_n = OFF;
            default: state_n = OFF;
        endcase
    end
    
    // output logic
    always @ (*)
    begin
        LA = 0;
        LB = 0;
        LC = 0;
        RA = 0;
        RB = 0;
        RC = 0;
        
        case (state_p)
            L1: LA = 1;
            
            L2:
            begin
                LA = 1;
                LB = 1;
            end
            
            L3:
            begin
                LA = 1;
                LB = 1;
                LC = 1;
            end
            
            R1: RA = 1;
            
            R2:
            begin
                RA = 1;
                RB = 1;
            end
            
            R3:
            begin
                RA = 1;
                RB = 1;
                RC = 1;
            end
        endcase
    end
endmodule
