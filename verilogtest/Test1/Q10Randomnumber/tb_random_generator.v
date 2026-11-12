
module tb_random_generator;

    random_generator dut();

    initial begin
        $dumpfile("random_generator.vcd");
        $dumpvars(0, tb_random_generator);
    end

    initial begin
        $monitor("Time=%0t | Random number=%0d",
                 $time, dut.random_num);
    end

    initial begin
        #200;
        $finish;
    end

endmodule

