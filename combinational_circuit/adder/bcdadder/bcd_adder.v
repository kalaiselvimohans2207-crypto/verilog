
module bcd_adder (
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] S,
    output       Cout
);

wire [3:0] Z;
wire K;
wire unused_c;

// First adder: normal binary addition
carry_lookahead_adder ADD1 (
    .A(A),
    .B(B),
    .C0(Cin),
    .S(Z),
    .C4(K)
);

// Detect when BCD correction is needed
assign Cout = K | (Z[3] & Z[2]) | (Z[3] & Z[1]);

// Second adder: add 0110 when correction is needed
carry_lookahead_adder ADD2 (
    .A(Z),
    .B({1'b0, Cout, Cout, 1'b0}),
    .C0(1'b0),
    .S(S),
    .C4(unused_c)
);

endmodule
