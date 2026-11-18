
`timescale 1ns/1ps

module tb_lshift_reg;

    reg clk;
    reg rstn;
    reg [7:0] load_val;
    reg load_en;
    wire [7:0] op;

    // Instantiate DUT
    lshift_reg dut (
        .clk(clk),
        .rstn(rstn),
        .load_val(load_val),
        .load_en(load_en),
        .op(op)
    );

    // Clock generation: 20 ns period
    always #10 clk = ~clk;

    initial begin

        // Initialize signals
        clk      = 0;
        rstn     = 0;
        load_val = 8'b00000001;
        load_en  = 0;

        $dumpfile("lshift_reg.vcd");
        $dumpvars(0, tb_lshift_reg);

        $monitor("Time=%0t rstn=%b load_en=%b load_val=%b op=%b",
                  $time, rstn, load_en, load_val, op);

        // Keep reset active for two clock edges
        repeat (2) @(negedge clk);
        rstn = 1;

        // Load data
        load_en = 1;
        load_val = 8'b00000001;
        @(negedge clk);
        load_en = 0;

        // Observe circular shifting
        repeat (10) @(negedge clk);

        $finish;
    end

endmodule

