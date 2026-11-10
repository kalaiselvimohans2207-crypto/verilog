module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
); reg [7:0] previous;

    always @(posedge clk) begin
        pedge <= in & ~previous;
        previous <= in;
    end

endmodule
