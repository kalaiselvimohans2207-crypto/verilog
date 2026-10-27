
module decoder_3to8_en (
    input x, y, z,
    input E,
    output [7:0] D
);

    wire x_n, y_n, z_n;

    not (x_n, x);
    not (y_n, y);
    not (z_n, z);

    and (D[0], E, x_n, y_n, z_n);
    and (D[1], E, x_n, y_n, z);
    and (D[2], E, x_n, y, z_n);
    and (D[3], E, x_n, y, z);
    and (D[4], E, x, y_n, z_n);
    and (D[5], E, x, y_n, z);
    and (D[6], E, x, y, z_n);
    and (D[7], E, x, y, z);

endmodule


module decoder_4to16 (
    input w, x, y, z,
    output [15:0] D
);

    wire w_n;

    not (w_n, w);

    // Lower decoder: D0-D7 when w=0
    decoder_3to8_en dec_lo (
        .x(x), .y(y), .z(z),
        .E(w_n), .D(D[7:0])
    );

    // Upper decoder: D8-D15 when w=1
    decoder_3to8_en dec_hi (
        .x(x), .y(y), .z(z),
        .E(w), .D(D[15:8])
    );

endmodule
