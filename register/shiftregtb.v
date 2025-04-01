`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2025 15:52:22
// Design Name: 
// Module Name: shiftregtb
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




module shift_register_4bit_tb;

    reg clk;
    reg reset;
    reg shift_en;
    reg data_in;
    wire [3:0] data_out;

    shift_register_4bit uut (
        .clk(clk),
        .reset(reset),
        .shift_en(shift_en),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        shift_en = 0;
        data_in = 0;
        
        #20;
        reset = 0;
        
        #10 shift_en = 1; data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 0;
        
        #10 shift_en = 0;
        #20;
        
        #10 shift_en = 1; data_in = 1;
        #10 data_in = 1;
        #10 data_in = 1;
        #10 data_in = 1;
        
        #10 reset = 1;
        #10 reset = 0;
        
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        
        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t, Reset=%b, Shift_En=%b, Data_In=%b, Data_Out=%b", 
                 $time, reset, shift_en, data_in, data_out);
    end

endmodule
