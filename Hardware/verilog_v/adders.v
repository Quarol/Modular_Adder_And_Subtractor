`include "adder.v"

module ADDERS (
    a3, b3,
    a2, b2,
    a1, b1,
    a0, b0,
    H3, G3, P3,
    H2, G2, P2,
    H1, G1, P1,
    H0, G0, P0
);
    input   a3, b3,
            a2, b2,
            a1, b1,
            a0, b0;

    output  H3, G3, P3,
            H2, G2, P2,
            H1, G1, P1,
            H0, G0, P0;

    ADDER adder3 (
        .a(a3), .b(b3),
        .H(H3), .G(G3), .P(P3)
    );

    ADDER adder2 (
        .a(a2), .b(b2),
        .H(H2), .G(G2), .P(P2)
    );

    ADDER adder1 (
        .a(a1), .b(b1),
        .H(H1), .G(G1), .P(P1)
    );

    ADDER adder0 (
        .a(a0), .b(b0),
        .H(H0), .G(G0), .P(P0)
    );

endmodule