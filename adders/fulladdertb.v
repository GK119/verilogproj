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
    
    reg a, b, cin;      
    wire sum, cout;    


    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

   
    initial begin
      
        a = 0; b = 0; cin = 0; #10;  
        a = 0; b = 0; cin = 1; #10;   
        a = 0; b = 1; cin = 0; #10;  
        a = 0; b = 1; cin = 1; #10;  
        a = 1; b = 0; cin = 0; #10;  
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;  
        a = 1; b = 1; cin = 1; #10;  

       
        $finish;
    end

    
    initial begin
        $monitor("At time %t: a = %b, b = %b, cin = %b, sum = %b, cout = %b",
                 $time, a, b, cin, sum, cout);
    end
endmodule
