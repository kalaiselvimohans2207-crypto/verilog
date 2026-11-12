module simple_ram (

    input clk,

    input we,

    input [3:0] addr,

    input  [7:0] wdata,

    output reg [7:0] rdata

);
reg [7:0] mem [0:15];

always @(posedge clk) begin

    if (we)

        mem[addr] <= wdata;

    rdata <= mem[addr];

end
endmodule