
module mux_4ingate (
    input i0, i1, i2, i3,
    input s1, s0,
    output y
);

    wire ns1, ns0;
    wire w0, w1, w2, w3;

    not (ns1, s1);
    not (ns0, s0);

    and (w0, i0, ns1, ns0);
    and (w1, i1, ns1, s0);
    and (w2, i2, s1, ns0);
    and (w3, i3, s1, s0);

    or (y, w0, w1, w2, w3);

endmodule
