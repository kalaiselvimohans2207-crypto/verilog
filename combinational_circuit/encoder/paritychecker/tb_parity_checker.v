module tb_parity_checker;
reg [3:0] a;
reg p;
wire error;
integer i;
parity_checker uut(
    .a(a),
    .p(p),
    .error(error)

);
initial begin
$dumpfile("parity_checker.vcd");
$dumpvars(0,tb_parity_checker);
$monitor("time=0%t,a=%b,p=%b,error=%b",$time,a,p,error);
for (i=0;i<16;i=i+1) begin
a=i;
p=(^a);//correct parity
#10;
p = ~(^a);    // Introduce parity error
#10;
end
$finish;
end
endmodule

