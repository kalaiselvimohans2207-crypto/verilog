
module subtractor8bit (
    input  [7:0] A,
    input  [7:0] B,
    output [7:0] Difference,
    output Borrow
);

    assign {Borrow, Difference} = {1'b0, A} - {1'b0, B};

endmodule
