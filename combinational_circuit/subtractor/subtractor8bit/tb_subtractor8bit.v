
`timescale 1ns/1ps

module tb_subtractor8bit;

    reg  [7:0] A, B;
    wire [7:0] Difference;
    wire Borrow;

    subtractor8bit dut (
        .A(A),
        .B(B),
        .Difference(Difference),
        .Borrow(Borrow)
    );

    initial begin
        $dumpfile("subtractor8bit.vcd");
        $dumpvars(0, tb_subtractor8bit);

        $display(" A    B   | Borrow Difference");
        $display("-----------------------------");

        A = 8'd10;  B = 8'd5;
        #10;
        $display("%3d  %3d  |   %b      %3d", A, B, Borrow, Difference);

        A = 8'd5;   B = 8'd10;
        #10;
        $display("%3d  %3d  |   %b      %3d", A, B, Borrow, Difference);

        A = 8'd20;  B = 8'd20;
        #10;
        $display("%3d  %3d  |   %b      %3d", A, B, Borrow, Difference);

        A = 8'd0;   B = 8'd1;
        #10;
        $display("%3d  %3d  |   %b      %3d", A, B, Borrow, Difference);

        $finish;
    end

endmodule
