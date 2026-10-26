
module tb_all_gates;

    reg A, B;

    wire and_y, or_y, not_y;
    wire nand_y, nor_y, xor_y, xnor_y;

    and_gate  g1 (.A(A), .B(B), .Y(and_y));
    or_gate   g2 (.A(A), .B(B), .Y(or_y));
    not_gate  g3 (.A(A),         .Y(not_y));
    nand_gate g4 (.A(A), .B(B), .Y(nand_y));
    nor_gate  g5 (.A(A), .B(B), .Y(nor_y));
    xor_gate  g6 (.A(A), .B(B), .Y(xor_y));
    xnor_gate g7 (.A(A), .B(B), .Y(xnor_y));

    integer i;

    initial begin
        $dumpfile("all_gates.vcd");
        $dumpvars(0, tb_all_gates);

        $display("A B | AND OR NOT NAND NOR XOR XNOR");
        $display("-----------------------------------");

        for (i = 0; i < 4; i = i + 1) begin
            {A, B} = i;
            #10;
            $display("%b %b |  %b   %b   %b    %b    %b   %b    %b",
                A, B, and_y, or_y, not_y,
                nand_y, nor_y, xor_y, xnor_y);
        end

        $finish;
    end

endmodule
