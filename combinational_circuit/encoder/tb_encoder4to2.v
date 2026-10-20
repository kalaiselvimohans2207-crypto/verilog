
module tb_encoder4to2;

reg  [3:0] D;
wire [1:0] A;

encoder4to2 uut (
    .D(D),
    .A(A)
);

initial begin
    $dumpfile("encoder4to2.vcd");
    $dumpvars(0,tb_encoder4to2);
    $monitor("D=%b | A=%b", D, A);

   
    D = 4'b0001; #10;
    D = 4'b0010; #10;
    D = 4'b0100; #10;
    D = 4'b1000; #10;

    $finish;
end

endmodule
