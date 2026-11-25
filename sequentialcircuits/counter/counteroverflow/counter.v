module counter #(parameter N=4)(
input clk,
input rst,
input en,
output reg[N-1:0] out,
output tc
);
always@(posedge clk)begin
if(rst)
out<=1'b0;
else if(en)
out<=out+1'b1;
end
assign tc=en&(&out);
endmodule
