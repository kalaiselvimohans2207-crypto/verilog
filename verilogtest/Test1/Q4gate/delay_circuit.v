
module delay_circuit (
    input A, B, C, D, E,
    output Y
);

    wire Bn, Cn, Dn;

    wire t1a, t1;
    wire t2a, t2;
    wire t3, t4;

    wire or1, or2;

    // NOT gates: delay = 4
    not #(4) n1(Bn, B);
    not #(4) n2(Cn, C);
    not #(4) n3(Dn, D);

    // Term 1: A.B'.C'
    and #(3) a1(t1a, A, Bn);
    and #(3) a2(t1, t1a, Cn);

    // Term 2: A.B.E
    and #(3) a3(t2a, A, B);
    and #(3) a4(t2, t2a, E);

    // Term 3: B'.C
    and #(3) a5(t3, Bn, C);

    // Term 4: C.D'
    and #(3) a6(t4, C, Dn);

    // OR gates: delay = 2
    or #(2) o1(or1, t1, t2);
    or #(2) o2(or2, t3, t4);
    or #(2) o3(Y, or1, or2);

endmodule
