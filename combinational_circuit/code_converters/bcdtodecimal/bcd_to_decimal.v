
module bcd_to_decimal (
    input  [3:0] tens,
    input  [3:0] ones,
    output reg [6:0] decimal_out
);

    always @(*) begin
        decimal_out = (tens * 10) + ones;
    end

endmodule
