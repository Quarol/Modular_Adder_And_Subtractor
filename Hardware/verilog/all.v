module MUX(
    sel, a, b,
    out
);
    input sel, a, b;
    output reg out;

    wire out_t;

    always @*
    if(sel == 1'b0) begin
        out = a;
    end else begin
        out = b;
    end

endmodule


module HAL (
    x, y,
    not_b, b,
    not_a, a 
);
    input x, y;
    output not_b, b,
           not_a, a;

    wire t;
    assign t = x ^ y;  // temporary variable
    
    assign not_b = x | y;
    assign b = x & y;
    assign not_a = ~t;
    assign a = t;

endmodule



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


module ADDER (
    a, b,
    H, G, P
);
    input a, b;
    output H, G, P;

    assign H = a ^ b;
    assign G = a & b;
    assign P = a | b;
endmodule


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


module BLACK_NODE (
    Gi, Gj, Pi, Pj,
    GiGj, PiPj
);
    input Gi, Gj, Pi, Pj;
    output GiGj, PiPj;
    
    assign GiGj = Gi | (Gj & Pi);
    assign PiPj = Pi & Pj;

endmodule

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
        .a(b3_0),
        .b(b3_1),
        .out(b3)
    );   

    MUX mux4 (
        .sel(s),
        .a(a2_0),
        .b(a2_1),
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

    PREFIX_ADDER v (
        .a3(a3), .b3(b3),
        .a2(a2), .b2(b2),
        .a1(a1), .b1(b1),
        .a0(a0), .b0(1),
        .out4(v4), .out3(v4), .out2(v2), .out1(v1), .out0(v0)
    );
endmodule

module FIRST_CONDITION (
    s,
    b4_0, b4,
    w4, v4,
    out
);
    input   s,
            b4_0, b4,
            w4, v4;
    
    output  out;

    wire in_1, in_2;
    assign in_1 = (w4 | b4_0) & s;
    assign in_2 = (v4 ~| b4) & (~s);

    assign out = in_1 | in_2;

endmodule


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


module ALL (
    s,
    x3, x2, x1, x0,
    y3, y2, y1, y0,

    z3, z2, z1, z0
);

    input   s,
            x3, x2, x1, x0,
            y3, y2, y1, y0;
    output  z3, z2, z1, z0;


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
        .b1_0(b1_0), .b1_1(b1_1), .a0_0(a0_0), .a0_1(a0_1), 
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