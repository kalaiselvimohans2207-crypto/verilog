
`timescale 1ns/1ps

module tb_multiplier_2x2;

    reg  [1:0] A, B;
    wire [3:0] C;
    integer i, j;

    multiplier_2x2 uut (
        .A(A),
        .B(B),
        .C(C)
    );

    initial begin
        $dumpfile("multiplier_2x2.vcd");
        $dumpvars(0, tb_multiplier_2x2);

        $display("A  B  | C(binary) | Decimal | Status");

        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                A = i;
                B = j;
                #10;

                $display("%0d  %0d  | %b      | %0d       | %s",
                         A, B, C, C, (C == i*j) ? "PASS" : "FAIL");
            end
        end

        $finish;
    end

endmodule
