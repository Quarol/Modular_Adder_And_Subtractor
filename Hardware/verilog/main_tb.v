`include "main.v"

module MAIN_TB ();
    
    reg     s,
            x3, x2, x1, x0,
            y3, y2, y1, y0;
    
    wire    z3, z2, z1, z0;

    MAIN dut (
        .s(s),
        .x3(x3), .x2(x2), .x1(x1), .x0(x0),
        .y3(y3), .y2(y2), .y1(y1), .y0(y0),
        .z3(z3), .z2(z2), .z1(z1), .z0(z0)
    );

    integer x, y, Z, S, count, result, modulus;
    initial begin
        count = 0;
        modulus = 11;
        for (S = 0; S <= 1; S = S + 1) begin
            for (x = 0; x <= 10; x = x + 1) begin
                for (y = 0; y <= 10; y = y + 1) begin
                    
                    s = S;
                    x3 = x / 8;
                    x2 = (x / 4) % 2;
                    x1 = (x / 2) % 2;
                    x0 = x % 2;
                    y3 = y / 8;
                    y2 = (y / 4) % 2;
                    y1 = (y / 2) % 2;
                    y0 = y % 2;
                    #1

                    $display("z3 = %d", z3);

                    if (S == 0) begin
                        result = (x + y) % 11;
                    end else begin
                        result = (x - y) % 11;
                    end

                    Z = (z3 * 8) + (z2 * 4) + (z1 * 2) + z0;

                    if (result == Z) begin
                        count = count + 1;
                    end
                end
            end
        end

        $display(count);
    end

endmodule