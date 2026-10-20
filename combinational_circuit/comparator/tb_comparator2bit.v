
module tb_comparator2bit;

reg  [1:0] A, B;
wire G, E, L;
integer i, j;

comparator2bit uut (
    .A(A),
    .B(B),
    .G(G),
    .E(E),
    .L(L)
);

initial begin
    $dumpfile("comparator2bit.vcd");
    $dumpvars(0, tb_comparator2bit);

    $monitor("Time=%0t | A=%b B=%b | G=%b E=%b L=%b",
              $time, A, B, G, E, L);

    for (i = 0; i < 4; i = i + 1) begin
        for (j = 0; j < 4; j = j + 1) begin
            A = i;
            B = j;
            #10;
        end
    end

    $finish;
end

endmodule
