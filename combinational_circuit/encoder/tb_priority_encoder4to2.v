module tb_priority_encoder4to2;
reg[3:0] d;
wire[1:0] y;
wire v;
priority_encoder4to2 dut(
    .d(d),
    .y(y),
    .v(v)
);
initial begin
$dumpfile("priority_encoder4to2.vcd");
$dumpvars(0,tb_priority_encoder4to2);
$monitor("Time=%0t | d=%b | y=%b | v=%b",
                  $time, d, y, v);
 d = 4'b0000; #10;
        d = 4'b0001; #10;
        d = 4'b0010; #10;
        d = 4'b0011; #10;
        d = 4'b0100; #10;
        d = 4'b0111; #10;
        d = 4'b1000; #10;
        d = 4'b1100; #10;
        d = 4'b1111; #10;

        $finish;
    end

endmodule