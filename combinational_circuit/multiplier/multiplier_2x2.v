
module half_adder (
    input a,
    input b,
    output sum,
    output carry
);

    assign sum   = a ^ b;
    assign carry = a & b;

endmodule


module multiplier_2x2 (
    input  [1:0] A,
    input  [1:0] B,
    output [3:0] C
);

    wire p0, p1, p2, p3;
    wire carry1;

    assign p0 = A[0] & B[0];
    assign p1 = A[0] & B[1];
    assign p2 = A[1] & B[0];
    assign p3 = A[1] & B[1];

    // Least significant bit
    assign C[0] = p0;

    // First half adder
    half_adder HA1 (
        .a(p1),
        .b(p2),
        .sum(C[1]),
        .carry(carry1)
    );

    // Second half adder
    half_adder HA2 (
        .a(p3),
        .b(carry1),
        .sum(C[2]),
        .carry(C[3])
    );

endmodule
