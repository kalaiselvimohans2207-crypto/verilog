
module tb_excess3_to_bcd;

    reg  [3:0] ex3;
    wire [3:0] bcd;
    integer i;

    excess3_to_bcd uut (
        .ex3(ex3),
        .bcd(bcd)
    );

    initial begin
        $monitor("Excess3=%b  BCD=%b", ex3, bcd);

        for (i = 3; i <= 12; i = i + 1) begin
            ex3 = i;
            #10;
        end

        $finish;
    end

endmodule
