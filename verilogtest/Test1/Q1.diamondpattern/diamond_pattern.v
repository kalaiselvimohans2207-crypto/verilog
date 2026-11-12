
module diamond_pattern;

integer i, j, k;

initial begin

    // Upper half
    for (i = 1; i <= 5; i = i + 1) begin

        for (k = 1; k <= 5-i; k = k + 1)
            $write(" ");

        for (j = 1; j <= 2*i-1; j = j + 1)
            $write("%0d", i);

        $display("");
    end

    // Lower half
    for (i = 4; i >= 1; i = i - 1) begin

        for (k = 1; k <= 5-i; k = k + 1)
            $write(" ");

        for (j = 1; j <= 2*i-1; j = j + 1)
            $write("%0d", i);

        $display("");
    end

    $finish;
end

endmodule
