
module tb_carry_lookahead_generator;

reg [3:0] P, G;
reg C0;
wire C1, C2, C3, C4;

carry_lookahead_generator dut (
    .P(P), .G(G), .C0(C0),
    .C1(C1), .C2(C2), .C3(C3), .C4(C4)
);

initial begin
$dumpfile("carry.vcd");
$dumpvars(0, tb_carry_lookahead_generator);
    $monitor("P=%b G=%b C0=%b | C1=%b C2=%b C3=%b C4=%b",
              P, G, C0, C1, C2, C3, C4);

    P=4'b0000; G=4'b0000; C0=0;
    #10;

    P=4'b1111; G=4'b0000; C0=1;
    #10;

    P=4'b0000; G=4'b0001; C0=0;
    #10;

    P=4'b1111; G=4'b1111; C0=0;
    #10;

    $finish;
end

endmodule

