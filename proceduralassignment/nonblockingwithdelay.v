module tb;
  reg [7:0] a, b, c, d, e;

  initial begin
    a <= 8'hDA;                                           // Schedule for end of time-step 0
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);  // 'a' not yet updated
    #10 b <= 8'hF1;                                       // Wait 10ns, then schedule for end of time-step 10
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);  // 'b' not yet updated (but 'a' is now 0xDA)
    c <= 8'h30;                                           // Schedule for end of time-step 10
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);  // 'b', 'c' not yet updated
  end

  initial begin
    #5 d <= 8'hAA;                                        // Wait 5ns, then schedule for end of time-step 5
    $display ("[%0t] d=0x%0h e=0x%0h", $time, d, e);      // 'd' not yet updated
    #5 e <= 8'h55;                                        // Wait 5ns more (total 10ns), schedule for end of time-step 10
    $display ("[%0t] d=0x%0h e=0x%0h", $time, d, e);      // 'e' not yet updated (but 'd' is now 0xAA)
  end
endmodule