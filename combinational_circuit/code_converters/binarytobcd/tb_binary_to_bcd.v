
`timescale 1ns/1ps

module tb_binary_to_bcd;

    reg [7:0] binary;
    wire [3:0] hundreds;
    wire [3:0] tens;
    wire [3:0] ones;

    binary_to_bcd uut (
        .binary(binary),
        .hundreds(hundreds),
        .tens(tens),
        .ones(ones)
    );

    initial begin
        $dumpfile("binary_to_bcd.vcd");
        $dumpvars(0, tb_binary_to_bcd);

        $monitor("Binary=%b BCD=%b %b %b",
                 binary, hundreds, tens, ones);

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
