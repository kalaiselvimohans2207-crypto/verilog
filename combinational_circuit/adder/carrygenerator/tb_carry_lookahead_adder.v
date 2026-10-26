
module tb_carry_lookahead_adder;

reg [3:0] A, B;
reg C0;
wire [3:0] S;
wire C4;

carry_lookahead_adder dut (
    .A(A), .B(B), .C0(C0),
    .S(S), .C4(C4)
);

initial begin
    $dumpfile("cla.vcd");
    $dumpvars(0, tb_carry_lookahead_adder);

    $monitor("Time=%0t A=%b B=%b C0=%b | C4=%b S=%b",
             $time, A, B, C0, C4, S);

    A=4'b0000; B=4'b0000; C0=0;
    #10;

    A=4'b0011; B=4'b0101; C0=0;
    #10;

    A=4'b1111; B=4'b0001; C0=0;
    #10;

    A=4'b1111; B=4'b1111; C0=1;
    #10;

    $finish;
end

endmodule
