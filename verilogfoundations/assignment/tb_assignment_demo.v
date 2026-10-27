module tb_assignment_demo;
reg a,b;
wire y1;
wire y2;
cont_and dut1(
    .a(a),
    .b(b),
    .y1(y1)
);
proc_and dut2(
    .a(a),
    .b(b),
    .y2(y2)
);
initial begin
    $dumpfile("assignment_demo.vcd");
    $dumpvars(0, tb_assignment_demo);

    $monitor("time=%0t a=%b b=%b assign_y=%b always_y=%b",
              $time, a, b, y1, y2);
    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10;

    $finish;
end

endmodule