module tb_half_sub;
reg a,b;
wire D;
wire B;
half_sub dut(
    .a(a),
    .b(b),
    .D(D),
    .B(B)
    );
    initial begin
    $dumpfile("half_sub.vcd");
        $dumpvars(0, tb_half_sub);
          $monitor("Time = %0t | a = %b b = %b | D=%b B=%b",
                 $time, a,b,D,B);
                 a=0;b=0; #10;
                 a=0;b=1; #10;
                 a=1;b=0; #10;
                 a=1;b=1; #10;
                 $finish;
                 end
                 endmodule