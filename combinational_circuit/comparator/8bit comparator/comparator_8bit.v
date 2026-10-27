module comparator_8bit(
input [7:0] a,
input [7:0] b,
output reg g,
output reg l,
output reg e
);
always @(*) begin
if (a>b)begin
g=1'b1;
l=1'b0;
e=1'b0;
end
else if(a<b)begin
g=1'b0;
l=1'b1;
e=1'b0;
end
else if(a==b)begin
g=1'b0;
l=1'b0;
e=1'b1;
end
end 
endmodule
