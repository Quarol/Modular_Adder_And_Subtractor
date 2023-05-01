`include "hal.v"

module SINGLE_INDEX (
    s, x, y,
    not_b, b,
    not_a, a
);
    input   s, x, y;
    output  not_b, b,
            not_a, a;

    wire y_XOR_s;
    assign y_XOR_s = y ^ s;

    HAL hal (
    .x(x),
    .y(y_XOR_s),
    .not_b(not_b),
    .b(b),
    .not_a(not_a),
    .a(a)
  );
     

endmodule