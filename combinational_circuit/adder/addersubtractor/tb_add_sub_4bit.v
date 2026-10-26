// 4. Testbench
module tb_add_sub_4bit;

    reg [3:0] A, B;
    reg M;

    wire [3:0] S;
    wire C, V;

    add_sub_4bit DUT (
        .A(A), .B(B), .M(M),
        .S(S), .C(C), .V(V)
    );

    initial begin
        $dumpfile("add_sub_4bit.vcd");
        $dumpvars(0, tb_add_sub_4bit);

        $monitor("Time=%0t A=%d B=%d M=%b | S=%b C=%b V=%b",
                 $time, A, B, M, S, C, V);

        M=0; A=5; B=3; #10;
        M=0; A=2; B=4; #10;
        M=0; A=7; B=1; #10;

        M=1; A=5; B=3; #10;
        M=1; A=3; B=5; #10;
        M=1; A=9; B=4; #10;

        $finish;
    end

endmodule