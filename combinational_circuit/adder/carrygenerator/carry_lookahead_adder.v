
module carry_lookahead_adder (
    input  [3:0] A,
    input  [3:0] B,
    input        C0,
    output [3:0] S,
    output       C4
);

wire [3:0] P;
wire [3:0] G;
wire C1, C2, C3;

// Generate Propagate and Generate signals
assign P = A ^ B;
assign G = A & B;

// Connect the existing carry generator
carry_lookahead_generator clg (
    .P(P),
    .G(G),
    .C0(C0),
    .C1(C1),
    .C2(C2),
    .C3(C3),
    .C4(C4)
);

// Calculate sum bits
assign S[0] = P[0] ^ C0;
assign S[1] = P[1] ^ C1;
assign S[2] = P[2] ^ C2;
assign S[3] = P[3] ^ C3;

endmodule