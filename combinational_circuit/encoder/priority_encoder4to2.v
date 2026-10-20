module priority_encoder4to2(
    input [3:0] d,
    output [1:0] y,
    output v
);
assign y[0]=d[3] | (~d[2]&d[1]);
assign y[1]=d[2] | d[3];
assign v=d[0]|d[1]|d[2]|d[3];
endmodule