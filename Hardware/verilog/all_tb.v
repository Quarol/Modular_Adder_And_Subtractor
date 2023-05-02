`include "all.v"

module test_ALL;
  // Inputs
  reg s, x3, x2, x1, x0, y3, y2, y1, y0;
  // Outputs
  wire z3, z2, z1, z0;
  // Instantiate the Unit Under Test (UUT)
  ALL uut (
    .s(s),
    .x3(x3), .x2(x2), .x1(x1), .x0(x0),
    .y3(y3), .y2(y2), .y1(y1), .y0(y0),
    .z3(z3), .z2(z2), .z1(z1), .z0(z0)
  );
  
  integer count, expected;
  
  initial begin
    count = 0;
    // Iterate over all possible values of x and y
    for (s = 0; s <= 1; s = s + 1) begin
        for (x3 = 0; x3 <= 1; x3 = x3 + 1) begin
        for (x2 = 0; x2 <= 1; x2 = x2 + 1) begin
            for (x1 = 0; x1 <= 1; x1 = x1 + 1) begin
            for (x0 = 0; x0 <= 1; x0 = x0 + 1) begin
                for (y3 = 0; y3 <= 1; y3 = y3 + 1) begin
                for (y2 = 0; y2 <= 1; y2 = y2 + 1) begin
                    for (y1 = 0; y1 <= 1; y1 = y1 + 1) begin
                    for (y0 = 0; y0 <= 1; y0 = y0 + 1) begin
                        // Calculate expected result
                        if (s == 0) begin
                        expected = (x3*1000 + x2*100 + x1*10 + x0 + y3*1000 + y2*100 + y1*10 + y0) % 10000;
                        end else begin
                        expected = (x3*1000 + x2*100 + x1*10 + x0 - y3*1000 - y2*100 - y1*10 - y0) % 10000;
                        end
                        // Apply input values
                        #1 s = s;
                        #1 x3 = x3;
                        #1 x2 = x2;
                        #1 x1 = x1;
                        #1 x0 = x0;
                        #1 y3 = y3;
                        #1 y2 = y2;
                        #1 y1 = y1;
                        #1 y0 = y0;
                        // Check output
                        #1 if ((z3*1000 + z2*100 + z1*10 + z0) !== expected) begin
                        //$display("Error: s=%b x=%d%d%d%d y=%d%d%d%d expected=%d actual=%d", s, x3, x2, x1, x0, y3, y2, y1, y0, expected, z3*1000 + z2*100 + z1*10 + z0);
                        count = count + 1;
                        end
                    end
                    end
                end
                end
            end
            end
        end
        end
    end

    $display(count);
  end
endmodule