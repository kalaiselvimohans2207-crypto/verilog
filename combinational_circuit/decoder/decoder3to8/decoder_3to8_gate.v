module decoder_3to8_gate (
    input  x, y, z,
    output D0, D1, D2, D3, D4, D5, D6, D7
);
    wire x_n, y_n, z_n;

    not (x_n, x);
    not (y_n, y);
    not (z_n, z);

    and (D0, x_n, y_n, z_n);  // x'y'z'
    and (D1, x_n, y_n, z  );  // x'y'z
    and (D2, x_n, y,   z_n);  // x'yz'
    and (D3, x_n, y,   z  );  // x'yz
    and (D4, x,   y_n, z_n);  // xy'z'
    and (D5, x,   y_n, z  );  // xy'z
    and (D6, x,   y,   z_n);  // xyz'
    and (D7, x,   y,   z  );  // xyz
endmodule