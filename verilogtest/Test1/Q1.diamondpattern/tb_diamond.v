module tb_diamond_pattern;

    diamond_pattern dut();

    initial begin
        $dumpfile("diamond_pattern.vcd");
        $dumpvars(0, tb_diamond_pattern);
    end

    initial begin
        #10;
        $finish;
    end

endmodule

