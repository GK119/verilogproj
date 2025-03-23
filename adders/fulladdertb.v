`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2025 19:05:59
// Design Name: 
// Module Name: fulladdertb
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


module full_adder_tb;
    // Declare signals
    reg a, b, cin;      // Inputs (reg for driving)
    wire sum, cout;     // Outputs (wire for receiving)

    // Instantiate the DUT (Device Under Test)
    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Stimulus generation
    initial begin
        // Test all input combinations
        a = 0; b = 0; cin = 0; #10;  // 0 + 0 + 0
        a = 0; b = 0; cin = 1; #10;  // 0 + 0 + 1
        a = 0; b = 1; cin = 0; #10;  // 0 + 1 + 0
        a = 0; b = 1; cin = 1; #10;  // 0 + 1 + 1
        a = 1; b = 0; cin = 0; #10;  // 1 + 0 + 0
        a = 1; b = 0; cin = 1; #10;  // 1 + 0 + 1
        a = 1; b = 1; cin = 0; #10;  // 1 + 1 + 0
        a = 1; b = 1; cin = 1; #10;  // 1 + 1 + 1

        // End simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("At time %t: a = %b, b = %b, cin = %b, sum = %b, cout = %b",
                 $time, a, b, cin, sum, cout);
    end
endmodule
