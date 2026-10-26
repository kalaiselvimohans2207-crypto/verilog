
module tb_gray_to_binary;

    reg  [3:0] G;
    wire [3:0] B;

    integer i;

    gray_to_binary uut (
        .G(G),
        .B(B)
    );

    initial begin
        $dumpfile("gray_to_binary.vcd");
        $dumpvars(0, tb_gray_to_binary);

        $display("Time=%0t  Gray G=%b  Binary B=%b",
                 $time, G, B);

        for (i = 0; i < 16; i = i + 1) begin
            G = i;
            #10;
            $display("Time=%0t  Gray G=%b  Binary B=%b",
                     $time, G, B);
        end

        $finish;
    end

endmodule
