
module tb_mux_8to1;

reg [7:0] d;
reg [2:0] s;
wire y;

mux_8to1 uut (
    .d(d),
    .s(s),
    .y(y)
);

initial begin
$dumpfile("mux_8to1.vcd");
$dumpvars(0, tb_mux_8to1);
    d = 8'b10110110;

    s = 3'b000; #10;
    $display("s=%b, d=%b, y=%b", s, d, y);

    s = 3'b001; #10;
    $display("s=%b, d=%b, y=%b", s, d, y);

    s = 3'b010; #10;
    $display("s=%b, d=%b, y=%b", s, d, y);

    s = 3'b011; #10;
    $display("s=%b, d=%b, y=%b", s, d, y);

    s = 3'b100; #10;
    $display("s=%b, d=%b, y=%b", s, d, y);

    s = 3'b101; #10;
    $display("s=%b, d=%b, y=%b", s, d, y);

    s = 3'b110; #10;
    $display("s=%b, d=%b, y=%b", s, d, y);

    s = 3'b111; #10;
    $display("s=%b, d=%b, y=%b", s, d, y);

    $finish;
end

endmodule

