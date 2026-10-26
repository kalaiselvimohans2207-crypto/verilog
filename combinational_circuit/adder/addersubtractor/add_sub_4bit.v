`timescale 1ns/1ps

// 1. Carry Lookahead Generator
module carry_lookahead_generator (
    input  [3:0] A, B,
    input        C0,
    output [3:0] P, G,
    output [4:1] C
);

    assign P = A ^ B;
    assign G = A & B;

    assign C[1] = G[0] | (P[0] & C0);

    assign C[2] = G[1] | (P[1] & G[0])
                        | (P[1] & P[0] & C0);

    assign C[3] = G[2] | (P[2] & G[1])
                        | (P[2] & P[1] & G[0])
                        | (P[2] & P[1] & P[0] & C0);

    assign C[4] = G[3] | (P[3] & G[2])
                        | (P[3] & P[2] & G[1])
                        | (P[3] & P[2] & P[1] & G[0])
                        | (P[3] & P[2] & P[1] & P[0] & C0);

endmodule


// 2. Carry Lookahead Adder
module carry_lookahead_adder (
    input  [3:0] A, B,
    input        C0,
    output [3:0] S,
    output       C4
);

    wire [3:0] P, G;
    wire [4:1] C;

    carry_lookahead_generator CG (
        .A(A), .B(B), .C0(C0),
        .P(P), .G(G), .C(C)
    );

    assign S[0] = P[0] ^ C0;
    assign S[1] = P[1] ^ C[1];
    assign S[2] = P[2] ^ C[2];
    assign S[3] = P[3] ^ C[3];

    assign C4 = C[4];

endmodule


// 3. 4-bit Adder-Subtractor
module add_sub_4bit (
    input  [3:0] A, B,
    input        M,
    output [3:0] S,
    output       C,
    output       V
);

    wire [3:0] Bx;

    // M=0: B remains unchanged
    // M=1: B is inverted
    assign Bx = B ^ {4{M}};

    // M is also the initial carry
    carry_lookahead_adder CLA (
        .A(A), .B(Bx), .C0(M),
        .S(S), .C4(C)
    );

    // Signed overflow
    assign V = ~(A[3] ^ Bx[3]) & (A[3] ^ S[3]);

endmodule


