
`timescale 1ns/1ps

module tb_multiplieradder_4x3;

    reg  [3:0] A;
    reg  [2:0] B;
    wire [6:0] P;

    integer i, j;

    multiplieradder_4x3 uut (
        .A(A),
        .B(B),
        .P(P)
    );

    initial begin
        $dumpfile("multiplieradder_4x3.vcd");
        $dumpvars(0, tb_multiplieradder_4x3);

        $display("A     B     P       Decimal");
        $display("--------------------------------");

        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 8; j = j + 1) begin
                A = i;
                B = j;
                #10;
                $display("%04b  %03b  %07b  %0d",
                         A, B, P, P);
            end
        end

        $finish;
    end

endmodule
