module tb_cmb_ckt1;
reg a,b,c,d,e;
wire z;
integer i;
cmb_ckt1 uut(
.a(a),.b(b),.c(c),.d(d),.e(e),.z(z));
initial begin;
$dumpfile("cmb_ckt1.vcd");
$dumpvars(0, tb_cmb_ckt1);
a=0;b=0;c=0;d=0;e=0;
$monitor("time=%d a=%b b=%b c=%b d=%b e=%b z=%b",$time,a,b,c,d,e,z);
for (i = 0; i < 32; i = i + 1) begin
			{a, b, c, d, e} = i; // Concatenation assigns bits from i to inputs
			#10; // Wait 10 time units between test vectors
		end

#20;
$finish;
end
endmodule


















