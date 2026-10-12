`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/12 22:43:13
// Design Name: 
// Module Name: alu
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


module alu(
    input wire[31:0] A,
    input wire[31:0] B,
    input wire[3:0] AluOp,
    output wire[31:0] Result,
    output wire Zero
    );
    
    // Arithmetic Part
    wire[31:0] B_for_adder;
    wire CarryIn;
    wire[31:0] AddResult;
    wire[31:0] ArithmeticResult;
    
    assign B_for_adder = (AluOp[1] == 1'b0)? B : ~B;
    assign CarryIn = AluOp[1];
    
    assign AddResult = A + B_for_adder + CarryIn;
    
    assign ArithmeticResult = (AluOp[3] == 1'b1)? {31'b0, AddResult[31]} : AddResult;
    
    // Logic Part
    reg[31:0] LogicResult;
    
    always @(*) begin
        case (AluOp[1:0])
            2'b00: LogicResult = A & B;
            2'b01: LogicResult = A | B;
            2'b10: LogicResult = A ^ B;
            2'b11: LogicResult = ~(A | B);
        endcase
    end
    
    // Final Result
    assign Result = (AluOp[2] == 1'b1)? LogicResult : ArithmeticResult;
 
    assign Zero = (Result == 32'b0);  
endmodule
