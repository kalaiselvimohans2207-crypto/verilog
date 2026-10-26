
module tb_bcd_adder;

reg [3:0] A, B;
reg Cin;
wire [3:0] S;
wire Cout;

integer i;

bcd_adder dut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
);

initial begin
    $dumpfile("bcd_adder.vcd");
    $dumpvars(0, tb_bcd_adder);

    $monitor("A=%d B=%d Cin=%b | Cout=%b S=%d",
             A, B, Cin, Cout, S);

    A=4'd2; B=4'd3; Cin=0; #10;
    A=4'd5; B=4'd7; Cin=0; #10;
    A=4'd9; B=4'd9; Cin=0; #10;
    A=4'd8; B=4'd1; Cin=1; #10;

    $finish;
end

endmodule
