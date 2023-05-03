`include "second_stage/black_node.v"
`include "second_stage/adders.v"

module PREFIX_ADDER (
    a3, b3,
    a2, b2,
    a1, b1,
    a0, b0,
    out4, out3, out2, out1, out0
);
    input   a3, b3,
            a2, b2,
            a1, b1,
            a0, b0;

    output out4, out3, out2, out1, out0;

    wire    H3, G3, P3,
            H2, G2, P2,
            H1, G1, P1,
            H0, G0, P0;

    ADDERS adders (
        .a3(a3), .b3(b3),
        .a2(a2), .b2(b2),
        .a1(a1), .b1(b1),
        .a0(a0), .b0(b0),
        .H3(H3), .G3(G3), .P3(P3),
        .H2(H2), .G2(G2), .P2(P2),
        .H1(H1), .G1(G1), .P1(P1),
        .H0(H0), .G0(G0), .P0(P0)
    );
    

    wire GiGj_0, PiPj_0;
    wire GiGj_1, PiPj_1;
    wire GiGj_2, PiPj_2;
    wire GiGj_3, PiPj_3;


    BLACK_NODE bn0 (
        .Gi(G1), .Pi(P1),
        .Gj(G0), .Pj(P0),
        .GiGj(GiGj_0), .PiPj(PiPj_0)
    );

    BLACK_NODE bn1 (
        .Gi(G2), .Pi(P2),
        .Gj(GiGj_0), .Pj(PiPj_0),
        .GiGj(GiGj_1), .PiPj(PiPj_1)
    );

    BLACK_NODE bn2 (
        .Gi(G3), .Pi(P3),
        .Gj(G2), .Pj(P2),
        .GiGj(GiGj_2), .PiPj(PiPj_2)
    );

    BLACK_NODE bn3 (
        .Gi(GiGj_2), .Pi(PiPj_2),
        .Gj(GiGj_0), .Pj(PiPj_0),
        .GiGj(GiGj_3), .PiPj(PiPj_3)
    );


    assign out0 = H0;
    assign out1 = H1 ^ P0;
    assign out2 = H2 ^ GiGj_0;
    assign out3 = H3 ^ GiGj_1;
    assign out4 = GiGj_3;




endmodule