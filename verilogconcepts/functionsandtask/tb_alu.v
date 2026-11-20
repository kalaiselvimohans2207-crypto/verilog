module tb_alu;
reg [7:0] a,b;
reg sel;
wire [7:0] sum,diff;
alu dut(
.a(a),
.b(b),
.sel(sel),
.sum(sum),
.diff(diff)
);
initial begin
$dumpfile("alu.vcd");
$dumpvars(0,tb_alu);
$monitor("Time=%0t a=%d b=%d sel=%b sum=%d diff=%d",$time,a,b,sel,sum,diff);
sel=0;
a=10;
b=20;
#10;
sel=1;
a=50;
b=30;
#10;
sel=0;
a=10;
b=90;
#10;
sel=1;
a=50;
b=70;
#10;
sel=0;
a=10;
b=80;
#10;
sel=1;
a=55;
b=25;
#10;
$finish;
end
endmodule
