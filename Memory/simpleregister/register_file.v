module register_file(
    input clk,
    input we,
    input [2:0] waddr,
    input [2:0]raddr,
    input [7:0] wdata,
    output reg [7:0] rdata
);
reg[7:0]mem[7:0];
always@(posedge clk)begin
if(we)
mem[waddr]<=wdata;
end

always @(*) begin
    rdata = mem[raddr];
end
endmodule