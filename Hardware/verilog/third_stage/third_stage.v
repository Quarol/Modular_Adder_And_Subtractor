`include "third_stage/first_condition.v"
`include "third_stage/second_condition.v"

module THIRD_STAGE (
    s,
    b4_0, b4,
    w4, v4,
    v3, w3,
    v2, w2,
    v1, w1,
    v0, w0,
    z3, z2, z1, z0
);

    input   s,
            b4_0, b4,
            w4, v4,
            v3, w3,
            v2, w2,
            v1, w1,
            v0, w0;
    output  z3, z2, z1, z0;

    wire first_out;

    FIRST_CONDITION first_condition (
        .s(s),
        .b4_0(b4_0),
        .b4(b4),
        .w4(w4),
        .v4(v4),
        .out(first_out)
    );

    SECOND_CONDITION second_condition (
        .first_condition(first_out),
        .v3(v3), .w3(w3),
        .v2(v2), .w2(w2),
        .v1(v1), .w1(w1),
        .v0(v0), .w0(w0),
        .z3(z3), .z2(z2), .z1(z1), .z0(z0)
    );
    
endmodule