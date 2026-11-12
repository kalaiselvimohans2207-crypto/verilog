
`timescale 1ns/1ps

module tb_simple_ram;

reg clk;
reg we;
reg [3:0] addr;
reg [7:0] wdata;

wire [7:0] rdata;

// DUT instantiation
simple_ram dut (
    .clk(clk),
    .we(we),
    .addr(addr),
    .wdata(wdata),
    .rdata(rdata)
);

// Clock generation: 10 ns period
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Test stimulus
initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, tb_simple_ram);

    $monitor("Time=%0t | clk=%b | we=%b | addr=%d | wdata=%h | rdata=%h",
             $time, clk, we, addr, wdata, rdata);

    // Initial values
    we = 0;
    addr = 0;
    wdata = 0;

    // Write data into address 0
    #10;
    we = 1;
    addr = 0;
    wdata = 8'h25;

    // Write data into address 1
    #10;
    addr = 1;
    wdata = 8'h50;

    // Write data into address 2
    #10;
    addr = 2;
    wdata = 8'hA5;

    // Stop writing
    #10;
    we = 0;

    // Read address 0
    addr = 0;
    #10;

    // Read address 1
    addr = 1;
    #10;

    // Read address 2
    addr = 2;
    #10;

    // Read address 3 (not written)
    addr = 3;
    #10;

    $finish;
end

endmodule
