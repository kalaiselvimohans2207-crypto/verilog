
`timescale 1ns/1ps

module tb_comparator4bit_gate;

    reg [3:0] A, B;

    wire A_gt_B;
    wire A_eq_B;
    wire A_lt_B;

    integer i, j;

    // Instantiate gate-level comparator
    comparator4bit_gate uut (
        .A(A),
        .B(B),
        .A_gt_B(A_gt_B),
        .A_eq_B(A_eq_B),
        .A_lt_B(A_lt_B)
    );

    initial begin
        $dumpfile("comparator4bit_gate.vcd");
        $dumpvars(0, tb_comparator4bit_gate);

        $display(" A     B     A>B  A=B  A<B");
        $display("--------------------------------");

        // Test all 256 combinations
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                A = i;
                B = j;
                #10;

                $display("%04b  %04b   %b    %b    %b",
                         A, B, A_gt_B, A_eq_B, A_lt_B);
            end
        end

        $finish;
    end

endmodule
