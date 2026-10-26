
module carry_lookahead_generator (
    input  [3:0] P,   // Propagate signals
    input  [3:0] G,   // Generate signals
    input        C0,  // Input carry

    output C1,
    output C2,
    output C3,
    output C4
);

assign C1 = G[0] | (P[0] & C0);

assign C2 = G[1] |
            (P[1] & G[0]) |
            (P[1] & P[0] & C0);

assign C3 = G[2] |
            (P[2] & G[1]) |
            (P[2] & P[1] & G[0]) |
            (P[2] & P[1] & P[0] & C0);

assign C4 = G[3] |
            (P[3] & G[2]) |
            (P[3] & P[2] & G[1]) |
            (P[3] & P[2] & P[1] & G[0]) |
            (P[3] & P[2] & P[1] & P[0] & C0);

endmodule
