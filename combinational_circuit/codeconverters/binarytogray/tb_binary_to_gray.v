

module tb_binary_to_gray;

    reg  [3:0] B;
    wire [3:0] G;

    binary_to_gray dut (
        .B(B),
        .G(G)
    );

    integer i;

    initial begin
        $dumpfile("binary_to_gray.vcd");
        $dumpvars(0, tb_binary_to_gray);

        $display("Decimal | Binary | Gray");
        $monitor("%0d      | %b | %b", B, B, G);

        for (i = 0; i < 16; i = i + 1) begin
            B = i;
            #10;
        end

        $finish;
    end

endmodule