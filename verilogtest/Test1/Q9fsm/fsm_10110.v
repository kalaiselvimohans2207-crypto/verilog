
module sequence_detector (
    input clk,
    input reset,
    input din,
    output reg dout
);

    reg [2:0] state, next_state;

    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100,
              S5 = 3'b101;

    // State register
    always @(posedge clk) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)

            S0: begin
                if (din)
                    next_state = S1;
                else
                    next_state = S0;
            end

            S1: begin
                if (din)
                    next_state = S1;
                else
                    next_state = S2;
            end

            S2: begin
                if (din)
                    next_state = S3;
                else
                    next_state = S0;
            end

            S3: begin
                if (din)
                    next_state = S4;
                else
                    next_state = S2;
            end

            S4: begin
                if (din)
                    next_state = S1;
                else
                    next_state = S5;
            end

            S5: begin
                if (din)
                    next_state = S3;
                else
                    next_state = S0;
            end

            default: next_state = S0;

        endcase
    end

    // Moore output logic
    always @(*) begin
        if (state == S5)
            dout = 1'b1;
        else
            dout = 1'b0;
    end

endmodule
