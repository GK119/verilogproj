`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: behavalutb
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


`timescale 1ns / 1ps

module behavioral_alu_tb();
    reg [3:0] a;
    reg [3:0] b;
    reg [2:0] operation;
    
    wire [3:0] result;
    wire carry_out;
    
    behavioral_alu uut (
        .a(a),
        .b(b),
        .operation(operation),
        .result(result),
        .carry_out(carry_out)
    );
    
    initial begin
        a = 0;
        b = 0;
        operation = 0;
        
        #100;
        
        a = 4'b0101;
        b = 4'b0011;
        operation = 3'b000;
        #10;
        $display("ADD: %d + %d = %d, Carry = %b", a, b, result, carry_out);
        
        a = 4'b1001;
        b = 4'b1000;
        operation = 3'b000;
        #10;
        $display("ADD with carry: %d + %d = %d, Carry = %b", a, b, result, carry_out);
        
        a = 4'b0111;
        b = 4'b0011;
        operation = 3'b001;
        #10;
        $display("SUB: %d - %d = %d, Borrow = %b", a, b, result, carry_out);
        
        a = 4'b0011;
        b = 4'b0101;
        operation = 3'b001;
        #10;
        $display("SUB with borrow: %d - %d = %d, Borrow = %b", a, b, result, carry_out);
        
        a = 4'b1010;
        b = 4'b1100;
        operation = 3'b010;
        #10;
        $display("AND: %b & %b = %b", a, b, result);
        
        a = 4'b1010;
        b = 4'b1100;
        operation = 3'b011;
        #10;
        $display("OR: %b | %b = %b", a, b, result);
        
        a = 4'b1010;
        b = 4'b1100;
        operation = 3'b100;
        #10;
        $display("XOR: %b ^ %b = %b", a, b, result);
        
        a = 4'b1010;
        operation = 3'b101;
        #10;
        $display("NOT: ~%b = %b", a, result);
        
        a = 4'b1010;
        operation = 3'b110;
        #10;
        $display("SHL: %b << 1 = %b", a, result);
        
        a = 4'b1010;
        operation = 3'b111;
        #10;
        $display("SHR: %b >> 1 = %b", a, result);
        
        $finish;
    end
endmodule

