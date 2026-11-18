module lshift_reg (input 						clk,				// Clock input
                   input 						rstn,				// Active low reset input
                   input [7:0] 			load_val, 	// Load value
                   input 						load_en, 		// Load enable
                   output reg [7:0] op); 				// Output register value

	 // At posedge of clock, if reset is low set output to 0
	 // If reset is high, load new value to op if load_en=1
	 // If reset is high, and load_en=0 shift register to left
	 always @ (posedge clk) begin
	    if (!rstn) begin
	      op <= 0;
	    end else begin
	    	if (load_en) begin
	      	op <= load_val;
	      end else begin
	        op[0] <= op[7];
	        op[1] <= op[0];
	        op[2] <= op[1];
	        op[3] <= op[2];
	        op[4] <= op[3];
	        op[5] <= op[4];
	        op[6] <= op[5];
	        op[7] <= op[6];
	      end
	    end
	  end
endmodule
