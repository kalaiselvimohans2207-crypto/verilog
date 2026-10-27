
module comparator4bit_gate (
    input  [3:0] A,
    input  [3:0] B,
    output A_gt_B,
    output A_eq_B,
    output A_lt_B
);

    wire [3:0] nA, nB;
    wire [3:0] eq;

    wire g3, g2, g1, g0;
    wire l3, l2, l1, l0;

    // Invert inputs
    not (nA[3], A[3]);
    not (nA[2], A[2]);
    not (nA[1], A[1]);
    not (nA[0], A[0]);

    not (nB[3], B[3]);
    not (nB[2], B[2]);
    not (nB[1], B[1]);
    not (nB[0], B[0]);

    // Equality of each bit
    xnor (eq[3], A[3], B[3]);
    xnor (eq[2], A[2], B[2]);
    xnor (eq[1], A[1], B[1]);
    xnor (eq[0], A[0], B[0]);

    and (A_eq_B, eq[3], eq[2], eq[1], eq[0]);

    // Greater-than terms
    and (g3, A[3], nB[3]);
    and (g2, eq[3], A[2], nB[2]);
    and (g1, eq[3], eq[2], A[1], nB[1]);
    and (g0, eq[3], eq[2], eq[1], A[0], nB[0]);

    or (A_gt_B, g3, g2, g1, g0);

    // Less-than terms
    and (l3, nA[3], B[3]);
    and (l2, eq[3], nA[2], B[2]);
    and (l1, eq[3], eq[2], nA[1], B[1]);
    and (l0, eq[3], eq[2], eq[1], nA[0], B[0]);

    or (A_lt_B, l3, l2, l1, l0);

endmodule
