
`timescale 1ns/1ps

module tb_fulladder_using_decoder;

    reg A, B, Cin;
    wire Sum, Cout;

    integer i;

    fulladder_using_decoder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("fulladder_using_decoder.vcd");
        $dumpvars(0, tb_fulladder_using_decoder);

        $display("A B Cin | Sum Cout");
        $display("-------------------");

        for (i = 0; i < 8; i = i + 1) begin
            {A, B, Cin} = i;
            #10;
            $display("%b %b  %b  |  %b    %b",
                     A, B, Cin, Sum, Cout);
        end

        $finish;
    end

endmodule
