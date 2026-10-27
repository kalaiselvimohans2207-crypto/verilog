
module decimal_to_bcd (
    input  [6:0] decimal_in,
    output reg [3:0] tens,
    output reg [3:0] ones
);

    always @(*) begin
        tens = decimal_in / 10;
        ones = decimal_in % 10;
    end

endmodule
