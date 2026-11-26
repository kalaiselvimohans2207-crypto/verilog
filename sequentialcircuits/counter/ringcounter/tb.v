module tb;
parameter N=4;
reg clk;
reg rst;
wire [N-1:0] out;
reg[N-1:0]expected;
integer i;
ring_counter #(.N(N)) dut(
.clk(clk),
.rst(rst),
.out(out)
);
initial clk=0;
always #5 clk=~clk;
initial begin
$dumpfile("r.vcd");
$dumpvars(0,tb);
end
initial begin
$monitor("Time=%0t clk=%0b rst=%0b out=%04b",$time,clk,rst,out);
end
function [N-1:0] next_value;
        input [N-1:0] current;
        begin
            next_value = {~|current[N-1:1],
                           current[N-1:1]};
        end
    endfunction
task check;
input[N-1:0]exp;
begin
if(out!==exp)
$fatal(1,"fail: time=%0t expected=%b actual=%b",$time,exp,out);
else
$display("pass:time=%0t expected=%b actual=%b",  $time,exp,out);
end
endtask
initial begin
rst=0;
@(posedge clk);
#1;
check(4'b0001);
rst=1;
for(i=0;i<4;i=i+1)begin
expected=next_value(out);
@(posedge clk);
#1;
check(expected);
 end
// Inject multiple 1s
        @(negedge clk);
        force dut.out = 4'b0011;

        @(posedge clk);
        #1;
        release dut.out;
#44;
        check(4'b0001);
 expected = next_value(out);
        // Inject all-zero state
        @(negedge clk);
        force dut.out = 4'b0000;

        @(posedge clk);
        #1;
        release dut.out;
        check(4'b1000);
$display("all test passed");
$finish;
end
endmodule
