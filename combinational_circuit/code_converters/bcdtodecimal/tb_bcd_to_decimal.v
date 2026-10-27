
`timescale 1ns/1ps

module tb_bcd_to_decimal;

    reg [3:0] tens;
    reg [3:0] ones;
    wire [6:0] decimal_out;

    bcd_to_decimal uut (
        .tens(tens),
        .ones(ones),
        .decimal_out(decimal_out)
    );

    initial begin
        $dumpfile("bcd_to_decimal.vcd");
        $dumpvars(0, tb_bcd_to_decimal);

        $monitor("BCD=%b%b Decimal=%0d",
                 tens, ones, decimal_out);

        tens = 4'd0; ones = 4'd5; #10;
        tens = 4'd1; ones = 4'd2; #10;
        tens = 4'd2; ones = 4'd5; #10;
        tens = 4'd4; ones = 4'd9; #10;
        tens = 4'd9; ones = 4'd9; #10;

        $finish;
    end

endmodule
