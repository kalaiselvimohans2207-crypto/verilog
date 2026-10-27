
`timescale 1ns/1ps

module tb_encoder8to3;

    reg [7:0] D;
    wire [2:0] Y;
    integer i;

    encoder8to3 dut (
        .D(D),
        .Y(Y)
    );

    initial begin
        $dumpfile("encoder8to3.vcd");
        $dumpvars(0, tb_encoder8to3);

        $monitor("D=%b Y=%b", D, Y);

        for (i = 0; i < 8; i = i + 1) begin
            D = 8'b00000001 << i;
            #10;
        end

        $finish;
    end

endmodule
