module tb_frequencydiv;

    reg clk;
    reg reset;
    wire clk_out;
    wire [17:0] count;

    frequencydiv dut(
        .clk(clk),
        .reset(reset),
        .clk_out(clk_out),
        .count(count)
    );

    initial begin
        $dumpfile("frequencydiv.vcd");
        $dumpvars(0,tb_frequencydiv);
    end 
    initial begin
    $monitor("Time=%0t | clk=%b | reset=%b | count=%d | clk_out=%b",
              $time, clk, reset, count, clk_out);
end

    initial begin
        clk = 0;
        reset = 0;
        forever #5 clk= ~clk;
    end

    initial begin
        #10;
        reset = 1;
        #10
        reset=0;
        #100
        $finish;
    end

endmodule