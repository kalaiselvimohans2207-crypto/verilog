module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    always@(posedge clk)
        if(reset)
            q<=4'b0000;
    else if(q==4'd9)
        q<=4'b0000;
    else q<=q+1'b1;
    
endmodule
