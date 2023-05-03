`include "first_stage/single_pos.v"

module FIRST_STAGE (
    s,
    x3, x2, x1, x0,
    y3, y2, y1, y0,
    b4_0, b4_1, a3_0, a3_1,
    b3_0, b3_1, a2_0, a2_1,
    b2_0, b2_1, a1_0, a1_1,
    b1_0, b1_1, a0_0, a0_1 
);
    input   s,
            x3, x2, x1, x0,
            y3, y2, y1, y0;

    output  b4_0, b4_1, a3_0, a3_1,
            b3_0, b3_1, a2_0, a2_1,
            b2_0, b2_1, a1_0, a1_1,
            b1_0, b1_1, a0_0, a0_1;


    SINGLE_INDEX i3 (
    .s(s),
    .x(x3),
    .y(y3),
    .not_b(b4_1),
    .b(b4_0),
    .not_a(a3_1),
    .a(a3_0)
  );

    SINGLE_INDEX i2 (
    .s(s),
    .x(x3),
    .y(y3),
    .not_b(b3_1),
    .b(b3_0),
    .not_a(a2_1),
    .a(a2_0)
  );

    SINGLE_INDEX i1 (
    .s(s),
    .x(x3),
    .y(y3),
    .not_b(b2_1),
    .b(b2_0),
    .not_a(a1_1),
    .a(a1_0)
  );

    SINGLE_INDEX i0 (
    .s(s),
    .x(x3),
    .y(y3),
    .not_b(b1_1),
    .b(b1_0),
    .not_a(a0_1),
    .a(a0_0)
  );

endmodule