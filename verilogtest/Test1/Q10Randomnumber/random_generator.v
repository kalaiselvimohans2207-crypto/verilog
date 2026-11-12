
module random_generator;

    integer random_num;
    integer temp;

    initial begin
        random_num = 0;

        forever begin
            #10;

            temp = $random & 32'h7fffffff;

            random_num = (temp % 201) - 100;
        end
    end

endmodule

