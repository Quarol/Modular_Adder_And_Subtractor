`include "mux.v"

module EIGHT_MUX (
    s,
    b4_0, b4_1, a3_0, a3_1,
    b3_0, b3_1, a2_0, a2_1,
    b2_0, b2_1, a1_0, a1_1,
    b1_0, b1_1, a0_0, a0_1,
    
    a3, b3, 
    a2, b2,
    a1, b1,
    a0, b4
);

    input   s,
            b4_0, b4_1, a3_0, a3_1,
            b3_0, b3_1, a2_0, a2_1,
            b2_0, b2_1, a1_0, a1_1,
            b1_0, b1_1, a0_0, a0_1;

    output  a3, b3, 
            a2, b2,
            a1, b1,
            a0, b4;


    MUX mux7 (
        .sel(s),
        .a(b4_0),
        .b(b4_1),
        .out(b4)
    );

    MUX mux6 (
        .sel(s),
        .a(a3_0),
        .b(a3_1),
        .out(a3)
    );

    MUX mux5 (
        .sel(s),
        .a(b3_1),
        .b(b3_0),
        .out(b3)
    );   

    MUX mux4 (
        .sel(s),
        .a(a2_1),
        .b(a2_0),
        .out(a2)
    ); 

    MUX mux3 (
        .sel(s),
        .a(b2_0),
        .b(b2_1),
        .out(b2)
    );

    MUX mux2 (
        .sel(s),
        .a(a1_0),
        .b(a1_1),
        .out(a1)
    );

    MUX mux1 (
        .sel(s),
        .a(b1_0),
        .b(b1_1),
        .out(b1)
    );   

    MUX mux0 (
        .sel(s),
        .a(a0_0),
        .b(a0_1),
        .out(a0)
    ); 

endmodule