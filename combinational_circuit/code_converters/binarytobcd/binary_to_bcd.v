
module binary_to_bcd (
    input  [7:0] binary,
    output reg [3:0] hundreds,
    output reg [3:0] tens,
    output reg [3:0] ones
);

    integer decimal_value;

    always @(*) begin
        decimal_value = binary;

        hundreds = decimal_value / 100;
        tens     = (decimal_value % 100) / 10;
        ones     = decimal_value % 10;
    end

endmodule
