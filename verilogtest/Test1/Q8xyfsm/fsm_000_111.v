
module fsm_000_111 (
    input clk,
    input reset,
    input x,
    output reg y
);

    reg [2:0] state, next_state;

    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100,
              S5 = 3'b101,
              S6 = 3'b110;

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
                if (x == 0)
                    next_state = S1;
                else
                    next_state = S4;
            end

            S1: begin
                if (x == 0)
                    next_state = S2;
                else
                    next_state = S4;
            end

            S2: begin
                if (x == 0)
                    next_state = S3;
                else
                    next_state = S4;
            end

            S3: begin
                if (x == 0)
                    next_state = S3;
                else
                    next_state = S4;
            end

            S4: begin
                if (x == 0)
                    next_state = S1;
                else
                    next_state = S5;
            end

            S5: begin
                if (x == 0)
                    next_state = S1;
                else
                    next_state = S6;
            end

            S6: begin
                if (x == 0)
                    next_state = S1;
                else
                    next_state = S6;
            end

            default: next_state = S0;

        endcase
    end

    // Moore output logic
    always @(*) begin
        if (state == S3 || state == S6)
            y = 1'b1;
        else
            y = 1'b0;
    end

endmodule
