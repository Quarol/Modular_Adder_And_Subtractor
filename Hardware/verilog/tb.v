`include "test.v"

module TEST (
);
    
    reg x, y;
    wire z;

    TEST dut (
        .x(x), .y(y), .z(z)
    );

    integer count, i, j;

    initial begin
        $display("CO JEST");
        x = 1;
        y = 0;

    end

endmodule