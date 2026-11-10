
`timescale 1ns/1ps

module tb_D_neg;

    reg clk;
    reg en;
    reg areset_n;
    reg d;
    wire q;

    // DUT instantiation
    D_neg dut (
        .clk(clk),
        .en(en),
        .areset_n(areset_n),
        .d(d),
        .q(q)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        $dumpfile("D_neg.vcd");
        $dumpvars(0, tb_D_neg);

        $monitor("time=%0t clk=%b reset_n=%b en=%b d=%b q=%b",
                  $time, clk, areset_n, en, d, q);

        // Initial values
        en = 0;
        d = 0;
        areset_n = 0;

        #12;
        areset_n = 1;

        // Test 1: Enable = 1, D = 1
        #2;
        en = 1;
        d = 1;

        // Test 2: Change D to 0
        #10;
        d = 0;

        // Test 3: Enable = 0, D = 1
        #10;
        en = 0;
        d = 1;

        // Test 4: Enable = 1, D = 1
        #10;
        en = 1;

        // Test 5: Asynchronous reset
        #3;
        areset_n = 0;

        #4;
        areset_n = 1;

        #10;
        $finish;
    end

endmodule
