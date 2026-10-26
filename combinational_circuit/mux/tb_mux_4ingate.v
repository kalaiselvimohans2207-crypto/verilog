
module tb_mux_4ingate;

    reg i0, i1, i2, i3;
    reg s1, s0;
    wire y;
    integer i,j;

    mux_4ingate dut (
        .i0(i0), .i1(i1),
        .i2(i2), .i3(i3),
        .s1(s1), .s0(s0),
        .y(y)
    );

    initial begin
    $dumpfile("mux_4ingate.vcd");
$dumpvars(0, tb_mux_4ingate);s
        $monitor("s1=%b s0=%b | i0=%b i1=%b i2=%b i3=%b | y=%b",
                 s1, s0, i0, i1, i2, i3, y);

        for (i = 0; i < 16; i = i + 1) begin
            {i0, i1, i2, i3} = i;
             for (j = 0; j < 4; j = j + 1) begin
                s1 = j / 2;
                s0 = j % 2;
                #10;
            end
        end

        $finish;
    end

endmodule
