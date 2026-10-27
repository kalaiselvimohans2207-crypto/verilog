
`timescale 1ns/1ps

module tb_binary_to_decimal;

    reg [7:0] binary;
    wire [3:0] hundreds;
    wire [3:0] tens;
    wire [3:0] ones;

    binary_to_decimal uut (
        .binary(binary),
        .hundreds(hundreds),
        .tens(tens),
        .ones(ones)
    );

    initial begin
        $dumpfile("binary_to_decimal.vcd");
        $dumpvars(0, tb_binary_to_decimal);

        $monitor("Time=%0t Binary=%b Decimal=%0d%0d%0d",
                 $time, binary, hundreds, tens, ones);

        binary = 8'd0;   #10;
        binary = 8'd9;   #10;
        binary = 8'd15;  #10;
        binary = 8'd25;  #10;
        binary = 8'd99;  #10;
        binary = 8'd123; #10;
        binary = 8'd255; #10;

        $finish;
    end

endmodule
