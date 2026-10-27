module parity_checker(
    input [3:0] a,
    input p,
    output reg error
);
always @(*)begin
if((^a)==p)
error=0;
else
error=1;
end 
endmodule
