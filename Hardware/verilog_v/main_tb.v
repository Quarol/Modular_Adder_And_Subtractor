`include "main.v"

module testbench();

    // Inputs
    reg s;
    reg [3:0] x;
    reg [3:0] y;

    // Outputs
    wire [3:0] z;

    // Instantiate the DUT
    MAIN dut (
        .s(s),
        .x3(0), .x2(0), .x1(0), .x0(x),
        .y3(0), .y2(0), .y1(0), .y0(y),
        .z3(0), .z2(0), .z1(0), .z0(z)
    );

    // Generate all possible input combinations and compare to expected output
    integer i, j, k;
    integer num_tests;
    integer error_count;
    integer expected;

    initial begin
        num_tests = 0;
        error_count = 0;
        for (i = 0; i <= 1; i = i + 1) begin
            s = i;
            for (j = 0; j <= 9; j = j + 1) begin
                x = j;
                for (k = 0; k <= 9; k = k + 1) begin
                    y = k;
                    if (s == 0) begin
                        // Modular addition
                        expected = (j + k) % 10;
                    end else begin
                        // Modular subtraction
                        expected = (j - k + 10) % 10;
                    end
                    #1;
                    if (z != expected) begin
                        $display("Error: s=%d x=%d y=%d expected=%d actual=%d", s, j, k, expected, z);
                        error_count = error_count + 1;
                    end
                    else begin
                        $display("Works");
                    end
                    num_tests = num_tests + 1;
                end
            end
        end
        $display("Completed %d tests with %d errors", num_tests, error_count);
        $finish;
    end

endmodule
