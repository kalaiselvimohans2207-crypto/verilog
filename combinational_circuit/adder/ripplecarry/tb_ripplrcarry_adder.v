module tb_ripplecarry_adder;

    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    ripplecarry_adder dut (
        A, B, Cin, Sum, Cout
    );

    initial begin
    $dumpfile("ripplecarry_adder.vcd");
$dumpvars(0, tb_ripplecarry_adder);
        $monitor("Time=%0t A=%b B=%b Cin=%b Sum=%b Cout=%b",
                  $time, A, B, Cin, Sum, Cout);

        A = 4'b0011; B = 4'b0010; Cin = 0;
        #10;

        A = 4'b0101; B = 4'b0011; Cin = 0;
        #10;

        A = 4'b1111; B = 4'b0001; Cin = 0;
        #10;

        $finish;
    end

endmodule