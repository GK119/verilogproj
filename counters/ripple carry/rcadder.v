`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2025 15:14:15
// Design Name: 
// Module Name: rcadder
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
module rca (
    input [3:0] a, b,
    input cin,
    output [3:0] sum,
    output cout
);
    wire c0, c1, c2;  // Intermediate carry signals

    fa FA0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c0));
    fa FA1 (.a(a[1]), .b(b[1]), .cin(c0), .sum(sum[1]), .cout(c1));
    fa FA2 (.a(a[2]), .b(b[2]), .cin(c1), .sum(sum[2]), .cout(c2));
    fa FA3 (.a(a[3]), .b(b[3]), .cin(c2), .sum(sum[3]), .cout(cout));
endmodule
