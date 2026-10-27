
module decoder3to8 (
    input A, B, Cin,
    output [7:0] D
);

    wire nA, nB, nCin;

    not (nA, A);
    not (nB, B);
    not (nCin, Cin);

    and (D[0], nA, nB, nCin);
    and (D[1], nA, nB, Cin);
    and (D[2], nA, B, nCin);
    and (D[3], nA, B, Cin);
    and (D[4], A, nB, nCin);
    and (D[5], A, nB, Cin);
    and (D[6], A, B, nCin);
    and (D[7], A, B, Cin);

endmodule


module fulladder_using_decoder (
    input A, B, Cin,
    output Sum, Cout
);

    wire [7:0] D;

    decoder3to8 dec (
        .A(A),
        .B(B),
        .Cin(Cin),
        .D(D)
    );

    // Sum = minterms 1, 2, 4, 7
    or (Sum, D[1], D[2], D[4], D[7]);

    // Carry = minterms 3, 5, 6, 7
    or (Cout, D[3], D[5], D[6], D[7]);

endmodule
