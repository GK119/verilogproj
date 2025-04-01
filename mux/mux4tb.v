`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2025 16:13:33
// Design Name: 
// Module Name: mux4tb
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


module mux_4to1_tb;
    reg [1:0] sel;
    reg [3:0] data_in;
    wire out;
    
    mux_4to1 uut (
        .sel(sel),
        .data_in(data_in),
        .out(out)
    );
    
    initial begin
        $dumpfile("mux_4to1_tb.vcd");
        $dumpvars(0, mux_4to1_tb);
    end
    
    initial begin
        sel = 2'b00;
        data_in = 4'b0000;
        
        $display("Time\tSel\tData_in\t\tOut");
        $display("----\t---\t-------\t\t---");
        
        repeat (64) begin
            #10;
            $display("%0t\t%b\t%b\t\t%b", $time, sel, data_in, out);
            
            if (out !== data_in[sel]) begin
                $display("ERROR at time %0t: sel=%b, data_in=%b, out=%b, expected=%b", 
                         $time, sel, data_in, out, data_in[sel]);
            end
            
            {sel, data_in} = {sel, data_in} + 1;
        end
        
        $finish;
    end
endmodule