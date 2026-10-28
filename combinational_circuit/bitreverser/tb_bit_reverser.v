module tb_bit_reverser;

    reg  [3:0] a;
    wire [3:0] y;

    bit_reverser dut (
        .a(a),
        .y(y)
    );

    initial begin
        $dumpfile("bit_reverser.vcd");
        $dumpvars(0, tb_bit_reverser);

        $monitor("time=%0t a=%b y=%b", $time, a, y);

        a = 4'b0001; #10;
        a = 4'b0010; #10;
        a = 4'b0100; #10;
        a = 4'b1000; #10;
        a = 4'b1010; #10;
        a = 4'b1101; #10;

        $finish;
    end

endmodule
