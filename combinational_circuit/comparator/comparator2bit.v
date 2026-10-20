
module comparator2bit (
    input  [1:0] A, B,
    output G, E, L
);

assign G = (A > B);
assign E = (A == B);
assign L = (A < B);

endmodule
