`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2025 23:55:14
// Design Name: 
// Module Name: counter4bit
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


module counter_4bit (
    input wire clk,        
    input wire reset,      
    output reg [3:0] count 
);
    // Counter logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000; 
        else if (count == 4'b1111) 
            count <= 4'b0000; 
        else
            count <= count + 1;
    end
endmodule
