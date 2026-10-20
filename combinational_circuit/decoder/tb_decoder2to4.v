module tb_decoder2to4;
    reg a,b;
    wire [3:0] y;
decoder2to4 dut(
    .a(a),
    .b(b),
    .y(y)
);
initial begin
$dumpfile("decoder2to4.vcd");
$dumpvars(0,tb_decoder2to4);
$monitor("Time=%0t | a=%b b=%b |y=%b",$time,a,b,y);
a=0;b=0; #10;
a=0;b=1; #10;
a=1;b=0; #10;
a=1;b=1; #10;
$finish;
end
endmodule