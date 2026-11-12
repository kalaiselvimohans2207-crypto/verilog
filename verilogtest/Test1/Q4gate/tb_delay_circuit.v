module tb_delay_circuit;

    reg A, B, C, D, E;
    wire Y;

    // DUT instantiation
    delay_circuit dut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .Y(Y)
    );
    initial begin
        $dumpfile("delay_circuit.vcd");
        $dumpvars(0, tb_delay_circuit);
    end

    initial begin

        $monitor("Time=%0t A=%b B=%b C=%b D=%b E=%b Y=%b",
                  $time, A, B, C, D, E, Y);

        // Initial inputs
        A=0; B=0; C=0; D=0; E=0;

        #10 A=1;
        #10 B=1;
        #10 C=1;
        #10 D=1;
        #10 E=1;

        // Turn off monitor at 50 time units
        $monitoroff;

        #10 A=0;
        #10 B=0;
        #10 C=0;
        #10 D=0;
        #10 E=0;

        // Continue displaying after 50 more time units
        #30;
        $monitoron;

        #10 A=1;
        #10 B=0;
        #10 C=1;
        #10 D=0;
        #10 E=1;

        #30 $finish;

    end

endmodule
