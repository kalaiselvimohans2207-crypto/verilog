module tb_bcd_to_excess3;

    reg [3:0] bcd;
    wire [3:0] ex3;
    integer i;

    bcd_to_excess3 uut (
        .bcd(bcd),
        .ex3(ex3)
    );

    initial begin
        $monitor("BCD=%b Excess3=%b", bcd, ex3);

        for (i = 0; i < 10; i = i + 1) begin
            bcd = i;
            #10;
        end

        $finish;
    end

endmodule