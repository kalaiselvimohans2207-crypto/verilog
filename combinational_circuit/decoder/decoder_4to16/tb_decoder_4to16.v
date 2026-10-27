
`timescale 1ns/1ps

module tb_decoder_4to16;

    reg w, x, y, z;
    wire [15:0] D;
    integer i;
    integer errors = 0;

    decoder_4to16 dut (
        .w(w), .x(x), .y(y), .z(z), .D(D)
    );

    initial begin
        $dumpfile("decoder_4to16.vcd");
        $dumpvars(0, tb_decoder_4to16);

        $display("wxyz   D[15:0]");

        for (i = 0; i < 16; i = i + 1) begin
            {w, x, y, z} = i;
            #10;

            $display("%b%b%b%b    %016b", w, x, y, z, D);

            if (D !== (16'b1 << i)) begin
                $display("ERROR at input %b", {w,x,y,z});
                errors = errors + 1;
            end
        end

        if (errors == 0)
            $display("All 16 cases passed.");
        else
            $display("Total errors = %0d", errors);

        $finish;
    end

endmodule
