`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
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
  
    reg clk;          
    reg reset;        
    wire [3:0] count; 

    counter_4bit uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

   
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

   
    initial begin
        
        reset = 1;  
        #10;        
        reset = 0; 

        #200;

       
        reset = 1;
        #10;
        reset = 0;

        
        #100;

     
        $finish;
    end

   
    initial begin
        $monitor("At time %t: reset = %b, count = %d (binary: %b)",
                 $time, reset, count, count);
    end
endmodule
