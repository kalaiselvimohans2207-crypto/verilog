module nonblocking;
  reg [3:0] data = 4'h5;
  reg [3:0] y = 4'h3;
    
  initial begin // first initial block
    y <= data;
    #1 $display("1st block: data = %0h and y = %0h", data, y);
  end
  
  initial begin // second initial block
    data <= y;
    #1 $display("2nd block: data = %0h and y = %0h", data, y);
  end  
endmodule