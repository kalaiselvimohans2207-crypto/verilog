module cont_and(
    input a,b,
    output y1
);
assign y1 = a & b;
endmodule
module proc_and(
    input a,b,
    output reg y2
);
always@(*)begin
y2= a & b;
end
endmodule
