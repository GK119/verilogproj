`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2025 00:16:57
// Design Name: 
// Module Name: 4bitcountertb
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
//////////////////////////////////////////////////////////////////////////////////\
module counter_4bit_tb;
    // Signals
    reg clk;          // Clock
    reg reset;        // Reset
    wire [3:0] count; // Counter output

    // Instantiate the DUT (Device Under Test)
    counter_4bit uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation: 10 ns period (5 ns high, 5 ns low)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5 ns
    end

    // Stimulus
    initial begin
        // Initialize signals
        reset = 1;  // Assert reset
        #10;        // Hold reset for 10 ns
        reset = 0;  // Deassert reset

        // Run for 20 clock cycles (should count from 0 to 15 and wrap around)
        #200;

        // Apply reset again to test reset functionality
        reset = 1;
        #10;
        reset = 0;

        // Run for another 10 cycles
        #100;

        // End simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("At time %t: reset = %b, count = %d (binary: %b)",
                 $time, reset, count, count);
    end
endmodule
