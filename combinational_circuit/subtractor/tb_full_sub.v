module tb_full_sub;
reg a,b,c;
wire D;
wire B;
full_sub dut(
.a(a),.b(b),.c(c),.D(D),.B(B)
);
initial begin
 $dumpfile("full_sub.vcd");
        $dumpvars(0, tb_full_sub);

        $monitor("Time = %0t | a = %b, b = %b, c = %b | D = %b, B = %b",
                 $time, a, b, c, D, B);
a=0;b=0;c=0; #10;
a=0;b=0;c=1; #10;
a=0;b=1;c=0; #10;
a=0;b=1;c=1; #10;
a=1;b=0;c=0; #10;
a=1;b=0;c=1; #10;
a=1;b=1;c=0; #10;;
a=1;b=1;c=1; #10;
        $finish;
end
endmodule