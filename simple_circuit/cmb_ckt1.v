module cmb_ckt1(input a,b,c,d,e,output z);
assign z=(a&b|(c^b)&~e);
endmodule
