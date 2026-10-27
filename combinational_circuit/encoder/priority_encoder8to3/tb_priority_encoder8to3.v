
module tb_priority_encoder8to3;

    reg E;
    reg [7:0] D;
    wire [2:0] Y;
    wire Valid;

    priority_encoder8to3 dut (
        .E(E),
        .D(D),
        .Y(Y),
        .Valid(Valid)
    );

    initial begin
        $dumpfile("priority_encoder8to3.vcd");
        $dumpvars(0, tb_priority_encoder8to3);

        $monitor("E=%b D=%b Y=%b Valid=%b",
                  E, D, Y, Valid);

        E = 0; D = 8'b10000000; #10;
        E = 1; D = 8'b00000001; #10;
        E = 1; D = 8'b00000100; #10;
        E = 1; D = 8'b00101000; #10;
        E = 1; D = 8'b11000000; #10;
        E = 1; D = 8'b00000000; #10;

        $finish;
    end

endmodule
