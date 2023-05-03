`include "second_stage/prefix_adder.v"
`include "second_stage/eight_mux.v"

module SECOND_STAGE (
    s,
    b4_0, b4_1, a3_0, a3_1,
    b3_0, b3_1, a2_0, a2_1,
    b2_0, b2_1, a1_0, a1_1,
    b1_0, b1_1, a0_0, a0_1,
    w4, w3, w2, w1, w0,
    v4, v3, v2, v1, v0,
    b4
);

    input   s,
            b4_0, b4_1, a3_0, a3_1,
            b3_0, b3_1, a2_0, a2_1,
            b2_0, b2_1, a1_0, a1_1,
            b1_0, b1_1, a0_0, a0_1;

    output  w4, w3, w2, w1, w0,
            v4, v3, v2, v1, v0,
            b4;

    PREFIX_ADDER w (
        .a3(a3_0), .b3(b3_0),
        .a2(a2_0), .b2(b2_0),
        .a1(a1_0), .b1(b1_0),
        .a0(a0_0), .b0(s),
        .out4(w4), .out3(w4), .out2(w2), .out1(w1), .out0(w0)
    );

    wire    a3, b3, 
            a2, b2,
            a1, b1,
            a0;

    EIGHT_MUX em (
        .s(s),
        .b4_0(b4_0), .b4_1(b4_1), .a3_0(a3_0), .a3_1(a3_1),
        .b3_0(b3_0), .b3_1(b3_1), .a2_0(a2_0), .a2_1(a2_1),
        .b2_0(b2_0), .b2_1(b2_1), .a1_0(a1_0), .a1_1(a1_1),
        .b1_0(b1_0), .b1_1(b1_1), .a0_0(a0_0), .a0_1(a0_1),
        .a3(a3), .b3(b3), .a2(a2), .b2(b2), .a1(a1), .b1(b1), .a0(a0),
        .b4(b4)
    );

    wire const;
    assign const = 1;

    PREFIX_ADDER v (
        .a3(a3), .b3(b3),
        .a2(a2), .b2(b2),
        .a1(a1), .b1(b1),
        .a0(a0), .b0(const),
        .out4(v4), .out3(v4), .out2(v2), .out1(v1), .out0(v0)
    );

endmodule