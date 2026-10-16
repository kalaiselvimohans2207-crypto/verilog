
module demux_1to4 (
    input  wire d,
    input  wire s1,
    input  wire s0,
    output wire y0,
    output wire y1,
    output wire y2,
    output wire y3
);

assign y0 = d & ~s1 & ~s0;
assign y1 = d & ~s1 &  s0;
assign y2 = d &  s1 & ~s0;
assign y3 = d &  s1 &  s0;

endmodule
