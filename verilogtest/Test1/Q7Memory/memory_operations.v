
module memory_operations;

    reg [13:0] mem [0:7];
    integer i;

    // Task to fill memory
    task fill_memory;
    begin
        mem[0] = 14'd10;
        mem[1] = 14'd25;
        mem[2] = 14'd40;
        mem[3] = 14'd15;
        mem[4] = 14'd60;
        mem[5] = 14'd35;
        mem[6] = 14'd80;
        mem[7] = 14'd50;
    end
    endtask

    // Function to add memory values
    function [16:0] add_memory;
        input dummy;
        integer i;
        begin
            add_memory = 0;

            for (i = 0; i < 8; i = i + 1)
                add_memory = add_memory + mem[i];
        end
    endfunction

    // Function to find largest number
    function [13:0] largest_number;
        input dummy;
        integer i;
        begin
            largest_number = mem[0];

            for (i = 1; i < 8; i = i + 1) begin
                if (mem[i] > largest_number)
                    largest_number = mem[i];
            end
        end
    endfunction

    // Main block
    initial begin

        fill_memory;

        $display("Memory contents:");

        for (i = 0; i < 8; i = i + 1)
            $display("mem[%0d] = %0d", i, mem[i]);

        $display("Sum = %0d", add_memory(1'b0));

        $display("Largest number = %0d",
                  largest_number(1'b0));

        $finish;
    end

endmodule
