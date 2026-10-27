
module adder4 (
    input  [3:0] A,
    input  [3:0] B,
    output [3:0] Sum,
    output Cout
);
    assign {Cout, Sum} = A + B;
endmodule


module multiplieradder_4x3 (
    input  [3:0] A,
    input  [2:0] B,
    output [6:0] P
);

    wire [3:0] pp0, pp1, pp2;
    wire [3:0] sum1, sum2;
    wire carry1, carry2;
    wire [3:0] row0, row1, row2;

    // Partial products
    assign pp0 = A & {4{B[0]}};
    assign pp1 = A & {4{B[1]}};
    assign pp2 = A & {4{B[2]}};

    // First 4-bit adder: add the first two rows
    assign row0 = {1'b0, pp0[3:1]};
    assign row1 = pp1;

    adder4 ADD1 (
        .A(row0),
        .B(row1),
        .Sum(sum1),
        .Cout(carry1)
    );

    // Second 4-bit adder: add the third row
    assign row2 = pp2;

    adder4 ADD2 (
        .A({carry1, sum1[3:1]}),
        .B(row2),
        .Sum(sum2),
        .Cout(carry2)
    );

    // Assemble the 7-bit product
    assign P[0]   = pp0[0];
    assign P[1]   = sum1[0];
    assign P[5:2] = sum2;
    assign P[6]   = carry2;

endmodule
