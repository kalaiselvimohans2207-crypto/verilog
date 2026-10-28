module mux2x1blocking(
    input a,b,s,
    output reg y
);
always@(*)begin
if(s==0)
y=a;
else
y=b;
end
endmodule