module shift_register_4bit (
    input wire clk,
    input wire reset,
    input wire shift_en,
    input wire data_in,
    output wire [3:0] data_out
);

    reg [3:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 4'b0000;
        end
        else if (shift_en) begin
            shift_reg <= {shift_reg[2:0], data_in};
        end
    end

    assign data_out = shift_reg;

endmodule
