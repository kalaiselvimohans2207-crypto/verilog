module tb_configurable_fulladder;

reg [7:0] A8, B8;
reg Cin8;
wire [7:0] Sum8;
wire Cout8;

reg [15:0] A16, B16;
reg Cin16;
wire [15:0] Sum16;
wire Cout16;

// 8-bit full adder
configurable_fulladder #(.N(8)) FA8 (
    .A(A8), .B(B8), .Cin(Cin8),
    .Sum(Sum8), .Cout(Cout8)
);

// 16-bit full adder
configurable_fulladder #(.N(16)) FA16 (
    .A(A16), .B(B16), .Cin(Cin16),
    .Sum(Sum16), .Cout(Cout16)
);

initial begin
    $dumpfile("configurable_fulladder.vcd");
    $dumpvars(0, tb_configurable_fulladder);
end

initial begin
    // Test 1: Carry generation
    A8 = 8'hFF;
    B8 = 8'h01;
    Cin8 = 0;

    A16 = 16'hFFFF;
    B16 = 16'h0001;
    Cin16 = 0;

    #10;
    $strobe("8-bit  : A=%h B=%h Cin=%b | Sum=%h Cout=%b",
             A8, B8, Cin8, Sum8, Cout8);

    $strobe("16-bit : A=%h B=%h Cin=%b | Sum=%h Cout=%b",
             A16, B16, Cin16, Sum16, Cout16);

    // Test 2
    #10;
    A8 = 8'h25;
    B8 = 8'h15;
    Cin8 = 1;

    A16 = 16'h1234;
    B16 = 16'h1111;
    Cin16 = 1;

    #10;
    $strobe("8-bit  : A=%h B=%h Cin=%b | Sum=%h Cout=%b",
             A8, B8, Cin8, Sum8, Cout8);

    $strobe("16-bit : A=%h B=%h Cin=%b | Sum=%h Cout=%b",
             A16, B16, Cin16, Sum16, Cout16);

    #10;
    $finish;
end

endmodule
