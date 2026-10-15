
module mux_4incond (
    input i0, i1, i2, i3,
    input s1, s0,
    output out
);

    assign out = s1 ? (s0 ? i3 : i2)
                    : (s0 ? i1 : i0);

endmodule
