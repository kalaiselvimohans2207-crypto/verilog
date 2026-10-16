
module tb_demux_1to4;

reg d, s1, s0;
wire y0, y1, y2, y3;

demux_1to4 uut (
    .d(d),
    .s1(s1),
    .s0(s0),
    .y0(y0),
    .y1(y1),
    .y2(y2),
    .y3(y3)
);

integer j;

initial begin
   $dumpfile("demux.vcd");
    $dumpvars(0, tb_demux_1to4);
    d = 1;

    for (j = 0; j < 4; j = j + 1) begin
        s1 = j / 2;
        s0 = j % 2;

        #10;
        $display("d=%b s1=%b s0=%b | y0=%b y1=%b y2=%b y3=%b",
                 d, s1, s0, y0, y1, y2, y3);
    end

    $finish;
end

endmodule