module tb_register_file();
reg clk;
reg we;
reg [2:0] waddr;
reg [2:0] raddr;
reg [7:0] wdata;
wire [7:0] rdata;

// DUT instantiation
register_file dut (
    .clk(clk),
    .we(we),
    .waddr(waddr),
    .raddr(raddr),
    .wdata(wdata),
    .rdata(rdata)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Test stimulus
initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, tb_register_file);

    $monitor("Time=%0t | clk=%b | we=%b | waddr=%d | wdata=%h | raddr=%d | rdata=%h",
              $time, clk, we, waddr, wdata, raddr, rdata);

    // Initialize inputs
    we = 0;
    waddr = 0;
    raddr = 0;
    wdata = 0;

    // Write data into memory location 0
    #10;
    we = 1;
    waddr = 0;
    wdata = 8'h25;

    // Write data into memory location 1
    #10;
    waddr = 1;
    wdata = 8'h50;

    // Write data into memory location 2
    #10;
    waddr = 2;
    wdata = 8'hA5;

    // Stop writing
    #10;
    we = 0;

    // Read memory location 0
    raddr = 0;
    #10;

    // Read memory location 1
    raddr = 1;
    #10;

    // Read memory location 2
    raddr = 2;
    #10;

    // Read memory location 3
    raddr = 3;
    #10;

    $finish;

end

endmodule