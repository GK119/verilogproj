`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: alu_behav
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

module behavioral_alu(
    input [3:0] a,
    input [3:0] b,
    input [2:0] operation,
    output reg [3:0] result,
    output reg carry_out
);
    parameter ADD = 3'b000;
    parameter SUB = 3'b001;
    parameter AND = 3'b010;
    parameter OR  = 3'b011;
    parameter XOR = 3'b100;
    parameter NOT = 3'b101;
    parameter SHL = 3'b110;
    parameter SHR = 3'b111;
    
    always @(*) begin
        carry_out = 0;
        
        case(operation)
            ADD: {carry_out, result} = a + b;
            SUB: begin
             result = a - b;
           if (a < b)
                 carry_out = 1;
            else
                carry_out = 0;
            end
            AND: result = a & b;
            OR:  result = a | b;
            XOR: result = a ^ b;
            NOT: result = ~a;
            SHL: result = a << 1;
            SHR: result = a >> 1;
            default: result = 4'b0000;
        endcase
    end
endmodule
