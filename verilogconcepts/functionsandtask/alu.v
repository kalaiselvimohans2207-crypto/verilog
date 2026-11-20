module alu(
input [7:0] a,
input [7:0] b,
input sel,
output reg[7:0]sum,
output reg[7:0]diff
);
function [7:0] add;
input[7:0] x,y;
add=x+y;
endfunction
task sub;
input[7:0]x,y;
output reg [7:0]result;
result=x-y;
endtask
always@(*)begin
if(sel==1'b0)begin
sum=add(a,b);
diff=8'b0;
end
else begin
sum=8'b0;
sub(a,b,diff);
end
end 
endmodule

