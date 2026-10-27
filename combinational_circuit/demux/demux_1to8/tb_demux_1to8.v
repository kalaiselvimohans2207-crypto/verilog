
module tb_demux_1to8;

reg d;
reg [2:0] s;
wire [7:0] y;

demux_1to8 uut (
    .d(d),
    .s(s),
    .y(y)
);

initial begin
    $dumpfile("demux_1to8.vcd");
    $dumpvars(0, tb_demux_1to8);

    d = 1'b1;

    s = 3'b000; #10;
    $display("d=%b s=%b y=%b", d, s, y);

    s = 3'b001; #10;
    $display("d=%b s=%b y=%b", d, s, y);

    s = 3'b010; #10;
    $display("d=%b s=%b y=%b", d, s, y);

    s = 3'b011; #10;
    $display("d=%b s=%b y=%b", d, s, y);

    s = 3'b100; #10;
    $display("d=%b s=%b y=%b", d, s, y);

    s = 3'b101; #10;
    $display("d=%b s=%b y=%b", d, s, y);

    s = 3'b110; #10;
    $display("d=%b s=%b y=%b", d, s, y);

    s = 3'b111; #10;
    $display("d=%b s=%b y=%b", d, s, y);

    $finish;
end

endmodule
