`include "second_stage/second_stage.v"

module moduleName (
);

    reg     a3, b3, 
            a2, b2,
            a1, b1,
            a0, b0;

    wire    v4, v3, v2, v1, v0;
 

    PREFIX_ADDER dut (
        .a3(a3), .b3(b3),
        .a2(a2), .b2(b2),
        .a1(a1), .b1(b1),
        .a0(a0), .b0(b0),
        .out4(v4), .out3(v3), .out2(v2), .out1(v1), .out0(v0)
    );

    integer x, y, counter, result, out;
    initial begin
    counter = 0;

        for (x = 0; x <= 10; x = x + 1) begin
            for (y = 0; y <= 10; y = y + 1) begin
                
                a3 = x / 8;
                a2 = (x / 4) % 2;
                a1 = (x / 2) % 2;
                a0 = x % 2;
                b3 = y / 8;
                b2 = (y / 4) % 2;
                b1 = (y / 2) % 2;
                b0 = y % 2;

                #1

                out = (v4 * 16) + (v3 * 8) + (v2 * 4) + (v1 * 2) + v0;
                result = x + y;
                //$display(out, " ", result);

                if (result == out) begin
                    counter = counter + 1;
                end            
            end
        end
        $display(counter);
    end

endmodule