
`timescale 1ns/1ps

module tb_binary_to_gray;

    reg  [3:0] B;
    wire [3:0] G;

    // Instantiate the design under test
    binary_to_gray uut (
        .B(B),
        .G(G)
    );

    initial begin
        $dumpfile("binary_to_gray.vcd");
        $dumpvars(0, tb_binary_to_gray);
        $display("Time\tBinary\tGray");

        $monitor("Time=%0t  Binary B=%b  Gray G=%b", $time, B, G);

        B = 4'b0000;
        repeat (16) begin
            #10;
            B = B + 1;
        end

        #10;
        $finish;
    end

endmodule
