
`timescale 1ns/1ps

module tb_memory_operations;

    // DUT instantiation
    memory_operations dut();

    initial begin
        $dumpfile("memory_operations.vcd");
        $dumpvars(0, tb_memory_operations);
    end

    initial begin
        #10;
        $display("Testbench completed");
        $finish;
    end

endmodule
