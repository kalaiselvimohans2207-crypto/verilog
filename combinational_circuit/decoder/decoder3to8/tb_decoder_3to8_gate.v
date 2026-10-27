module tb_decoder;
    reg x, y, z;
    wire D0, D1, D2, D3, D4, D5, D6, D7;
    wire [7:0] D = {D7, D6, D5, D4, D3, D2, D1, D0};
    integer i, errors = 0;

    decoder_3to8_gate dut (.x(x), .y(y), .z(z),
                           .D0(D0), .D1(D1), .D2(D2), .D3(D3),
                           .D4(D4), .D5(D5), .D6(D6), .D7(D7));

    initial begin
    $dumpfile("decoder_3to8_gate.vcd");
    $dumpvars(0, tb_decoder);
     $monitor("t=%0t | xyz=%b%b%b | D7..D0=%b", $time, x, y, z, D);
        for (i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i[2:0];
            #1;
            if (D !== (8'b1 << i)) begin
                $display("ERROR: xyz=%b D=%b", {x,y,z}, D);
                errors = errors + 1;
            end
        end
        if (errors == 0) $display("All 8 cases passed.");
        $finish;
    end
endmodule