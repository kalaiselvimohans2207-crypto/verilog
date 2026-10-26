
module tb_mux_4incond;

    reg i0, i1, i2, i3;
    reg s1, s0;
    wire out;

    integer i, j;
     $dumpfile("mux_4incond.vcd");
    $dumpvars(0, tb_mux_4incond);

    // Instantiate the design
    mux_4incond uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .s1(s1),
        .s0(s0),
        .out(out)
    );

    initial begin
        $dumpfile("mux_4incond.vcd");
        $dumpvars(0, tb_mux_4incond);

        $monitor("s1=%b s0=%b | i0=%b i1=%b i2=%b i3=%b | out=%b",
                 s1, s0, i0, i1, i2, i3, out);

        // Test all 16 combinations of data inputs
        for (i = 0; i < 16; i = i + 1) begin
            {i0, i1, i2, i3} = i;

            // Test all 4 select combinations
            for (j = 0; j < 4; j = j + 1) begin
                s1 = j / 2;
                s0 = j % 2;
                #10;
            end
        end

        $finish;
    end

endmodule
