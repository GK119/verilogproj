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
    input wire clk,        // Clock input
    input wire reset,      // Active-high reset
    output reg [3:0] count // 4-bit counter output
);
    // Counter logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000;  // Reset to 0
        else if (count == 4'b1111) // If count reaches 15 (1111)
            count <= 4'b0000;  // Wrap around to 0
        else
            count <= count + 1; // Increment count
    end
endmodule
