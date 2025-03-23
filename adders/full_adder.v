`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2025 19:10:12
// Design Name: 
// Module Name: full_adder
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



module full_adder (
    input  a,      // First input bit
    input  b,      // Second input bit
    input  cin,    // Carry input bit
    output sum,    // Sum output
    output cout    // Carry output
);
    wire s1, c1, c2;  // Internal signals

    // First half adder
    half_adder ha1 (
        .a(a),
        .b(b),
        .sum(s1),    // Sum of a and b
        .carry(c1)   // Carry of a and b
    );

    // Second half adder
    half_adder ha2 (
        .a(s1),
        .b(cin),
        .sum(sum),   // Final sum output
        .carry(c2)  // Carry of s1 and cin
    );

    // OR gate for final carry
    assign cout = c1 | c2;
endmodule
