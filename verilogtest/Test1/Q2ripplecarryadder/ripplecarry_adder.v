
module ripple_carry_adder #(parameter N = 4)
(
    input  [N-1:0] A, B,
    input          Cin,
    output [N-1:0] Sum,
    output         Cout
);

wire [N:0] carry;

assign carry[0] = Cin;
assign Cout = carry[N];

genvar i;

generate
    for (i = 0; i < N; i = i + 1) begin : FA

        assign Sum[i] = A[i] ^ B[i] ^ carry[i];

        assign carry[i+1] =
            (A[i] & B[i]) |
            (A[i] & carry[i]) |
            (B[i] & carry[i]);

    end
endgenerate

endmodule
