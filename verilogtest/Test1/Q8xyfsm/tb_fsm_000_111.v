
`timescale 1ns/1ps

module tb_fsm_000_111;

    reg clk;
    reg reset;
    reg x;
    wire y;

    // DUT instantiation
    fsm_000_111 dut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Input stimulus
    initial begin

        $dumpfile("fsm_000_111.vcd");
        $dumpvars(0, tb_fsm_000_111);

        reset = 1;
        x = 0;

        #10;
        reset = 0;

        // Test sequence 00000
        #10 x = 0;
        #10 x = 0;
        #10 x = 0;
        #10 x = 0;
        #10 x = 0;

        // Test sequence 11111
        #10 x = 1;
        #10 x = 1;
        #10 x = 1;
        #10 x = 1;
        #10 x = 1;

        // Test mixed sequence
        #10 x = 0;
        #10 x = 1;
        #10 x = 0;
        #10 x = 0;
        #10 x = 0;

        #20;
        $finish;
    end

    // Monitor
    initial begin
        $monitor("Time=%0t | clk=%b | reset=%b | x=%b | y=%b | state=%b",
                  $time, clk, reset, x, y, dut.state);
    end

endmodule
