module multiplier_4x3 (
    input  [3:0] A,
    input  [2:0] B,
    output [6:0] P
);

    assign P = A * B;

endmodule