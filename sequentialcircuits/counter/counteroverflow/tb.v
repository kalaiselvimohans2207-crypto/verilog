module tb;
parameter N=4;
reg clk;
reg rst;
reg en;
wire[N-1:0] out;
wire tc;
counter #(.N(N)) c1(
.clk(clk),
.rst(rst),
.en(en),
.out(out),
.tc(tc)
);

initial clk=0;
always #5 clk=~clk;
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
$monitor("Time=%0t clk=%0b rst=%0b en=%0b tc=%0b out=%0d",$time, clk,rst,en,tc,out);
end


    // Stimulus
    initial begin

        // Initial conditions
        rst = 1;
        en = 0;

       // Keep reset active for 2 clock cycles
        #20;
        rst = 0;

        // Enable counting
        en = 1;

        // Count from 1 to 15 and wrap
        #160;
        en = 0;

        #20;
        $finish;
    end
endmodule
