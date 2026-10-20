module encoder4to2(
    input [3:0] D,
    output[1:0] A
);
assign A[1]=D[2] | D[3];
assign A[0]=D[1] |D[3];
endmodule