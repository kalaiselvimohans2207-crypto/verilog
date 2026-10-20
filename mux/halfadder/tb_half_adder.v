module tb_half_adder;
reg a;
reg b;
wire s;
wire c;
half_adder uut(.a(a),.b(b),.s(s),.c(c));
initial begin 
 $dumpfile("half_adder.vcd"); 
 $dumpvars(0, tb_half_adder); 
 $monitor("Time = %0dt | a = %b, b = %b | s = %b, c = %b", $time, a, b, s, c);
a=0;b=0; #5;
a=0;b=1; #5;
a=1;b=0; #5;
a=1;b=1; #5;
$finish;
end
endmodule