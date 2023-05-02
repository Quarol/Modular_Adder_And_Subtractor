`include "first_stage/first_stage.v"
`include "second_stage/second_stage.v"
`include "third_stage/third_stage.v"

module MAIN (
    s,
    x3, x2, x1, x0,
    y3, y2, y1, y0,

    z3, z2, z1, z0
);

    input   s,
            x3, x2, x1, x0,
            y3, y2, y1, y0;
    output  z3, z2, z1, z0;

    //Stage 1:
    wire    b4_0, b4_1, a3_0, a3_1,
            b3_0, b3_1, a2_0, a2_1,
            b2_0, b2_1, a1_0, a1_1,
            b1_0, b1_1, a0_0, a0_1;

    FIRST_STAGE first_stage (
        .s(s),
        .x3(x3), .x2(x2), .x1(x1), .x0(x0),
        .y3(y3), .y2(y2), .y1(y1), .y0(y0),
        .b4_0(b4_0), .b4_1(b4_1), .a3_0(a3_0), .a3_1(a3_1),
        .b3_0(b3_0), .b3_1(b3_1), .a2_0(a2_0), .a2_1(a2_1),
        .b2_0(b2_0), .b2_1(b2_1), .a1_0(a1_0), .a1_1(a1_1),
        .b1_0(b1_0), .b1_1(b1_1), .a0_0(a0_0), .a0_1(a0_1) 
    );

    wire    w4, w3, w2, w1, w0,
            v4, v3, v2, v1, v0,
            b4;

    SECOND_STAGE second_stage (
        .s(s),
        .b4_0(b4_0), .b4_1(b4_1), .a3_0(a3_0), .a3_1(a3_1),
        .b3_0(b3_0), .b3_1(b3_1), .a2_0(a2_0), .a2_1(a2_1),
        .b2_0(b2_0), .b2_1(b2_1), .a1_0(a1_0), .a1_1(a1_1),
        .b1_0(b1_0), .b1_1(b1_1), .a0_0(a0_0), .a0_1(a0_1) 
        .w4(w4), .w3(w3), .w2(w2), .w1(w1), .w0(w0),
        .v4(v4), .v3(v3), .v2(v2), .v1(v1), .v0(v0),
        .b4(b4)
    );

    THIRD_STAGE third_stage (
        .s(s),
        .b4_0(b4_0), .b4(b4),
        .w4(w4), .w3(w3), .w2(w2), .w1(w1), .w0(w0),
        .v4(v4), .v3(v3), .v2(v2), .v1(v1), .v0(v0),
        .z3(z3), .z2(z2), .z1(z1), .z0(z0)
    );

endmodule