module tb_comparator_8bit;
reg [7:0] a;
reg[7:0] b;
wire g;
wire l;
wire e;
comparator_8bit dut(
    .a(a),
    .b(b),
    .g(g),
    .l(l),
    .e(e)
);
initial begin
$dumpfile("comparator_8bit.vcd");
$dumpvars(0,tb_comparator_8bit);
$monitor("time=%t a=%b b=%b g=%b l=%b e=%b",$time,a,b,g,l,e);
a=8'd20;b=8'd30; #10;
a=8'd10;b=8'd5; #10;
a=8'd20;b=8'd20; #10;
a=8'd40;b=8'd30; #10;
a=8'd22;b=8'd33; #10;
a=8'd20;b=8'd2; #10;
end
endmodule
