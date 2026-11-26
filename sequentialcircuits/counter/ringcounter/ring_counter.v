module ring_counter #(parameter N=4)
(
input clk,
input rst,
output reg[N-1:0]out
);
always@(posedge clk)begin
if(!rst)
out<=4'b1;
else
out<={~|out[N-1:1],out[N-1:1]};
end
endmodule
