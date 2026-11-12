module frequencydiv(
    input clk,
    input reset,
    output reg clk_out,
    output reg [17:0] count

);
always@(posedge clk or posedge reset)begin
if(reset) begin
clk_out<=1'b0;
count<=1'b0;
end
        else if (count ==249999)  begin
            count <= 18'b0 ;
            clk_out <= ~clk_out ;
            end
             else begin
            count <= count +1'b1 ;
            end
            end
        endmodule