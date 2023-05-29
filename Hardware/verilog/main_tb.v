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

    integer x, y, Z, S, count, result, modulus, sub;
    //Choose modulus in [1001b, 1111b]
    defparam dut.m=4'b1100;

    initial begin
        count = 0;
        //Converts binary parameter m to decimal
        modulus = dut.m[0] + 2*dut.m[1] + 4*dut.m[2]+8*dut.m[3];
        // Generates all possible combinations of S , x and y for given modulus
        for (S = 0; S <= 1; S = S + 1) begin
            for (x = 0; x < modulus; x = x + 1) begin
                for (y = 0; y < modulus; y = y + 1) begin
                    
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

                    if (S == 0) begin
                        result = (x + y) % modulus;
                    end else begin
                        sub = x - y;
                        if (sub < 0) begin
                            result = sub + modulus;
                        end else begin
                            result = sub % modulus;
                        end
                    end

                    Z = (z3 * 8) + (z2 * 4) + (z1 * 2) + z0;

                    // Check if the circuit output is correct by comparing it to the predicted result
                    // Update the number of correct results
                    if (result == Z) begin
                        count = count + 1;
                    end
                end
            end
        end
        //Display tests result
        $display("Total: ", modulus*modulus*2);
        $display("Passed: ", count);
    end

endmodule