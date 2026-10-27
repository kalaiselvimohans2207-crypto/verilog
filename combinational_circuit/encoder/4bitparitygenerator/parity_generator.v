module parity_generator(
    input [3:0] a,
    output p
);
assign p=^a;
endmodule