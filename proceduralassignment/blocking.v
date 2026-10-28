module tb;
  reg [7:0] a, b, c, d, e;

  initial begin
    a = 8'hDA;                                            // Execute first
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);  // Then display (b, c still unassigned)
    b = 8'hF1;                                            // Then assign b
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);  // Display again (c still unassigned)
    c = 8'h30;                                            // Finally assign c
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);  // Display all assigned values
  end

  initial begin                                          // This block runs in parallel with the first block
    d = 8'hAA;                                           // Execute first in this block
    $display ("[%0t] d=0x%0h e=0x%0h", $time, d, e);     // Display (e still unassigned)
    e = 8'h55;                                           // Then assign e
    $display ("[%0t] d=0x%0h e=0x%0h", $time, d, e);     // Display both assigned
  end
endmodule