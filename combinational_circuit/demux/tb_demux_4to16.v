
module tb_decoder;

reg [3:0] a;
wire [15:0] y;
integer i;

decoder_4to16 uut (
    .a(a),
    .y(y)
);

initial begin
    $dumpfile("decoder.vcd");
    $dumpvars(0, tb_decoder);

    for (i = 0; i < 16; i = i + 1) begin
        a = i;
        #10;
        $display("a=%b y=%b", a, y);
    end

    $finish;
end

endmodule
