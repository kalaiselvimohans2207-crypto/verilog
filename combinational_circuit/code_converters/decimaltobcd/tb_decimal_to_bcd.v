
module tb_decimal_to_bcd;

    reg [6:0] decimal_in;
    wire [3:0] tens;
    wire [3:0] ones;

    decimal_to_bcd uut (
        .decimal_in(decimal_in),
        .tens(tens),
        .ones(ones)
    );

    initial begin
        $dumpfile("decimal_to_bcd.vcd");
        $dumpvars(0, tb_decimal_to_bcd);

        $monitor("Input=%0d Tens=%b Ones=%b BCD=%b%b",
                 decimal_in, tens, ones, tens, ones);

        decimal_in = 7'd0;  #10;
        decimal_in = 7'd9;  #10;
        decimal_in = 7'd12; #10;
        decimal_in = 7'd25; #10;
        decimal_in = 7'd49; #10;
        decimal_in = 7'd99; #10;

        $finish;
    end

endmodule
