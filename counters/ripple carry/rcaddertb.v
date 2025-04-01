`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: rcaddertb
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


module rca_tb;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    rca uut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        a = 4'b0001; b = 4'b0001; cin = 0; #10;
        a = 4'b1111; b = 4'b0000; cin = 1; #10;
        a = 4'b0111; b = 4'b1000; cin = 0; #10;
        a = 4'b1010; b = 4'b0101; cin = 1; #10;
        a = 4'b0011; b = 4'b0011; cin = 1; #10;
        $finish;
    end

    initial begin
        $monitor("At time %t: a=%d, b=%d, cin=%b, sum=%d, cout=%b (bin: a=%b, b=%b, sum=%b)",
                 $time, a, b, cin, sum, cout, a, b, sum);
    end
endmodule
