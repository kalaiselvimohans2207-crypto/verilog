
module priority_encoder8to3 (
    input E,
    input [7:0] D,
    output reg [2:0] Y,
    output reg Valid
);

    always @(*) begin
        Y = 3'b000;
        Valid = 1'b0;

        if (E) begin
            if (D[7]) begin
                Y = 3'b111;
                Valid = 1'b1;
            end
            else if (D[6]) begin
                Y = 3'b110;
                Valid = 1'b1;
            end
            else if (D[5]) begin
                Y = 3'b101;
                Valid = 1'b1;
            end
            else if (D[4]) begin
                Y = 3'b100;
                Valid = 1'b1;
            end
            else if (D[3]) begin
                Y = 3'b011;
                Valid = 1'b1;
            end
            else if (D[2]) begin
                Y = 3'b010;
                Valid = 1'b1;
            end
            else if (D[1]) begin
                Y = 3'b001;
                Valid = 1'b1;
            end
            else if (D[0]) begin
                Y = 3'b000;
                Valid = 1'b1;
            end
        end
    end

endmodule
