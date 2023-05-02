`include "mux.v"

module SECOND_CONDITION (
    first_condition,
    v3, w3,
    v2, w2,
    v1, w1,
    v0, w0,
    z3, z2, z1, z0
);
    input   first_condition,
            v3, w3,
            v2, w2,
            v1, w1,
            v0, w0;
    output  z3, z2, z1, z0;

    MUX m3 (
        .sel(first_condition),
        .a(v3),
        .b(w3),
        .out(z3)
    );

    MUX m2 (
        .sel(first_condition),
        .a(v2),
        .b(w2),
        .out(z2)
    );

    MUX m1 (
        .sel(first_condition),
        .a(v1),
        .b(w1),
        .out(z1)
    );   

    MUX m0 (
        .sel(first_condition),
        .a(v0),
        .b(w0),
        .out(z0)
    ); 

endmodule