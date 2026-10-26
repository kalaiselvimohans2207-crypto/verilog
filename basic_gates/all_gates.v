
module and_gate(input A, B, output Y);
    assign Y = A & B;
endmodule

module or_gate(input A, B, output Y);
    assign Y = A | B;
endmodule

module not_gate(input A, output Y);
    assign Y = ~A;
endmodule

module nand_gate(input A, B, output Y);
    assign Y = ~(A & B);
endmodule

module nor_gate(input A, B, output Y);
    assign Y = ~(A | B);
endmodule

module xor_gate(input A, B, output Y);
    assign Y = A ^ B;
endmodule

module xnor_gate(input A, B, output Y);
    assign Y = ~(A ^ B);
endmodule
